// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module canny_accel_Mat2Axi (
        dst_mat_422_dout,
        dst_mat_422_empty_n,
        dst_mat_422_read,
        m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY,
        m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY,
        m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST,
        m_axi_gmem2_WID,
        m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST,
        m_axi_gmem2_RID,
        m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID,
        m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP,
        m_axi_gmem2_BID,
        m_axi_gmem2_BUSER,
        dout,
        rows,
        cols,
        ap_clk,
        ap_rst,
        dout_ap_vld,
        rows_ap_vld,
        cols_ap_vld,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input  [63:0] dst_mat_422_dout;
input   dst_mat_422_empty_n;
output   dst_mat_422_read;
output   m_axi_gmem2_AWVALID;
input   m_axi_gmem2_AWREADY;
output  [63:0] m_axi_gmem2_AWADDR;
output  [0:0] m_axi_gmem2_AWID;
output  [31:0] m_axi_gmem2_AWLEN;
output  [2:0] m_axi_gmem2_AWSIZE;
output  [1:0] m_axi_gmem2_AWBURST;
output  [1:0] m_axi_gmem2_AWLOCK;
output  [3:0] m_axi_gmem2_AWCACHE;
output  [2:0] m_axi_gmem2_AWPROT;
output  [3:0] m_axi_gmem2_AWQOS;
output  [3:0] m_axi_gmem2_AWREGION;
output  [0:0] m_axi_gmem2_AWUSER;
output   m_axi_gmem2_WVALID;
input   m_axi_gmem2_WREADY;
output  [63:0] m_axi_gmem2_WDATA;
output  [7:0] m_axi_gmem2_WSTRB;
output   m_axi_gmem2_WLAST;
output  [0:0] m_axi_gmem2_WID;
output  [0:0] m_axi_gmem2_WUSER;
output   m_axi_gmem2_ARVALID;
input   m_axi_gmem2_ARREADY;
output  [63:0] m_axi_gmem2_ARADDR;
output  [0:0] m_axi_gmem2_ARID;
output  [31:0] m_axi_gmem2_ARLEN;
output  [2:0] m_axi_gmem2_ARSIZE;
output  [1:0] m_axi_gmem2_ARBURST;
output  [1:0] m_axi_gmem2_ARLOCK;
output  [3:0] m_axi_gmem2_ARCACHE;
output  [2:0] m_axi_gmem2_ARPROT;
output  [3:0] m_axi_gmem2_ARQOS;
output  [3:0] m_axi_gmem2_ARREGION;
output  [0:0] m_axi_gmem2_ARUSER;
input   m_axi_gmem2_RVALID;
output   m_axi_gmem2_RREADY;
input  [63:0] m_axi_gmem2_RDATA;
input   m_axi_gmem2_RLAST;
input  [0:0] m_axi_gmem2_RID;
input  [0:0] m_axi_gmem2_RUSER;
input  [1:0] m_axi_gmem2_RRESP;
input   m_axi_gmem2_BVALID;
output   m_axi_gmem2_BREADY;
input  [1:0] m_axi_gmem2_BRESP;
input  [0:0] m_axi_gmem2_BID;
input  [0:0] m_axi_gmem2_BUSER;
input  [63:0] dout;
input  [15:0] rows;
input  [10:0] cols;
input   ap_clk;
input   ap_rst;
input   dout_ap_vld;
input   rows_ap_vld;
input   cols_ap_vld;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire    Mat2Axi_entry67_U0_ap_start;
wire    Mat2Axi_entry67_U0_start_full_n;
wire    Mat2Axi_entry67_U0_ap_done;
wire    Mat2Axi_entry67_U0_ap_continue;
wire    Mat2Axi_entry67_U0_ap_idle;
wire    Mat2Axi_entry67_U0_ap_ready;
wire    Mat2Axi_entry67_U0_start_out;
wire    Mat2Axi_entry67_U0_start_write;
wire   [63:0] Mat2Axi_entry67_U0_dout_out_din;
wire    Mat2Axi_entry67_U0_dout_out_write;
wire   [15:0] Mat2Axi_entry67_U0_rows_out_din;
wire    Mat2Axi_entry67_U0_rows_out_write;
wire   [15:0] Mat2Axi_entry67_U0_rows_out1_din;
wire    Mat2Axi_entry67_U0_rows_out1_write;
wire   [10:0] Mat2Axi_entry67_U0_cols_out_din;
wire    Mat2Axi_entry67_U0_cols_out_write;
wire   [10:0] Mat2Axi_entry67_U0_cols_out2_din;
wire    Mat2Axi_entry67_U0_cols_out2_write;
wire    addrbound_U0_ap_start;
wire    addrbound_U0_ap_done;
wire    addrbound_U0_ap_continue;
wire    addrbound_U0_ap_idle;
wire    addrbound_U0_ap_ready;
wire   [15:0] addrbound_U0_return_r;
wire    addrbound_U0_return_r_ap_vld;
wire    addrbound_U0_rows_read;
wire    addrbound_U0_cols_read;
wire    ap_channel_done_p_channel;
wire    p_channel_full_n;
wire    Mat2Axi_Block_split13_proc_U0_ap_start;
wire    Mat2Axi_Block_split13_proc_U0_ap_done;
wire    Mat2Axi_Block_split13_proc_U0_ap_continue;
wire    Mat2Axi_Block_split13_proc_U0_ap_idle;
wire    Mat2Axi_Block_split13_proc_U0_ap_ready;
wire   [15:0] Mat2Axi_Block_split13_proc_U0_ap_return;
wire    ap_channel_done_axibound_V;
wire    axibound_V_full_n;
wire    Mat2AxiStream_U0_dst_mat_422_read;
wire   [63:0] Mat2AxiStream_U0_ldata1_din;
wire    Mat2AxiStream_U0_ldata1_write;
wire    Mat2AxiStream_U0_rows_read;
wire    Mat2AxiStream_U0_cols_read;
wire    Mat2AxiStream_U0_ap_start;
wire    Mat2AxiStream_U0_ap_done;
wire    Mat2AxiStream_U0_ap_ready;
wire    Mat2AxiStream_U0_ap_idle;
wire    Mat2AxiStream_U0_ap_continue;
wire    AxiStream2Axi_U0_ap_start;
wire    AxiStream2Axi_U0_ap_done;
wire    AxiStream2Axi_U0_ap_continue;
wire    AxiStream2Axi_U0_ap_idle;
wire    AxiStream2Axi_U0_ap_ready;
wire    AxiStream2Axi_U0_ldata1_read;
wire    AxiStream2Axi_U0_m_axi_gmem2_AWVALID;
wire   [63:0] AxiStream2Axi_U0_m_axi_gmem2_AWADDR;
wire   [0:0] AxiStream2Axi_U0_m_axi_gmem2_AWID;
wire   [31:0] AxiStream2Axi_U0_m_axi_gmem2_AWLEN;
wire   [2:0] AxiStream2Axi_U0_m_axi_gmem2_AWSIZE;
wire   [1:0] AxiStream2Axi_U0_m_axi_gmem2_AWBURST;
wire   [1:0] AxiStream2Axi_U0_m_axi_gmem2_AWLOCK;
wire   [3:0] AxiStream2Axi_U0_m_axi_gmem2_AWCACHE;
wire   [2:0] AxiStream2Axi_U0_m_axi_gmem2_AWPROT;
wire   [3:0] AxiStream2Axi_U0_m_axi_gmem2_AWQOS;
wire   [3:0] AxiStream2Axi_U0_m_axi_gmem2_AWREGION;
wire   [0:0] AxiStream2Axi_U0_m_axi_gmem2_AWUSER;
wire    AxiStream2Axi_U0_m_axi_gmem2_WVALID;
wire   [63:0] AxiStream2Axi_U0_m_axi_gmem2_WDATA;
wire   [7:0] AxiStream2Axi_U0_m_axi_gmem2_WSTRB;
wire    AxiStream2Axi_U0_m_axi_gmem2_WLAST;
wire   [0:0] AxiStream2Axi_U0_m_axi_gmem2_WID;
wire   [0:0] AxiStream2Axi_U0_m_axi_gmem2_WUSER;
wire    AxiStream2Axi_U0_m_axi_gmem2_ARVALID;
wire   [63:0] AxiStream2Axi_U0_m_axi_gmem2_ARADDR;
wire   [0:0] AxiStream2Axi_U0_m_axi_gmem2_ARID;
wire   [31:0] AxiStream2Axi_U0_m_axi_gmem2_ARLEN;
wire   [2:0] AxiStream2Axi_U0_m_axi_gmem2_ARSIZE;
wire   [1:0] AxiStream2Axi_U0_m_axi_gmem2_ARBURST;
wire   [1:0] AxiStream2Axi_U0_m_axi_gmem2_ARLOCK;
wire   [3:0] AxiStream2Axi_U0_m_axi_gmem2_ARCACHE;
wire   [2:0] AxiStream2Axi_U0_m_axi_gmem2_ARPROT;
wire   [3:0] AxiStream2Axi_U0_m_axi_gmem2_ARQOS;
wire   [3:0] AxiStream2Axi_U0_m_axi_gmem2_ARREGION;
wire   [0:0] AxiStream2Axi_U0_m_axi_gmem2_ARUSER;
wire    AxiStream2Axi_U0_m_axi_gmem2_RREADY;
wire    AxiStream2Axi_U0_m_axi_gmem2_BREADY;
wire    AxiStream2Axi_U0_dout_read;
wire    ap_sync_continue;
wire    dout_c_full_n;
wire   [63:0] dout_c_dout;
wire    dout_c_empty_n;
wire    rows_c_full_n;
wire   [15:0] rows_c_dout;
wire    rows_c_empty_n;
wire    rows_c10_full_n;
wire   [15:0] rows_c10_dout;
wire    rows_c10_empty_n;
wire    cols_c_full_n;
wire   [10:0] cols_c_dout;
wire    cols_c_empty_n;
wire    cols_c11_full_n;
wire   [10:0] cols_c11_dout;
wire    cols_c11_empty_n;
wire   [15:0] p_channel_dout;
wire    p_channel_empty_n;
wire   [15:0] axibound_V_dout;
wire    axibound_V_empty_n;
wire    ldata_full_n;
wire   [63:0] ldata_dout;
wire    ldata_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
wire   [0:0] start_for_addrbound_U0_din;
wire    start_for_addrbound_U0_full_n;
wire   [0:0] start_for_addrbound_U0_dout;
wire    start_for_addrbound_U0_empty_n;
wire   [0:0] start_for_Mat2AxiStream_U0_din;
wire    start_for_Mat2AxiStream_U0_full_n;
wire   [0:0] start_for_Mat2AxiStream_U0_dout;
wire    start_for_Mat2AxiStream_U0_empty_n;
wire    addrbound_U0_start_full_n;
wire    addrbound_U0_start_write;
wire    Mat2Axi_Block_split13_proc_U0_start_full_n;
wire    Mat2Axi_Block_split13_proc_U0_start_write;
wire    Mat2AxiStream_U0_start_full_n;
wire    Mat2AxiStream_U0_start_write;
wire    AxiStream2Axi_U0_start_full_n;
wire    AxiStream2Axi_U0_start_write;

