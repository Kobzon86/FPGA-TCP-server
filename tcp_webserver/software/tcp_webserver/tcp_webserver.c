#include "system.h"
#include "sys/alt_irq.h"
#include <stdio.h>
#include <altera_avalon_pio_regs.h>//include the PIO registers

#include "tcp_socket.h"

#include "altera_avalon_lcd_16207_regs.h"
#include "altera_avalon_lcd_16207.h"

/********* Initialize variables *****************/
int *tse = (int *)ETH_TSE_0_BASE;
alt_u8 in;

/************* LEDS and LCD vars *********************/
alt_u8 leds;
char lcd_string[64];
alt_u8 lcd_string_len;
bool lcd_string_changed = false;

/********** Function Prototypes ******************/
void tse_init();
alt_u8 get_command(char* data);

/******* MAIN BLOCK STARTS HERE ********************************/
int main(void){
	/************* Tcp connection structures *********************/
	struct tcp_conn TCP;
	struct timer_struct tmr;

	TCP.state = LISTEN;

	altera_avalon_lcd_16207_state lcd_obj;
	altera_avalon_lcd_16207_state * lcd = &lcd_obj;
	lcd->base = LCD_16207_0_BASE;
	altera_avalon_lcd_16207_init(lcd);
	altera_avalon_lcd_16207_write(lcd, "My IP is: \n",sizeof("My IP is: \n") , 0);
	altera_avalon_lcd_16207_write(lcd, "169.254.229.14 \n",sizeof("169.254.229.14 \n") , 0);

/**** Initializing timer status and control values *************/
	tmr.base = TIMER_0_BASE;
	tmr.id = TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID;
	tmr.irq = TIMER_0_IRQ;
	tmr.set_timer_zero = false;
	timer_int_en(&tmr);
	tse_init(tse, &TCP);


	while (1) {
		in =  IORD_ALTERA_AVALON_PIO_DATA(PIO_0_BASE); //read the input from the switch
		if(TCP.got_html_req == true){
			TCP.got_html_req = false;
			if(TCP.payload[5] == '?'){
				leds = 0x0;
				for (alt_u8 i = 0; i < 4; i++)
				{
					leds |= get_command(TCP.payload + 6 + ( i*8 ));
					if(TCP.payload[5 + ( ( i + 1 )*8 )] != '&')
						break;
				}
			}
		}
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE, ~leds);
		if(lcd_string_changed){
			altera_avalon_lcd_16207_write(lcd, lcd_string, lcd_string_len , 0);
			lcd_string_changed = false;
		}
	}
	return 0;
}

alt_u8 get_command(char* data){
	char led_ch[] = "led";
	char lcd_ch[] = "lcd";
	char message[3];
	memmove(message, data, 3);
	if(strncmp(message, led_ch, sizeof(message)) == 0){
		switch(data[3]){
		case '1':
			return 0x1;
		case '2':
			return 0x2;
		case '3':
			return 0x4;
		default:
			return 0x0;
		}
	}
	else if(strncmp(message, lcd_ch, sizeof(message)) == 0){
		alt_u8 n = 4;
		while (data[n]!=' ' && n<64)
		{
			if(data[n] == '+'){
				lcd_string[n-4] = ' ';
				n++;
			}
			else
				lcd_string[n-4] = data[n++];
		}
		lcd_string_len = n-4;
		if(lcd_string_len > 0)
			lcd_string[lcd_string_len++] = '\n';
			lcd_string_changed = true;
		return 0x0;
	}
	else
		return 0x0;
}

