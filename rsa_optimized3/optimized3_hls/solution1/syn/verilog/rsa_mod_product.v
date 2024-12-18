// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_mod_product (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        b,
        N,
        ap_return
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [255:0] b;
input  [255:0] N;
output  [255:0] ap_return;

reg ap_idle;

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
wire   [0:0] icmp_ln59_fu_79_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [257:0] conv_i_fu_58_p1;
reg   [257:0] conv_i_reg_156;
wire   [256:0] zext_ln186_fu_62_p1;
reg   [256:0] zext_ln186_reg_161;
wire   [0:0] icmp_ln1035_fu_102_p2;
reg   [0:0] icmp_ln1035_reg_169;
wire   [256:0] t_V_2_fu_107_p2;
reg   [256:0] t_V_2_reg_174;
reg   [256:0] rhs_fu_34;
wire   [256:0] t_V_3_fu_123_p3;
wire   [256:0] zext_ln186_1_fu_54_p1;
reg   [256:0] ap_sig_allocacmp_rhs_load_1;
wire    ap_block_pp0_stage0;
reg   [256:0] ap_sig_allocacmp_rhs_load;
wire    ap_loop_init;
reg   [8:0] i_fu_38;
wire   [8:0] i_4_fu_85_p2;
wire   [257:0] ret_V_fu_94_p3;
wire   [256:0] grp_fu_113_p0;
wire   [256:0] grp_fu_113_p2;
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
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

rsa_sub_257ns_257ns_257_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 257 ),
    .din1_WIDTH( 257 ),
    .dout_WIDTH( 257 ))
sub_257ns_257ns_257_2_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_113_p0),
    .din1(zext_ln186_reg_161),
    .ce(1'b1),
    .dout(grp_fu_113_p2)
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
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
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_38 <= 9'd0;
        end else if (((icmp_ln59_fu_79_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_38 <= i_4_fu_85_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            rhs_fu_34 <= zext_ln186_1_fu_54_p1;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            rhs_fu_34 <= t_V_3_fu_123_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        conv_i_reg_156[255 : 0] <= conv_i_fu_58_p1[255 : 0];
        zext_ln186_reg_161[255 : 0] <= zext_ln186_fu_62_p1[255 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln59_fu_79_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1035_reg_169 <= icmp_ln1035_fu_102_p2;
        t_V_2_reg_174[256 : 1] <= t_V_2_fu_107_p2[256 : 1];
    end
end

always @ (*) begin
    if (((icmp_ln59_fu_79_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
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
        ap_sig_allocacmp_rhs_load = t_V_3_fu_123_p3;
    end else begin
        ap_sig_allocacmp_rhs_load = rhs_fu_34;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_rhs_load_1 = t_V_3_fu_123_p3;
    end else begin
        ap_sig_allocacmp_rhs_load_1 = rhs_fu_34;
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

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_return = ap_sig_allocacmp_rhs_load[255:0];

assign conv_i_fu_58_p1 = N;

assign grp_fu_113_p0 = ap_sig_allocacmp_rhs_load_1 << 257'd1;

assign i_4_fu_85_p2 = (i_fu_38 + 9'd1);

assign icmp_ln1035_fu_102_p2 = ((ret_V_fu_94_p3 > conv_i_reg_156) ? 1'b1 : 1'b0);

assign icmp_ln59_fu_79_p2 = ((i_fu_38 == 9'd256) ? 1'b1 : 1'b0);

assign ret_V_fu_94_p3 = {{ap_sig_allocacmp_rhs_load_1}, {1'd0}};

assign t_V_2_fu_107_p2 = ap_sig_allocacmp_rhs_load_1 << 257'd1;

assign t_V_3_fu_123_p3 = ((icmp_ln1035_reg_169[0:0] == 1'b1) ? grp_fu_113_p2 : t_V_2_reg_174);

assign zext_ln186_1_fu_54_p1 = b;

assign zext_ln186_fu_62_p1 = N;

always @ (posedge ap_clk) begin
    conv_i_reg_156[257:256] <= 2'b00;
    zext_ln186_reg_161[256] <= 1'b0;
    t_V_2_reg_174[0] <= 1'b0;
end

endmodule //rsa_mod_product