canny_accel_Mat2Axi_entry67 Mat2Axi_entry67_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Mat2Axi_entry67_U0_ap_start),
    .start_full_n(Mat2Axi_entry67_U0_start_full_n),
    .ap_done(Mat2Axi_entry67_U0_ap_done),
    .ap_continue(Mat2Axi_entry67_U0_ap_continue),
    .ap_idle(Mat2Axi_entry67_U0_ap_idle),
    .ap_ready(Mat2Axi_entry67_U0_ap_ready),
    .start_out(Mat2Axi_entry67_U0_start_out),
    .start_write(Mat2Axi_entry67_U0_start_write),
    .dout(dout),
    .rows(rows),
    .cols(cols),
    .dout_out_din(Mat2Axi_entry67_U0_dout_out_din),
    .dout_out_full_n(dout_c_full_n),
    .dout_out_write(Mat2Axi_entry67_U0_dout_out_write),
    .rows_out_din(Mat2Axi_entry67_U0_rows_out_din),
    .rows_out_full_n(rows_c_full_n),
    .rows_out_write(Mat2Axi_entry67_U0_rows_out_write),
    .rows_out1_din(Mat2Axi_entry67_U0_rows_out1_din),
    .rows_out1_full_n(rows_c10_full_n),
    .rows_out1_write(Mat2Axi_entry67_U0_rows_out1_write),
    .cols_out_din(Mat2Axi_entry67_U0_cols_out_din),
    .cols_out_full_n(cols_c_full_n),
    .cols_out_write(Mat2Axi_entry67_U0_cols_out_write),
    .cols_out2_din(Mat2Axi_entry67_U0_cols_out2_din),
    .cols_out2_full_n(cols_c11_full_n),
    .cols_out2_write(Mat2Axi_entry67_U0_cols_out2_write)
);

