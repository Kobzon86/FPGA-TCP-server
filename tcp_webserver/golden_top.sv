//--------------------------------------------------------------------------//
// Title:       golden_top.v                                                //
// Rev:         Rev 1                                                       //
// Created:     3/20/2010                                                   //
//--------------------------------------------------------------------------//
// Description: C4GX Starter Kit Rev B PCB signal name and I/O standards    //
//              for all FPGA pins                                           //
//--------------------------------------------------------------------------//
// Revision History:                                                        //
// Rev 1:       First cut from tcl-script output                            //
//----------------------------------------------------------------------------
//------ 1 ------- 2 ------- 3 ------- 4 ------- 5 ------- 6 ------- 7 ------7
//------ 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------8
//----------------------------------------------------------------------------
// Rev 2:       Further IO description                                      //
// Created: 01.27.2016, by Kirstin Kita
//----------------------------------------------------------------------------
//------ 1 ------- 2 ------- 3 ------- 4 ------- 5 ------- 6 ------- 7 ------7
//------ 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------8
//----------------------------------------------------------------------------
//Copyright � 2010 Altera Corporation. All rights reserved.  Altera products
//are protected under numerous U.S. and foreign patents, maskwork rights,
//copyrights and other intellectual property laws.
//
//This reference design file, and your use thereof, is subject to and
//governed by the terms and conditions of the applicable Altera Reference
//Design License Agreement.  By using this reference design file, you
//indicate your acceptance of such terms and conditions between you and
//Altera Corporation.  In the event that you do not agree with such terms and
//conditions, you may not use the reference design file. Please promptly
//destroy any copies you have made.
//
//This reference design file being provided on an "as-is" basis and as an
//accommodation and therefore all warranties, representations or guarantees
//of any kind (whether express, implied or statutory) including, without
//limitation, warranties of merchantability, non-infringement, or fitness for
//a particular purpose, are specifically disclaimed.  By making this
//reference design file available, Altera expressly does not recommend,
//suggest or require that this reference design file be used in combination
//with any other product not provided by Altera.
//


`define	enet_sma_xcvr          //comment in to use Ethernet transceiver
//Requires valid ALTGX megafunction

// `define	pcie_xcvr              //comment in to use PCIe transceiver
//Requires valid ALTGX megafunction

`define	clkin_50	clk_b7_se
`define fsm
// `define flash
`define ssram
`define ethernet2_5
`define user_io
// `define epcs

`ifdef	enet_sma_xcvr
	`define	use_enet_sma_xcvr_refclk_p
	`define	enet_sma_xcvr_refclk_p	refclk_125_p
`endif

`ifdef	pcie_xcvr
	`define	use_pcie_xcvr_refclk_p
	`define	pcie_xcvr_refclk_p	pcie_refclk_p
`endif

module golden_top (
	//-----------Clocks-----------
	input         diff_125_p   ,
	input         clk_b7_se    ,
	//-----------FSM--------------
	////  2.5-V  ////
	`ifdef fsm
	output [23:0] fsm_a        ,
	inout  [15:0] fsm_d        ,
	output        fsm_oen      ,
	output        fsm_wen      ,
	`endif
	//-----------Flash------------
	////        2.5-V        ////
	`ifdef flash
	output        flash_cen    ,
	`endif
	//-----------Ssram-----------
	////        2.5-V        ////
	`ifdef ssram
	output        sram_bwan    ,
	output        sram_bwbn    ,
	output        sram_cen     ,
	output        sram_clk     ,
	`endif
	//---------Ethernet----------
	`ifdef ethernet2_5
	////        2.5-V        ////
	input         enet_intn    ,
	output        enet_mdc     ,
	inout         enet_mdio    ,
	output        enet_resetn  ,
	`endif
	`ifdef	enet_sma_xcvr
	////     1.4-V PCML     ////
	input         enetr_rx_p   ,
	output        enetr_tx_p   ,
	`endif
	`ifdef	use_enet_sma_xcvr_refclk_p
	////         LVDS       ////
	input         refclk_125_p ,
	`endif
	//----------PCIe--------------
	input         pcie_perstn  ,
	`ifdef use_pcie_xcvr_refclk_p
	////   100 MHz HCSL   ////
	input         pcie_refclk_p,
	`endif
	`ifdef	pcie_xcvr
	////    1.4-V PCML    ////
	input         pcie_rx_p    ,
	output        pcie_tx_p    ,
	`endif
	//----------User IO-----------
	`ifdef user_io
	input         cpu_resetn   ,
	output        lcd_csn      ,
	output [ 3:0] user_led     ,
	input  [ 1:0] user_pb      ,
	output        max2_csn     
	`endif
	//----------EPCS-----------
	`ifdef epcs
	,inout         config_data0 , // for epcs r/w using NiosII
	output        dclk         ,
	output        epcs_cen     ,
	output        epcs_sdo
	`endif
);
//	assign sram_cen = 1'b1;
	// assign lcd_csn = 1'b1;
	assign max2_csn = 1'b1;
	// assign user_led[3] = |user_pb;
	assign enet_resetn = 1'b1;

 
 
	reg  [10:0] cntr  = 0       ;
	wire        reset = cntr[10];

