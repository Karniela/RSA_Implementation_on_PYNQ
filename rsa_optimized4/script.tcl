############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project baseline
set_top rsa
add_files rsa.cpp
add_files rsa.h
add_files -tb rsa_test.cpp
add_files -tb ./data/golden.txt
add_files -tb ./data/input.txt
open_solution "solution1"
set_part  {xc7z020clg400-1}
create_clock -period 10