canny_accel_addrbound addrbound_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(addrbound_U0_ap_start),
    .ap_done(addrbound_U0_ap_done),
    .ap_continue(addrbound_U0_ap_continue),
    .ap_idle(addrbound_U0_ap_idle),
    .ap_ready(addrbound_U0_ap_ready),
    .return_r(addrbound_U0_return_r),
    .return_r_ap_vld(addrbound_U0_return_r_ap_vld),
    .rows_dout(rows_c_dout),
    .rows_empty_n(rows_c_empty_n),
    .rows_read(addrbound_U0_rows_read),
    .cols_dout(cols_c_dout),
    .cols_empty_n(cols_c_empty_n),
    .cols_read(addrbound_U0_cols_read)
);

canny_accel_Mat2Axi_Block_split13_proc Mat2Axi_Block_split13_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Mat2Axi_Block_split13_proc_U0_ap_start),
    .ap_done(Mat2Axi_Block_split13_proc_U0_ap_done),
    .ap_continue(Mat2Axi_Block_split13_proc_U0_ap_continue),
    .ap_idle(Mat2Axi_Block_split13_proc_U0_ap_idle),
    .ap_ready(Mat2Axi_Block_split13_proc_U0_ap_ready),
    .axibound_V_1(p_channel_dout),
    .ap_return(Mat2Axi_Block_split13_proc_U0_ap_return)
);

