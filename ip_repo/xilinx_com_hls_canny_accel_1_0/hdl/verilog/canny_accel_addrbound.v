// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module canny_accel_addrbound (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        return_r,
        return_r_ap_vld,
        rows_dout,
        rows_empty_n,
        rows_read,
        cols_dout,
        cols_empty_n,
        cols_read
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] return_r;
output   return_r_ap_vld;
input  [15:0] rows_dout;
input   rows_empty_n;
output   rows_read;
input  [10:0] cols_dout;
input   cols_empty_n;
output   cols_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] return_r;
reg return_r_ap_vld;
reg rows_read;
reg cols_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    rows_blk_n;
reg    cols_blk_n;
reg    ap_block_state1;
reg   [15:0] return_r_preg;
wire    ap_CS_fsm_state3;
wire   [26:0] grp_fu_107_p2;
wire   [20:0] trunc_ln1345_fu_79_p1;
wire   [21:0] ret_fu_82_p3;
wire   [21:0] add_ln534_fu_90_p2;
wire   [15:0] grp_fu_107_p0;
wire   [10:0] grp_fu_107_p1;
reg    grp_fu_107_ce;
reg   [2:0] ap_NS_fsm;
wire   [26:0] grp_fu_107_p00;
wire   [26:0] grp_fu_107_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 return_r_preg = 16'd0;
end

canny_accel_mul_mul_16ns_11ns_27_3_1 #(
    .ID( 1 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 11 ),
    .dout_WIDTH( 27 ))
mul_mul_16ns_11ns_27_3_1_U236(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_107_p0),
    .din1(grp_fu_107_p1),
    .ce(grp_fu_107_ce),
    .dout(grp_fu_107_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        return_r_preg <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            return_r_preg <= {{add_ln534_fu_90_p2[21:6]}};
        end
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
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
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_blk_n = cols_empty_n;
    end else begin
        cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_read = 1'b1;
    end else begin
        cols_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ((ap_start == 1'b0) | (cols_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)))) begin
        grp_fu_107_ce = 1'b0;
    end else begin
        grp_fu_107_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        return_r = {{add_ln534_fu_90_p2[21:6]}};
    end else begin
        return_r = return_r_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        return_r_ap_vld = 1'b1;
    end else begin
        return_r_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_blk_n = rows_empty_n;
    end else begin
        rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_read = 1'b1;
    end else begin
        rows_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (cols_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln534_fu_90_p2 = (ret_fu_82_p3 + 22'd63);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (cols_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_fu_107_p0 = grp_fu_107_p00;

assign grp_fu_107_p00 = rows_dout;

assign grp_fu_107_p1 = grp_fu_107_p10;

assign grp_fu_107_p10 = cols_dout;

assign ret_fu_82_p3 = {{trunc_ln1345_fu_79_p1}, {1'd0}};

assign trunc_ln1345_fu_79_p1 = grp_fu_107_p2[20:0];

endmodule //canny_accel_addrbound
