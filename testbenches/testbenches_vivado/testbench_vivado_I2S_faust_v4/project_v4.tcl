#*****************************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# project_v4.tcl: Tcl script for re-creating project 'le_meilleur_projet'
#
# Generated by Vivado on Wed Apr 29 07:30:33 CEST 2020
# IP Build 2548770 on Fri May 24 18:01:18 MDT 2019
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# NOTE: In order to use this script for source control purposes, please make sure that the
#       following files are added to the source control system:-
#
# 1. This project restoration tcl script (project_v4.tcl) that was generated.
#
# 2. The following source(s) files that were local or imported into the original project.
#    (Please see the '$orig_proj_dir' and '$origin_dir' variable setting below at the start of the script)
#
#    "/home/trisset/technical/syfala/v4-no-axi/v4-no-axi/le_meilleur_projet/le_meilleur_projet.srcs/sources_1/imports/src/TB_I2S_Faust.vhd"
#    "/home/trisset/technical/syfala/v4-no-axi/v4-no-axi/le_meilleur_projet/le_meilleur_projet.srcs/sources_1/imports/src/i2stranciever.vhd"
#    "/home/trisset/technical/syfala/v4-no-axi/v4-no-axi/le_meilleur_projet/le_meilleur_projet.srcs/sources_1/bd/simu_oth/hdl/simu_both_wrapper.vhd"
#    "/home/trisset/technical/syfala/v4-no-axi/v4-no-axi/le_meilleur_projet/le_meilleur_projet.srcs/constrs_1/imports/src/master.xdc"
#
# 3. The following remote source files that were added to the original project:-
#
#    <none>
#
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "faust_v4_project"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "project_v4.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/"]"

# Create project
create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xc7z010clg400-1 -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "digilentinc.com:zybo-z7-10:part0:1.0" -objects $obj
set_property -name "board_part_repo_paths" -value "/home/trisset/.Xilinx/Vivado/2019.1/xhub/board_store" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "dsa.accelerator_binary_content" -value "bitstream" -objects $obj
set_property -name "dsa.accelerator_binary_format" -value "xclbin2" -objects $obj
set_property -name "dsa.board_id" -value "zybo-z7-10" -objects $obj
set_property -name "dsa.description" -value "Vivado generated DSA" -objects $obj
set_property -name "dsa.dr_bd_base_address" -value "0" -objects $obj
set_property -name "dsa.emu_dir" -value "emu" -objects $obj
set_property -name "dsa.flash_interface_type" -value "bpix16" -objects $obj
set_property -name "dsa.flash_offset_address" -value "0" -objects $obj
set_property -name "dsa.flash_size" -value "1024" -objects $obj
set_property -name "dsa.host_architecture" -value "x86_64" -objects $obj
set_property -name "dsa.host_interface" -value "pcie" -objects $obj
set_property -name "dsa.num_compute_units" -value "60" -objects $obj
set_property -name "dsa.platform_state" -value "pre_synth" -objects $obj
set_property -name "dsa.vendor" -value "xilinx" -objects $obj
set_property -name "dsa.version" -value "0.0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "1" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "1" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "1" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "1" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "1" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xcelium_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "4" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "[file normalize "$origin_dir/build/faust_v4_ip/faust_v4"]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
# Import local files from the original project
set files [list \
 [file normalize "${origin_dir}/src/TB_I2S_Faust.vhd"]\
 [file normalize "${origin_dir}/src/i2s_transceiver.vhd"]\
 [file normalize "${origin_dir}/src/bd/simu_both_wrapper.vhd" ]\
]
set imported_files [import_files -fileset sources_1 $files]

# TANG
# [file normalize "${origin_dir}/src/bd/simu_both.bd" ]\

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
set file "src/TB_I2S_Faust.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "src/i2s_transceiver.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

#TANG
# set file "bd/simu_both.bd"
# set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
# set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "src/bd/simu_both_wrapper.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "simu_both_wrapper" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize ${origin_dir}/src/master.xdc]"
set file_imported [import_files -fileset constrs_1 [list $file]]
set file "src/master.xdc"
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)
# Import local files from the original project
set files [list \
 [file normalize "${origin_dir}/src/sim/simu_both_wrapper_behav.wcfg" ]\
]
set imported_files [import_files -fileset sim_1 $files]


# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "simu_both_wrapper" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]


# # Adding sources referenced in BDs, if not already added
# if { [get_files TB_I2S_Faust.vhd] == "" } {
#   import_files -quiet -fileset sources_1 /home/trisset/technical/syfala/v4-no-axi/v4-no-axi/le_meilleur_projet/le_meilleur_projet.srcs/sources_1/imports/src/TB_I2S_Faust.vhd
# }
# if { [get_files i2stranciever.vhd] == "" } {
#   import_files -quiet -fileset sources_1 /home/trisset/technical/syfala/v4-no-axi/v4-no-axi/le_meilleur_projet/le_meilleur_projet.srcs/sources_1/imports/src/i2stranciever.vhd
# }
# Adding sources referenced in BDs, if not already added
if { [get_files TB_I2S_Faust.vhd] == "" } {
  import_files -quiet -fileset sources_1 ${origin_dir}/src/TB_I2S_Faust.vhd
}
if { [get_files i2s_transceiver.vhd] == "" } {
  import_files -quiet -fileset sources_1 ${origin_dir}/src/i2s_transceiver.vhd
}


# Proc to create BD simu_both
proc cr_bd_simu_both { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# TB_I2S_Faust, i2s_transceiver



  # CHANGE DESIGN NAME HERE
  set design_name simu_both

  common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:clk_wiz:6.0\
  xilinx.com:hls:faust_v4:1.0\
  "

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  TB_I2S_Faust\
  i2s_transceiver\
  "

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set bclk [ create_bd_port -dir O bclk ]
  set bclkpmod [ create_bd_port -dir O bclkpmod ]
  set bypass_dsp [ create_bd_port -dir I -type data bypass_dsp ]
  set bypass_faust [ create_bd_port -dir I -type data bypass_faust ]
  set mclk [ create_bd_port -dir O mclk ]
  set mclkpmod [ create_bd_port -dir O mclkpmod ]
  set reset_btn [ create_bd_port -dir I -type rst reset_btn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset_btn
  set sd_rx [ create_bd_port -dir I sd_rx ]
  set sd_rxpmod [ create_bd_port -dir O sd_rxpmod ]
  set sd_tx [ create_bd_port -dir O sd_tx ]
  set sd_txpmod [ create_bd_port -dir O sd_txpmod ]
  set sys_clk [ create_bd_port -dir I -type clk sys_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
 ] $sys_clk
  set ws_rx [ create_bd_port -dir O ws_rx ]
  set ws_tx [ create_bd_port -dir O ws_tx ]
  set wspmod [ create_bd_port -dir O wspmod ]

  # Create instance: TB_I2S_Faust_0, and set properties
  set block_name TB_I2S_Faust
  set block_cell_name TB_I2S_Faust_0
  if { [catch {set TB_I2S_Faust_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $TB_I2S_Faust_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {247.013} \
   CONFIG.CLKOUT1_PHASE_ERROR {261.747} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {120.000} \
   CONFIG.CLKOUT2_JITTER {389.046} \
   CONFIG.CLKOUT2_PHASE_ERROR {261.747} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {12.880} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLK_OUT1_PORT {sys_clock} \
   CONFIG.CLK_OUT2_PORT {mclk} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {33.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {6.875} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {64} \
   CONFIG.MMCM_DIVCLK_DIVIDE {5} \
   CONFIG.NUM_OUT_CLKS {2} \
 ] $clk_wiz_0

  # Create instance: faust_v4_0, and set properties
  set faust_v4_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:faust_v4:1.0 faust_v4_0 ]

  # Create instance: i2s_transceiver_0, and set properties
  set block_name i2s_transceiver
  set block_cell_name i2s_transceiver_0
  if { [catch {set i2s_transceiver_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $i2s_transceiver_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net TB_I2S_Faust_0_reset_n [get_bd_pins TB_I2S_Faust_0/reset_n] [get_bd_pins i2s_transceiver_0/reset_n]
  connect_bd_net -net TB_I2S_Faust_0_start [get_bd_pins TB_I2S_Faust_0/start] [get_bd_pins i2s_transceiver_0/start]
  connect_bd_net -net bypass_dsp_0_1 [get_bd_ports bypass_dsp] [get_bd_pins faust_v4_0/bypass_dsp]
  connect_bd_net -net bypass_faust_0_1 [get_bd_ports bypass_faust] [get_bd_pins faust_v4_0/bypass_faust]
  connect_bd_net -net clk_in1_0_1 [get_bd_ports sys_clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_mclk [get_bd_ports mclk] [get_bd_ports mclkpmod] [get_bd_pins clk_wiz_0/mclk] [get_bd_pins i2s_transceiver_0/mclk]
  connect_bd_net -net clk_wiz_0_sys_clock [get_bd_pins TB_I2S_Faust_0/sys_clk] [get_bd_pins clk_wiz_0/sys_clock] [get_bd_pins faust_v4_0/ap_clk] [get_bd_pins i2s_transceiver_0/sys_clk]
  connect_bd_net -net faust_v4_0_ap_done [get_bd_pins faust_v4_0/ap_done] [get_bd_pins i2s_transceiver_0/ap_done]
  connect_bd_net -net faust_v4_0_out_left_V [get_bd_pins faust_v4_0/out_left_V] [get_bd_pins i2s_transceiver_0/l_data_tx]
  connect_bd_net -net faust_v4_0_out_left_V_ap_vld [get_bd_pins faust_v4_0/out_left_V_ap_vld] [get_bd_pins i2s_transceiver_0/out_left_V_ap_vld]
  connect_bd_net -net faust_v4_0_out_right_V [get_bd_pins faust_v4_0/out_right_V] [get_bd_pins i2s_transceiver_0/r_data_tx]
  connect_bd_net -net faust_v4_0_out_right_V_ap_vld [get_bd_pins faust_v4_0/out_right_V_ap_vld] [get_bd_pins i2s_transceiver_0/out_right_V_ap_vld]
  connect_bd_net -net i2s_transceiver_0_l_data_rx [get_bd_pins faust_v4_0/in_left_V] [get_bd_pins i2s_transceiver_0/l_data_rx]
  connect_bd_net -net i2s_transceiver_0_r_data_rx [get_bd_pins faust_v4_0/in_right_V] [get_bd_pins i2s_transceiver_0/r_data_rx]
  connect_bd_net -net i2s_transceiver_0_rdy [get_bd_pins TB_I2S_Faust_0/ap_start] [get_bd_pins faust_v4_0/ap_start] [get_bd_pins i2s_transceiver_0/rdy]
  connect_bd_net -net i2s_transceiver_0_sclk [get_bd_ports bclk] [get_bd_ports bclkpmod] [get_bd_pins i2s_transceiver_0/sclk]
  connect_bd_net -net i2s_transceiver_0_sd_tx [get_bd_ports sd_tx] [get_bd_ports sd_txpmod] [get_bd_pins TB_I2S_Faust_0/sd_tx] [get_bd_pins i2s_transceiver_0/sd_tx]
  connect_bd_net -net i2s_transceiver_0_ws [get_bd_ports ws_rx] [get_bd_ports ws_tx] [get_bd_ports wspmod] [get_bd_pins i2s_transceiver_0/ws]
  connect_bd_net -net reset_0_1 [get_bd_ports reset_btn] [get_bd_pins TB_I2S_Faust_0/reset] [get_bd_pins clk_wiz_0/reset] [get_bd_pins faust_v4_0/ap_rst]
  connect_bd_net -net sd_rx_1 [get_bd_ports sd_rx] [get_bd_ports sd_rxpmod] [get_bd_pins i2s_transceiver_0/sd_rx]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0.19  2019-03-26 bk=1.5019 VDI=41 GEI=35 GUI=JA:9.0 TLS
#  -string -flagsOSRD
preplace port bypass_dsp -pg 1 -lvl 0 -x 0 -y 280 -defaultsOSRD
preplace port bypass_faust -pg 1 -lvl 0 -x 0 -y 300 -defaultsOSRD
preplace port sys_clk -pg 1 -lvl 0 -x 0 -y 90 -defaultsOSRD
preplace port reset_btn -pg 1 -lvl 0 -x 0 -y 70 -defaultsOSRD
preplace port bclkpmod -pg 1 -lvl 4 -x 1110 -y 110 -defaultsOSRD
preplace port bclk -pg 1 -lvl 4 -x 1110 -y 90 -defaultsOSRD
preplace port ws_tx -pg 1 -lvl 4 -x 1110 -y 150 -defaultsOSRD
preplace port ws_rx -pg 1 -lvl 4 -x 1110 -y 130 -defaultsOSRD
preplace port sd_tx -pg 1 -lvl 4 -x 1110 -y 190 -defaultsOSRD
preplace port sd_txpmod -pg 1 -lvl 4 -x 1110 -y 210 -defaultsOSRD
preplace port sd_rx -pg 1 -lvl 0 -x 0 -y 580 -defaultsOSRD
preplace port sd_rxpmod -pg 1 -lvl 4 -x 1110 -y 580 -defaultsOSRD
preplace port mclk -pg 1 -lvl 4 -x 1110 -y 460 -defaultsOSRD
preplace port mclkpmod -pg 1 -lvl 4 -x 1110 -y 480 -defaultsOSRD
preplace port wspmod -pg 1 -lvl 4 -x 1110 -y 170 -defaultsOSRD
preplace inst TB_I2S_Faust_0 -pg 1 -lvl 2 -x 480 -y 490 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -x 120 -y 80 -defaultsOSRD
preplace inst faust_v4_0 -pg 1 -lvl 2 -x 480 -y 220 -defaultsOSRD
preplace inst i2s_transceiver_0 -pg 1 -lvl 3 -x 880 -y 160 -defaultsOSRD
preplace netloc TB_I2S_Faust_0_reset_n 1 2 1 670 110n
preplace netloc TB_I2S_Faust_0_start 1 2 1 700 130n
preplace netloc bypass_dsp_0_1 1 0 2 NJ 280 NJ
preplace netloc bypass_faust_0_1 1 0 2 NJ 300 NJ
preplace netloc clk_in1_0_1 1 0 1 NJ 90
preplace netloc clk_wiz_0_mclk 1 1 3 230J 70 690 370 1060
preplace netloc clk_wiz_0_sys_clock 1 1 2 240 60 710
preplace netloc faust_v4_0_ap_done 1 1 2 280 80 680
preplace netloc faust_v4_0_out_left_V 1 2 1 N 230
preplace netloc faust_v4_0_out_left_V_ap_vld 1 2 1 N 190
preplace netloc faust_v4_0_out_right_V 1 2 1 N 250
preplace netloc faust_v4_0_out_right_V_ap_vld 1 2 1 N 210
preplace netloc i2s_transceiver_0_l_data_rx 1 1 3 270 -10 NJ -10 1060
preplace netloc i2s_transceiver_0_r_data_rx 1 1 3 280 360 NJ 360 1050
preplace netloc i2s_transceiver_0_rdy 1 1 3 250 0 NJ 0 1050
preplace netloc i2s_transceiver_0_sclk 1 3 1 1080 90n
preplace netloc i2s_transceiver_0_sd_tx 1 1 3 260 10 NJ 10 1070
preplace netloc i2s_transceiver_0_ws 1 3 1 1080 130n
preplace netloc reset_0_1 1 0 2 20 0 220
preplace netloc sd_rx_1 1 0 4 NJ 580 NJ 580 710J 580 NJ
levelinfo -pg 1 0 120 480 880 1110
pagesize -pg 1 -db -bbox -sgen -150 -20 1240 600
"
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_simu_both()
cr_bd_simu_both ""
set_property REGISTERED_WITH_MANAGER "1" [get_files simu_both.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files simu_both.bd ] 

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7z010clg400-1 -flow {Vivado Synthesis 2019} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2019" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1]
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7z010clg400-1 -flow {Vivado Implementation 2019} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2019" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "options.verbose" -value "1" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1