canny_accel_Mat2AxiStream Mat2AxiStream_U0(
    .dst_mat_422_dout(dst_mat_422_dout),
    .dst_mat_422_empty_n(dst_mat_422_empty_n),
    .dst_mat_422_read(Mat2AxiStream_U0_dst_mat_422_read),
    .ldata1_din(Mat2AxiStream_U0_ldata1_din),
    .ldata1_full_n(ldata_full_n),
    .ldata1_write(Mat2AxiStream_U0_ldata1_write),
    .rows_dout(rows_c10_dout),
    .rows_empty_n(rows_c10_empty_n),
    .rows_read(Mat2AxiStream_U0_rows_read),
    .cols_dout(cols_c11_dout),
    .cols_empty_n(cols_c11_empty_n),
    .cols_read(Mat2AxiStream_U0_cols_read),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Mat2AxiStream_U0_ap_start),
    .ap_done(Mat2AxiStream_U0_ap_done),
    .ap_ready(Mat2AxiStream_U0_ap_ready),
    .ap_idle(Mat2AxiStream_U0_ap_idle),
    .ap_continue(Mat2AxiStream_U0_ap_continue)
);

canny_accel_AxiStream2Axi AxiStream2Axi_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(AxiStream2Axi_U0_ap_start),
    .ap_done(AxiStream2Axi_U0_ap_done),
    .ap_continue(AxiStream2Axi_U0_ap_continue),
    .ap_idle(AxiStream2Axi_U0_ap_idle),
    .ap_ready(AxiStream2Axi_U0_ap_ready),
    .ldata1_dout(ldata_dout),
    .ldata1_empty_n(ldata_empty_n),
    .ldata1_read(AxiStream2Axi_U0_ldata1_read),
    .m_axi_gmem2_AWVALID(AxiStream2Axi_U0_m_axi_gmem2_AWVALID),
    .m_axi_gmem2_AWREADY(m_axi_gmem2_AWREADY),
    .m_axi_gmem2_AWADDR(AxiStream2Axi_U0_m_axi_gmem2_AWADDR),
    .m_axi_gmem2_AWID(AxiStream2Axi_U0_m_axi_gmem2_AWID),
    .m_axi_gmem2_AWLEN(AxiStream2Axi_U0_m_axi_gmem2_AWLEN),
    .m_axi_gmem2_AWSIZE(AxiStream2Axi_U0_m_axi_gmem2_AWSIZE),
    .m_axi_gmem2_AWBURST(AxiStream2Axi_U0_m_axi_gmem2_AWBURST),
    .m_axi_gmem2_AWLOCK(AxiStream2Axi_U0_m_axi_gmem2_AWLOCK),
    .m_axi_gmem2_AWCACHE(AxiStream2Axi_U0_m_axi_gmem2_AWCACHE),
    .m_axi_gmem2_AWPROT(AxiStream2Axi_U0_m_axi_gmem2_AWPROT),
    .m_axi_gmem2_AWQOS(AxiStream2Axi_U0_m_axi_gmem2_AWQOS),
    .m_axi_gmem2_AWREGION(AxiStream2Axi_U0_m_axi_gmem2_AWREGION),
    .m_axi_gmem2_AWUSER(AxiStream2Axi_U0_m_axi_gmem2_AWUSER),
    .m_axi_gmem2_WVALID(AxiStream2Axi_U0_m_axi_gmem2_WVALID),
    .m_axi_gmem2_WREADY(m_axi_gmem2_WREADY),
    .m_axi_gmem2_WDATA(AxiStream2Axi_U0_m_axi_gmem2_WDATA),
    .m_axi_gmem2_WSTRB(AxiStream2Axi_U0_m_axi_gmem2_WSTRB),
    .m_axi_gmem2_WLAST(AxiStream2Axi_U0_m_axi_gmem2_WLAST),
    .m_axi_gmem2_WID(AxiStream2Axi_U0_m_axi_gmem2_WID),
    .m_axi_gmem2_WUSER(AxiStream2Axi_U0_m_axi_gmem2_WUSER),
    .m_axi_gmem2_ARVALID(AxiStream2Axi_U0_m_axi_gmem2_ARVALID),
    .m_axi_gmem2_ARREADY(1'b0),
    .m_axi_gmem2_ARADDR(AxiStream2Axi_U0_m_axi_gmem2_ARADDR),
    .m_axi_gmem2_ARID(AxiStream2Axi_U0_m_axi_gmem2_ARID),
    .m_axi_gmem2_ARLEN(AxiStream2Axi_U0_m_axi_gmem2_ARLEN),
    .m_axi_gmem2_ARSIZE(AxiStream2Axi_U0_m_axi_gmem2_ARSIZE),
    .m_axi_gmem2_ARBURST(AxiStream2Axi_U0_m_axi_gmem2_ARBURST),
    .m_axi_gmem2_ARLOCK(AxiStream2Axi_U0_m_axi_gmem2_ARLOCK),
    .m_axi_gmem2_ARCACHE(AxiStream2Axi_U0_m_axi_gmem2_ARCACHE),
    .m_axi_gmem2_ARPROT(AxiStream2Axi_U0_m_axi_gmem2_ARPROT),
    .m_axi_gmem2_ARQOS(AxiStream2Axi_U0_m_axi_gmem2_ARQOS),
    .m_axi_gmem2_ARREGION(AxiStream2Axi_U0_m_axi_gmem2_ARREGION),
    .m_axi_gmem2_ARUSER(AxiStream2Axi_U0_m_axi_gmem2_ARUSER),
    .m_axi_gmem2_RVALID(1'b0),
    .m_axi_gmem2_RREADY(AxiStream2Axi_U0_m_axi_gmem2_RREADY),
    .m_axi_gmem2_RDATA(64'd0),
    .m_axi_gmem2_RLAST(1'b0),
    .m_axi_gmem2_RID(1'd0),
    .m_axi_gmem2_RUSER(1'd0),
    .m_axi_gmem2_RRESP(2'd0),
    .m_axi_gmem2_BVALID(m_axi_gmem2_BVALID),
    .m_axi_gmem2_BREADY(AxiStream2Axi_U0_m_axi_gmem2_BREADY),
    .m_axi_gmem2_BRESP(m_axi_gmem2_BRESP),
    .m_axi_gmem2_BID(m_axi_gmem2_BID),
    .m_axi_gmem2_BUSER(m_axi_gmem2_BUSER),
    .dout_dout(dout_c_dout),
    .dout_empty_n(dout_c_empty_n),
    .dout_read(AxiStream2Axi_U0_dout_read),
    .addrbound_V_read(axibound_V_dout)
);

canny_accel_fifo_w64_d4_S dout_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2Axi_entry67_U0_dout_out_din),
    .if_full_n(dout_c_full_n),
    .if_write(Mat2Axi_entry67_U0_dout_out_write),
    .if_dout(dout_c_dout),
    .if_empty_n(dout_c_empty_n),
    .if_read(AxiStream2Axi_U0_dout_read)
);

canny_accel_fifo_w16_d2_S_x rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2Axi_entry67_U0_rows_out_din),
    .if_full_n(rows_c_full_n),
    .if_write(Mat2Axi_entry67_U0_rows_out_write),
    .if_dout(rows_c_dout),
    .if_empty_n(rows_c_empty_n),
    .if_read(addrbound_U0_rows_read)
);

canny_accel_fifo_w16_d2_S_x rows_c10_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2Axi_entry67_U0_rows_out1_din),
    .if_full_n(rows_c10_full_n),
    .if_write(Mat2Axi_entry67_U0_rows_out1_write),
    .if_dout(rows_c10_dout),
    .if_empty_n(rows_c10_empty_n),
    .if_read(Mat2AxiStream_U0_rows_read)
);

