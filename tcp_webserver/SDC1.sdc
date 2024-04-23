create_clock -name clk_125 -period 8.000 [get_ports refclk_125_p]

# Derive PLL generated output clocks.
derive_pll_clocks
create_clock -name clk_50 -period 20.000 [get_ports clk_b7_se]



create_clock -name clk_full -period 5.000 [get_ports clk_full]
create_clock -name clk -period 5.000 [get_ports clk]