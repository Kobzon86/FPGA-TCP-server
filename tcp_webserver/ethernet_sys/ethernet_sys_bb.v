
module ethernet_sys (
	clk_50_clk,
	clk_ref_125_clk,
	eth_tse_0_mac_mdio_connection_mdc,
	eth_tse_0_mac_mdio_connection_mdio_in,
	eth_tse_0_mac_mdio_connection_mdio_out,
	eth_tse_0_mac_mdio_connection_mdio_oen,
	lcd_16207_0_external_RS,
	lcd_16207_0_external_RW,
	lcd_16207_0_external_data,
	lcd_16207_0_external_E,
	leds_crs,
	leds_link,
	leds_panel_link,
	leds_col,
	leds_an,
	leds_char_err,
	leds_disp_err,
	mac_misc_ff_tx_crc_fwd,
	mac_misc_ff_tx_septy,
	mac_misc_tx_ff_uflow,
	mac_misc_ff_tx_a_full,
	mac_misc_ff_tx_a_empty,
	mac_misc_rx_err_stat,
	mac_misc_rx_frm_type,
	mac_misc_ff_rx_dsav,
	mac_misc_ff_rx_a_full,
	mac_misc_ff_rx_a_empty,
	pio_0_external_connection_export,
	pio_1_external_connection_export,
	reset_reset_n,
	reset_0_reset_n,
	serdes_txp,
	serdes_rxp,
	serdes_control_rx_recovclkout,
	serdes_control_reconfig_clk,
	serdes_control_reconfig_togxb,
	serdes_control_reconfig_fromgxb,
	serdes_control_reconfig_busy,
	sram_clk_clk,
	sram_cntrlr_0_conduit_end_dq,
	sram_cntrlr_0_conduit_end_addr,
	sram_cntrlr_0_conduit_end_sram_bwan,
	sram_cntrlr_0_conduit_end_sram_bwbn,
	sram_cntrlr_0_conduit_end_sram_cen,
	sram_cntrlr_0_conduit_end_sram_oen,
	sram_cntrlr_0_conduit_end_sram_wen);	

	input		clk_50_clk;
	input		clk_ref_125_clk;
	output		eth_tse_0_mac_mdio_connection_mdc;
	input		eth_tse_0_mac_mdio_connection_mdio_in;
	output		eth_tse_0_mac_mdio_connection_mdio_out;
	output		eth_tse_0_mac_mdio_connection_mdio_oen;
	output		lcd_16207_0_external_RS;
	output		lcd_16207_0_external_RW;
	inout	[7:0]	lcd_16207_0_external_data;
	output		lcd_16207_0_external_E;
	output		leds_crs;
	output		leds_link;
	output		leds_panel_link;
	output		leds_col;
	output		leds_an;
	output		leds_char_err;
	output		leds_disp_err;
	input		mac_misc_ff_tx_crc_fwd;
	output		mac_misc_ff_tx_septy;
	output		mac_misc_tx_ff_uflow;
	output		mac_misc_ff_tx_a_full;
	output		mac_misc_ff_tx_a_empty;
	output	[17:0]	mac_misc_rx_err_stat;
	output	[3:0]	mac_misc_rx_frm_type;
	output		mac_misc_ff_rx_dsav;
	output		mac_misc_ff_rx_a_full;
	output		mac_misc_ff_rx_a_empty;
	input	[7:0]	pio_0_external_connection_export;
	output	[2:0]	pio_1_external_connection_export;
	input		reset_reset_n;
	input		reset_0_reset_n;
	output		serdes_txp;
	input		serdes_rxp;
	output		serdes_control_rx_recovclkout;
	input		serdes_control_reconfig_clk;
	input	[3:0]	serdes_control_reconfig_togxb;
	output	[4:0]	serdes_control_reconfig_fromgxb;
	input		serdes_control_reconfig_busy;
	output		sram_clk_clk;
	inout	[15:0]	sram_cntrlr_0_conduit_end_dq;
	output	[20:0]	sram_cntrlr_0_conduit_end_addr;
	output		sram_cntrlr_0_conduit_end_sram_bwan;
	output		sram_cntrlr_0_conduit_end_sram_bwbn;
	output		sram_cntrlr_0_conduit_end_sram_cen;
	output		sram_cntrlr_0_conduit_end_sram_oen;
	output		sram_cntrlr_0_conduit_end_sram_wen;
endmodule