canny_accel_fifo_w11_d2_S_x0 cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2Axi_entry67_U0_cols_out_din),
    .if_full_n(cols_c_full_n),
    .if_write(Mat2Axi_entry67_U0_cols_out_write),
    .if_dout(cols_c_dout),
    .if_empty_n(cols_c_empty_n),
    .if_read(addrbound_U0_cols_read)
);

canny_accel_fifo_w11_d2_S_x0 cols_c11_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2Axi_entry67_U0_cols_out2_din),
    .if_full_n(cols_c11_full_n),
    .if_write(Mat2Axi_entry67_U0_cols_out2_write),
    .if_dout(cols_c11_dout),
    .if_empty_n(cols_c11_empty_n),
    .if_read(Mat2AxiStream_U0_cols_read)
);

canny_accel_fifo_w16_d2_S_x p_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(addrbound_U0_return_r),
    .if_full_n(p_channel_full_n),
    .if_write(addrbound_U0_ap_done),
    .if_dout(p_channel_dout),
    .if_empty_n(p_channel_empty_n),
    .if_read(Mat2Axi_Block_split13_proc_U0_ap_ready)
);

canny_accel_fifo_w16_d2_S_x axibound_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2Axi_Block_split13_proc_U0_ap_return),
    .if_full_n(axibound_V_full_n),
    .if_write(Mat2Axi_Block_split13_proc_U0_ap_done),
    .if_dout(axibound_V_dout),
    .if_empty_n(axibound_V_empty_n),
    .if_read(AxiStream2Axi_U0_ap_ready)
);

