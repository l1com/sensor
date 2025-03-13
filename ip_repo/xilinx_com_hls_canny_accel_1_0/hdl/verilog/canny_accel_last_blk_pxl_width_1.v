// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module canny_accel_last_blk_pxl_width_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        return_r,
        return_r_ap_vld,
        cols_dout,
        cols_empty_n,
        cols_read,
        cols_bound_per_npc_dout,
        cols_bound_per_npc_empty_n,
        cols_bound_per_npc_read,
        cols_bound_per_npc_out_din,
        cols_bound_per_npc_out_full_n,
        cols_bound_per_npc_out_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [6:0] return_r;
output   return_r_ap_vld;
input  [31:0] cols_dout;
input   cols_empty_n;
output   cols_read;
input  [28:0] cols_bound_per_npc_dout;
input   cols_bound_per_npc_empty_n;
output   cols_bound_per_npc_read;
output  [28:0] cols_bound_per_npc_out_din;
input   cols_bound_per_npc_out_full_n;
output   cols_bound_per_npc_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[6:0] return_r;
reg return_r_ap_vld;
reg cols_read;
reg cols_bound_per_npc_read;
reg cols_bound_per_npc_out_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    cols_blk_n;
reg    cols_bound_per_npc_blk_n;
reg    cols_bound_per_npc_out_blk_n;
reg    ap_block_state1;
wire   [6:0] select_ln933_fu_101_p3;
reg   [6:0] return_r_preg;
wire   [28:0] trunc_ln_fu_69_p4;
wire   [2:0] trunc_ln935_fu_85_p1;
wire   [5:0] shl_ln_fu_89_p3;
wire   [0:0] icmp_ln933_fu_79_p2;
wire   [6:0] zext_ln933_fu_97_p1;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 return_r_preg = 7'd0;
end

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
        end else if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
                return_r_preg[3] <= 1'b0;
        return_r_preg[4] <= 1'b0;
        return_r_preg[5] <= 1'b0;
        return_r_preg[6] <= 1'b0;
    end else begin
        if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                        return_r_preg[6 : 3] <= select_ln933_fu_101_p3[6 : 3];
        end
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_bound_per_npc_blk_n = cols_bound_per_npc_empty_n;
    end else begin
        cols_bound_per_npc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_bound_per_npc_out_blk_n = cols_bound_per_npc_out_full_n;
    end else begin
        cols_bound_per_npc_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_bound_per_npc_out_write = 1'b1;
    end else begin
        cols_bound_per_npc_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_bound_per_npc_read = 1'b1;
    end else begin
        cols_bound_per_npc_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_read = 1'b1;
    end else begin
        cols_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        return_r = select_ln933_fu_101_p3;
    end else begin
        return_r = return_r_preg;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        return_r_ap_vld = 1'b1;
    end else begin
        return_r_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (cols_bound_per_npc_out_full_n == 1'b0) | (cols_bound_per_npc_empty_n == 1'b0) | (cols_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign cols_bound_per_npc_out_din = cols_bound_per_npc_dout;

assign icmp_ln933_fu_79_p2 = ((trunc_ln_fu_69_p4 == cols_bound_per_npc_dout) ? 1'b1 : 1'b0);

assign select_ln933_fu_101_p3 = ((icmp_ln933_fu_79_p2[0:0] == 1'b1) ? 7'd64 : zext_ln933_fu_97_p1);

assign shl_ln_fu_89_p3 = {{trunc_ln935_fu_85_p1}, {3'd0}};

assign trunc_ln935_fu_85_p1 = cols_dout[2:0];

assign trunc_ln_fu_69_p4 = {{cols_dout[31:3]}};

assign zext_ln933_fu_97_p1 = shl_ln_fu_89_p3;

always @ (posedge ap_clk) begin
    return_r_preg[2:0] <= 3'b000;
end

endmodule //canny_accel_last_blk_pxl_width_1
