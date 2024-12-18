// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_multi_stage_mul_x0 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b,
        ap_return
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] a;
input  [128:0] b;
output  [128:0] ap_return;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln60_fu_106_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    temp_V_multi_stage_mul_x0_add_m_fu_64_ap_ready;
wire   [0:0] temp_V_multi_stage_mul_x0_add_m_fu_64_a;
wire   [128:0] temp_V_multi_stage_mul_x0_add_m_fu_64_ap_return;
wire    call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_ready;
wire   [127:0] call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_t_V_read;
wire   [128:0] call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_0;
wire   [128:0] call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_1;
wire   [128:0] call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_2;
wire    ap_block_pp0_stage0;
reg   [7:0] i_01_fu_36;
wire   [7:0] i_3_fu_112_p2;
wire    ap_loop_init;
wire    ap_block_pp0_stage0_11001;
reg   [7:0] ap_sig_allocacmp_i;
reg   [128:0] m_V_4_fu_40;
reg   [128:0] ap_sig_allocacmp_m_V_4_load;
reg   [128:0] a_buf_0_fu_44;
wire   [128:0] a_cast_fu_79_p1;
reg   [128:0] t_V_4_fu_48;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

rsa_multi_stage_mul_x0_add_m temp_V_multi_stage_mul_x0_add_m_fu_64(
    .ap_ready(temp_V_multi_stage_mul_x0_add_m_fu_64_ap_ready),
    .a(temp_V_multi_stage_mul_x0_add_m_fu_64_a),
    .m(m_V_4_fu_40),
    .t(t_V_4_fu_48),
    .ap_return(temp_V_multi_stage_mul_x0_add_m_fu_64_ap_return)
);

rsa_multi_stage_mul_x0_update_m_t_a call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71(
    .ap_ready(call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_ready),
    .m_V_write(temp_V_multi_stage_mul_x0_add_m_fu_64_ap_return),
    .t_V_read(call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_t_V_read),
    .a_V_read(a_buf_0_fu_44),
    .ap_return_0(call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_0),
    .ap_return_1(call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_1),
    .ap_return_2(call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_2)
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            a_buf_0_fu_44 <= a_cast_fu_79_p1;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            a_buf_0_fu_44 <= call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln60_fu_106_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_01_fu_36 <= i_3_fu_112_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_01_fu_36 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            m_V_4_fu_40 <= 129'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            m_V_4_fu_40 <= call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            t_V_4_fu_48 <= b;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            t_V_4_fu_48 <= call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_1;
        end
    end
end

always @ (*) begin
    if (((icmp_ln60_fu_106_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i = 8'd0;
    end else begin
        ap_sig_allocacmp_i = i_01_fu_36;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            ap_sig_allocacmp_m_V_4_load = 129'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            ap_sig_allocacmp_m_V_4_load = call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_ap_return_0;
        end else begin
            ap_sig_allocacmp_m_V_4_load = m_V_4_fu_40;
        end
    end else begin
        ap_sig_allocacmp_m_V_4_load = m_V_4_fu_40;
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

assign a_cast_fu_79_p1 = a;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_return = ap_sig_allocacmp_m_V_4_load;

assign call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71_t_V_read = t_V_4_fu_48[127:0];

assign i_3_fu_112_p2 = (ap_sig_allocacmp_i + 8'd1);

assign icmp_ln60_fu_106_p2 = ((ap_sig_allocacmp_i == 8'd129) ? 1'b1 : 1'b0);

assign temp_V_multi_stage_mul_x0_add_m_fu_64_a = a_buf_0_fu_44[0:0];

endmodule //rsa_multi_stage_mul_x0
