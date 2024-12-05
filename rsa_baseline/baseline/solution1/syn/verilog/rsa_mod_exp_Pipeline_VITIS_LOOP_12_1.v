// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_mod_exp_Pipeline_VITIS_LOOP_12_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        exp,
        ret_V,
        agg_result_0_out,
        agg_result_0_out_ap_vld,
        result_V_1_out,
        result_V_1_out_ap_vld,
        ap_return
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_pp0_stage0 = 4'd2;
parameter    ap_ST_fsm_state4 = 4'd4;
parameter    ap_ST_fsm_state5 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [255:0] exp;
input  [255:0] ret_V;
output  [255:0] agg_result_0_out;
output   agg_result_0_out_ap_vld;
output  [255:0] result_V_1_out;
output   result_V_1_out_ap_vld;
output  [0:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[255:0] agg_result_0_out;
reg agg_result_0_out_ap_vld;
reg result_V_1_out_ap_vld;
reg[0:0] ap_return;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln12_fu_158_p2;
reg   [0:0] icmp_ln12_reg_285;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
reg  signed [255:0] lhs_load_reg_289;
wire   [0:0] trunc_ln1497_fu_179_p1;
reg   [0:0] trunc_ln1497_reg_294;
wire   [255:0] ret_V_4_fu_183_p2;
reg   [255:0] ret_V_4_reg_300;
wire   [0:0] icmp_ln1019_fu_203_p2;
reg   [0:0] icmp_ln1019_reg_306;
wire   [255:0] ret_V_3_fu_209_p2;
reg   [255:0] ret_V_3_reg_310;
reg   [255:0] result_V_load_1_reg_315;
reg    ap_enable_reg_pp0_iter1;
wire   [255:0] result_V_4_fu_225_p3;
reg   [255:0] result_V_4_reg_320;
wire    ap_block_pp0_stage0_subdone;
reg    ap_predicate_tran3to4_state2;
reg    ap_condition_pp0_flush_enable;
reg   [0:0] ap_phi_mux_UnifiedRetVal_phi_fu_118_p4;
reg   [0:0] UnifiedRetVal_reg_114;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state4;
reg   [255:0] rhs_fu_68;
reg  signed [255:0] ap_sig_allocacmp_rhs_load;
wire    ap_block_pp0_stage0;
reg   [8:0] i_fu_72;
wire   [8:0] i_2_fu_164_p2;
reg   [255:0] lhs_fu_76;
wire   [255:0] result_V_5_fu_231_p3;
reg  signed [255:0] ap_sig_allocacmp_lhs_load;
reg   [255:0] exp_buf_0_fu_80;
wire   [255:0] zext_ln1669_fu_199_p1;
reg   [255:0] result_V_fu_84;
wire   [254:0] r_V_fu_189_p4;
reg   [0:0] ap_return_preg;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg   [1:0] ap_exit_tran_regpp0;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_return_preg = 1'd0;
end

rsa_mul_256s_256s_256_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 256 ),
    .din1_WIDTH( 256 ),
    .dout_WIDTH( 256 ))
mul_256s_256s_256_1_1_U1(
    .din0(ap_sig_allocacmp_rhs_load),
    .din1(ap_sig_allocacmp_lhs_load),
    .dout(ret_V_4_fu_183_p2)
);

rsa_mul_256s_256s_256_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 256 ),
    .din1_WIDTH( 256 ),
    .dout_WIDTH( 256 ))
