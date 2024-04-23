/*
 * tcp_socket.c
 *
 *  Created on: Mar 17, 2024
 *      Author: Maksim Ananev
 */

#include "tcp_socket.h"

alt_u8 html_page[] = {
" <!DOCTYPE html><html><head><title>Altera WebSrv</title><link rel=\"icon\" type=\"image/x-icon\" href=\"https://github.com/favicon.ico\"></head>"
"<html><body>"
"<h2>Leds checkboxes</h2>"
"<form>"
"  <input type=\"checkbox\" id=\"led1\" name=\"led1\" value=\"en\">"
"  <label for=\"led1\"> LED1</label><br>"
"  <input type=\"checkbox\" id=\"led2\" name=\"led2\" value=\"en\">"
"  <label for=\"led2\"> LED2</label><br>"
"  <input type=\"checkbox\" id=\"led3\" name=\"led3\" value=\"en\">"
"  <label for=\"led3\"> LED3</label><br><br>"
"  <label for=\"lcd\">LCD output:</label><br>"
"  <input type=\"text\" id=lcd\"\" name=\"lcd\"><br><br>"
"  <input type=\"submit\" value=\"Submit\">"
"</form>"
"</body></html>"
};
#define HTML_PAGE_LEN ( sizeof(html_page)-1 )


/************* Create sgdma transmit and receive devices **************/
alt_sgdma_dev * sgdma_tx_dev;
alt_sgdma_dev * sgdma_rx_dev;

/*********** Create a receive frame ****************/
unsigned char rx_frame[1518] = { 0 };
unsigned char tx_frame[1518] = { 0 };

/**************  Allocate descriptors in the descriptor_memory (onchip memory) *************/
alt_sgdma_descriptor *tx_descriptor		= DESCRIPTOR_MEMORY_BASE;
alt_sgdma_descriptor *tx_descriptor_end	= DESCRIPTOR_MEMORY_BASE + sizeof(alt_sgdma_descriptor);

alt_sgdma_descriptor *rx_descriptor  	= DESCRIPTOR_MEMORY_BASE + 2*sizeof(alt_sgdma_descriptor);
alt_sgdma_descriptor *rx_descriptor_end = DESCRIPTOR_MEMORY_BASE + 3*sizeof(alt_sgdma_descriptor);

/************* Tcp connection structures *********************/
struct tcp_conn *TCP;

arp_packet_s * arp_packet = (arp_packet_s *)tx_frame;
arp_packet_s * arp_recieved = (arp_packet_s *)( rx_frame + 2 );
ipv4_header  * ipv4_recieved = (ipv4_header *)( rx_frame + 2 );
tcp_packet_out * tcp_out = (tcp_packet_out *)tx_frame;
tcp_packet * tcp_recieved = (tcp_packet *)( rx_frame + 26 );

alt_u8 my_ip[4] = { 0xa9, 0xfe, 0xe5, 0x0e }; //my ip = a9.fe.e5.0e = 169.254.229.14
alt_u8 my_mac[6] = {0x60, 0xe3, 0x27, 0x04, 0xd5, 0xe3}; //"\x60\xe3\x27\x04\xd5\xe3"


void add_phy_to_profile()
{
/* supported PHY definition */
//	alt_tse_phy_profile MV88E1111 = {"Marvell 88E1111",      /* Marvell 88E1111                                  */
//	                            MV88E1111_OUI,          /* OUI                                                           */
//	                            MV88E1111_MODEL,        /* Vender Model Number                                           */
//	                            MV88E1111_REV,          /* Model Revision Number                                         */
//	                            0x11,                   /* Location of Status Register                                   */
//	                            14,                     /* Location of Speed Status                                      */
//	                            13,                     /* Location of Duplex Status                                     */
//	                            10,                     /* Location of Link Status                                       */
//	                            &marvell_phy_cfg        /* Function pointer to configure Marvell PHY                     */
//	                           };
//
//	/* add supported PHY to profile */
//	alt_tse_phy_add_profile(&MV88E1111);
}

