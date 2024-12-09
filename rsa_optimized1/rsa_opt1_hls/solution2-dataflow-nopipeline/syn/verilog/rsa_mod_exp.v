// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rsa_mod_exp (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        y,
        d,
        N,
        ap_return
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [255:0] y;
input  [255:0] d;
input  [255:0] N;
output  [255:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [255:0] reg_85;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln42_fu_114_p2;
wire   [0:0] trunc_ln1497_fu_126_p1;
wire    ap_CS_fsm_state3;
wire    grp_mod_product_fu_66_ap_done;
reg   [0:0] trunc_ln1497_reg_204;
reg    ap_block_state3_on_subcall_done;
wire   [8:0] i_4_fu_120_p2;
reg   [8:0] i_4_reg_199;
reg   [255:0] m_V_load_1_reg_208;
wire    grp_mod_product_fu_66_ap_start;
wire    grp_mod_product_fu_66_ap_idle;
wire    grp_mod_product_fu_66_ap_ready;
reg   [255:0] grp_mod_product_fu_66_a;
wire   [255:0] grp_mod_product_fu_66_ap_return;
reg    grp_mod_product_fu_66_ap_start_reg;
wire    ap_CS_fsm_state4;
reg   [255:0] t_fu_32;
reg    ap_block_state1;
reg   [8:0] i_fu_36;
reg   [255:0] shr_i4_fu_40;
wire   [255:0] zext_ln1669_fu_149_p1;
reg   [255:0] m_V_fu_44;
wire   [254:0] r_V_fu_139_p4;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_mod_product_fu_66_ap_start_reg = 1'b0;
end

rsa_mod_product grp_mod_product_fu_66(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_mod_product_fu_66_ap_start),
    .ap_done(grp_mod_product_fu_66_ap_done),
    .ap_idle(grp_mod_product_fu_66_ap_idle),
    .ap_ready(grp_mod_product_fu_66_ap_ready),
    .a(grp_mod_product_fu_66_a),
    .b(reg_85),
    .N(N),
    .ap_return(grp_mod_product_fu_66_ap_return)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((icmp_ln42_fu_114_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_mod_product_fu_66_ap_start_reg <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_state3_on_subcall_done) & (1'b1 == ap_CS_fsm_state3)) | ((trunc_ln1497_fu_126_p1 == 1'd1) & (icmp_ln42_fu_114_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
            grp_mod_product_fu_66_ap_start_reg <= 1'b1;
        end else if ((grp_mod_product_fu_66_ap_ready == 1'b1)) begin
            grp_mod_product_fu_66_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_36 <= 9'd0;
    end else if (((1'b0 == ap_block_state3_on_subcall_done) & (1'b1 == ap_CS_fsm_state3))) begin
        i_fu_36 <= i_4_reg_199;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_V_fu_44 <= 256'd1;
    end else if (((1'b0 == ap_block_state3_on_subcall_done) & (trunc_ln1497_reg_204 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_V_fu_44 <= grp_mod_product_fu_66_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        shr_i4_fu_40 <= d;
    end else if (((grp_mod_product_fu_66_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        shr_i4_fu_40 <= zext_ln1669_fu_149_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        t_fu_32 <= y;
    end else if (((grp_mod_product_fu_66_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        t_fu_32 <= grp_mod_product_fu_66_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_4_reg_199 <= i_4_fu_120_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln1497_fu_126_p1 == 1'd1) & (icmp_ln42_fu_114_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        m_V_load_1_reg_208 <= m_V_fu_44;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_state3_on_subcall_done) & (1'b1 == ap_CS_fsm_state3)) | ((trunc_ln1497_fu_126_p1 == 1'd1) & (icmp_ln42_fu_114_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        reg_85 <= t_fu_32;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln42_fu_114_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        trunc_ln1497_reg_204 <= trunc_ln1497_fu_126_p1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state3_on_subcall_done)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_mod_product_fu_66_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln42_fu_114_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((icmp_ln42_fu_114_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_mod_product_fu_66_a = reg_85;
    end else if (((trunc_ln1497_reg_204 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        grp_mod_product_fu_66_a = m_V_load_1_reg_208;
    end else begin
        grp_mod_product_fu_66_a = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln42_fu_114_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b0 == ap_block_state3_on_subcall_done) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((grp_mod_product_fu_66_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state3_on_subcall_done = ((trunc_ln1497_reg_204 == 1'd1) & (grp_mod_product_fu_66_ap_done == 1'b0));
end

assign ap_return = m_V_fu_44;

assign grp_mod_product_fu_66_ap_start = grp_mod_product_fu_66_ap_start_reg;

assign i_4_fu_120_p2 = (i_fu_36 + 9'd1);

assign icmp_ln42_fu_114_p2 = ((i_fu_36 == 9'd256) ? 1'b1 : 1'b0);

assign r_V_fu_139_p4 = {{shr_i4_fu_40[255:1]}};

assign trunc_ln1497_fu_126_p1 = shr_i4_fu_40[0:0];

assign zext_ln1669_fu_149_p1 = r_V_fu_139_p4;

endmodule //rsa_mod_exp
