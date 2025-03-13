// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module canny_accel_Canny_3_0_0_11_800_1280_8_32_false_2_2_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        in_mat_data_dout,
        in_mat_data_empty_n,
        in_mat_data_read,
        dst_mat_data_din,
        dst_mat_data_full_n,
        dst_mat_data_write,
        in_mat_rows_dout,
        in_mat_rows_empty_n,
        in_mat_rows_read,
        in_mat_cols_dout,
        in_mat_cols_empty_n,
        in_mat_cols_read,
        low_threshold_dout,
        low_threshold_empty_n,
        low_threshold_read,
        high_threshold_dout,
        high_threshold_empty_n,
        high_threshold_read
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [63:0] in_mat_data_dout;
input   in_mat_data_empty_n;
output   in_mat_data_read;
output  [63:0] dst_mat_data_din;
input   dst_mat_data_full_n;
output   dst_mat_data_write;
input  [31:0] in_mat_rows_dout;
input   in_mat_rows_empty_n;
output   in_mat_rows_read;
input  [31:0] in_mat_cols_dout;
input   in_mat_cols_empty_n;
output   in_mat_cols_read;
input  [31:0] low_threshold_dout;
input   low_threshold_empty_n;
output   low_threshold_read;
input  [31:0] high_threshold_dout;
input   high_threshold_empty_n;
output   high_threshold_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_mat_data_read;
reg dst_mat_data_write;
reg in_mat_rows_read;
reg in_mat_cols_read;
reg low_threshold_read;
reg high_threshold_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    in_mat_rows_blk_n;
reg    in_mat_cols_blk_n;
reg    low_threshold_blk_n;
reg    high_threshold_blk_n;
wire   [7:0] trunc_ln44_fu_70_p1;
reg   [7:0] trunc_ln44_reg_90;
wire   [7:0] trunc_ln44_1_fu_75_p1;
reg   [7:0] trunc_ln44_1_reg_95;
wire   [9:0] trunc_ln309_fu_80_p1;
reg   [9:0] trunc_ln309_reg_100;
wire   [10:0] trunc_ln309_1_fu_85_p1;
reg   [10:0] trunc_ln309_1_reg_105;
wire    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_in_mat_421_read;
wire   [63:0] grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_dst_mat_422_din;
wire    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_dst_mat_422_write;
wire    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start;
wire    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done;
wire    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready;
wire    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_idle;
reg    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_continue;
reg    grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start_reg;
reg    ap_block_state1_ignore_call16;
wire    ap_CS_fsm_state2;
wire    ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready;
wire    ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done;
reg    ap_block_state2_on_subcall_done;
reg    ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready;
reg    ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done;
reg    ap_block_state1;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start_reg = 1'b0;
#0 ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready = 1'b0;
#0 ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done = 1'b0;
end

canny_accel_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58(
    .in_mat_421_dout(in_mat_data_dout),
    .in_mat_421_empty_n(in_mat_data_empty_n),
    .in_mat_421_read(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_in_mat_421_read),
    .dst_mat_422_din(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_dst_mat_422_din),
    .dst_mat_422_full_n(dst_mat_data_full_n),
    .dst_mat_422_write(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_dst_mat_422_write),
    .p_lowthreshold(trunc_ln44_reg_90),
    .p_highthreshold(trunc_ln44_1_reg_95),
    .img_height(trunc_ln309_reg_100),
    .img_width(trunc_ln309_1_reg_105),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .p_lowthreshold_ap_vld(1'b1),
    .p_highthreshold_ap_vld(1'b1),
    .img_height_ap_vld(1'b1),
    .img_width_ap_vld(1'b1),
    .ap_start(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start),
    .ap_done(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done),
    .ap_ready(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready),
    .ap_idle(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_idle),
    .ap_continue(grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_continue)
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
        end else if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
            ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done <= 1'b0;
        end else if ((grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done == 1'b1)) begin
            ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
            ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready <= 1'b0;
        end else if ((grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready == 1'b1)) begin
            ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start_reg <= 1'b0;
    end else begin
        if (((~((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state2) & (ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready == 1'b0)))) begin
            grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start_reg <= 1'b1;
        end else if ((grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready == 1'b1)) begin
            grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln309_1_reg_105 <= trunc_ln309_1_fu_85_p1;
        trunc_ln309_reg_100 <= trunc_ln309_fu_80_p1;
        trunc_ln44_1_reg_95 <= trunc_ln44_1_fu_75_p1;
        trunc_ln44_reg_90 <= trunc_ln44_fu_70_p1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
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
    if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        dst_mat_data_write = grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_dst_mat_422_write;
    end else begin
        dst_mat_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
        grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_continue = 1'b1;
    end else begin
        grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_continue = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        high_threshold_blk_n = high_threshold_empty_n;
    end else begin
        high_threshold_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        high_threshold_read = 1'b1;
    end else begin
        high_threshold_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_mat_cols_blk_n = in_mat_cols_empty_n;
    end else begin
        in_mat_cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_mat_cols_read = 1'b1;
    end else begin
        in_mat_cols_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        in_mat_data_read = grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_in_mat_421_read;
    end else begin
        in_mat_data_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_mat_rows_blk_n = in_mat_rows_empty_n;
    end else begin
        in_mat_rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_mat_rows_read = 1'b1;
    end else begin
        in_mat_rows_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        low_threshold_blk_n = low_threshold_empty_n;
    end else begin
        low_threshold_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        low_threshold_read = 1'b1;
    end else begin
        low_threshold_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'b0 == ap_block_state2_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call16 = ((ap_start == 1'b0) | (high_threshold_empty_n == 1'b0) | (low_threshold_empty_n == 1'b0) | (in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2_on_subcall_done = ((ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready & ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done) == 1'b0);
end

assign ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done = (grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done | ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_done);

assign ap_sync_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready = (grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready | ap_sync_reg_grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_ready);

assign dst_mat_data_din = grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_dst_mat_422_din;

assign grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start = grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58_ap_start_reg;

assign trunc_ln309_1_fu_85_p1 = in_mat_cols_dout[10:0];

assign trunc_ln309_fu_80_p1 = in_mat_rows_dout[9:0];

assign trunc_ln44_1_fu_75_p1 = high_threshold_dout[7:0];

assign trunc_ln44_fu_70_p1 = low_threshold_dout[7:0];

endmodule //canny_accel_Canny_3_0_0_11_800_1280_8_32_false_2_2_s