void tse_init(int *tse, struct tcp_conn * TCP_link){
	TCP = TCP_link;
	/*********** Open the sgdma transmit device ********************/
	sgdma_tx_dev = alt_avalon_sgdma_open ("/dev/sgdma_0");
	// if (sgdma_tx_dev == NULL) {
	// 	alt_printf ("Error: could not open scatter-gather dma transmit device\n");
	// 	//return -1;
	// } else alt_printf ("Opened scatter-gather dma transmit device\n");

/***********  Open the sgdma receive device *************************/
	sgdma_rx_dev = alt_avalon_sgdma_open ("/dev/sgdma_1");
	// if (sgdma_rx_dev == NULL) {
	// 	alt_printf ("Error: could not open scatter-gather dma receive device\n");
	// 	//return -1;
	// } else alt_printf ("Opened scatter-gather dma receive device\n");


	add_phy_to_profile();

	// Specify the addresses of the PHY devices to be accessed through MDIO interface
	*(tse + 0x0F) = 0x00;

/************ Disable read and write transfers and wait**************************/
	*(tse + 0x02 ) = *(tse + 0x02) | 0x00800220;
	while ( *(tse + 0x02 ) != ( *(tse + 0x02 ) | 0x00800220 )) {
		// alt_printf("n0");
	}

/****************MAC FIFO Configuration*****************************************/
	*(tse + 0x09) = ETH_TSE_0_TRANSMIT_FIFO_DEPTH-16;
	*(tse + 0x0E) = 3;
	*(tse + 0x0D) = 8;
	*(tse + 0x07) = ETH_TSE_0_RECEIVE_FIFO_DEPTH-16;
	*(tse + 0x0C) = 8;
	*(tse + 0x0B) = 8;
	*(tse + 0x0A) = 0;
	*(tse + 0x08) = 0;

/***************** Initialize the MAC address************************************/
	*(tse + 0x03 ) = 0x0427E360; //mac_0
	*(tse + 0x04) =  0x0000E3D5; //mac_1
/****************** MAC function configuration**********************************/
	*(tse + 0x05) = 1518 ;
	*(tse + 0x17) = 12;
	*(tse + 0x06 ) = 0xFFFF;
	*(tse + 0x02 ) = 0x00800220; //command config
//
///*************** Software reset the PHY chip and wait***************************/
	*(tse + 0x02  ) =  0x00802220;
	while ( *(tse + 0x02  ) != ( 0x00800220 ) ) {
		// alt_printf("n1");
		}

/*** Enable read and write transfers, gigabit Ethernet operation and promiscuous mode*/

	*(tse + 0x02 ) = 0x0400022B;//*(tse + 0x02 ) | 0x0080023B;
	while ( *(tse + 0x02 ) != ( *(tse + 0x02) | 0x0400022B ) ) {
		// alt_printf("n2") ;
	}

///**************** Set interrupts for the sgdma receive device , Create sgdma receive descriptor  & Set up non-blocking transfer of sgdma receive descriptor **********/
	sgdma_int_en();

}

void send_packet(alt_u32 * data, int len){
	while (alt_avalon_sgdma_check_descriptor_status(tx_descriptor) != 0);
	alt_avalon_sgdma_construct_mem_to_stream_desc(tx_descriptor, tx_descriptor_end, data, len, 0, 1, 1, 0);
	alt_avalon_sgdma_do_async_transfer( sgdma_tx_dev, tx_descriptor );
}

void send_packet(alt_u32 * data, int len);

void sgdma_int_en(){
	alt_avalon_sgdma_register_callback( sgdma_rx_dev, (alt_avalon_sgdma_callback) rx_ethernet_isr, 0x00000014, NULL );
	alt_avalon_sgdma_construct_stream_to_mem_desc( rx_descriptor, rx_descriptor_end, (alt_u32 *)rx_frame, 0, 0 );
	alt_avalon_sgdma_do_async_transfer( sgdma_rx_dev, rx_descriptor );
}