mul_256s_256s_256_1_1_U2(
    .din0(ap_sig_allocacmp_rhs_load),
    .din1(ap_sig_allocacmp_rhs_load),
    .dout(ret_V_3_fu_209_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_preg <= ap_phi_mux_UnifiedRetVal_phi_fu_118_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        UnifiedRetVal_reg_114 <= 1'd0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        UnifiedRetVal_reg_114 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        if ((icmp_ln12_fu_158_p2 == 1'd1)) begin
                        ap_exit_tran_regpp0[0] <= 1'b1;
        end else if ((ap_predicate_tran3to4_state2 == 1'b1)) begin
                        ap_exit_tran_regpp0[0] <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        exp_buf_0_fu_80 <= exp;
    end else if (((icmp_ln1019_fu_203_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln12_fu_158_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exp_buf_0_fu_80 <= zext_ln1669_fu_199_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_72 <= 9'd0;
    end else if (((icmp_ln1019_fu_203_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln12_fu_158_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_fu_72 <= i_2_fu_164_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        lhs_fu_76 <= 256'd1;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1019_reg_306 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lhs_fu_76 <= result_V_5_fu_231_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        result_V_fu_84 <= 256'd1;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1019_reg_306 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        result_V_fu_84 <= result_V_4_fu_225_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        rhs_fu_68 <= ret_V;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1019_reg_306 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rhs_fu_68 <= ret_V_3_reg_310;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_fu_158_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1019_reg_306 <= icmp_ln1019_fu_203_p2;
        lhs_load_reg_289 <= ap_sig_allocacmp_lhs_load;
        ret_V_4_reg_300 <= ret_V_4_fu_183_p2;
        trunc_ln1497_reg_294 <= trunc_ln1497_fu_179_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln12_reg_285 <= icmp_ln12_fu_158_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        result_V_4_reg_320 <= result_V_4_fu_225_p3;
        result_V_load_1_reg_315 <= result_V_fu_84;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1019_fu_203_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_fu_158_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ret_V_3_reg_310 <= ret_V_3_fu_209_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        agg_result_0_out = result_V_fu_84;
    end else if (((icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        agg_result_0_out = result_V_load_1_reg_315;
    end else begin
        agg_result_0_out = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_state4)))) begin
        agg_result_0_out_ap_vld = 1'b1;
    end else begin
        agg_result_0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((ap_predicate_tran3to4_state2 == 1'b1) | (icmp_ln12_fu_158_p2 == 1'd1)))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_phi_mux_UnifiedRetVal_phi_fu_118_p4 = 1'd0;
    end else begin
        ap_phi_mux_UnifiedRetVal_phi_fu_118_p4 = UnifiedRetVal_reg_114;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return = ap_phi_mux_UnifiedRetVal_phi_fu_118_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1019_reg_306 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_lhs_load = result_V_5_fu_231_p3;
    end else begin
        ap_sig_allocacmp_lhs_load = lhs_fu_76;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1019_reg_306 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_rhs_load = ret_V_3_reg_310;
    end else begin
        ap_sig_allocacmp_rhs_load = rhs_fu_68;
    end
end

always @ (*) begin
    if (((icmp_ln12_reg_285 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        result_V_1_out_ap_vld = 1'b1;
    end else begin
        result_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_exit_tran_regpp0 == 2'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_exit_tran_regpp0 == 2'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_tran3to4_state2 = ((icmp_ln1019_fu_203_p2 == 1'd1) & (icmp_ln12_fu_158_p2 == 1'd0));
end

assign i_2_fu_164_p2 = (i_fu_72 + 9'd1);

assign icmp_ln1019_fu_203_p2 = ((r_V_fu_189_p4 == 255'd0) ? 1'b1 : 1'b0);

assign icmp_ln12_fu_158_p2 = ((i_fu_72 == 9'd256) ? 1'b1 : 1'b0);

assign r_V_fu_189_p4 = {{exp_buf_0_fu_80[255:1]}};

assign result_V_1_out = result_V_4_reg_320;

assign result_V_4_fu_225_p3 = ((trunc_ln1497_reg_294[0:0] == 1'b1) ? ret_V_4_reg_300 : result_V_fu_84);

assign result_V_5_fu_231_p3 = ((trunc_ln1497_reg_294[0:0] == 1'b1) ? ret_V_4_reg_300 : lhs_load_reg_289);

assign trunc_ln1497_fu_179_p1 = exp_buf_0_fu_80[0:0];

assign zext_ln1669_fu_199_p1 = r_V_fu_189_p4;

always @ (posedge ap_clk) begin
    ap_exit_tran_regpp0[1] <= 1'b0;
end

endmodule //rsa_mod_exp_Pipeline_VITIS_LOOP_12_1