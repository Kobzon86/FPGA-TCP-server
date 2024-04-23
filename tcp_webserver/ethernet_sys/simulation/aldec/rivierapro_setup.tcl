
# (C) 2001-2024 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 18.1 625 win32 2024.02.22.10:54:17
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     ethernet_sys
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If ethernet_sys is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "ethernet_sys"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga/18.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_rf_ram_b.mif ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_onchip_memory2_0.hex ./
  file copy -force $QSYS_SIMDIR/submodules/ethernet_sys_descriptor_memory.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                        ./libraries/altera_ver            
vmap       altera_ver             ./libraries/altera_ver            
ensure_lib                        ./libraries/lpm_ver               
vmap       lpm_ver                ./libraries/lpm_ver               
ensure_lib                        ./libraries/sgate_ver             
vmap       sgate_ver              ./libraries/sgate_ver             
ensure_lib                        ./libraries/altera_mf_ver         
vmap       altera_mf_ver          ./libraries/altera_mf_ver         
ensure_lib                        ./libraries/altera_lnsim_ver      
vmap       altera_lnsim_ver       ./libraries/altera_lnsim_ver      
ensure_lib                        ./libraries/cycloneiv_hssi_ver    
vmap       cycloneiv_hssi_ver     ./libraries/cycloneiv_hssi_ver    
ensure_lib                        ./libraries/cycloneiv_pcie_hip_ver
vmap       cycloneiv_pcie_hip_ver ./libraries/cycloneiv_pcie_hip_ver
ensure_lib                        ./libraries/cycloneiv_ver         
vmap       cycloneiv_ver          ./libraries/cycloneiv_ver         
ensure_lib                                       ./libraries/error_adapter_0                      
vmap       error_adapter_0                       ./libraries/error_adapter_0                      
ensure_lib                                       ./libraries/timing_adapter_0                     
vmap       timing_adapter_0                      ./libraries/timing_adapter_0                     
ensure_lib                                       ./libraries/rsp_mux                              
vmap       rsp_mux                               ./libraries/rsp_mux                              
ensure_lib                                       ./libraries/rsp_demux                            
vmap       rsp_demux                             ./libraries/rsp_demux                            
ensure_lib                                       ./libraries/cmd_mux                              
vmap       cmd_mux                               ./libraries/cmd_mux                              
ensure_lib                                       ./libraries/cmd_demux                            
vmap       cmd_demux                             ./libraries/cmd_demux                            
ensure_lib                                       ./libraries/router_002                           
vmap       router_002                            ./libraries/router_002                           
ensure_lib                                       ./libraries/router                               
vmap       router                                ./libraries/router                               
ensure_lib                                       ./libraries/router_004                           
vmap       router_004                            ./libraries/router_004                           
ensure_lib                                       ./libraries/avalon_st_adapter                    
vmap       avalon_st_adapter                     ./libraries/avalon_st_adapter                    
ensure_lib                                       ./libraries/crosser                              
vmap       crosser                               ./libraries/crosser                              
ensure_lib                                       ./libraries/rsp_mux_001                          
vmap       rsp_mux_001                           ./libraries/rsp_mux_001                          
ensure_lib                                       ./libraries/rsp_demux_001                        
vmap       rsp_demux_001                         ./libraries/rsp_demux_001                        
ensure_lib                                       ./libraries/cmd_mux_004                          
vmap       cmd_mux_004                           ./libraries/cmd_mux_004                          
ensure_lib                                       ./libraries/cmd_demux_001                        
vmap       cmd_demux_001                         ./libraries/cmd_demux_001                        
ensure_lib                                       ./libraries/router_006                           
vmap       router_006                            ./libraries/router_006                           
ensure_lib                                       ./libraries/router_001                           
vmap       router_001                            ./libraries/router_001                           
ensure_lib                                       ./libraries/eth_tse_0_control_port_agent_rsp_fifo
vmap       eth_tse_0_control_port_agent_rsp_fifo ./libraries/eth_tse_0_control_port_agent_rsp_fifo
ensure_lib                                       ./libraries/eth_tse_0_control_port_agent         
vmap       eth_tse_0_control_port_agent          ./libraries/eth_tse_0_control_port_agent         
ensure_lib                                       ./libraries/nios2_gen2_0_data_master_agent       
vmap       nios2_gen2_0_data_master_agent        ./libraries/nios2_gen2_0_data_master_agent       
ensure_lib                                       ./libraries/eth_tse_0_control_port_translator    
vmap       eth_tse_0_control_port_translator     ./libraries/eth_tse_0_control_port_translator    
ensure_lib                                       ./libraries/nios2_gen2_0_data_master_translator  
vmap       nios2_gen2_0_data_master_translator   ./libraries/nios2_gen2_0_data_master_translator  
ensure_lib                                       ./libraries/cpu                                  
vmap       cpu                                   ./libraries/cpu                                  
ensure_lib                                       ./libraries/i_altgxb_0                           
vmap       i_altgxb_0                            ./libraries/i_altgxb_0                           
ensure_lib                                       ./libraries/i_tse_pcs_0                          
vmap       i_tse_pcs_0                           ./libraries/i_tse_pcs_0                          
ensure_lib                                       ./libraries/avalon_arbiter                       
vmap       avalon_arbiter                        ./libraries/avalon_arbiter                       
ensure_lib                                       ./libraries/i_tse_mac                            
vmap       i_tse_mac                             ./libraries/i_tse_mac                            
ensure_lib                                       ./libraries/rst_controller                       
vmap       rst_controller                        ./libraries/rst_controller                       
ensure_lib                                       ./libraries/avalon_st_adapter_001                
vmap       avalon_st_adapter_001                 ./libraries/avalon_st_adapter_001                
ensure_lib                                       ./libraries/irq_synchronizer                     
vmap       irq_synchronizer                      ./libraries/irq_synchronizer                     
ensure_lib                                       ./libraries/irq_mapper                           
vmap       irq_mapper                            ./libraries/irq_mapper                           
ensure_lib                                       ./libraries/mm_interconnect_2                    
vmap       mm_interconnect_2                     ./libraries/mm_interconnect_2                    
ensure_lib                                       ./libraries/mm_interconnect_1                    
vmap       mm_interconnect_1                     ./libraries/mm_interconnect_1                    
ensure_lib                                       ./libraries/mm_interconnect_0                    
vmap       mm_interconnect_0                     ./libraries/mm_interconnect_0                    
ensure_lib                                       ./libraries/sgdma_1                              
vmap       sgdma_1                               ./libraries/sgdma_1                              
ensure_lib                                       ./libraries/sgdma_0                              
vmap       sgdma_0                               ./libraries/sgdma_0                              
ensure_lib                                       ./libraries/onchip_memory2_0                     
vmap       onchip_memory2_0                      ./libraries/onchip_memory2_0                     
ensure_lib                                       ./libraries/nios2_gen2_0                         
vmap       nios2_gen2_0                          ./libraries/nios2_gen2_0                         
ensure_lib                                       ./libraries/lcd_16207_0                          
vmap       lcd_16207_0                           ./libraries/lcd_16207_0                          
ensure_lib                                       ./libraries/eth_tse_0                            
vmap       eth_tse_0                             ./libraries/eth_tse_0                            
ensure_lib                                       ./libraries/descriptor_memory                    
vmap       descriptor_memory                     ./libraries/descriptor_memory                    
ensure_lib                                       ./libraries/altpll_0                             
vmap       altpll_0                              ./libraries/altpll_0                             
ensure_lib                                       ./libraries/NIOS_data                            
vmap       NIOS_data                             ./libraries/NIOS_data                            

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"        -work altera_ver            
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                 -work lpm_ver               
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                    -work sgate_ver             
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                -work altera_mf_ver         
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"            -work altera_lnsim_ver      
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_atoms.v"     -work cycloneiv_hssi_ver    
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_atoms.v" -work cycloneiv_pcie_hip_ver
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_atoms.v"          -work cycloneiv_ver         
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_avalon_st_adapter_001_timing_adapter_0.sv"              -work timing_adapter_0                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_avalon_st_adapter_001_timing_adapter_0_fifo.sv"         -work timing_adapter_0                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_avalon_st_adapter_001_error_adapter_0.sv"               -work error_adapter_0                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_avalon_st_adapter_error_adapter_0.sv"                   -work error_adapter_0                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2_rsp_mux.sv"                           -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2_rsp_demux.sv"                         -work rsp_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2_cmd_mux.sv"                           -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2_cmd_demux.sv"                         -work cmd_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2_router_002.sv"                        -work router_002                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2_router.sv"                            -work router                               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1_rsp_mux.sv"                           -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1_rsp_demux.sv"                         -work rsp_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1_cmd_mux.sv"                           -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1_cmd_demux.sv"                         -work cmd_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1_router_004.sv"                        -work router_004                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1_router.sv"                            -work router                               
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                          -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                    -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                    -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                     -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_rsp_mux_001.sv"                       -work rsp_mux_001                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_001                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_rsp_demux_001.sv"                     -work rsp_demux_001                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_cmd_mux_004.sv"                       -work cmd_mux_004                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_004                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_cmd_demux_001.sv"                     -work cmd_demux_001                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_router_006.sv"                        -work router_006                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_router_002.sv"                        -work router_002                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_router_001.sv"                        -work router_001                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0_router.sv"                            -work router                               
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                             -work eth_tse_0_control_port_agent_rsp_fifo
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                        -work eth_tse_0_control_port_agent         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                 -work eth_tse_0_control_port_agent         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                       -work nios2_gen2_0_data_master_agent       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                   -work eth_tse_0_control_port_translator    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                  -work nios2_gen2_0_data_master_translator  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu.v"                                     -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_debug_slave_sysclk.v"                  -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_debug_slave_tck.v"                     -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_debug_slave_wrapper.v"                 -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0_cpu_test_bench.v"                          -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_eth_tse_0_i_altgxb_0.vo"                                -work i_altgxb_0                           
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_pcs_pma_gxb.v"                                  -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_align_sync.v"                                       -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_dec10b8b.v"                                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_dec_func.v"                                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_enc8b10b.v"                                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_autoneg.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_carrier_sense.v"                                    -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_clk_gen.v"                                          -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sgmii_clk_div.v"                                    -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sgmii_clk_enable.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_encapsulation.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_encapsulation.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_encapsulation_strx_gx.v"                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_pcs_control.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_pcs_host_control.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mdio_reg.v"                                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mii_rx_if_pcs.v"                                    -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mii_tx_if_pcs.v"                                    -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_sync.v"                                          -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sgmii_clk_cntl.v"                                   -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_colision_detect.v"                                  -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_converter.v"                                     -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_fifo_rd.v"                                       -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_rx_converter.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_sgmii.v"                                        -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_sgmii_strx_gx.v"                                -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_tx_converter.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_converter.v"                                     -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_1000_base_x.v"                                  -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_1000_base_x_strx_gx.v"                          -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_pcs.v"                                          -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_pcs_strx_gx.v"                                  -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_rx.v"                                           -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_tx.v"                                           -work i_tse_pcs_0                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/aldec/altera_tse_reset_sequencer.sv"                                 -work i_tse_pcs_0                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/aldec/altera_tse_reset_ctrl_lego.sv"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_xcvr_resync.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_gxb_aligned_rxsync.v"                               -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_std_synchronizer.v"                             -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_std_synchronizer_bundle.v"                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_ptp_std_synchronizer.v"                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_false_path_marker.v"                                -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_reset_synchronizer.v"                               -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_clock_crosser.v"                                    -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_13.v"                                        -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_24.v"                                        -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_34.v"                                        -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_opt_1246.v"                                  -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_opt_14_44.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_opt_36_10.v"                                 -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_gray_cnt.v"                                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sdpm_altsyncram.v"                                  -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_altsyncram_dpm_fifo.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_bin_cnt.v"                                          -work i_tse_pcs_0                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/aldec/altera_tse_ph_calculator.sv"                                   -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sdpm_gen.v"                                         -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x10.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x10.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x10_wrapper.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x14.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x14.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x14_wrapper.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x2.v"                                       -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x2.v"                                       -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x2_wrapper.v"                               -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x23.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x23.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x23_wrapper.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x36.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x36.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x36_wrapper.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x40.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x40.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x40_wrapper.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x30.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x30.v"                                      -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x30_wrapper.v"                              -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_status_crosser.v"                               -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                     -work i_tse_pcs_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_avalon_arbiter.v"                               -work avalon_arbiter                       
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_mac.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_clk_cntl.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_crc328checker.v"                                    -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_crc328generator.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_crc32ctl8.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_crc32galois8.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_gmii_io.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_lb_read_cntl.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_lb_wrt_cntl.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_hashing.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_host_control.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_host_control_small.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mac_control.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_register_map.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_register_map_small.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_counter_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_shared_mac_control.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_shared_register_map.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_counter_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_lfsr_10.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_loopback_ff.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_altshifttaps.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_fifoless_mac_rx.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mac_rx.v"                                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_fifoless_mac_tx.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mac_tx.v"                                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_magic_detection.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mdio.v"                                             -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mdio_clk_gen.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mdio_cntl.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_mdio.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mii_rx_if.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_mii_tx_if.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_pipeline_base.v"                                    -work i_tse_mac                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/aldec/altera_tse_pipeline_stage.sv"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_dpram_16x32.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_dpram_8x32.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_dpram_ecc_16x32.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_fifoless_retransmit_cntl.v"                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_retransmit_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rgmii_in1.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rgmii_in4.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_nf_rgmii_module.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rgmii_module.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rgmii_out1.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rgmii_out4.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_ff.v"                                            -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_min_ff.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_ff_cntrl.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_ff_cntrl_32.v"                                   -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_ff_cntrl_32_shift16.v"                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_ff_length.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_rx_stat_extract.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_timing_adapter32.v"                                 -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_timing_adapter8.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_timing_adapter_fifo32.v"                            -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_timing_adapter_fifo8.v"                             -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_1geth.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_fifoless_1geth.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_w_fifo.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_w_fifo_10_100_1000.v"                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_wo_fifo.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_wo_fifo_10_100_1000.v"                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_top_gen_host.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_ff.v"                                            -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_min_ff.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_ff_cntrl.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_ff_cntrl_32.v"                                   -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_ff_cntrl_32_shift16.v"                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_ff_length.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_ff_read_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_tx_stat_extract.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_std_synchronizer.v"                             -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_std_synchronizer_bundle.v"                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_eth_tse_ptp_std_synchronizer.v"                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_false_path_marker.v"                                -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_reset_synchronizer.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_clock_crosser.v"                                    -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_13.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_24.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_34.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_opt_1246.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_opt_14_44.v"                                 -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_a_fifo_opt_36_10.v"                                 -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_gray_cnt.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sdpm_altsyncram.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_altsyncram_dpm_fifo.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_bin_cnt.v"                                          -work i_tse_mac                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/aldec/altera_tse_ph_calculator.sv"                                   -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_sdpm_gen.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x10.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x10.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x10_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x14.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x14.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x14_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x2.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x2.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x2_wrapper.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x23.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x23.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x23_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x36.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x36.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x36_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x40.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x40.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x40_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_dec_x30.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x30.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_enc_x30_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/altera_tse_ecc_status_crosser.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                           -work rst_controller                       
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                         -work rst_controller                       
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_avalon_st_adapter_001.v"                                -work avalon_st_adapter_001                
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_avalon_st_adapter.v"                                    -work avalon_st_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_irq_clock_crosser.sv"                                         -work irq_synchronizer                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/ethernet_sys_irq_mapper.sv"                                          -work irq_mapper                           
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_2.v"                                    -work mm_interconnect_2                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_1.v"                                    -work mm_interconnect_1                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_mm_interconnect_0.v"                                    -work mm_interconnect_0                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_sgdma_1.v"                                              -work sgdma_1                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_sgdma_0.v"                                              -work sgdma_0                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_onchip_memory2_0.v"                                     -work onchip_memory2_0                     
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_nios2_gen2_0.v"                                         -work nios2_gen2_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_lcd_16207_0.v"                                          -work lcd_16207_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_eth_tse_0.v"                                            -work eth_tse_0                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_descriptor_memory.v"                                    -work descriptor_memory                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_altpll_0.vo"                                            -work altpll_0                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ethernet_sys_NIOS_data.v"                                            -work NIOS_data                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/ethernet_sys.v"                                                                                                            
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L timing_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_002 -L router -L router_004 -L avalon_st_adapter -L crosser -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_004 -L cmd_demux_001 -L router_006 -L router_001 -L eth_tse_0_control_port_agent_rsp_fifo -L eth_tse_0_control_port_agent -L nios2_gen2_0_data_master_agent -L eth_tse_0_control_port_translator -L nios2_gen2_0_data_master_translator -L cpu -L i_altgxb_0 -L i_tse_pcs_0 -L avalon_arbiter -L i_tse_mac -L rst_controller -L avalon_st_adapter_001 -L irq_synchronizer -L irq_mapper -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L sgdma_1 -L sgdma_0 -L onchip_memory2_0 -L nios2_gen2_0 -L lcd_16207_0 -L eth_tse_0 -L descriptor_memory -L altpll_0 -L NIOS_data -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L timing_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_002 -L router -L router_004 -L avalon_st_adapter -L crosser -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_004 -L cmd_demux_001 -L router_006 -L router_001 -L eth_tse_0_control_port_agent_rsp_fifo -L eth_tse_0_control_port_agent -L nios2_gen2_0_data_master_agent -L eth_tse_0_control_port_translator -L nios2_gen2_0_data_master_translator -L cpu -L i_altgxb_0 -L i_tse_pcs_0 -L avalon_arbiter -L i_tse_mac -L rst_controller -L avalon_st_adapter_001 -L irq_synchronizer -L irq_mapper -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L sgdma_1 -L sgdma_0 -L onchip_memory2_0 -L nios2_gen2_0 -L lcd_16207_0 -L eth_tse_0 -L descriptor_memory -L altpll_0 -L NIOS_data -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h