bool checkmac(ipv4_header  * ipv4_recieved){
	if( ipv4_recieved->eth_flds.dest_addr[0] == my_mac[0] &&
		ipv4_recieved->eth_flds.dest_addr[1] == my_mac[1] &&
		ipv4_recieved->eth_flds.dest_addr[2] == my_mac[2] &&
		ipv4_recieved->eth_flds.dest_addr[3] == my_mac[3] &&
		ipv4_recieved->eth_flds.dest_addr[4] == my_mac[4] &&
		ipv4_recieved->eth_flds.dest_addr[5] == my_mac[5])
		return true;
	else
		return false;
}

bool check_tcp_sender_ip(ipv4_header  * ipv4_recieved){
	if( ipv4_recieved->sender_ip[0] == TCP->dest_ip[0] &&
		ipv4_recieved->sender_ip[1] == TCP->dest_ip[1] &&
		ipv4_recieved->sender_ip[2] == TCP->dest_ip[2] &&
		ipv4_recieved->sender_ip[3] == TCP->dest_ip[3] )
		return true;
	else
		return false;
}

alt_u32 get_seq_num(tcp_packet * tcp_recieved){
	return tcp_recieved->seq_num[0]<<24 | tcp_recieved->seq_num[1]<<16 | tcp_recieved->seq_num[2]<<8  | tcp_recieved->seq_num[3];
}

bool check_checksumm(){
	/* dog in - dog out*/
	return true;
};

alt_u32 get_payload_len(){
	alt_u32 ip_len = ipv4_recieved->total_len[1] + (ipv4_recieved->total_len[0]<<8);
	ip_len -=  (tcp_recieved->header_len>>4) * 4;
	ip_len -=  (ipv4_recieved->ver_ihl&0xf) * 4;
	return ip_len;
}



void ack_check(){
	if(tcp_recieved->flags.ack){
		alt_u32 acked_num = tcp_recieved->ack_num[0]<<24 | tcp_recieved->ack_num[1]<<16 | tcp_recieved->ack_num[2]<<8  | tcp_recieved->ack_num[3];
		if(acked_num == ( TCP->last_acked + TCP->last_sended_len + 1 )){
			if(TCP->last_sended_len != 0)
				TCP->last_acked += TCP->last_sended_len + 1;
			TCP->last_acked += TCP->command_sent;
			TCP->acked = true;
		}
		else
			TCP->acked = false;
	}
	else
			TCP->acked = false;
}


/****************************************************************************************
 * Subroutine to read incoming Ethernet frames  *
****************************************************************************************/
bool set_timer_zero = false;