always_ff @(posedge clk_b7_se or negedge cpu_resetn) begin : proc_
	if(~cpu_resetn) begin
		cntr <= '0;
	end else begin
		cntr <= cntr[10] ? cntr : (cntr + 1);
	end
end



	wire reconfig_fromgxb       ;
	wire reconfig_busy          ;
	wire rx_recovclkout         ;
	wire magic_wakeup           ;
	wire magic_sleep_n    = 1'b1;

	wire [17:0] mac_misc_rx_err_stat  ;
	wire [ 3:0] mac_misc_rx_frm_type  ;
	wire        mac_misc_ff_rx_dsav   ;
	wire        mac_misc_ff_rx_a_full ;
	wire        mac_misc_ff_rx_a_empty;

	wire mac_misc_ff_tx_crc_fwd;
	wire mac_misc_ff_tx_septy  ;
	wire mac_misc_tx_ff_uflow  ;
	wire mac_misc_ff_tx_a_full ;
	wire mac_misc_ff_tx_a_empty;

	logic mdio_oen;
	logic mdio_in ;
	logic mdio_out;
	
	
	
	
	logic [23:0] sram_addr,lcd_addr;
	logic [7:0]lcd_d;
	logic [15:0]sram_d;
	
	ethernet_sys u0 (
		.clk_50_clk                            (clk_b7_se             ), //                        clk_50.clk
		.reset_0_reset_n                       (reset                 ),
		
		`ifdef enet_sma_xcvr
		.clk_ref_125_clk                       (refclk_125_p          ), //            clk.clk
		.reset_reset_n                         (reset                 ), //          reset.reset_n
		.serdes_control_rx_recovclkout         (rx_recovclkout        ), // serdes_control.rx_recovclkout
		.serdes_control_reconfig_clk           (clk_b7_se             ), //               .reconfig_clk
		.serdes_control_reconfig_togxb         (2'd2                  ), //               .reconfig_togxb
		.serdes_control_reconfig_fromgxb       (reconfig_fromgxb      ), //               .reconfig_fromgxb
		.serdes_control_reconfig_busy          (reconfig_busy         ), //               .reconfig_busy
		
		.serdes_txp                            (enetr_tx_p            ), //         serdes.txp
		.serdes_rxp                            (enetr_rx_p            ), //               .rxp
		
		// .leds_crs                              (user_led[1]           ), //           leds.crs
		// .leds_link                             (user_led[0]           ), //               .link
		// .leds_panel_link                       (user_led[2]           ), //               .panel_link
		// .leds_col                              (                      ), //               .col
		// .leds_an                               (                      ), //               .an
		// .leds_char_err                         (                      ), //               .char_err
		// .leds_disp_err                         (                      ), //               .disp_err
		
		// .mac_misc_magic_wakeup                 (magic_wakeup          ), //       mac_misc.magic_wakeup
		// .mac_misc_magic_sleep_n                (magic_sleep_n         ), //               .magic_sleep_n
		
		.mac_misc_ff_tx_crc_fwd                (mac_misc_ff_tx_crc_fwd), //               .ff_tx_crc_fwd
		.mac_misc_ff_tx_septy                  (mac_misc_ff_tx_septy  ), //               .ff_tx_septy
		.mac_misc_tx_ff_uflow                  (mac_misc_tx_ff_uflow  ), //               .tx_ff_uflow
		.mac_misc_ff_tx_a_full                 (mac_misc_ff_tx_a_full ), //               .ff_tx_a_full
		.mac_misc_ff_tx_a_empty                (mac_misc_ff_tx_a_empty), //               .ff_tx_a_empty
		
		.mac_misc_rx_err_stat                  (mac_misc_rx_err_stat  ), //               .rx_err_stat
		.mac_misc_rx_frm_type                  (mac_misc_rx_frm_type  ), //               .rx_frm_type
		.mac_misc_ff_rx_dsav                   (mac_misc_ff_rx_dsav   ), //               .ff_rx_dsav
		.mac_misc_ff_rx_a_full                 (mac_misc_ff_rx_a_full ), //               .ff_rx_a_full
		.mac_misc_ff_rx_a_empty                (mac_misc_ff_rx_a_empty), //               .ff_rx_a_empty
		
		.eth_tse_0_mac_mdio_connection_mdc     (enet_mdc              ), // eth_tse_0_mac_mdio_connection.mdc
		.eth_tse_0_mac_mdio_connection_mdio_in (mdio_in               ), //                              .mdio_in
		.eth_tse_0_mac_mdio_connection_mdio_out(mdio_out              ), //                              .mdio_out
		.eth_tse_0_mac_mdio_connection_mdio_oen(mdio_oen              ),
		`endif
		`ifdef	pcie_xcvr
		.pcie_hard_ip_0_pcie_rstn_export       (pcie_perstn           ), //          pcie_hard_ip_0_pcie_rstn.export
		.pcie_hard_ip_0_powerdown_pll_powerdown(1'b0                  ), //          pcie_hard_ip_0_powerdown.pll_powerdown
		.pcie_hard_ip_0_powerdown_gxb_powerdown(1'b0                  ), //                                  .gxb_powerdown
		.pcie_hard_ip_0_refclk_export          (pcie_refclk_p         ), //             pcie_hard_ip_0_refclk.export
		.pcie_hard_ip_0_rx_in_rx_datain_0      (pcie_rx_p             ), //              pcie_hard_ip_0_rx_in.rx_datain_0
		.pcie_hard_ip_0_tx_out_tx_dataout_0    (pcie_tx_p             ), //             pcie_hard_ip_0_tx_out.tx_dataout_0
		.pcie_hard_ip_0_reconfig_togxb_data    (4'b0010               ),
		`endif
		
		///LCD
		.lcd_16207_0_external_RS               (fsm_a[1]              ), // lcd_16207_0_external.RS
		.lcd_16207_0_external_RW               (fsm_a[0]              ), //                     .RW
		.lcd_16207_0_external_data             (fsm_d[7:0]            ), //                     .data
		.lcd_16207_0_external_E                (lcd_csn               ),
		
		///buttons and leds
		.pio_0_external_connection_export      (user_pb               ),
		.pio_1_external_connection_export      (user_led              ),
		
		////SRAM
		.sram_clk_clk                          (sram_clk              ),
		// .sram_cntrlr_0_conduit_end_dq          (fsm_d                 ), //     sram_cntrlr_0_conduit_end.dq
		// .sram_cntrlr_0_conduit_end_addr        (fsm_a                 ), //                              .addr
		
		.sram_cntrlr_0_conduit_end_sram_bwan   (sram_bwan             ), //                              .sram_bwan
		.sram_cntrlr_0_conduit_end_sram_bwbn   (sram_bwbn             ), //                              .sram_bwbn
		.sram_cntrlr_0_conduit_end_sram_cen    (sram_cen              ), //                              .sram_cen
		.sram_cntrlr_0_conduit_end_sram_oen    (fsm_oen               ), //                              .sram_oen
		.sram_cntrlr_0_conduit_end_sram_wen    (fsm_wen               )
	);
		
		`ifdef enet_sma_xcvr
		assign  enet_mdio = mdio_oen ? mdio_out : mdio_in;
		`endif


// 		wire [45:0] source;
// 		    sap u0 (
// 		        .source_clk (clk_b7_se), // source_clk.clk
// 		        .source     (source)      //    sources.source
		
//  );


	 
	 
endmodule