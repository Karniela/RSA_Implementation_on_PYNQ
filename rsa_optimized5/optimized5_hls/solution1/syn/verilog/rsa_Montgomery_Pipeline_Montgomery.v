// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_Montgomery_Pipeline_Montgomery (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b,
        N,
        m_V_7_0_out,
        m_V_7_0_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] a;
input  [127:0] b;
input  [127:0] N;
output  [129:0] m_V_7_0_out;
output   m_V_7_0_out_ap_vld;

reg ap_idle;
reg m_V_7_0_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln34_fu_110_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln34_reg_193;
reg   [127:0] a_buf_0_load_reg_197;
wire   [0:0] grp_mont_update_m_temp_fu_77_a;
wire   [129:0] grp_mont_update_m_temp_fu_77_ap_return;
wire    call_ret2_mont_update_m_a_fu_85_ap_ready;
wire   [129:0] call_ret2_mont_update_m_a_fu_85_ap_return_0;
wire   [127:0] call_ret2_mont_update_m_a_fu_85_ap_return_1;
wire    ap_block_pp0_stage0;
reg   [7:0] i_01_fu_40;
wire   [7:0] i_11_fu_116_p2;
wire    ap_loop_init;
reg   [7:0] ap_sig_allocacmp_i;
reg   [127:0] a_buf_0_fu_44;
reg   [127:0] ap_sig_allocacmp_a_buf_0_load;
reg   [129:0] m_V_6_fu_48;
reg   [129:0] ap_sig_allocacmp_m_V_6_load_1;
wire    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

rsa_mont_update_m_temp grp_mont_update_m_temp_fu_77(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .a(grp_mont_update_m_temp_fu_77_a),
    .b(b),
    .N(N),
    .m(ap_sig_allocacmp_m_V_6_load_1),
    .ap_return(grp_mont_update_m_temp_fu_77_ap_return)
);

rsa_mont_update_m_a call_ret2_mont_update_m_a_fu_85(
    .ap_ready(call_ret2_mont_update_m_a_fu_85_ap_ready),
    .temp(grp_mont_update_m_temp_fu_77_ap_return),
    .a_V_read(a_buf_0_load_reg_197),
    .ap_return_0(call_ret2_mont_update_m_a_fu_85_ap_return_0),
    .ap_return_1(call_ret2_mont_update_m_a_fu_85_ap_return_1)
);

rsa_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            a_buf_0_fu_44 <= a;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            a_buf_0_fu_44 <= call_ret2_mont_update_m_a_fu_85_ap_return_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln34_fu_110_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_01_fu_40 <= i_11_fu_116_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_01_fu_40 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            m_V_6_fu_48 <= 130'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            m_V_6_fu_48 <= call_ret2_mont_update_m_a_fu_85_ap_return_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        a_buf_0_load_reg_197 <= ap_sig_allocacmp_a_buf_0_load;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln34_reg_193 <= icmp_ln34_fu_110_p2;
    end
end

always @ (*) begin
    if (((icmp_ln34_fu_110_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_a_buf_0_load = call_ret2_mont_update_m_a_fu_85_ap_return_1;
    end else begin
        ap_sig_allocacmp_a_buf_0_load = a_buf_0_fu_44;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i = 8'd0;
    end else begin
        ap_sig_allocacmp_i = i_01_fu_40;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_m_V_6_load_1 = call_ret2_mont_update_m_a_fu_85_ap_return_0;
    end else begin
        ap_sig_allocacmp_m_V_6_load_1 = m_V_6_fu_48;
    end
end

always @ (*) begin
    if (((icmp_ln34_reg_193 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_V_7_0_out_ap_vld = 1'b1;
    end else begin
        m_V_7_0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign grp_mont_update_m_temp_fu_77_a = ap_sig_allocacmp_a_buf_0_load[0:0];

assign i_11_fu_116_p2 = (ap_sig_allocacmp_i + 8'd1);

assign icmp_ln34_fu_110_p2 = ((ap_sig_allocacmp_i == 8'd128) ? 1'b1 : 1'b0);

assign m_V_7_0_out = m_V_6_fu_48;

endmodule //rsa_Montgomery_Pipeline_Montgomery
