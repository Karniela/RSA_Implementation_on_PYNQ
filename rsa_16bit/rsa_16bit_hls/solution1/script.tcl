############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project rsa_baseline_hls
set_top rsa
add_files RSA_Implementation_on_PYNQ/rsa_baseline_synthesis/rsa.h
add_files RSA_Implementation_on_PYNQ/rsa_baseline_synthesis/rsa.cpp
add_files -tb RSA_Implementation_on_PYNQ/rsa_baseline_synthesis/rsa_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb RSA_Implementation_on_PYNQ/rsa_baseline_synthesis/data/input.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb RSA_Implementation_on_PYNQ/rsa_baseline_synthesis/data/golden.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/cse237c_fa24_y_liao/Desktop/rsa_baseline_hls -rtl verilog
source "./rsa_baseline_hls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/cse237c_fa24_y_liao/Desktop/rsa_baseline_hls
