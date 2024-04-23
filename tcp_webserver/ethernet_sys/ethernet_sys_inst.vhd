	component ethernet_sys is
		port (
			clk_50_clk                             : in    std_logic                     := 'X';             -- clk
			clk_ref_125_clk                        : in    std_logic                     := 'X';             -- clk
			eth_tse_0_mac_mdio_connection_mdc      : out   std_logic;                                        -- mdc
			eth_tse_0_mac_mdio_connection_mdio_in  : in    std_logic                     := 'X';             -- mdio_in
			eth_tse_0_mac_mdio_connection_mdio_out : out   std_logic;                                        -- mdio_out
			eth_tse_0_mac_mdio_connection_mdio_oen : out   std_logic;                                        -- mdio_oen
			lcd_16207_0_external_RS                : out   std_logic;                                        -- RS
			lcd_16207_0_external_RW                : out   std_logic;                                        -- RW
			lcd_16207_0_external_data              : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			lcd_16207_0_external_E                 : out   std_logic;                                        -- E
			leds_crs                               : out   std_logic;                                        -- crs
			leds_link                              : out   std_logic;                                        -- link
			leds_panel_link                        : out   std_logic;                                        -- panel_link
			leds_col                               : out   std_logic;                                        -- col
			leds_an                                : out   std_logic;                                        -- an
			leds_char_err                          : out   std_logic;                                        -- char_err
			leds_disp_err                          : out   std_logic;                                        -- disp_err
			mac_misc_ff_tx_crc_fwd                 : in    std_logic                     := 'X';             -- ff_tx_crc_fwd
			mac_misc_ff_tx_septy                   : out   std_logic;                                        -- ff_tx_septy
			mac_misc_tx_ff_uflow                   : out   std_logic;                                        -- tx_ff_uflow
			mac_misc_ff_tx_a_full                  : out   std_logic;                                        -- ff_tx_a_full
			mac_misc_ff_tx_a_empty                 : out   std_logic;                                        -- ff_tx_a_empty
			mac_misc_rx_err_stat                   : out   std_logic_vector(17 downto 0);                    -- rx_err_stat
			mac_misc_rx_frm_type                   : out   std_logic_vector(3 downto 0);                     -- rx_frm_type
			mac_misc_ff_rx_dsav                    : out   std_logic;                                        -- ff_rx_dsav
			mac_misc_ff_rx_a_full                  : out   std_logic;                                        -- ff_rx_a_full
			mac_misc_ff_rx_a_empty                 : out   std_logic;                                        -- ff_rx_a_empty
			pio_0_external_connection_export       : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			pio_1_external_connection_export       : out   std_logic_vector(2 downto 0);                     -- export
			reset_reset_n                          : in    std_logic                     := 'X';             -- reset_n
			reset_0_reset_n                        : in    std_logic                     := 'X';             -- reset_n
			serdes_txp                             : out   std_logic;                                        -- txp
			serdes_rxp                             : in    std_logic                     := 'X';             -- rxp
			serdes_control_rx_recovclkout          : out   std_logic;                                        -- rx_recovclkout
			serdes_control_reconfig_clk            : in    std_logic                     := 'X';             -- reconfig_clk
			serdes_control_reconfig_togxb          : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- reconfig_togxb
			serdes_control_reconfig_fromgxb        : out   std_logic_vector(4 downto 0);                     -- reconfig_fromgxb
			serdes_control_reconfig_busy           : in    std_logic                     := 'X';             -- reconfig_busy
			sram_clk_clk                           : out   std_logic;                                        -- clk
			sram_cntrlr_0_conduit_end_dq           : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sram_cntrlr_0_conduit_end_addr         : out   std_logic_vector(20 downto 0);                    -- addr
			sram_cntrlr_0_conduit_end_sram_bwan    : out   std_logic;                                        -- sram_bwan
			sram_cntrlr_0_conduit_end_sram_bwbn    : out   std_logic;                                        -- sram_bwbn
			sram_cntrlr_0_conduit_end_sram_cen     : out   std_logic;                                        -- sram_cen
			sram_cntrlr_0_conduit_end_sram_oen     : out   std_logic;                                        -- sram_oen
			sram_cntrlr_0_conduit_end_sram_wen     : out   std_logic                                         -- sram_wen
		);
	end component ethernet_sys;

	u0 : component ethernet_sys
		port map (
			clk_50_clk                             => CONNECTED_TO_clk_50_clk,                             --                        clk_50.clk
			clk_ref_125_clk                        => CONNECTED_TO_clk_ref_125_clk,                        --                   clk_ref_125.clk
			eth_tse_0_mac_mdio_connection_mdc      => CONNECTED_TO_eth_tse_0_mac_mdio_connection_mdc,      -- eth_tse_0_mac_mdio_connection.mdc
			eth_tse_0_mac_mdio_connection_mdio_in  => CONNECTED_TO_eth_tse_0_mac_mdio_connection_mdio_in,  --                              .mdio_in
			eth_tse_0_mac_mdio_connection_mdio_out => CONNECTED_TO_eth_tse_0_mac_mdio_connection_mdio_out, --                              .mdio_out
			eth_tse_0_mac_mdio_connection_mdio_oen => CONNECTED_TO_eth_tse_0_mac_mdio_connection_mdio_oen, --                              .mdio_oen
			lcd_16207_0_external_RS                => CONNECTED_TO_lcd_16207_0_external_RS,                --          lcd_16207_0_external.RS
			lcd_16207_0_external_RW                => CONNECTED_TO_lcd_16207_0_external_RW,                --                              .RW
			lcd_16207_0_external_data              => CONNECTED_TO_lcd_16207_0_external_data,              --                              .data
			lcd_16207_0_external_E                 => CONNECTED_TO_lcd_16207_0_external_E,                 --                              .E
			leds_crs                               => CONNECTED_TO_leds_crs,                               --                          leds.crs
			leds_link                              => CONNECTED_TO_leds_link,                              --                              .link
			leds_panel_link                        => CONNECTED_TO_leds_panel_link,                        --                              .panel_link
			leds_col                               => CONNECTED_TO_leds_col,                               --                              .col
			leds_an                                => CONNECTED_TO_leds_an,                                --                              .an
			leds_char_err                          => CONNECTED_TO_leds_char_err,                          --                              .char_err
			leds_disp_err                          => CONNECTED_TO_leds_disp_err,                          --                              .disp_err
			mac_misc_ff_tx_crc_fwd                 => CONNECTED_TO_mac_misc_ff_tx_crc_fwd,                 --                      mac_misc.ff_tx_crc_fwd
			mac_misc_ff_tx_septy                   => CONNECTED_TO_mac_misc_ff_tx_septy,                   --                              .ff_tx_septy
			mac_misc_tx_ff_uflow                   => CONNECTED_TO_mac_misc_tx_ff_uflow,                   --                              .tx_ff_uflow
			mac_misc_ff_tx_a_full                  => CONNECTED_TO_mac_misc_ff_tx_a_full,                  --                              .ff_tx_a_full
			mac_misc_ff_tx_a_empty                 => CONNECTED_TO_mac_misc_ff_tx_a_empty,                 --                              .ff_tx_a_empty
			mac_misc_rx_err_stat                   => CONNECTED_TO_mac_misc_rx_err_stat,                   --                              .rx_err_stat
			mac_misc_rx_frm_type                   => CONNECTED_TO_mac_misc_rx_frm_type,                   --                              .rx_frm_type
			mac_misc_ff_rx_dsav                    => CONNECTED_TO_mac_misc_ff_rx_dsav,                    --                              .ff_rx_dsav
			mac_misc_ff_rx_a_full                  => CONNECTED_TO_mac_misc_ff_rx_a_full,                  --                              .ff_rx_a_full
			mac_misc_ff_rx_a_empty                 => CONNECTED_TO_mac_misc_ff_rx_a_empty,                 --                              .ff_rx_a_empty
			pio_0_external_connection_export       => CONNECTED_TO_pio_0_external_connection_export,       --     pio_0_external_connection.export
			pio_1_external_connection_export       => CONNECTED_TO_pio_1_external_connection_export,       --     pio_1_external_connection.export
			reset_reset_n                          => CONNECTED_TO_reset_reset_n,                          --                         reset.reset_n
			reset_0_reset_n                        => CONNECTED_TO_reset_0_reset_n,                        --                       reset_0.reset_n
			serdes_txp                             => CONNECTED_TO_serdes_txp,                             --                        serdes.txp
			serdes_rxp                             => CONNECTED_TO_serdes_rxp,                             --                              .rxp
			serdes_control_rx_recovclkout          => CONNECTED_TO_serdes_control_rx_recovclkout,          --                serdes_control.rx_recovclkout
			serdes_control_reconfig_clk            => CONNECTED_TO_serdes_control_reconfig_clk,            --                              .reconfig_clk
			serdes_control_reconfig_togxb          => CONNECTED_TO_serdes_control_reconfig_togxb,          --                              .reconfig_togxb
			serdes_control_reconfig_fromgxb        => CONNECTED_TO_serdes_control_reconfig_fromgxb,        --                              .reconfig_fromgxb
			serdes_control_reconfig_busy           => CONNECTED_TO_serdes_control_reconfig_busy,           --                              .reconfig_busy
			sram_clk_clk                           => CONNECTED_TO_sram_clk_clk,                           --                      sram_clk.clk
			sram_cntrlr_0_conduit_end_dq           => CONNECTED_TO_sram_cntrlr_0_conduit_end_dq,           --     sram_cntrlr_0_conduit_end.dq
			sram_cntrlr_0_conduit_end_addr         => CONNECTED_TO_sram_cntrlr_0_conduit_end_addr,         --                              .addr
			sram_cntrlr_0_conduit_end_sram_bwan    => CONNECTED_TO_sram_cntrlr_0_conduit_end_sram_bwan,    --                              .sram_bwan
			sram_cntrlr_0_conduit_end_sram_bwbn    => CONNECTED_TO_sram_cntrlr_0_conduit_end_sram_bwbn,    --                              .sram_bwbn
			sram_cntrlr_0_conduit_end_sram_cen     => CONNECTED_TO_sram_cntrlr_0_conduit_end_sram_cen,     --                              .sram_cen
			sram_cntrlr_0_conduit_end_sram_oen     => CONNECTED_TO_sram_cntrlr_0_conduit_end_sram_oen,     --                              .sram_oen
			sram_cntrlr_0_conduit_end_sram_wen     => CONNECTED_TO_sram_cntrlr_0_conduit_end_sram_wen      --                              .sram_wen
		);

