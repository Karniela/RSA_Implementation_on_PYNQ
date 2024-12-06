############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project rsa_baseline_hls
set_top rsa
add_files rsa.h
add_files rsa.cpp
add_files -tb rsa_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb data/input.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb data/golden.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution2-NoDSP" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/cse237c_fa24_y_liao/Desktop/RSA_Implementation_on_PYNQ/rsa_baseline/rsa_baseline_hls -rtl verilog
source "./rsa_baseline_hls/solution2-NoDSP/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/cse237c_fa24_y_liao/Desktop/RSA_Implementation_on_PYNQ/rsa_baseline/rsa_baseline_hls