void rx_ethernet_isr (void *context)
{

	///Check if ARP
	if( arp_recieved->eth_flds.type == 0x0608 ){
		if( arp_recieved->target_ip[0] == my_ip[0] && arp_recieved->target_ip[1] == my_ip[1] && arp_recieved->target_ip[2] == my_ip[2] && arp_recieved->target_ip[3] == my_ip[3]){
			arp_packet->eth_flds.dest_addr[0] = arp_recieved->sender_hard_addr[0];
			arp_packet->eth_flds.dest_addr[1] = arp_recieved->sender_hard_addr[1];
			arp_packet->eth_flds.dest_addr[2] = arp_recieved->sender_hard_addr[2];
			arp_packet->eth_flds.dest_addr[3] = arp_recieved->sender_hard_addr[3];
			arp_packet->eth_flds.dest_addr[4] = arp_recieved->sender_hard_addr[4];
			arp_packet->eth_flds.dest_addr[5] = arp_recieved->sender_hard_addr[5];


			memmove(arp_packet->eth_flds.source_addr,my_mac,6);
			arp_packet->eth_flds.type  = 0x0608;
			arp_packet->htype = 0x0100;
			arp_packet->ptype = 0x0008;
			arp_packet->hlen_plen = 0x0406;
			arp_packet->oper = 0x0200;
			memmove(arp_packet->sender_hard_addr,my_mac,6);
			memmove(arp_packet->sender_ip, my_ip, 4);
			memmove(arp_packet->target_hard_addr,arp_recieved->sender_hard_addr,6);
			memmove(arp_packet->target_ip, arp_recieved->sender_ip, 4);
			send_packet( (alt_u32 *)tx_frame, 44);
		}
	}

	if( ipv4_recieved->eth_flds.type == 0x0008 && ipv4_recieved->protocol == 0x06){ // if ip-packet and TCP

		if( checkmac(ipv4_recieved) && check_checksumm(ipv4_recieved) ){
			int tcp_start_point = (ipv4_recieved->ver_ihl&0xf) * 4 + 14;
			tcp_recieved = (int)ipv4_recieved + tcp_start_point;
			if (tcp_recieved->destination_port == 0x5000) // port = 80
			{
				switch (TCP->state)
				{
				case LISTEN:
					TCP->command_sent = false;
					if(tcp_recieved->flags.syn){
						memmove(TCP->dest_mac,ipv4_recieved->eth_flds.source_addr,6);
						TCP->dest_port = tcp_recieved->sender_port;
						memmove(TCP->dest_ip, ipv4_recieved->sender_ip, 4);
						TCP->seq_num = get_seq_num(tcp_recieved);
						TCP->rec_payload_len = get_payload_len();
						TCP->window = tcp_recieved->window;
						TCP->last_acked = 0x13370000;
						memmove(TCP->payload, tcp_recieved->payload,24);
						create_tcp_pkt(0x12, TCP->payload, 32, 12);
						TCP->last_sended_len = 0;
						send_packet( (alt_u32 *)tx_frame, 66 + 2);
						TCP->state = SYN_RECEIVED;
						IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_START_MSK | ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);

					}
					break;
				case SYN_RECEIVED:
					if(tcp_recieved->flags.ack){
						if( check_tcp_sender_ip( ipv4_recieved ) ){
							if(TCP->dest_port == tcp_recieved->sender_port){
								ack_check();
								if(TCP->acked){
									TCP->state = ESTABLISHED;
									set_timer_zero = true;
								}
							}
						}
					}
					break;
				case ESTABLISHED:
					if(tcp_recieved->flags.ack){
						if( check_tcp_sender_ip( ipv4_recieved ) ){
							if(TCP->dest_port == tcp_recieved->sender_port){
								ack_check();
								TCP->seq_num = get_seq_num(tcp_recieved);
								TCP->rec_payload_len = get_payload_len();
								if(TCP->acked){
									set_timer_zero = true;
									if(TCP->rec_payload_len > 1){
										char message[3];
										char ref_message[] = "GET";
										memmove(message, tcp_recieved->payload, 3);
										if(strncmp(message, ref_message, sizeof(message)) == 0){
											TCP->window = tcp_recieved->window;
											create_tcp_pkt(0x11, html_page, 20, HTML_PAGE_LEN);
											TCP->last_sended_len = HTML_PAGE_LEN;
											send_packet( (alt_u32 *)tx_frame, 54 + TCP->last_sended_len + 2);
											TCP->state = FIN_WAIT;
											memmove(TCP->payload, tcp_recieved->payload,64);
											TCP->got_html_req = true;
											break;
										}
									}

									if(tcp_recieved->flags.fin){
										TCP->last_acked++;
										create_tcp_pkt(0x11, TCP->payload, 20, 0);
										send_packet( (alt_u32 *)tx_frame, 54 + 2);
										TCP->state = LAST_ACK;//CLOSE_WAIT
									}
									else{
										create_tcp_pkt(0x10, TCP->payload, 20, 0);
										TCP->last_sended_len = 0;
										send_packet( (alt_u32 *)tx_frame, 54 + 2);
									}

								}

							}
						}
					}

					break;
				case FIN_WAIT:
					if(tcp_recieved->flags.ack && tcp_recieved->flags.fin){
						if( check_tcp_sender_ip( ipv4_recieved ) ){
							if(TCP->dest_port == tcp_recieved->sender_port){
								TCP->seq_num = get_seq_num(tcp_recieved);
								TCP->rec_payload_len = get_payload_len();
								ack_check();
								if(TCP->acked){
									create_tcp_pkt(0x10, TCP->payload, 20, 0);
									TCP->last_sended_len = 0;
									send_packet( (alt_u32 *)tx_frame, 54 + 2);
									// TCP.state = TIME_WAIT;
										TCP->state = LISTEN;
								}
							}
						}
					}
					break;
				case CLOSING:
					break;
				case CLOSE_WAIT:
					break;
				case TIME_WAIT:
					break;
				case LAST_ACK:
					if(tcp_recieved->flags.ack ){
						if( check_tcp_sender_ip( ipv4_recieved ) ){
							if(TCP->dest_port == tcp_recieved->sender_port){
								TCP->seq_num = get_seq_num(tcp_recieved);
								TCP->rec_payload_len = get_payload_len();
								ack_check();
								if(TCP->acked){
									TCP->state = LISTEN;
								}
							}
						}
					}
					break;

				default:
					break;
				}
			}


		}
	}

	// Wait until receive descriptor transfer is complete
	while (alt_avalon_sgdma_check_descriptor_status(rx_descriptor) != 0);
	// Create new receive sgdma descriptor
	alt_avalon_sgdma_construct_stream_to_mem_desc( rx_descriptor, rx_descriptor_end, (alt_u32 *)rx_frame, 0, 0 );
	// Set up non-blocking transfer of sgdma receive descriptor
	alt_avalon_sgdma_do_async_transfer( sgdma_rx_dev, rx_descriptor );

}

