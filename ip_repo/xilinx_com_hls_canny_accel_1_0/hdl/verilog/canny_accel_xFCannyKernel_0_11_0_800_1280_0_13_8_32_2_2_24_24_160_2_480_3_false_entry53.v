// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module canny_accel_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        p_lowthreshold,
        p_highthreshold,
        img_height,
        img_width,
        p_lowthreshold_out_din,
        p_lowthreshold_out_full_n,
        p_lowthreshold_out_write,
        p_highthreshold_out_din,
        p_highthreshold_out_full_n,
        p_highthreshold_out_write,
        img_height_out_din,
        img_height_out_full_n,
        img_height_out_write,
        img_height_out1_din,
        img_height_out1_full_n,
        img_height_out1_write,
        img_width_out_din,
        img_width_out_full_n,
        img_width_out_write,
        img_width_out2_din,
        img_width_out2_full_n,
        img_width_out2_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [7:0] p_lowthreshold;
input  [7:0] p_highthreshold;
input  [9:0] img_height;
input  [10:0] img_width;
output  [7:0] p_lowthreshold_out_din;
input   p_lowthreshold_out_full_n;
output   p_lowthreshold_out_write;
output  [7:0] p_highthreshold_out_din;
input   p_highthreshold_out_full_n;
output   p_highthreshold_out_write;
output  [9:0] img_height_out_din;
input   img_height_out_full_n;
output   img_height_out_write;
output  [9:0] img_height_out1_din;
input   img_height_out1_full_n;
output   img_height_out1_write;
output  [10:0] img_width_out_din;
input   img_width_out_full_n;
output   img_width_out_write;
output  [10:0] img_width_out2_din;
input   img_width_out2_full_n;
output   img_width_out2_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg p_lowthreshold_out_write;
reg p_highthreshold_out_write;
reg img_height_out_write;
reg img_height_out1_write;
reg img_width_out_write;
reg img_width_out2_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    p_lowthreshold_out_blk_n;
reg    p_highthreshold_out_blk_n;
reg    img_height_out_blk_n;
reg    img_height_out1_blk_n;
reg    img_width_out_blk_n;
reg    img_width_out2_blk_n;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
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
        end else if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_height_out1_blk_n = img_height_out1_full_n;
    end else begin
        img_height_out1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_height_out1_write = 1'b1;
    end else begin
        img_height_out1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_height_out_blk_n = img_height_out_full_n;
    end else begin
        img_height_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_height_out_write = 1'b1;
    end else begin
        img_height_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_width_out2_blk_n = img_width_out2_full_n;
    end else begin
        img_width_out2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_width_out2_write = 1'b1;
    end else begin
        img_width_out2_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_width_out_blk_n = img_width_out_full_n;
    end else begin
        img_width_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_width_out_write = 1'b1;
    end else begin
        img_width_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_highthreshold_out_blk_n = p_highthreshold_out_full_n;
    end else begin
        p_highthreshold_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_highthreshold_out_write = 1'b1;
    end else begin
        p_highthreshold_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_lowthreshold_out_blk_n = p_lowthreshold_out_full_n;
    end else begin
        p_lowthreshold_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_lowthreshold_out_write = 1'b1;
    end else begin
        p_lowthreshold_out_write = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
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
    ap_block_state1 = ((real_start == 1'b0) | (img_width_out2_full_n == 1'b0) | (img_width_out_full_n == 1'b0) | (img_height_out1_full_n == 1'b0) | (img_height_out_full_n == 1'b0) | (p_highthreshold_out_full_n == 1'b0) | (p_lowthreshold_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign img_height_out1_din = img_height;

assign img_height_out_din = img_height;

assign img_width_out2_din = img_width;

assign img_width_out_din = img_width;

assign p_highthreshold_out_din = p_highthreshold;

assign p_lowthreshold_out_din = p_lowthreshold;

assign start_out = real_start;

endmodule //canny_accel_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53
