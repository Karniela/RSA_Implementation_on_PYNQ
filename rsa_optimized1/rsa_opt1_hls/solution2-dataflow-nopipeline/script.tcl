############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project rsa_opt1_hls
set_top rsa
add_files rsa.cpp
add_files rsa.h
add_files -tb data/golden.txt
add_files -tb data/input.txt
add_files -tb rsa_test.cpp
open_solution "solution2-dataflow-nopipeline" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./rsa_opt1_hls/solution2-dataflow-nopipeline/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