void timeout_isr (timer_struct * tmr)
{
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);

	static int secs=0;

	if(tmr->set_timer_zero == true){
		secs = 0;
		tmr->set_timer_zero = false;
	}

	switch (TCP->state)
	{
	case ESTABLISHED:
		if( ++secs == 10){
			TCP->seq_num--;
			TCP->last_acked++;
			create_tcp_pkt(0x11, TCP->payload, 20, 0);
			send_packet( (alt_u32 *)tx_frame, 54 + 2);
			TCP->state = FIN_WAIT;
			TCP->command_sent = true;
			secs = 0;
		}

		break;
	case SYN_RECEIVED:
		if( ++secs == 60){
			TCP->state = LISTEN;
			IOWR_ALTERA_AVALON_TIMER_CONTROL(tmr->base, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_STOP_MSK | ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);
			secs = 0;
		}
		break;
	case FIN_WAIT:
		if( ++secs == 60){
			TCP->state = LISTEN;
			IOWR_ALTERA_AVALON_TIMER_CONTROL(tmr->base, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_STOP_MSK | ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);
			secs = 0;
		}
		break;
	case LAST_ACK:
		if( ++secs == 60){
			TCP->state = LISTEN;
			IOWR_ALTERA_AVALON_TIMER_CONTROL(tmr->base, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_STOP_MSK | ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);
			secs = 0;
		}
		break;

	default:
		IOWR_ALTERA_AVALON_TIMER_CONTROL(tmr->base, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_STOP_MSK | ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);
		secs = 0;
		break;
	}


}

void timer_int_en(timer_struct * tmr){
	alt_ic_isr_register(tmr->id, tmr->irq, (void *)timeout_isr, tmr, 0x00);
	IOWR_ALTERA_AVALON_TIMER_PERIODL(tmr->base, TIMEOUT_PERIOD);
	IOWR_ALTERA_AVALON_TIMER_PERIODH(tmr->base, TIMEOUT_PERIOD>>16);
}