canny_accel_fifo_w64_d2_S_x0 ldata_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Mat2AxiStream_U0_ldata1_din),
    .if_full_n(ldata_full_n),
    .if_write(Mat2AxiStream_U0_ldata1_write),
    .if_dout(ldata_dout),
    .if_empty_n(ldata_empty_n),
    .if_read(AxiStream2Axi_U0_ldata1_read)
);

canny_accel_start_for_addrbound_U0 start_for_addrbound_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_addrbound_U0_din),
    .if_full_n(start_for_addrbound_U0_full_n),
    .if_write(Mat2Axi_entry67_U0_start_write),
    .if_dout(start_for_addrbound_U0_dout),
    .if_empty_n(start_for_addrbound_U0_empty_n),
    .if_read(addrbound_U0_ap_ready)
);

canny_accel_start_for_Mat2AxiStream_U0 start_for_Mat2AxiStream_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_Mat2AxiStream_U0_din),
    .if_full_n(start_for_Mat2AxiStream_U0_full_n),
    .if_write(Mat2Axi_entry67_U0_start_write),
    .if_dout(start_for_Mat2AxiStream_U0_dout),
    .if_empty_n(start_for_Mat2AxiStream_U0_empty_n),
    .if_read(Mat2AxiStream_U0_ap_ready)
);

