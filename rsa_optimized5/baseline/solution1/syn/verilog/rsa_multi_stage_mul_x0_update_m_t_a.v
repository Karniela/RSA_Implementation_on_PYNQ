// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_multi_stage_mul_x0_update_m_t_a (
        ap_ready,
        m_V_write,
        t_V_read,
        a_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2
);


output   ap_ready;
input  [128:0] m_V_write;
input  [127:0] t_V_read;
input  [128:0] a_V_read;
output  [128:0] ap_return_0;
output  [128:0] ap_return_1;
output  [128:0] ap_return_2;

wire   [127:0] r_V_fu_40_p4;
wire   [128:0] r_V_1_fu_54_p3;
wire  signed [128:0] sext_ln1669_fu_50_p1;

assign ap_ready = 1'b1;

assign r_V_1_fu_54_p3 = {{t_V_read}, {1'd0}};

assign r_V_fu_40_p4 = {{a_V_read[128:1]}};

assign sext_ln1669_fu_50_p1 = $signed(r_V_fu_40_p4);

assign ap_return_0 = m_V_write;

assign ap_return_1 = r_V_1_fu_54_p3;

assign ap_return_2 = sext_ln1669_fu_50_p1;

endmodule //rsa_multi_stage_mul_x0_update_m_t_a