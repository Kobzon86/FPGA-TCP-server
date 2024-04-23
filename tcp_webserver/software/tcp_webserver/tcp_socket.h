#ifndef __TCP_SOCKET_H__
#define __TCP_SOCKET_H__

#include <unistd.h>
#include <stdio.h>
#include <altera_avalon_sgdma.h>
#include <altera_avalon_sgdma_descriptor.h> //include the sgdma descriptor
#include <altera_avalon_sgdma_regs.h>//include the sgdma registers
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include <altera_avalon_timer.h>
#include <altera_avalon_timer_regs.h>
//#include <altera_avalon_tse.h>
#include <stdbool.h>

#define CLOCK 100000000
#define TIME_MS 1000
#define TIMEOUT_PERIOD CLOCK*(TIME_MS/1000)

enum  tcp_state{
    CLOSED,
    LISTEN = 2,
    SYN_SENT,
    SYN_RECEIVED,
    ESTABLISHED,
    CLOSE_WAIT,
    LAST_ACK,
    FIN_WAIT,
    CLOSING,
    TIME_WAIT
};
/*********** STRUCTS *******************************/
	typedef struct timer_struct {
		alt_u32 id;
		alt_u32 irq;
		alt_u32 base;
		bool set_timer_zero;
	}timer_struct;

	struct tcp_conn {
        enum tcp_state state;
		bool link;
		alt_u8 dest_mac[6];
		alt_u8 source_mac[6];
		alt_u8 dest_ip[4];
		alt_u16 source_port ;
		alt_u16 dest_port;
		alt_u16 ack_num;
		alt_u32 seq_num;
		alt_u32 last_acked;
        alt_u16 last_sended_len;
        alt_u16 window;
		alt_u16 rec_payload_len;
		bool acked;
		bool command_sent;
		bool got_html_req;
		alt_u8 payload[64];
	};

	typedef struct {
		alt_u8 dest_addr[6];
		alt_u8 source_addr[6];
		alt_u16 type;
	}ethernet_fields;

	typedef struct 
	{
		ethernet_fields eth_flds;
		alt_u8 ver_ihl;
		alt_u8 dscp;
		alt_u8 total_len[2];
		alt_u16 id;
		alt_u16 flags_frag_ofset;
		alt_u8 ttl;
		alt_u8 protocol;
		alt_u16 checksum;
		alt_u8 sender_ip[4];
		alt_u8 dest_ip[4];

	}ipv4_header;

	typedef struct {
		alt_u8 fin:1;
		alt_u8 syn:1;
		alt_u8 rst:1;
		alt_u8 psh:1;
		alt_u8 ack:1;
		alt_u8 urg:1;
		alt_u8 unused:2;
	} t_flags;

	typedef struct 
	{
		alt_u16 sender_port;
		alt_u16 destination_port;
		alt_u8 seq_num[4];
		alt_u8 ack_num[4];
		alt_u8 header_len;
		t_flags flags;
		alt_u16 window;
		alt_u16 checksumm;
		alt_u16 urgent_data_pntr;
		alt_u8 payload[30];
	}tcp_packet;
	
	typedef struct 
	{		
		ipv4_header ipv4;
		alt_u16 sender_port;
		alt_u16 destination_port;
		alt_u8 seq_num[4];
		alt_u8 ack_num[4];
		alt_u8 header_len;
		alt_u8 flags;
		alt_u16 window;
		alt_u16 checksumm;
		alt_u16 urgent_data_pntr;
		alt_u8 payload[1024];
	}tcp_packet_out;	

	typedef struct
	{
		ethernet_fields eth_flds;
		alt_u16 htype;
		alt_u16 ptype;
		alt_u16 hlen_plen;
		alt_u16 oper;
		alt_u8 sender_hard_addr[6];
		alt_u8 sender_ip[4];
		alt_u8 target_hard_addr[6];
		alt_u8 target_ip[4];	
	}arp_packet_s;



/************* Triple speed ethernet core init */
void tse_init(int *tse, struct tcp_conn *TCP);
/************* Handling a received packet interrupt */
void rx_ethernet_isr (void *context);
/************* TCP packet buffer filling */
void create_tcp_pkt( alt_u8 flags, alt_u8 * payload, alt_u8 header_len, alt_u16 payload_len);
/************* Add phy model if needed */
void add_phy_to_profile();
/************* Send packet function */
void send_packet(alt_u32 * data, int len);
/************* SGDMA (RX/TX buffers) init **/
void sgdma_int_en();
/************* Mac address check function */
bool checkmac(ipv4_header  * ipv4_recieved);
/************* IP address check function */
bool check_tcp_sender_ip(ipv4_header  * ipv4_recieved);
/************* Get Seq number from TCP packet */
alt_u32 get_seq_num(tcp_packet * tcp_recieved);
/*************  *********************/
bool check_checksumm();
/************* Get payload from TCP packet */
alt_u32 get_payload_len();
/************* Check Acknowledge number from TCP packet*/
void ack_check();
/************* Handling a timer interrupt */
void timeout_isr (timer_struct * tmr);
/************* Timer interrupt set */
void timer_int_en(timer_struct * tmr);
/************* Check IP checksum */
alt_u16 get_ipv4_checksumm(alt_u8 * data, alt_u8 len);
/************* Check TCP checksum */
alt_u16 get_tcp_checksumm(alt_u8 * source_ip, alt_u8 * dest_ip,  alt_u8 * tcp_data, alt_u16 len);

#endif