assign AxiStream2Axi_U0_ap_continue = ap_continue;

assign AxiStream2Axi_U0_ap_start = axibound_V_empty_n;

assign AxiStream2Axi_U0_start_full_n = 1'b1;

assign AxiStream2Axi_U0_start_write = 1'b0;

assign Mat2AxiStream_U0_ap_continue = 1'b1;

assign Mat2AxiStream_U0_ap_start = start_for_Mat2AxiStream_U0_empty_n;

assign Mat2AxiStream_U0_start_full_n = 1'b1;

assign Mat2AxiStream_U0_start_write = 1'b0;

assign Mat2Axi_Block_split13_proc_U0_ap_continue = axibound_V_full_n;

assign Mat2Axi_Block_split13_proc_U0_ap_start = p_channel_empty_n;

assign Mat2Axi_Block_split13_proc_U0_start_full_n = 1'b1;

assign Mat2Axi_Block_split13_proc_U0_start_write = 1'b0;

assign Mat2Axi_entry67_U0_ap_continue = 1'b1;

assign Mat2Axi_entry67_U0_ap_start = ap_start;

assign Mat2Axi_entry67_U0_start_full_n = (start_for_addrbound_U0_full_n & start_for_Mat2AxiStream_U0_full_n);

assign addrbound_U0_ap_continue = p_channel_full_n;

assign addrbound_U0_ap_start = start_for_addrbound_U0_empty_n;

assign addrbound_U0_start_full_n = 1'b1;

assign addrbound_U0_start_write = 1'b0;

assign ap_channel_done_axibound_V = Mat2Axi_Block_split13_proc_U0_ap_done;

assign ap_channel_done_p_channel = addrbound_U0_ap_done;

assign ap_done = AxiStream2Axi_U0_ap_done;