alt_u16 get_ipv4_checksumm(alt_u8 * data, alt_u8 len){

	alt_u32 sum = 0;
//	int addr = data;// +  0xe;

	for(alt_u8 i = 0; i < len; i = i + 2){
		alt_u8 a = data[i];
		alt_u8 b = data[i+1];
		sum += a<<8 | b;
	}

//    /*  Add left-over byte, if any */
//    if ( count > 0 )
//        sum += * (alt_u8 *) addr;

	/*  Fold 32-bit sum to 16 bits */
	while (sum>>16)
		sum = (sum & 0xffff) + (sum >> 16);

	alt_u16 rev = ~sum;
	return rev>>8 | rev<<8;
}
alt_u16 get_tcp_checksumm(alt_u8 * source_ip, alt_u8 * dest_ip,  alt_u8 * tcp_data, alt_u16 len){

	alt_u32 sum = 0;
	for(alt_u8 i = 0; i < 4; i = i + 2){
		alt_u8 a = source_ip[i];
		alt_u8 b = source_ip[i+1];
		sum += a<<8 | b;
	}

	for(alt_u8 i = 0; i < 4; i = i + 2){
		alt_u8 a = dest_ip[i];
		alt_u8 b = dest_ip[i+1];
		sum += a<<8 | b;
	}
	sum += 0x6;
	sum += len;

	for(alt_u16 i = 0; i < len; i = i + 2){
		alt_u8 a = tcp_data[i];
		alt_u8 b = tcp_data[i+1];
		sum += a<<8 | b;
	}

//    /*  Add left-over byte, if any */
//    if ( count > 0 )
//        sum += * (alt_u8 *) addr;

	/*  Fold 32-bit sum to 16 bits */
	while (sum>>16)
		sum = (sum & 0xffff) + (sum >> 16);

	alt_u16 rev = ~sum;
	return rev>>8 | rev<<8;
}


/********* Function for Creating Packet before transmission ***********************/
void create_tcp_pkt( alt_u8 flags, alt_u8 * payload, alt_u8 header_len, alt_u16 payload_len){
	///ip fields
	memmove(tcp_out->ipv4.eth_flds.dest_addr, &TCP->dest_mac, 6);
	memmove(tcp_out->ipv4.eth_flds.source_addr,&my_mac,6);
	tcp_out->ipv4.eth_flds.type = 0x0008;
	tcp_out->ipv4.ver_ihl = 0x45;
	tcp_out->ipv4.dscp = 0x0;
	tcp_out->ipv4.flags_frag_ofset = 0x0040;
	tcp_out->ipv4.id = 0xe117; //???
	tcp_out->ipv4.ttl = 0x80;
	tcp_out->ipv4.protocol = 06;
	memmove(tcp_out->ipv4.sender_ip, my_ip, 6);
	memmove(tcp_out->ipv4.dest_ip, TCP->dest_ip, 4);
	alt_u16 full_len = 20 + 20 + payload_len;
	tcp_out->ipv4.total_len[0] = full_len>>8;
	tcp_out->ipv4.total_len[1] = full_len;

	//TCP fields
	tcp_out->sender_port = 0x5000;
	tcp_out->destination_port = TCP->dest_port;

	tcp_out->seq_num[0] = TCP->last_acked>>24;
	tcp_out->seq_num[1] = TCP->last_acked>>16;
	tcp_out->seq_num[2] = TCP->last_acked>>8;
	tcp_out->seq_num[3] = TCP->last_acked;

	TCP->seq_num += TCP->rec_payload_len + ( TCP->rec_payload_len == 0);

	tcp_out->ack_num[0] = TCP->seq_num>>24;
	tcp_out->ack_num[1] = TCP->seq_num>>16;
	tcp_out->ack_num[2] = TCP->seq_num>>8;
	tcp_out->ack_num[3] = TCP->seq_num;

	tcp_out->header_len = (header_len/4)<<4;
	tcp_out->flags = flags;
	tcp_out->window = 0xf0fa;
	tcp_out->urgent_data_pntr = 0x0;

	memmove(tcp_out->payload, payload,payload_len);


	///checksums
	tcp_out->ipv4.checksum =0;
	tcp_out->ipv4.checksum = get_ipv4_checksumm((alt_u8*)&tcp_out->ipv4.ver_ihl, 20);
	tcp_out->checksumm = 0;
	tcp_out->checksumm = get_tcp_checksumm(my_ip, TCP->dest_ip, (alt_u8*)&tcp_out->sender_port, 20 + payload_len);

}