assign ap_idle = ((axibound_V_empty_n ^ 1'b1) & (p_channel_empty_n ^ 1'b1) & addrbound_U0_ap_idle & Mat2Axi_entry67_U0_ap_idle & Mat2Axi_Block_split13_proc_U0_ap_idle & Mat2AxiStream_U0_ap_idle & AxiStream2Axi_U0_ap_idle);

assign ap_ready = Mat2Axi_entry67_U0_ap_ready;

assign ap_sync_continue = ap_continue;

assign ap_sync_done = AxiStream2Axi_U0_ap_done;

assign ap_sync_ready = Mat2Axi_entry67_U0_ap_ready;

assign dst_mat_422_read = Mat2AxiStream_U0_dst_mat_422_read;

assign m_axi_gmem2_ARADDR = 64'd0;

assign m_axi_gmem2_ARBURST = 2'd0;

assign m_axi_gmem2_ARCACHE = 4'd0;

assign m_axi_gmem2_ARID = 1'd0;

assign m_axi_gmem2_ARLEN = 32'd0;

assign m_axi_gmem2_ARLOCK = 2'd0;

assign m_axi_gmem2_ARPROT = 3'd0;

assign m_axi_gmem2_ARQOS = 4'd0;

assign m_axi_gmem2_ARREGION = 4'd0;

assign m_axi_gmem2_ARSIZE = 3'd0;

assign m_axi_gmem2_ARUSER = 1'd0;

assign m_axi_gmem2_ARVALID = 1'b0;

assign m_axi_gmem2_AWADDR = AxiStream2Axi_U0_m_axi_gmem2_AWADDR;

assign m_axi_gmem2_AWBURST = AxiStream2Axi_U0_m_axi_gmem2_AWBURST;

assign m_axi_gmem2_AWCACHE = AxiStream2Axi_U0_m_axi_gmem2_AWCACHE;

assign m_axi_gmem2_AWID = AxiStream2Axi_U0_m_axi_gmem2_AWID;

assign m_axi_gmem2_AWLEN = AxiStream2Axi_U0_m_axi_gmem2_AWLEN;

assign m_axi_gmem2_AWLOCK = AxiStream2Axi_U0_m_axi_gmem2_AWLOCK;

assign m_axi_gmem2_AWPROT = AxiStream2Axi_U0_m_axi_gmem2_AWPROT;

assign m_axi_gmem2_AWQOS = AxiStream2Axi_U0_m_axi_gmem2_AWQOS;

assign m_axi_gmem2_AWREGION = AxiStream2Axi_U0_m_axi_gmem2_AWREGION;

assign m_axi_gmem2_AWSIZE = AxiStream2Axi_U0_m_axi_gmem2_AWSIZE;

assign m_axi_gmem2_AWUSER = AxiStream2Axi_U0_m_axi_gmem2_AWUSER;

assign m_axi_gmem2_AWVALID = AxiStream2Axi_U0_m_axi_gmem2_AWVALID;

assign m_axi_gmem2_BREADY = AxiStream2Axi_U0_m_axi_gmem2_BREADY;

assign m_axi_gmem2_RREADY = 1'b0;

assign m_axi_gmem2_WDATA = AxiStream2Axi_U0_m_axi_gmem2_WDATA;

assign m_axi_gmem2_WID = AxiStream2Axi_U0_m_axi_gmem2_WID;

assign m_axi_gmem2_WLAST = AxiStream2Axi_U0_m_axi_gmem2_WLAST;

assign m_axi_gmem2_WSTRB = AxiStream2Axi_U0_m_axi_gmem2_WSTRB;

assign m_axi_gmem2_WUSER = AxiStream2Axi_U0_m_axi_gmem2_WUSER;

assign m_axi_gmem2_WVALID = AxiStream2Axi_U0_m_axi_gmem2_WVALID;

assign start_for_Mat2AxiStream_U0_din = 1'b1;

assign start_for_addrbound_U0_din = 1'b1;

endmodule //canny_accel_Mat2Axi
