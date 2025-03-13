//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Wed Dec 18 11:27:07 2024
//Host        : L running 64-bit major release  (build 9200)
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_N6CHY9
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [39:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [39:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_1YGIC8G
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [39:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [39:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_1MV52F6
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [39:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [39:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m03_couplers_imp_XXQL8Z
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m03_couplers_to_m03_couplers_ARADDR;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire [39:0]m03_couplers_to_m03_couplers_AWADDR;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_11NL2LI
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m04_couplers_to_m04_couplers_ARADDR;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire [39:0]m04_couplers_to_m04_couplers_AWADDR;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module m05_couplers_imp_BM87P3
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m05_couplers_to_m05_couplers_ARADDR;
  wire [2:0]m05_couplers_to_m05_couplers_ARPROT;
  wire m05_couplers_to_m05_couplers_ARREADY;
  wire m05_couplers_to_m05_couplers_ARVALID;
  wire [39:0]m05_couplers_to_m05_couplers_AWADDR;
  wire [2:0]m05_couplers_to_m05_couplers_AWPROT;
  wire m05_couplers_to_m05_couplers_AWREADY;
  wire m05_couplers_to_m05_couplers_AWVALID;
  wire m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire m05_couplers_to_m05_couplers_WREADY;
  wire [3:0]m05_couplers_to_m05_couplers_WSTRB;
  wire m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m05_couplers_to_m05_couplers_ARPROT;
  assign M_AXI_arvalid = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m05_couplers_to_m05_couplers_AWPROT;
  assign M_AXI_awvalid = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m05_couplers_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m05_couplers_to_m05_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready;
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m05_couplers_to_m05_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready;
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready;
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready;
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready;
  assign m05_couplers_to_m05_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_RR89KG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [39:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [39:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [15:0]s00_couplers_to_auto_pc_ARID;
  wire [7:0]s00_couplers_to_auto_pc_ARLEN;
  wire [0:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [39:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [15:0]s00_couplers_to_auto_pc_AWID;
  wire [7:0]s00_couplers_to_auto_pc_AWLEN;
  wire [0:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [15:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [15:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[39:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[15:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[15:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[39:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[15:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[39:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[15:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=30,numReposBlks=22,numNonXlnxBlks=3,numHierBlks=8,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=2,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=111,da_board_cnt=2,da_clkrst_cnt=6,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (cam_data_0,
    cam_data_1,
    cam_data_2,
    cam_href_0,
    cam_href_1,
    cam_href_2,
    cam_pclk_0,
    cam_pclk_1,
    cam_pclk_2,
    cam_pwdn_0,
    cam_pwdn_1,
    cam_pwdn_2,
    cam_rst_n_0,
    cam_rst_n_1,
    cam_rst_n_2,
    cam_vsync_0,
    cam_vsync_1,
    cam_vsync_2,
    emio_sccb_tri_i,
    emio_sccb_tri_o,
    emio_sccb_tri_t);
  input [7:0]cam_data_0;
  input [7:0]cam_data_1;
  input [7:0]cam_data_2;
  input cam_href_0;
  input cam_href_1;
  input cam_href_2;
  input cam_pclk_0;
  input cam_pclk_1;
  input cam_pclk_2;
  output cam_pwdn_0;
  output cam_pwdn_1;
  output cam_pwdn_2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CAM_RST_N_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CAM_RST_N_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output cam_rst_n_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CAM_RST_N_1 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CAM_RST_N_1, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output cam_rst_n_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CAM_RST_N_2 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CAM_RST_N_2, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output cam_rst_n_2;
  input cam_vsync_0;
  input cam_vsync_1;
  input cam_vsync_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 emio_sccb TRI_I" *) input [5:0]emio_sccb_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 emio_sccb TRI_O" *) output [5:0]emio_sccb_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 emio_sccb TRI_T" *) output [5:0]emio_sccb_tri_t;

  wire Net;
  wire [48:0]axi_smc_M00_AXI_ARADDR;
  wire [1:0]axi_smc_M00_AXI_ARBURST;
  wire [3:0]axi_smc_M00_AXI_ARCACHE;
  wire [7:0]axi_smc_M00_AXI_ARLEN;
  wire [0:0]axi_smc_M00_AXI_ARLOCK;
  wire [2:0]axi_smc_M00_AXI_ARPROT;
  wire [3:0]axi_smc_M00_AXI_ARQOS;
  wire axi_smc_M00_AXI_ARREADY;
  wire [2:0]axi_smc_M00_AXI_ARSIZE;
  wire axi_smc_M00_AXI_ARVALID;
  wire [48:0]axi_smc_M00_AXI_AWADDR;
  wire [1:0]axi_smc_M00_AXI_AWBURST;
  wire [3:0]axi_smc_M00_AXI_AWCACHE;
  wire [7:0]axi_smc_M00_AXI_AWLEN;
  wire [0:0]axi_smc_M00_AXI_AWLOCK;
  wire [2:0]axi_smc_M00_AXI_AWPROT;
  wire [3:0]axi_smc_M00_AXI_AWQOS;
  wire axi_smc_M00_AXI_AWREADY;
  wire [2:0]axi_smc_M00_AXI_AWSIZE;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [127:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RLAST;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [127:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WLAST;
  wire axi_smc_M00_AXI_WREADY;
  wire [15:0]axi_smc_M00_AXI_WSTRB;
  wire axi_smc_M00_AXI_WVALID;
  wire [31:0]axi_vdma_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_vdma_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_vdma_0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_vdma_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_vdma_0_M_AXI_S2MM_AWPROT;
  wire axi_vdma_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_vdma_0_M_AXI_S2MM_AWSIZE;
  wire axi_vdma_0_M_AXI_S2MM_AWVALID;
  wire axi_vdma_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_vdma_0_M_AXI_S2MM_BRESP;
  wire axi_vdma_0_M_AXI_S2MM_BVALID;
  wire [63:0]axi_vdma_0_M_AXI_S2MM_WDATA;
  wire axi_vdma_0_M_AXI_S2MM_WLAST;
  wire axi_vdma_0_M_AXI_S2MM_WREADY;
  wire [7:0]axi_vdma_0_M_AXI_S2MM_WSTRB;
  wire axi_vdma_0_M_AXI_S2MM_WVALID;
  wire [31:0]axi_vdma_1_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_vdma_1_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_vdma_1_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_vdma_1_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_vdma_1_M_AXI_S2MM_AWPROT;
  wire axi_vdma_1_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_vdma_1_M_AXI_S2MM_AWSIZE;
  wire axi_vdma_1_M_AXI_S2MM_AWVALID;
  wire axi_vdma_1_M_AXI_S2MM_BREADY;
  wire [1:0]axi_vdma_1_M_AXI_S2MM_BRESP;
  wire axi_vdma_1_M_AXI_S2MM_BVALID;
  wire [63:0]axi_vdma_1_M_AXI_S2MM_WDATA;
  wire axi_vdma_1_M_AXI_S2MM_WLAST;
  wire axi_vdma_1_M_AXI_S2MM_WREADY;
  wire [7:0]axi_vdma_1_M_AXI_S2MM_WSTRB;
  wire axi_vdma_1_M_AXI_S2MM_WVALID;
  wire [31:0]axi_vdma_2_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_vdma_2_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_vdma_2_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_vdma_2_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_vdma_2_M_AXI_S2MM_AWPROT;
  wire axi_vdma_2_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_vdma_2_M_AXI_S2MM_AWSIZE;
  wire axi_vdma_2_M_AXI_S2MM_AWVALID;
  wire axi_vdma_2_M_AXI_S2MM_BREADY;
  wire [1:0]axi_vdma_2_M_AXI_S2MM_BRESP;
  wire axi_vdma_2_M_AXI_S2MM_BVALID;
  wire [63:0]axi_vdma_2_M_AXI_S2MM_WDATA;
  wire axi_vdma_2_M_AXI_S2MM_WLAST;
  wire axi_vdma_2_M_AXI_S2MM_WREADY;
  wire [7:0]axi_vdma_2_M_AXI_S2MM_WSTRB;
  wire axi_vdma_2_M_AXI_S2MM_WVALID;
  wire [7:0]cam_data_0_1;
  wire [7:0]cam_data_1_1;
  wire [7:0]cam_data_2_1;
  wire cam_href_0_1;
  wire cam_href_1_1;
  wire cam_href_2_1;
  wire cam_pclk_0_1;
  wire cam_pclk_1_1;
  wire cam_pclk_2_1;
  wire cam_vsync_0_1;
  wire cam_vsync_1_1;
  wire cam_vsync_2_1;
  wire [63:0]canny_accel_0_m_axi_gmem1_ARADDR;
  wire [1:0]canny_accel_0_m_axi_gmem1_ARBURST;
  wire [3:0]canny_accel_0_m_axi_gmem1_ARCACHE;
  wire [7:0]canny_accel_0_m_axi_gmem1_ARLEN;
  wire [1:0]canny_accel_0_m_axi_gmem1_ARLOCK;
  wire [2:0]canny_accel_0_m_axi_gmem1_ARPROT;
  wire [3:0]canny_accel_0_m_axi_gmem1_ARQOS;
  wire canny_accel_0_m_axi_gmem1_ARREADY;
  wire [2:0]canny_accel_0_m_axi_gmem1_ARSIZE;
  wire canny_accel_0_m_axi_gmem1_ARVALID;
  wire [63:0]canny_accel_0_m_axi_gmem1_AWADDR;
  wire [1:0]canny_accel_0_m_axi_gmem1_AWBURST;
  wire [3:0]canny_accel_0_m_axi_gmem1_AWCACHE;
  wire [7:0]canny_accel_0_m_axi_gmem1_AWLEN;
  wire [1:0]canny_accel_0_m_axi_gmem1_AWLOCK;
  wire [2:0]canny_accel_0_m_axi_gmem1_AWPROT;
  wire [3:0]canny_accel_0_m_axi_gmem1_AWQOS;
  wire canny_accel_0_m_axi_gmem1_AWREADY;
  wire [2:0]canny_accel_0_m_axi_gmem1_AWSIZE;
  wire canny_accel_0_m_axi_gmem1_AWVALID;
  wire canny_accel_0_m_axi_gmem1_BREADY;
  wire [1:0]canny_accel_0_m_axi_gmem1_BRESP;
  wire canny_accel_0_m_axi_gmem1_BVALID;
  wire [63:0]canny_accel_0_m_axi_gmem1_RDATA;
  wire canny_accel_0_m_axi_gmem1_RLAST;
  wire canny_accel_0_m_axi_gmem1_RREADY;
  wire [1:0]canny_accel_0_m_axi_gmem1_RRESP;
  wire canny_accel_0_m_axi_gmem1_RVALID;
  wire [63:0]canny_accel_0_m_axi_gmem1_WDATA;
  wire canny_accel_0_m_axi_gmem1_WLAST;
  wire canny_accel_0_m_axi_gmem1_WREADY;
  wire [7:0]canny_accel_0_m_axi_gmem1_WSTRB;
  wire canny_accel_0_m_axi_gmem1_WVALID;
  wire [63:0]canny_accel_0_m_axi_gmem2_ARADDR;
  wire [1:0]canny_accel_0_m_axi_gmem2_ARBURST;
  wire [3:0]canny_accel_0_m_axi_gmem2_ARCACHE;
  wire [7:0]canny_accel_0_m_axi_gmem2_ARLEN;
  wire [1:0]canny_accel_0_m_axi_gmem2_ARLOCK;
  wire [2:0]canny_accel_0_m_axi_gmem2_ARPROT;
  wire [3:0]canny_accel_0_m_axi_gmem2_ARQOS;
  wire canny_accel_0_m_axi_gmem2_ARREADY;
  wire [2:0]canny_accel_0_m_axi_gmem2_ARSIZE;
  wire canny_accel_0_m_axi_gmem2_ARVALID;
  wire [63:0]canny_accel_0_m_axi_gmem2_AWADDR;
  wire [1:0]canny_accel_0_m_axi_gmem2_AWBURST;
  wire [3:0]canny_accel_0_m_axi_gmem2_AWCACHE;
  wire [7:0]canny_accel_0_m_axi_gmem2_AWLEN;
  wire [1:0]canny_accel_0_m_axi_gmem2_AWLOCK;
  wire [2:0]canny_accel_0_m_axi_gmem2_AWPROT;
  wire [3:0]canny_accel_0_m_axi_gmem2_AWQOS;
  wire canny_accel_0_m_axi_gmem2_AWREADY;
  wire [2:0]canny_accel_0_m_axi_gmem2_AWSIZE;
  wire canny_accel_0_m_axi_gmem2_AWVALID;
  wire canny_accel_0_m_axi_gmem2_BREADY;
  wire [1:0]canny_accel_0_m_axi_gmem2_BRESP;
  wire canny_accel_0_m_axi_gmem2_BVALID;
  wire [63:0]canny_accel_0_m_axi_gmem2_RDATA;
  wire canny_accel_0_m_axi_gmem2_RLAST;
  wire canny_accel_0_m_axi_gmem2_RREADY;
  wire [1:0]canny_accel_0_m_axi_gmem2_RRESP;
  wire canny_accel_0_m_axi_gmem2_RVALID;
  wire [63:0]canny_accel_0_m_axi_gmem2_WDATA;
  wire canny_accel_0_m_axi_gmem2_WLAST;
  wire canny_accel_0_m_axi_gmem2_WREADY;
  wire [7:0]canny_accel_0_m_axi_gmem2_WSTRB;
  wire canny_accel_0_m_axi_gmem2_WVALID;
  wire clk_wiz_0_locked;
  wire [63:0]edgetracing_accel_0_m_axi_gmem3_ARADDR;
  wire [1:0]edgetracing_accel_0_m_axi_gmem3_ARBURST;
  wire [3:0]edgetracing_accel_0_m_axi_gmem3_ARCACHE;
  wire [7:0]edgetracing_accel_0_m_axi_gmem3_ARLEN;
  wire [1:0]edgetracing_accel_0_m_axi_gmem3_ARLOCK;
  wire [2:0]edgetracing_accel_0_m_axi_gmem3_ARPROT;
  wire [3:0]edgetracing_accel_0_m_axi_gmem3_ARQOS;
  wire edgetracing_accel_0_m_axi_gmem3_ARREADY;
  wire [2:0]edgetracing_accel_0_m_axi_gmem3_ARSIZE;
  wire edgetracing_accel_0_m_axi_gmem3_ARVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem3_AWADDR;
  wire [1:0]edgetracing_accel_0_m_axi_gmem3_AWBURST;
  wire [3:0]edgetracing_accel_0_m_axi_gmem3_AWCACHE;
  wire [7:0]edgetracing_accel_0_m_axi_gmem3_AWLEN;
  wire [1:0]edgetracing_accel_0_m_axi_gmem3_AWLOCK;
  wire [2:0]edgetracing_accel_0_m_axi_gmem3_AWPROT;
  wire [3:0]edgetracing_accel_0_m_axi_gmem3_AWQOS;
  wire edgetracing_accel_0_m_axi_gmem3_AWREADY;
  wire [2:0]edgetracing_accel_0_m_axi_gmem3_AWSIZE;
  wire edgetracing_accel_0_m_axi_gmem3_AWVALID;
  wire edgetracing_accel_0_m_axi_gmem3_BREADY;
  wire [1:0]edgetracing_accel_0_m_axi_gmem3_BRESP;
  wire edgetracing_accel_0_m_axi_gmem3_BVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem3_RDATA;
  wire edgetracing_accel_0_m_axi_gmem3_RLAST;
  wire edgetracing_accel_0_m_axi_gmem3_RREADY;
  wire [1:0]edgetracing_accel_0_m_axi_gmem3_RRESP;
  wire edgetracing_accel_0_m_axi_gmem3_RVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem3_WDATA;
  wire edgetracing_accel_0_m_axi_gmem3_WLAST;
  wire edgetracing_accel_0_m_axi_gmem3_WREADY;
  wire [7:0]edgetracing_accel_0_m_axi_gmem3_WSTRB;
  wire edgetracing_accel_0_m_axi_gmem3_WVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem4_ARADDR;
  wire [1:0]edgetracing_accel_0_m_axi_gmem4_ARBURST;
  wire [3:0]edgetracing_accel_0_m_axi_gmem4_ARCACHE;
  wire [7:0]edgetracing_accel_0_m_axi_gmem4_ARLEN;
  wire [1:0]edgetracing_accel_0_m_axi_gmem4_ARLOCK;
  wire [2:0]edgetracing_accel_0_m_axi_gmem4_ARPROT;
  wire [3:0]edgetracing_accel_0_m_axi_gmem4_ARQOS;
  wire edgetracing_accel_0_m_axi_gmem4_ARREADY;
  wire [2:0]edgetracing_accel_0_m_axi_gmem4_ARSIZE;
  wire edgetracing_accel_0_m_axi_gmem4_ARVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem4_AWADDR;
  wire [1:0]edgetracing_accel_0_m_axi_gmem4_AWBURST;
  wire [3:0]edgetracing_accel_0_m_axi_gmem4_AWCACHE;
  wire [7:0]edgetracing_accel_0_m_axi_gmem4_AWLEN;
  wire [1:0]edgetracing_accel_0_m_axi_gmem4_AWLOCK;
  wire [2:0]edgetracing_accel_0_m_axi_gmem4_AWPROT;
  wire [3:0]edgetracing_accel_0_m_axi_gmem4_AWQOS;
  wire edgetracing_accel_0_m_axi_gmem4_AWREADY;
  wire [2:0]edgetracing_accel_0_m_axi_gmem4_AWSIZE;
  wire edgetracing_accel_0_m_axi_gmem4_AWVALID;
  wire edgetracing_accel_0_m_axi_gmem4_BREADY;
  wire [1:0]edgetracing_accel_0_m_axi_gmem4_BRESP;
  wire edgetracing_accel_0_m_axi_gmem4_BVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem4_RDATA;
  wire edgetracing_accel_0_m_axi_gmem4_RLAST;
  wire edgetracing_accel_0_m_axi_gmem4_RREADY;
  wire [1:0]edgetracing_accel_0_m_axi_gmem4_RRESP;
  wire edgetracing_accel_0_m_axi_gmem4_RVALID;
  wire [63:0]edgetracing_accel_0_m_axi_gmem4_WDATA;
  wire edgetracing_accel_0_m_axi_gmem4_WLAST;
  wire edgetracing_accel_0_m_axi_gmem4_WREADY;
  wire [7:0]edgetracing_accel_0_m_axi_gmem4_WSTRB;
  wire edgetracing_accel_0_m_axi_gmem4_WVALID;
  wire ov5640_capture_data_0_cam_pwdn;
  wire ov5640_capture_data_0_cam_rst_n;
  wire ov5640_capture_data_0_cmos_frame_ce;
  wire ov5640_capture_data_0_cmos_frame_clk;
  wire ov5640_capture_data_0_cmos_rgb_ACTIVE_VIDEO;
  wire [23:0]ov5640_capture_data_0_cmos_rgb_DATA;
  wire ov5640_capture_data_0_cmos_rgb_VSYNC;
  wire ov5640_capture_data_1_cam_pwdn;
  wire ov5640_capture_data_1_cam_rst_n;
  wire ov5640_capture_data_1_cmos_frame_ce;
  wire ov5640_capture_data_1_cmos_frame_clk;
  wire ov5640_capture_data_1_cmos_rgb_ACTIVE_VIDEO;
  wire [23:0]ov5640_capture_data_1_cmos_rgb_DATA;
  wire ov5640_capture_data_1_cmos_rgb_VSYNC;
  wire ov5640_capture_data_2_cam_pwdn;
  wire ov5640_capture_data_2_cam_rst_n;
  wire ov5640_capture_data_2_cmos_frame_ce;
  wire ov5640_capture_data_2_cmos_frame_clk;
  wire ov5640_capture_data_2_cmos_rgb_ACTIVE_VIDEO;
  wire [23:0]ov5640_capture_data_2_cmos_rgb_DATA;
  wire ov5640_capture_data_2_cmos_rgb_VSYNC;
  wire [39:0]ps8_0_axi_periph_M00_AXI_ARADDR;
  wire ps8_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]ps8_0_axi_periph_M00_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M00_AXI_AWADDR;
  wire ps8_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]ps8_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]ps8_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M00_AXI_BRESP;
  wire ps8_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]ps8_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M00_AXI_RRESP;
  wire ps8_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M00_AXI_WDATA;
  wire ps8_0_axi_periph_M00_AXI_WREADY;
  wire [0:0]ps8_0_axi_periph_M00_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M01_AXI_ARADDR;
  wire ps8_0_axi_periph_M01_AXI_ARREADY;
  wire [0:0]ps8_0_axi_periph_M01_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M01_AXI_AWADDR;
  wire ps8_0_axi_periph_M01_AXI_AWREADY;
  wire [0:0]ps8_0_axi_periph_M01_AXI_AWVALID;
  wire [0:0]ps8_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M01_AXI_BRESP;
  wire ps8_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M01_AXI_RDATA;
  wire [0:0]ps8_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M01_AXI_RRESP;
  wire ps8_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M01_AXI_WDATA;
  wire ps8_0_axi_periph_M01_AXI_WREADY;
  wire [0:0]ps8_0_axi_periph_M01_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M02_AXI_ARADDR;
  wire ps8_0_axi_periph_M02_AXI_ARREADY;
  wire [0:0]ps8_0_axi_periph_M02_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M02_AXI_AWADDR;
  wire ps8_0_axi_periph_M02_AXI_AWREADY;
  wire [0:0]ps8_0_axi_periph_M02_AXI_AWVALID;
  wire [0:0]ps8_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M02_AXI_BRESP;
  wire ps8_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M02_AXI_RDATA;
  wire [0:0]ps8_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M02_AXI_RRESP;
  wire ps8_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M02_AXI_WDATA;
  wire ps8_0_axi_periph_M02_AXI_WREADY;
  wire [0:0]ps8_0_axi_periph_M02_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M03_AXI_ARADDR;
  wire ps8_0_axi_periph_M03_AXI_ARREADY;
  wire ps8_0_axi_periph_M03_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M03_AXI_AWADDR;
  wire ps8_0_axi_periph_M03_AXI_AWREADY;
  wire ps8_0_axi_periph_M03_AXI_AWVALID;
  wire ps8_0_axi_periph_M03_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M03_AXI_BRESP;
  wire ps8_0_axi_periph_M03_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M03_AXI_RDATA;
  wire ps8_0_axi_periph_M03_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M03_AXI_RRESP;
  wire ps8_0_axi_periph_M03_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M03_AXI_WDATA;
  wire ps8_0_axi_periph_M03_AXI_WREADY;
  wire [3:0]ps8_0_axi_periph_M03_AXI_WSTRB;
  wire ps8_0_axi_periph_M03_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M04_AXI_ARADDR;
  wire ps8_0_axi_periph_M04_AXI_ARREADY;
  wire ps8_0_axi_periph_M04_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M04_AXI_AWADDR;
  wire ps8_0_axi_periph_M04_AXI_AWREADY;
  wire ps8_0_axi_periph_M04_AXI_AWVALID;
  wire ps8_0_axi_periph_M04_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M04_AXI_BRESP;
  wire ps8_0_axi_periph_M04_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M04_AXI_RDATA;
  wire ps8_0_axi_periph_M04_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M04_AXI_RRESP;
  wire ps8_0_axi_periph_M04_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M04_AXI_WDATA;
  wire ps8_0_axi_periph_M04_AXI_WREADY;
  wire [3:0]ps8_0_axi_periph_M04_AXI_WSTRB;
  wire ps8_0_axi_periph_M04_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M05_AXI_ARADDR;
  wire [2:0]ps8_0_axi_periph_M05_AXI_ARPROT;
  wire ps8_0_axi_periph_M05_AXI_ARREADY;
  wire ps8_0_axi_periph_M05_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M05_AXI_AWADDR;
  wire [2:0]ps8_0_axi_periph_M05_AXI_AWPROT;
  wire ps8_0_axi_periph_M05_AXI_AWREADY;
  wire ps8_0_axi_periph_M05_AXI_AWVALID;
  wire ps8_0_axi_periph_M05_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M05_AXI_BRESP;
  wire ps8_0_axi_periph_M05_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M05_AXI_RDATA;
  wire ps8_0_axi_periph_M05_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M05_AXI_RRESP;
  wire ps8_0_axi_periph_M05_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M05_AXI_WDATA;
  wire ps8_0_axi_periph_M05_AXI_WREADY;
  wire [3:0]ps8_0_axi_periph_M05_AXI_WSTRB;
  wire ps8_0_axi_periph_M05_AXI_WVALID;
  wire [0:0]rst_ps8_0_149M_peripheral_aresetn;
  wire [0:0]rst_ps8_0_99M_peripheral_aresetn1;
  wire [0:0]rst_ps8_0_99M_peripheral_reset;
  wire [23:0]v_vid_in_axi4s_0_video_out_TDATA;
  wire v_vid_in_axi4s_0_video_out_TLAST;
  wire v_vid_in_axi4s_0_video_out_TREADY;
  wire v_vid_in_axi4s_0_video_out_TUSER;
  wire v_vid_in_axi4s_0_video_out_TVALID;
  wire [23:0]v_vid_in_axi4s_1_video_out_TDATA;
  wire v_vid_in_axi4s_1_video_out_TLAST;
  wire v_vid_in_axi4s_1_video_out_TREADY;
  wire v_vid_in_axi4s_1_video_out_TUSER;
  wire v_vid_in_axi4s_1_video_out_TVALID;
  wire [23:0]v_vid_in_axi4s_2_video_out_TDATA;
  wire v_vid_in_axi4s_2_video_out_TLAST;
  wire v_vid_in_axi4s_2_video_out_TREADY;
  wire v_vid_in_axi4s_2_video_out_TUSER;
  wire v_vid_in_axi4s_2_video_out_TVALID;
  wire video_image_process_0_pos_image_ACTIVE_VIDEO;
  wire [23:0]video_image_process_0_pos_image_DATA;
  wire video_image_process_0_pos_image_VSYNC;
  wire video_image_process_0_pos_image_clken;
  wire video_image_process_1_pos_image_ACTIVE_VIDEO;
  wire [23:0]video_image_process_1_pos_image_DATA;
  wire video_image_process_1_pos_image_VSYNC;
  wire video_image_process_1_pos_image_clken;
  wire video_image_process_2_pos_image_ACTIVE_VIDEO;
  wire [23:0]video_image_process_2_pos_image_DATA;
  wire video_image_process_2_pos_image_VSYNC;
  wire video_image_process_2_pos_image_clken;
  wire [5:0]zynq_ultra_ps_e_0_GPIO_0_TRI_I;
  wire [5:0]zynq_ultra_ps_e_0_GPIO_0_TRI_O;
  wire [5:0]zynq_ultra_ps_e_0_GPIO_0_TRI_T;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID;
  wire [31:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID;
  wire [31:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID;
  wire zynq_ultra_ps_e_0_pl_clk0;
  wire zynq_ultra_ps_e_0_pl_resetn0;

  assign cam_data_0_1 = cam_data_0[7:0];
  assign cam_data_1_1 = cam_data_1[7:0];
  assign cam_data_2_1 = cam_data_2[7:0];
  assign cam_href_0_1 = cam_href_0;
  assign cam_href_1_1 = cam_href_1;
  assign cam_href_2_1 = cam_href_2;
  assign cam_pclk_0_1 = cam_pclk_0;
  assign cam_pclk_1_1 = cam_pclk_1;
  assign cam_pclk_2_1 = cam_pclk_2;
  assign cam_pwdn_0 = ov5640_capture_data_0_cam_pwdn;
  assign cam_pwdn_1 = ov5640_capture_data_1_cam_pwdn;
  assign cam_pwdn_2 = ov5640_capture_data_2_cam_pwdn;
  assign cam_rst_n_0 = ov5640_capture_data_0_cam_rst_n;
  assign cam_rst_n_1 = ov5640_capture_data_1_cam_rst_n;
  assign cam_rst_n_2 = ov5640_capture_data_2_cam_rst_n;
  assign cam_vsync_0_1 = cam_vsync_0;
  assign cam_vsync_1_1 = cam_vsync_1;
  assign cam_vsync_2_1 = cam_vsync_2;
  assign emio_sccb_tri_o[5:0] = zynq_ultra_ps_e_0_GPIO_0_TRI_O;
  assign emio_sccb_tri_t[5:0] = zynq_ultra_ps_e_0_GPIO_0_TRI_T;
  assign zynq_ultra_ps_e_0_GPIO_0_TRI_I = emio_sccb_tri_i[5:0];
  system_axi_smc_9 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_smc_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_smc_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_smc_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_smc_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_smc_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_smc_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_smc_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_smc_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_smc_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_smc_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_smc_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_smc_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_smc_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_smc_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_smc_M00_AXI_RLAST),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_smc_M00_AXI_WLAST),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .S00_AXI_awaddr(axi_vdma_0_M_AXI_S2MM_AWADDR),
        .S00_AXI_awburst(axi_vdma_0_M_AXI_S2MM_AWBURST),
        .S00_AXI_awcache(axi_vdma_0_M_AXI_S2MM_AWCACHE),
        .S00_AXI_awlen(axi_vdma_0_M_AXI_S2MM_AWLEN),
        .S00_AXI_awlock(1'b0),
        .S00_AXI_awprot(axi_vdma_0_M_AXI_S2MM_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(axi_vdma_0_M_AXI_S2MM_AWREADY),
        .S00_AXI_awsize(axi_vdma_0_M_AXI_S2MM_AWSIZE),
        .S00_AXI_awvalid(axi_vdma_0_M_AXI_S2MM_AWVALID),
        .S00_AXI_bready(axi_vdma_0_M_AXI_S2MM_BREADY),
        .S00_AXI_bresp(axi_vdma_0_M_AXI_S2MM_BRESP),
        .S00_AXI_bvalid(axi_vdma_0_M_AXI_S2MM_BVALID),
        .S00_AXI_wdata(axi_vdma_0_M_AXI_S2MM_WDATA),
        .S00_AXI_wlast(axi_vdma_0_M_AXI_S2MM_WLAST),
        .S00_AXI_wready(axi_vdma_0_M_AXI_S2MM_WREADY),
        .S00_AXI_wstrb(axi_vdma_0_M_AXI_S2MM_WSTRB),
        .S00_AXI_wvalid(axi_vdma_0_M_AXI_S2MM_WVALID),
        .S01_AXI_awaddr(axi_vdma_1_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(axi_vdma_1_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(axi_vdma_1_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(axi_vdma_1_M_AXI_S2MM_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(axi_vdma_1_M_AXI_S2MM_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(axi_vdma_1_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(axi_vdma_1_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awvalid(axi_vdma_1_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(axi_vdma_1_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(axi_vdma_1_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(axi_vdma_1_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(axi_vdma_1_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(axi_vdma_1_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(axi_vdma_1_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(axi_vdma_1_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(axi_vdma_1_M_AXI_S2MM_WVALID),
        .S02_AXI_awaddr(axi_vdma_2_M_AXI_S2MM_AWADDR),
        .S02_AXI_awburst(axi_vdma_2_M_AXI_S2MM_AWBURST),
        .S02_AXI_awcache(axi_vdma_2_M_AXI_S2MM_AWCACHE),
        .S02_AXI_awlen(axi_vdma_2_M_AXI_S2MM_AWLEN),
        .S02_AXI_awlock(1'b0),
        .S02_AXI_awprot(axi_vdma_2_M_AXI_S2MM_AWPROT),
        .S02_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awready(axi_vdma_2_M_AXI_S2MM_AWREADY),
        .S02_AXI_awsize(axi_vdma_2_M_AXI_S2MM_AWSIZE),
        .S02_AXI_awvalid(axi_vdma_2_M_AXI_S2MM_AWVALID),
        .S02_AXI_bready(axi_vdma_2_M_AXI_S2MM_BREADY),
        .S02_AXI_bresp(axi_vdma_2_M_AXI_S2MM_BRESP),
        .S02_AXI_bvalid(axi_vdma_2_M_AXI_S2MM_BVALID),
        .S02_AXI_wdata(axi_vdma_2_M_AXI_S2MM_WDATA),
        .S02_AXI_wlast(axi_vdma_2_M_AXI_S2MM_WLAST),
        .S02_AXI_wready(axi_vdma_2_M_AXI_S2MM_WREADY),
        .S02_AXI_wstrb(axi_vdma_2_M_AXI_S2MM_WSTRB),
        .S02_AXI_wvalid(axi_vdma_2_M_AXI_S2MM_WVALID),
        .S03_AXI_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arburst({1'b0,1'b1}),
        .S03_AXI_arcache({1'b0,1'b0,1'b1,1'b1}),
        .S03_AXI_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arlock(1'b0),
        .S03_AXI_arprot({1'b0,1'b0,1'b0}),
        .S03_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arsize({1'b0,1'b1,1'b1}),
        .S03_AXI_arvalid(1'b0),
        .S03_AXI_rready(1'b0),
        .S04_AXI_araddr(canny_accel_0_m_axi_gmem1_ARADDR),
        .S04_AXI_arburst(canny_accel_0_m_axi_gmem1_ARBURST),
        .S04_AXI_arcache(canny_accel_0_m_axi_gmem1_ARCACHE),
        .S04_AXI_arlen(canny_accel_0_m_axi_gmem1_ARLEN),
        .S04_AXI_arlock(canny_accel_0_m_axi_gmem1_ARLOCK[0]),
        .S04_AXI_arprot(canny_accel_0_m_axi_gmem1_ARPROT),
        .S04_AXI_arqos(canny_accel_0_m_axi_gmem1_ARQOS),
        .S04_AXI_arready(canny_accel_0_m_axi_gmem1_ARREADY),
        .S04_AXI_arsize(canny_accel_0_m_axi_gmem1_ARSIZE),
        .S04_AXI_arvalid(canny_accel_0_m_axi_gmem1_ARVALID),
        .S04_AXI_awaddr(canny_accel_0_m_axi_gmem1_AWADDR),
        .S04_AXI_awburst(canny_accel_0_m_axi_gmem1_AWBURST),
        .S04_AXI_awcache(canny_accel_0_m_axi_gmem1_AWCACHE),
        .S04_AXI_awlen(canny_accel_0_m_axi_gmem1_AWLEN),
        .S04_AXI_awlock(canny_accel_0_m_axi_gmem1_AWLOCK[0]),
        .S04_AXI_awprot(canny_accel_0_m_axi_gmem1_AWPROT),
        .S04_AXI_awqos(canny_accel_0_m_axi_gmem1_AWQOS),
        .S04_AXI_awready(canny_accel_0_m_axi_gmem1_AWREADY),
        .S04_AXI_awsize(canny_accel_0_m_axi_gmem1_AWSIZE),
        .S04_AXI_awvalid(canny_accel_0_m_axi_gmem1_AWVALID),
        .S04_AXI_bready(canny_accel_0_m_axi_gmem1_BREADY),
        .S04_AXI_bresp(canny_accel_0_m_axi_gmem1_BRESP),
        .S04_AXI_bvalid(canny_accel_0_m_axi_gmem1_BVALID),
        .S04_AXI_rdata(canny_accel_0_m_axi_gmem1_RDATA),
        .S04_AXI_rlast(canny_accel_0_m_axi_gmem1_RLAST),
        .S04_AXI_rready(canny_accel_0_m_axi_gmem1_RREADY),
        .S04_AXI_rresp(canny_accel_0_m_axi_gmem1_RRESP),
        .S04_AXI_rvalid(canny_accel_0_m_axi_gmem1_RVALID),
        .S04_AXI_wdata(canny_accel_0_m_axi_gmem1_WDATA),
        .S04_AXI_wlast(canny_accel_0_m_axi_gmem1_WLAST),
        .S04_AXI_wready(canny_accel_0_m_axi_gmem1_WREADY),
        .S04_AXI_wstrb(canny_accel_0_m_axi_gmem1_WSTRB),
        .S04_AXI_wvalid(canny_accel_0_m_axi_gmem1_WVALID),
        .S05_AXI_araddr(canny_accel_0_m_axi_gmem2_ARADDR),
        .S05_AXI_arburst(canny_accel_0_m_axi_gmem2_ARBURST),
        .S05_AXI_arcache(canny_accel_0_m_axi_gmem2_ARCACHE),
        .S05_AXI_arlen(canny_accel_0_m_axi_gmem2_ARLEN),
        .S05_AXI_arlock(canny_accel_0_m_axi_gmem2_ARLOCK[0]),
        .S05_AXI_arprot(canny_accel_0_m_axi_gmem2_ARPROT),
        .S05_AXI_arqos(canny_accel_0_m_axi_gmem2_ARQOS),
        .S05_AXI_arready(canny_accel_0_m_axi_gmem2_ARREADY),
        .S05_AXI_arsize(canny_accel_0_m_axi_gmem2_ARSIZE),
        .S05_AXI_arvalid(canny_accel_0_m_axi_gmem2_ARVALID),
        .S05_AXI_awaddr(canny_accel_0_m_axi_gmem2_AWADDR),
        .S05_AXI_awburst(canny_accel_0_m_axi_gmem2_AWBURST),
        .S05_AXI_awcache(canny_accel_0_m_axi_gmem2_AWCACHE),
        .S05_AXI_awlen(canny_accel_0_m_axi_gmem2_AWLEN),
        .S05_AXI_awlock(canny_accel_0_m_axi_gmem2_AWLOCK[0]),
        .S05_AXI_awprot(canny_accel_0_m_axi_gmem2_AWPROT),
        .S05_AXI_awqos(canny_accel_0_m_axi_gmem2_AWQOS),
        .S05_AXI_awready(canny_accel_0_m_axi_gmem2_AWREADY),
        .S05_AXI_awsize(canny_accel_0_m_axi_gmem2_AWSIZE),
        .S05_AXI_awvalid(canny_accel_0_m_axi_gmem2_AWVALID),
        .S05_AXI_bready(canny_accel_0_m_axi_gmem2_BREADY),
        .S05_AXI_bresp(canny_accel_0_m_axi_gmem2_BRESP),
        .S05_AXI_bvalid(canny_accel_0_m_axi_gmem2_BVALID),
        .S05_AXI_rdata(canny_accel_0_m_axi_gmem2_RDATA),
        .S05_AXI_rlast(canny_accel_0_m_axi_gmem2_RLAST),
        .S05_AXI_rready(canny_accel_0_m_axi_gmem2_RREADY),
        .S05_AXI_rresp(canny_accel_0_m_axi_gmem2_RRESP),
        .S05_AXI_rvalid(canny_accel_0_m_axi_gmem2_RVALID),
        .S05_AXI_wdata(canny_accel_0_m_axi_gmem2_WDATA),
        .S05_AXI_wlast(canny_accel_0_m_axi_gmem2_WLAST),
        .S05_AXI_wready(canny_accel_0_m_axi_gmem2_WREADY),
        .S05_AXI_wstrb(canny_accel_0_m_axi_gmem2_WSTRB),
        .S05_AXI_wvalid(canny_accel_0_m_axi_gmem2_WVALID),
        .S06_AXI_araddr(edgetracing_accel_0_m_axi_gmem3_ARADDR),
        .S06_AXI_arburst(edgetracing_accel_0_m_axi_gmem3_ARBURST),
        .S06_AXI_arcache(edgetracing_accel_0_m_axi_gmem3_ARCACHE),
        .S06_AXI_arlen(edgetracing_accel_0_m_axi_gmem3_ARLEN),
        .S06_AXI_arlock(edgetracing_accel_0_m_axi_gmem3_ARLOCK[0]),
        .S06_AXI_arprot(edgetracing_accel_0_m_axi_gmem3_ARPROT),
        .S06_AXI_arqos(edgetracing_accel_0_m_axi_gmem3_ARQOS),
        .S06_AXI_arready(edgetracing_accel_0_m_axi_gmem3_ARREADY),
        .S06_AXI_arsize(edgetracing_accel_0_m_axi_gmem3_ARSIZE),
        .S06_AXI_arvalid(edgetracing_accel_0_m_axi_gmem3_ARVALID),
        .S06_AXI_awaddr(edgetracing_accel_0_m_axi_gmem3_AWADDR),
        .S06_AXI_awburst(edgetracing_accel_0_m_axi_gmem3_AWBURST),
        .S06_AXI_awcache(edgetracing_accel_0_m_axi_gmem3_AWCACHE),
        .S06_AXI_awlen(edgetracing_accel_0_m_axi_gmem3_AWLEN),
        .S06_AXI_awlock(edgetracing_accel_0_m_axi_gmem3_AWLOCK[0]),
        .S06_AXI_awprot(edgetracing_accel_0_m_axi_gmem3_AWPROT),
        .S06_AXI_awqos(edgetracing_accel_0_m_axi_gmem3_AWQOS),
        .S06_AXI_awready(edgetracing_accel_0_m_axi_gmem3_AWREADY),
        .S06_AXI_awsize(edgetracing_accel_0_m_axi_gmem3_AWSIZE),
        .S06_AXI_awvalid(edgetracing_accel_0_m_axi_gmem3_AWVALID),
        .S06_AXI_bready(edgetracing_accel_0_m_axi_gmem3_BREADY),
        .S06_AXI_bresp(edgetracing_accel_0_m_axi_gmem3_BRESP),
        .S06_AXI_bvalid(edgetracing_accel_0_m_axi_gmem3_BVALID),
        .S06_AXI_rdata(edgetracing_accel_0_m_axi_gmem3_RDATA),
        .S06_AXI_rlast(edgetracing_accel_0_m_axi_gmem3_RLAST),
        .S06_AXI_rready(edgetracing_accel_0_m_axi_gmem3_RREADY),
        .S06_AXI_rresp(edgetracing_accel_0_m_axi_gmem3_RRESP),
        .S06_AXI_rvalid(edgetracing_accel_0_m_axi_gmem3_RVALID),
        .S06_AXI_wdata(edgetracing_accel_0_m_axi_gmem3_WDATA),
        .S06_AXI_wlast(edgetracing_accel_0_m_axi_gmem3_WLAST),
        .S06_AXI_wready(edgetracing_accel_0_m_axi_gmem3_WREADY),
        .S06_AXI_wstrb(edgetracing_accel_0_m_axi_gmem3_WSTRB),
        .S06_AXI_wvalid(edgetracing_accel_0_m_axi_gmem3_WVALID),
        .S07_AXI_araddr(edgetracing_accel_0_m_axi_gmem4_ARADDR),
        .S07_AXI_arburst(edgetracing_accel_0_m_axi_gmem4_ARBURST),
        .S07_AXI_arcache(edgetracing_accel_0_m_axi_gmem4_ARCACHE),
        .S07_AXI_arlen(edgetracing_accel_0_m_axi_gmem4_ARLEN),
        .S07_AXI_arlock(edgetracing_accel_0_m_axi_gmem4_ARLOCK[0]),
        .S07_AXI_arprot(edgetracing_accel_0_m_axi_gmem4_ARPROT),
        .S07_AXI_arqos(edgetracing_accel_0_m_axi_gmem4_ARQOS),
        .S07_AXI_arready(edgetracing_accel_0_m_axi_gmem4_ARREADY),
        .S07_AXI_arsize(edgetracing_accel_0_m_axi_gmem4_ARSIZE),
        .S07_AXI_arvalid(edgetracing_accel_0_m_axi_gmem4_ARVALID),
        .S07_AXI_awaddr(edgetracing_accel_0_m_axi_gmem4_AWADDR),
        .S07_AXI_awburst(edgetracing_accel_0_m_axi_gmem4_AWBURST),
        .S07_AXI_awcache(edgetracing_accel_0_m_axi_gmem4_AWCACHE),
        .S07_AXI_awlen(edgetracing_accel_0_m_axi_gmem4_AWLEN),
        .S07_AXI_awlock(edgetracing_accel_0_m_axi_gmem4_AWLOCK[0]),
        .S07_AXI_awprot(edgetracing_accel_0_m_axi_gmem4_AWPROT),
        .S07_AXI_awqos(edgetracing_accel_0_m_axi_gmem4_AWQOS),
        .S07_AXI_awready(edgetracing_accel_0_m_axi_gmem4_AWREADY),
        .S07_AXI_awsize(edgetracing_accel_0_m_axi_gmem4_AWSIZE),
        .S07_AXI_awvalid(edgetracing_accel_0_m_axi_gmem4_AWVALID),
        .S07_AXI_bready(edgetracing_accel_0_m_axi_gmem4_BREADY),
        .S07_AXI_bresp(edgetracing_accel_0_m_axi_gmem4_BRESP),
        .S07_AXI_bvalid(edgetracing_accel_0_m_axi_gmem4_BVALID),
        .S07_AXI_rdata(edgetracing_accel_0_m_axi_gmem4_RDATA),
        .S07_AXI_rlast(edgetracing_accel_0_m_axi_gmem4_RLAST),
        .S07_AXI_rready(edgetracing_accel_0_m_axi_gmem4_RREADY),
        .S07_AXI_rresp(edgetracing_accel_0_m_axi_gmem4_RRESP),
        .S07_AXI_rvalid(edgetracing_accel_0_m_axi_gmem4_RVALID),
        .S07_AXI_wdata(edgetracing_accel_0_m_axi_gmem4_WDATA),
        .S07_AXI_wlast(edgetracing_accel_0_m_axi_gmem4_WLAST),
        .S07_AXI_wready(edgetracing_accel_0_m_axi_gmem4_WREADY),
        .S07_AXI_wstrb(edgetracing_accel_0_m_axi_gmem4_WSTRB),
        .S07_AXI_wvalid(edgetracing_accel_0_m_axi_gmem4_WVALID),
        .aclk(Net),
        .aclk1(zynq_ultra_ps_e_0_pl_clk0),
        .aresetn(rst_ps8_0_149M_peripheral_aresetn));
  system_axi_vdma_0_0 axi_vdma_0
       (.axi_resetn(rst_ps8_0_99M_peripheral_aresetn1),
        .m_axi_s2mm_aclk(Net),
        .m_axi_s2mm_awaddr(axi_vdma_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_vdma_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_vdma_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_vdma_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_vdma_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_vdma_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_vdma_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_vdma_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_vdma_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_vdma_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_vdma_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_vdma_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_vdma_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_vdma_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_vdma_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_vdma_0_M_AXI_S2MM_WVALID),
        .s_axi_lite_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_lite_araddr(ps8_0_axi_periph_M00_AXI_ARADDR[8:0]),
        .s_axi_lite_arready(ps8_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_lite_arvalid(ps8_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_lite_awaddr(ps8_0_axi_periph_M00_AXI_AWADDR[8:0]),
        .s_axi_lite_awready(ps8_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_lite_awvalid(ps8_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_lite_bready(ps8_0_axi_periph_M00_AXI_BREADY),
        .s_axi_lite_bresp(ps8_0_axi_periph_M00_AXI_BRESP),
        .s_axi_lite_bvalid(ps8_0_axi_periph_M00_AXI_BVALID),
        .s_axi_lite_rdata(ps8_0_axi_periph_M00_AXI_RDATA),
        .s_axi_lite_rready(ps8_0_axi_periph_M00_AXI_RREADY),
        .s_axi_lite_rresp(ps8_0_axi_periph_M00_AXI_RRESP),
        .s_axi_lite_rvalid(ps8_0_axi_periph_M00_AXI_RVALID),
        .s_axi_lite_wdata(ps8_0_axi_periph_M00_AXI_WDATA),
        .s_axi_lite_wready(ps8_0_axi_periph_M00_AXI_WREADY),
        .s_axi_lite_wvalid(ps8_0_axi_periph_M00_AXI_WVALID),
        .s_axis_s2mm_aclk(Net),
        .s_axis_s2mm_tdata(v_vid_in_axi4s_0_video_out_TDATA),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(v_vid_in_axi4s_0_video_out_TLAST),
        .s_axis_s2mm_tready(v_vid_in_axi4s_0_video_out_TREADY),
        .s_axis_s2mm_tuser(v_vid_in_axi4s_0_video_out_TUSER),
        .s_axis_s2mm_tvalid(v_vid_in_axi4s_0_video_out_TVALID));
  system_axi_vdma_0_1 axi_vdma_1
       (.axi_resetn(rst_ps8_0_99M_peripheral_aresetn1),
        .m_axi_s2mm_aclk(Net),
        .m_axi_s2mm_awaddr(axi_vdma_1_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_vdma_1_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_vdma_1_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_vdma_1_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_vdma_1_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_vdma_1_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_vdma_1_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_vdma_1_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_vdma_1_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_vdma_1_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_vdma_1_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_vdma_1_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_vdma_1_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_vdma_1_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_vdma_1_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_vdma_1_M_AXI_S2MM_WVALID),
        .s2mm_frame_ptr_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_lite_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_lite_araddr(ps8_0_axi_periph_M01_AXI_ARADDR[8:0]),
        .s_axi_lite_arready(ps8_0_axi_periph_M01_AXI_ARREADY),
        .s_axi_lite_arvalid(ps8_0_axi_periph_M01_AXI_ARVALID),
        .s_axi_lite_awaddr(ps8_0_axi_periph_M01_AXI_AWADDR[8:0]),
        .s_axi_lite_awready(ps8_0_axi_periph_M01_AXI_AWREADY),
        .s_axi_lite_awvalid(ps8_0_axi_periph_M01_AXI_AWVALID),
        .s_axi_lite_bready(ps8_0_axi_periph_M01_AXI_BREADY),
        .s_axi_lite_bresp(ps8_0_axi_periph_M01_AXI_BRESP),
        .s_axi_lite_bvalid(ps8_0_axi_periph_M01_AXI_BVALID),
        .s_axi_lite_rdata(ps8_0_axi_periph_M01_AXI_RDATA),
        .s_axi_lite_rready(ps8_0_axi_periph_M01_AXI_RREADY),
        .s_axi_lite_rresp(ps8_0_axi_periph_M01_AXI_RRESP),
        .s_axi_lite_rvalid(ps8_0_axi_periph_M01_AXI_RVALID),
        .s_axi_lite_wdata(ps8_0_axi_periph_M01_AXI_WDATA),
        .s_axi_lite_wready(ps8_0_axi_periph_M01_AXI_WREADY),
        .s_axi_lite_wvalid(ps8_0_axi_periph_M01_AXI_WVALID),
        .s_axis_s2mm_aclk(Net),
        .s_axis_s2mm_tdata(v_vid_in_axi4s_1_video_out_TDATA),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(v_vid_in_axi4s_1_video_out_TLAST),
        .s_axis_s2mm_tready(v_vid_in_axi4s_1_video_out_TREADY),
        .s_axis_s2mm_tuser(v_vid_in_axi4s_1_video_out_TUSER),
        .s_axis_s2mm_tvalid(v_vid_in_axi4s_1_video_out_TVALID));
  system_axi_vdma_1_2 axi_vdma_2
       (.axi_resetn(rst_ps8_0_99M_peripheral_aresetn1),
        .m_axi_s2mm_aclk(Net),
        .m_axi_s2mm_awaddr(axi_vdma_2_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_vdma_2_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_vdma_2_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_vdma_2_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_vdma_2_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_vdma_2_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_vdma_2_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_vdma_2_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_vdma_2_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_vdma_2_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_vdma_2_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_vdma_2_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_vdma_2_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_vdma_2_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_vdma_2_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_vdma_2_M_AXI_S2MM_WVALID),
        .s2mm_frame_ptr_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_lite_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_lite_araddr(ps8_0_axi_periph_M02_AXI_ARADDR[8:0]),
        .s_axi_lite_arready(ps8_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_lite_arvalid(ps8_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_lite_awaddr(ps8_0_axi_periph_M02_AXI_AWADDR[8:0]),
        .s_axi_lite_awready(ps8_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_lite_awvalid(ps8_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_lite_bready(ps8_0_axi_periph_M02_AXI_BREADY),
        .s_axi_lite_bresp(ps8_0_axi_periph_M02_AXI_BRESP),
        .s_axi_lite_bvalid(ps8_0_axi_periph_M02_AXI_BVALID),
        .s_axi_lite_rdata(ps8_0_axi_periph_M02_AXI_RDATA),
        .s_axi_lite_rready(ps8_0_axi_periph_M02_AXI_RREADY),
        .s_axi_lite_rresp(ps8_0_axi_periph_M02_AXI_RRESP),
        .s_axi_lite_rvalid(ps8_0_axi_periph_M02_AXI_RVALID),
        .s_axi_lite_wdata(ps8_0_axi_periph_M02_AXI_WDATA),
        .s_axi_lite_wready(ps8_0_axi_periph_M02_AXI_WREADY),
        .s_axi_lite_wvalid(ps8_0_axi_periph_M02_AXI_WVALID),
        .s_axis_s2mm_aclk(Net),
        .s_axis_s2mm_tdata(v_vid_in_axi4s_2_video_out_TDATA),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(v_vid_in_axi4s_2_video_out_TLAST),
        .s_axis_s2mm_tready(v_vid_in_axi4s_2_video_out_TREADY),
        .s_axis_s2mm_tuser(v_vid_in_axi4s_2_video_out_TUSER),
        .s_axis_s2mm_tvalid(v_vid_in_axi4s_2_video_out_TVALID));
  system_canny_accel_0_0 canny_accel_0
       (.ap_clk(zynq_ultra_ps_e_0_pl_clk0),
        .ap_rst_n(rst_ps8_0_99M_peripheral_aresetn1),
        .m_axi_gmem1_ARADDR(canny_accel_0_m_axi_gmem1_ARADDR),
        .m_axi_gmem1_ARBURST(canny_accel_0_m_axi_gmem1_ARBURST),
        .m_axi_gmem1_ARCACHE(canny_accel_0_m_axi_gmem1_ARCACHE),
        .m_axi_gmem1_ARLEN(canny_accel_0_m_axi_gmem1_ARLEN),
        .m_axi_gmem1_ARLOCK(canny_accel_0_m_axi_gmem1_ARLOCK),
        .m_axi_gmem1_ARPROT(canny_accel_0_m_axi_gmem1_ARPROT),
        .m_axi_gmem1_ARQOS(canny_accel_0_m_axi_gmem1_ARQOS),
        .m_axi_gmem1_ARREADY(canny_accel_0_m_axi_gmem1_ARREADY),
        .m_axi_gmem1_ARSIZE(canny_accel_0_m_axi_gmem1_ARSIZE),
        .m_axi_gmem1_ARVALID(canny_accel_0_m_axi_gmem1_ARVALID),
        .m_axi_gmem1_AWADDR(canny_accel_0_m_axi_gmem1_AWADDR),
        .m_axi_gmem1_AWBURST(canny_accel_0_m_axi_gmem1_AWBURST),
        .m_axi_gmem1_AWCACHE(canny_accel_0_m_axi_gmem1_AWCACHE),
        .m_axi_gmem1_AWLEN(canny_accel_0_m_axi_gmem1_AWLEN),
        .m_axi_gmem1_AWLOCK(canny_accel_0_m_axi_gmem1_AWLOCK),
        .m_axi_gmem1_AWPROT(canny_accel_0_m_axi_gmem1_AWPROT),
        .m_axi_gmem1_AWQOS(canny_accel_0_m_axi_gmem1_AWQOS),
        .m_axi_gmem1_AWREADY(canny_accel_0_m_axi_gmem1_AWREADY),
        .m_axi_gmem1_AWSIZE(canny_accel_0_m_axi_gmem1_AWSIZE),
        .m_axi_gmem1_AWVALID(canny_accel_0_m_axi_gmem1_AWVALID),
        .m_axi_gmem1_BREADY(canny_accel_0_m_axi_gmem1_BREADY),
        .m_axi_gmem1_BRESP(canny_accel_0_m_axi_gmem1_BRESP),
        .m_axi_gmem1_BVALID(canny_accel_0_m_axi_gmem1_BVALID),
        .m_axi_gmem1_RDATA(canny_accel_0_m_axi_gmem1_RDATA),
        .m_axi_gmem1_RLAST(canny_accel_0_m_axi_gmem1_RLAST),
        .m_axi_gmem1_RREADY(canny_accel_0_m_axi_gmem1_RREADY),
        .m_axi_gmem1_RRESP(canny_accel_0_m_axi_gmem1_RRESP),
        .m_axi_gmem1_RVALID(canny_accel_0_m_axi_gmem1_RVALID),
        .m_axi_gmem1_WDATA(canny_accel_0_m_axi_gmem1_WDATA),
        .m_axi_gmem1_WLAST(canny_accel_0_m_axi_gmem1_WLAST),
        .m_axi_gmem1_WREADY(canny_accel_0_m_axi_gmem1_WREADY),
        .m_axi_gmem1_WSTRB(canny_accel_0_m_axi_gmem1_WSTRB),
        .m_axi_gmem1_WVALID(canny_accel_0_m_axi_gmem1_WVALID),
        .m_axi_gmem2_ARADDR(canny_accel_0_m_axi_gmem2_ARADDR),
        .m_axi_gmem2_ARBURST(canny_accel_0_m_axi_gmem2_ARBURST),
        .m_axi_gmem2_ARCACHE(canny_accel_0_m_axi_gmem2_ARCACHE),
        .m_axi_gmem2_ARLEN(canny_accel_0_m_axi_gmem2_ARLEN),
        .m_axi_gmem2_ARLOCK(canny_accel_0_m_axi_gmem2_ARLOCK),
        .m_axi_gmem2_ARPROT(canny_accel_0_m_axi_gmem2_ARPROT),
        .m_axi_gmem2_ARQOS(canny_accel_0_m_axi_gmem2_ARQOS),
        .m_axi_gmem2_ARREADY(canny_accel_0_m_axi_gmem2_ARREADY),
        .m_axi_gmem2_ARSIZE(canny_accel_0_m_axi_gmem2_ARSIZE),
        .m_axi_gmem2_ARVALID(canny_accel_0_m_axi_gmem2_ARVALID),
        .m_axi_gmem2_AWADDR(canny_accel_0_m_axi_gmem2_AWADDR),
        .m_axi_gmem2_AWBURST(canny_accel_0_m_axi_gmem2_AWBURST),
        .m_axi_gmem2_AWCACHE(canny_accel_0_m_axi_gmem2_AWCACHE),
        .m_axi_gmem2_AWLEN(canny_accel_0_m_axi_gmem2_AWLEN),
        .m_axi_gmem2_AWLOCK(canny_accel_0_m_axi_gmem2_AWLOCK),
        .m_axi_gmem2_AWPROT(canny_accel_0_m_axi_gmem2_AWPROT),
        .m_axi_gmem2_AWQOS(canny_accel_0_m_axi_gmem2_AWQOS),
        .m_axi_gmem2_AWREADY(canny_accel_0_m_axi_gmem2_AWREADY),
        .m_axi_gmem2_AWSIZE(canny_accel_0_m_axi_gmem2_AWSIZE),
        .m_axi_gmem2_AWVALID(canny_accel_0_m_axi_gmem2_AWVALID),
        .m_axi_gmem2_BREADY(canny_accel_0_m_axi_gmem2_BREADY),
        .m_axi_gmem2_BRESP(canny_accel_0_m_axi_gmem2_BRESP),
        .m_axi_gmem2_BVALID(canny_accel_0_m_axi_gmem2_BVALID),
        .m_axi_gmem2_RDATA(canny_accel_0_m_axi_gmem2_RDATA),
        .m_axi_gmem2_RLAST(canny_accel_0_m_axi_gmem2_RLAST),
        .m_axi_gmem2_RREADY(canny_accel_0_m_axi_gmem2_RREADY),
        .m_axi_gmem2_RRESP(canny_accel_0_m_axi_gmem2_RRESP),
        .m_axi_gmem2_RVALID(canny_accel_0_m_axi_gmem2_RVALID),
        .m_axi_gmem2_WDATA(canny_accel_0_m_axi_gmem2_WDATA),
        .m_axi_gmem2_WLAST(canny_accel_0_m_axi_gmem2_WLAST),
        .m_axi_gmem2_WREADY(canny_accel_0_m_axi_gmem2_WREADY),
        .m_axi_gmem2_WSTRB(canny_accel_0_m_axi_gmem2_WSTRB),
        .m_axi_gmem2_WVALID(canny_accel_0_m_axi_gmem2_WVALID),
        .s_axi_control_ARADDR(ps8_0_axi_periph_M03_AXI_ARADDR[6:0]),
        .s_axi_control_ARREADY(ps8_0_axi_periph_M03_AXI_ARREADY),
        .s_axi_control_ARVALID(ps8_0_axi_periph_M03_AXI_ARVALID),
        .s_axi_control_AWADDR(ps8_0_axi_periph_M03_AXI_AWADDR[6:0]),
        .s_axi_control_AWREADY(ps8_0_axi_periph_M03_AXI_AWREADY),
        .s_axi_control_AWVALID(ps8_0_axi_periph_M03_AXI_AWVALID),
        .s_axi_control_BREADY(ps8_0_axi_periph_M03_AXI_BREADY),
        .s_axi_control_BRESP(ps8_0_axi_periph_M03_AXI_BRESP),
        .s_axi_control_BVALID(ps8_0_axi_periph_M03_AXI_BVALID),
        .s_axi_control_RDATA(ps8_0_axi_periph_M03_AXI_RDATA),
        .s_axi_control_RREADY(ps8_0_axi_periph_M03_AXI_RREADY),
        .s_axi_control_RRESP(ps8_0_axi_periph_M03_AXI_RRESP),
        .s_axi_control_RVALID(ps8_0_axi_periph_M03_AXI_RVALID),
        .s_axi_control_WDATA(ps8_0_axi_periph_M03_AXI_WDATA),
        .s_axi_control_WREADY(ps8_0_axi_periph_M03_AXI_WREADY),
        .s_axi_control_WSTRB(ps8_0_axi_periph_M03_AXI_WSTRB),
        .s_axi_control_WVALID(ps8_0_axi_periph_M03_AXI_WVALID));
  system_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(zynq_ultra_ps_e_0_pl_clk0),
        .locked(clk_wiz_0_locked),
        .reset(rst_ps8_0_99M_peripheral_reset));
  system_count_ip_0_1 count_ip_0
       (.s00_axi_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s00_axi_araddr(ps8_0_axi_periph_M05_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(rst_ps8_0_99M_peripheral_aresetn1),
        .s00_axi_arprot(ps8_0_axi_periph_M05_AXI_ARPROT),
        .s00_axi_arready(ps8_0_axi_periph_M05_AXI_ARREADY),
        .s00_axi_arvalid(ps8_0_axi_periph_M05_AXI_ARVALID),
        .s00_axi_awaddr(ps8_0_axi_periph_M05_AXI_AWADDR[3:0]),
        .s00_axi_awprot(ps8_0_axi_periph_M05_AXI_AWPROT),
        .s00_axi_awready(ps8_0_axi_periph_M05_AXI_AWREADY),
        .s00_axi_awvalid(ps8_0_axi_periph_M05_AXI_AWVALID),
        .s00_axi_bready(ps8_0_axi_periph_M05_AXI_BREADY),
        .s00_axi_bresp(ps8_0_axi_periph_M05_AXI_BRESP),
        .s00_axi_bvalid(ps8_0_axi_periph_M05_AXI_BVALID),
        .s00_axi_rdata(ps8_0_axi_periph_M05_AXI_RDATA),
        .s00_axi_rready(ps8_0_axi_periph_M05_AXI_RREADY),
        .s00_axi_rresp(ps8_0_axi_periph_M05_AXI_RRESP),
        .s00_axi_rvalid(ps8_0_axi_periph_M05_AXI_RVALID),
        .s00_axi_wdata(ps8_0_axi_periph_M05_AXI_WDATA),
        .s00_axi_wready(ps8_0_axi_periph_M05_AXI_WREADY),
        .s00_axi_wstrb(ps8_0_axi_periph_M05_AXI_WSTRB),
        .s00_axi_wvalid(ps8_0_axi_periph_M05_AXI_WVALID));
  system_edgetracing_accel_0_0 edgetracing_accel_0
       (.ap_clk(zynq_ultra_ps_e_0_pl_clk0),
        .ap_rst_n(rst_ps8_0_99M_peripheral_aresetn1),
        .m_axi_gmem3_ARADDR(edgetracing_accel_0_m_axi_gmem3_ARADDR),
        .m_axi_gmem3_ARBURST(edgetracing_accel_0_m_axi_gmem3_ARBURST),
        .m_axi_gmem3_ARCACHE(edgetracing_accel_0_m_axi_gmem3_ARCACHE),
        .m_axi_gmem3_ARLEN(edgetracing_accel_0_m_axi_gmem3_ARLEN),
        .m_axi_gmem3_ARLOCK(edgetracing_accel_0_m_axi_gmem3_ARLOCK),
        .m_axi_gmem3_ARPROT(edgetracing_accel_0_m_axi_gmem3_ARPROT),
        .m_axi_gmem3_ARQOS(edgetracing_accel_0_m_axi_gmem3_ARQOS),
        .m_axi_gmem3_ARREADY(edgetracing_accel_0_m_axi_gmem3_ARREADY),
        .m_axi_gmem3_ARSIZE(edgetracing_accel_0_m_axi_gmem3_ARSIZE),
        .m_axi_gmem3_ARVALID(edgetracing_accel_0_m_axi_gmem3_ARVALID),
        .m_axi_gmem3_AWADDR(edgetracing_accel_0_m_axi_gmem3_AWADDR),
        .m_axi_gmem3_AWBURST(edgetracing_accel_0_m_axi_gmem3_AWBURST),
        .m_axi_gmem3_AWCACHE(edgetracing_accel_0_m_axi_gmem3_AWCACHE),
        .m_axi_gmem3_AWLEN(edgetracing_accel_0_m_axi_gmem3_AWLEN),
        .m_axi_gmem3_AWLOCK(edgetracing_accel_0_m_axi_gmem3_AWLOCK),
        .m_axi_gmem3_AWPROT(edgetracing_accel_0_m_axi_gmem3_AWPROT),
        .m_axi_gmem3_AWQOS(edgetracing_accel_0_m_axi_gmem3_AWQOS),
        .m_axi_gmem3_AWREADY(edgetracing_accel_0_m_axi_gmem3_AWREADY),
        .m_axi_gmem3_AWSIZE(edgetracing_accel_0_m_axi_gmem3_AWSIZE),
        .m_axi_gmem3_AWVALID(edgetracing_accel_0_m_axi_gmem3_AWVALID),
        .m_axi_gmem3_BREADY(edgetracing_accel_0_m_axi_gmem3_BREADY),
        .m_axi_gmem3_BRESP(edgetracing_accel_0_m_axi_gmem3_BRESP),
        .m_axi_gmem3_BVALID(edgetracing_accel_0_m_axi_gmem3_BVALID),
        .m_axi_gmem3_RDATA(edgetracing_accel_0_m_axi_gmem3_RDATA),
        .m_axi_gmem3_RLAST(edgetracing_accel_0_m_axi_gmem3_RLAST),
        .m_axi_gmem3_RREADY(edgetracing_accel_0_m_axi_gmem3_RREADY),
        .m_axi_gmem3_RRESP(edgetracing_accel_0_m_axi_gmem3_RRESP),
        .m_axi_gmem3_RVALID(edgetracing_accel_0_m_axi_gmem3_RVALID),
        .m_axi_gmem3_WDATA(edgetracing_accel_0_m_axi_gmem3_WDATA),
        .m_axi_gmem3_WLAST(edgetracing_accel_0_m_axi_gmem3_WLAST),
        .m_axi_gmem3_WREADY(edgetracing_accel_0_m_axi_gmem3_WREADY),
        .m_axi_gmem3_WSTRB(edgetracing_accel_0_m_axi_gmem3_WSTRB),
        .m_axi_gmem3_WVALID(edgetracing_accel_0_m_axi_gmem3_WVALID),
        .m_axi_gmem4_ARADDR(edgetracing_accel_0_m_axi_gmem4_ARADDR),
        .m_axi_gmem4_ARBURST(edgetracing_accel_0_m_axi_gmem4_ARBURST),
        .m_axi_gmem4_ARCACHE(edgetracing_accel_0_m_axi_gmem4_ARCACHE),
        .m_axi_gmem4_ARLEN(edgetracing_accel_0_m_axi_gmem4_ARLEN),
        .m_axi_gmem4_ARLOCK(edgetracing_accel_0_m_axi_gmem4_ARLOCK),
        .m_axi_gmem4_ARPROT(edgetracing_accel_0_m_axi_gmem4_ARPROT),
        .m_axi_gmem4_ARQOS(edgetracing_accel_0_m_axi_gmem4_ARQOS),
        .m_axi_gmem4_ARREADY(edgetracing_accel_0_m_axi_gmem4_ARREADY),
        .m_axi_gmem4_ARSIZE(edgetracing_accel_0_m_axi_gmem4_ARSIZE),
        .m_axi_gmem4_ARVALID(edgetracing_accel_0_m_axi_gmem4_ARVALID),
        .m_axi_gmem4_AWADDR(edgetracing_accel_0_m_axi_gmem4_AWADDR),
        .m_axi_gmem4_AWBURST(edgetracing_accel_0_m_axi_gmem4_AWBURST),
        .m_axi_gmem4_AWCACHE(edgetracing_accel_0_m_axi_gmem4_AWCACHE),
        .m_axi_gmem4_AWLEN(edgetracing_accel_0_m_axi_gmem4_AWLEN),
        .m_axi_gmem4_AWLOCK(edgetracing_accel_0_m_axi_gmem4_AWLOCK),
        .m_axi_gmem4_AWPROT(edgetracing_accel_0_m_axi_gmem4_AWPROT),
        .m_axi_gmem4_AWQOS(edgetracing_accel_0_m_axi_gmem4_AWQOS),
        .m_axi_gmem4_AWREADY(edgetracing_accel_0_m_axi_gmem4_AWREADY),
        .m_axi_gmem4_AWSIZE(edgetracing_accel_0_m_axi_gmem4_AWSIZE),
        .m_axi_gmem4_AWVALID(edgetracing_accel_0_m_axi_gmem4_AWVALID),
        .m_axi_gmem4_BREADY(edgetracing_accel_0_m_axi_gmem4_BREADY),
        .m_axi_gmem4_BRESP(edgetracing_accel_0_m_axi_gmem4_BRESP),
        .m_axi_gmem4_BVALID(edgetracing_accel_0_m_axi_gmem4_BVALID),
        .m_axi_gmem4_RDATA(edgetracing_accel_0_m_axi_gmem4_RDATA),
        .m_axi_gmem4_RLAST(edgetracing_accel_0_m_axi_gmem4_RLAST),
        .m_axi_gmem4_RREADY(edgetracing_accel_0_m_axi_gmem4_RREADY),
        .m_axi_gmem4_RRESP(edgetracing_accel_0_m_axi_gmem4_RRESP),
        .m_axi_gmem4_RVALID(edgetracing_accel_0_m_axi_gmem4_RVALID),
        .m_axi_gmem4_WDATA(edgetracing_accel_0_m_axi_gmem4_WDATA),
        .m_axi_gmem4_WLAST(edgetracing_accel_0_m_axi_gmem4_WLAST),
        .m_axi_gmem4_WREADY(edgetracing_accel_0_m_axi_gmem4_WREADY),
        .m_axi_gmem4_WSTRB(edgetracing_accel_0_m_axi_gmem4_WSTRB),
        .m_axi_gmem4_WVALID(edgetracing_accel_0_m_axi_gmem4_WVALID),
        .s_axi_control_ARADDR(ps8_0_axi_periph_M04_AXI_ARADDR[5:0]),
        .s_axi_control_ARREADY(ps8_0_axi_periph_M04_AXI_ARREADY),
        .s_axi_control_ARVALID(ps8_0_axi_periph_M04_AXI_ARVALID),
        .s_axi_control_AWADDR(ps8_0_axi_periph_M04_AXI_AWADDR[5:0]),
        .s_axi_control_AWREADY(ps8_0_axi_periph_M04_AXI_AWREADY),
        .s_axi_control_AWVALID(ps8_0_axi_periph_M04_AXI_AWVALID),
        .s_axi_control_BREADY(ps8_0_axi_periph_M04_AXI_BREADY),
        .s_axi_control_BRESP(ps8_0_axi_periph_M04_AXI_BRESP),
        .s_axi_control_BVALID(ps8_0_axi_periph_M04_AXI_BVALID),
        .s_axi_control_RDATA(ps8_0_axi_periph_M04_AXI_RDATA),
        .s_axi_control_RREADY(ps8_0_axi_periph_M04_AXI_RREADY),
        .s_axi_control_RRESP(ps8_0_axi_periph_M04_AXI_RRESP),
        .s_axi_control_RVALID(ps8_0_axi_periph_M04_AXI_RVALID),
        .s_axi_control_WDATA(ps8_0_axi_periph_M04_AXI_WDATA),
        .s_axi_control_WREADY(ps8_0_axi_periph_M04_AXI_WREADY),
        .s_axi_control_WSTRB(ps8_0_axi_periph_M04_AXI_WSTRB),
        .s_axi_control_WVALID(ps8_0_axi_periph_M04_AXI_WVALID));
  system_ov5640_capture_data_0_0 ov5640_capture_data_0
       (.cam_data(cam_data_0_1),
        .cam_href(cam_href_0_1),
        .cam_pclk(cam_pclk_0_1),
        .cam_pwdn(ov5640_capture_data_0_cam_pwdn),
        .cam_rst_n(ov5640_capture_data_0_cam_rst_n),
        .cam_vsync(cam_vsync_0_1),
        .cmos_active_video(ov5640_capture_data_0_cmos_rgb_ACTIVE_VIDEO),
        .cmos_frame_ce(ov5640_capture_data_0_cmos_frame_ce),
        .cmos_frame_clk(ov5640_capture_data_0_cmos_frame_clk),
        .cmos_frame_data(ov5640_capture_data_0_cmos_rgb_DATA),
        .cmos_frame_vsync(ov5640_capture_data_0_cmos_rgb_VSYNC),
        .rst_n(clk_wiz_0_locked));
  system_ov5640_capture_data_0_1 ov5640_capture_data_1
       (.cam_data(cam_data_1_1),
        .cam_href(cam_href_1_1),
        .cam_pclk(cam_pclk_1_1),
        .cam_pwdn(ov5640_capture_data_1_cam_pwdn),
        .cam_rst_n(ov5640_capture_data_1_cam_rst_n),
        .cam_vsync(cam_vsync_1_1),
        .cmos_active_video(ov5640_capture_data_1_cmos_rgb_ACTIVE_VIDEO),
        .cmos_frame_ce(ov5640_capture_data_1_cmos_frame_ce),
        .cmos_frame_clk(ov5640_capture_data_1_cmos_frame_clk),
        .cmos_frame_data(ov5640_capture_data_1_cmos_rgb_DATA),
        .cmos_frame_vsync(ov5640_capture_data_1_cmos_rgb_VSYNC),
        .rst_n(clk_wiz_0_locked));
  system_ov5640_capture_data_1_0 ov5640_capture_data_2
       (.cam_data(cam_data_2_1),
        .cam_href(cam_href_2_1),
        .cam_pclk(cam_pclk_2_1),
        .cam_pwdn(ov5640_capture_data_2_cam_pwdn),
        .cam_rst_n(ov5640_capture_data_2_cam_rst_n),
        .cam_vsync(cam_vsync_2_1),
        .cmos_active_video(ov5640_capture_data_2_cmos_rgb_ACTIVE_VIDEO),
        .cmos_frame_ce(ov5640_capture_data_2_cmos_frame_ce),
        .cmos_frame_clk(ov5640_capture_data_2_cmos_frame_clk),
        .cmos_frame_data(ov5640_capture_data_2_cmos_rgb_DATA),
        .cmos_frame_vsync(ov5640_capture_data_2_cmos_rgb_VSYNC),
        .rst_n(clk_wiz_0_locked));
  system_ps8_0_axi_periph_9 ps8_0_axi_periph
       (.ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M00_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M00_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M00_AXI_araddr(ps8_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps8_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps8_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps8_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps8_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps8_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps8_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps8_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps8_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps8_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps8_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps8_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps8_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps8_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps8_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wvalid(ps8_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M01_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M01_AXI_araddr(ps8_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps8_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps8_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps8_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps8_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps8_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps8_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps8_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps8_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps8_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps8_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps8_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps8_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps8_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps8_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(ps8_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M02_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M02_AXI_araddr(ps8_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(ps8_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(ps8_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(ps8_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(ps8_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(ps8_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(ps8_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(ps8_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(ps8_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(ps8_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(ps8_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(ps8_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(ps8_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(ps8_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(ps8_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wvalid(ps8_0_axi_periph_M02_AXI_WVALID),
        .M03_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M03_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M03_AXI_araddr(ps8_0_axi_periph_M03_AXI_ARADDR),
        .M03_AXI_arready(ps8_0_axi_periph_M03_AXI_ARREADY),
        .M03_AXI_arvalid(ps8_0_axi_periph_M03_AXI_ARVALID),
        .M03_AXI_awaddr(ps8_0_axi_periph_M03_AXI_AWADDR),
        .M03_AXI_awready(ps8_0_axi_periph_M03_AXI_AWREADY),
        .M03_AXI_awvalid(ps8_0_axi_periph_M03_AXI_AWVALID),
        .M03_AXI_bready(ps8_0_axi_periph_M03_AXI_BREADY),
        .M03_AXI_bresp(ps8_0_axi_periph_M03_AXI_BRESP),
        .M03_AXI_bvalid(ps8_0_axi_periph_M03_AXI_BVALID),
        .M03_AXI_rdata(ps8_0_axi_periph_M03_AXI_RDATA),
        .M03_AXI_rready(ps8_0_axi_periph_M03_AXI_RREADY),
        .M03_AXI_rresp(ps8_0_axi_periph_M03_AXI_RRESP),
        .M03_AXI_rvalid(ps8_0_axi_periph_M03_AXI_RVALID),
        .M03_AXI_wdata(ps8_0_axi_periph_M03_AXI_WDATA),
        .M03_AXI_wready(ps8_0_axi_periph_M03_AXI_WREADY),
        .M03_AXI_wstrb(ps8_0_axi_periph_M03_AXI_WSTRB),
        .M03_AXI_wvalid(ps8_0_axi_periph_M03_AXI_WVALID),
        .M04_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M04_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M04_AXI_araddr(ps8_0_axi_periph_M04_AXI_ARADDR),
        .M04_AXI_arready(ps8_0_axi_periph_M04_AXI_ARREADY),
        .M04_AXI_arvalid(ps8_0_axi_periph_M04_AXI_ARVALID),
        .M04_AXI_awaddr(ps8_0_axi_periph_M04_AXI_AWADDR),
        .M04_AXI_awready(ps8_0_axi_periph_M04_AXI_AWREADY),
        .M04_AXI_awvalid(ps8_0_axi_periph_M04_AXI_AWVALID),
        .M04_AXI_bready(ps8_0_axi_periph_M04_AXI_BREADY),
        .M04_AXI_bresp(ps8_0_axi_periph_M04_AXI_BRESP),
        .M04_AXI_bvalid(ps8_0_axi_periph_M04_AXI_BVALID),
        .M04_AXI_rdata(ps8_0_axi_periph_M04_AXI_RDATA),
        .M04_AXI_rready(ps8_0_axi_periph_M04_AXI_RREADY),
        .M04_AXI_rresp(ps8_0_axi_periph_M04_AXI_RRESP),
        .M04_AXI_rvalid(ps8_0_axi_periph_M04_AXI_RVALID),
        .M04_AXI_wdata(ps8_0_axi_periph_M04_AXI_WDATA),
        .M04_AXI_wready(ps8_0_axi_periph_M04_AXI_WREADY),
        .M04_AXI_wstrb(ps8_0_axi_periph_M04_AXI_WSTRB),
        .M04_AXI_wvalid(ps8_0_axi_periph_M04_AXI_WVALID),
        .M05_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M05_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .M05_AXI_araddr(ps8_0_axi_periph_M05_AXI_ARADDR),
        .M05_AXI_arprot(ps8_0_axi_periph_M05_AXI_ARPROT),
        .M05_AXI_arready(ps8_0_axi_periph_M05_AXI_ARREADY),
        .M05_AXI_arvalid(ps8_0_axi_periph_M05_AXI_ARVALID),
        .M05_AXI_awaddr(ps8_0_axi_periph_M05_AXI_AWADDR),
        .M05_AXI_awprot(ps8_0_axi_periph_M05_AXI_AWPROT),
        .M05_AXI_awready(ps8_0_axi_periph_M05_AXI_AWREADY),
        .M05_AXI_awvalid(ps8_0_axi_periph_M05_AXI_AWVALID),
        .M05_AXI_bready(ps8_0_axi_periph_M05_AXI_BREADY),
        .M05_AXI_bresp(ps8_0_axi_periph_M05_AXI_BRESP),
        .M05_AXI_bvalid(ps8_0_axi_periph_M05_AXI_BVALID),
        .M05_AXI_rdata(ps8_0_axi_periph_M05_AXI_RDATA),
        .M05_AXI_rready(ps8_0_axi_periph_M05_AXI_RREADY),
        .M05_AXI_rresp(ps8_0_axi_periph_M05_AXI_RRESP),
        .M05_AXI_rvalid(ps8_0_axi_periph_M05_AXI_RVALID),
        .M05_AXI_wdata(ps8_0_axi_periph_M05_AXI_WDATA),
        .M05_AXI_wready(ps8_0_axi_periph_M05_AXI_WREADY),
        .M05_AXI_wstrb(ps8_0_axi_periph_M05_AXI_WSTRB),
        .M05_AXI_wvalid(ps8_0_axi_periph_M05_AXI_WVALID),
        .S00_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .S00_ARESETN(rst_ps8_0_99M_peripheral_aresetn1),
        .S00_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR),
        .S00_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST),
        .S00_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE),
        .S00_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID),
        .S00_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN),
        .S00_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK),
        .S00_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT),
        .S00_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS),
        .S00_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY),
        .S00_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE),
        .S00_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID),
        .S00_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR),
        .S00_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST),
        .S00_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE),
        .S00_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID),
        .S00_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN),
        .S00_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK),
        .S00_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT),
        .S00_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS),
        .S00_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY),
        .S00_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE),
        .S00_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID),
        .S00_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID),
        .S00_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY),
        .S00_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP),
        .S00_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID),
        .S00_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA),
        .S00_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID),
        .S00_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST),
        .S00_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY),
        .S00_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP),
        .S00_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID),
        .S00_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA),
        .S00_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST),
        .S00_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY),
        .S00_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB),
        .S00_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID));
  system_rst_ps8_0_149M_0 rst_ps8_0_149M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps8_0_149M_peripheral_aresetn),
        .slowest_sync_clk(Net));
  system_rst_ps8_0_99M_0 rst_ps8_0_99M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps8_0_99M_peripheral_aresetn1),
        .peripheral_reset(rst_ps8_0_99M_peripheral_reset),
        .slowest_sync_clk(zynq_ultra_ps_e_0_pl_clk0));
  system_v_vid_in_axi4s_0_0 v_vid_in_axi4s_0
       (.aclk(Net),
        .aclken(1'b1),
        .aresetn(1'b1),
        .axis_enable(1'b1),
        .m_axis_video_tdata(v_vid_in_axi4s_0_video_out_TDATA),
        .m_axis_video_tlast(v_vid_in_axi4s_0_video_out_TLAST),
        .m_axis_video_tready(v_vid_in_axi4s_0_video_out_TREADY),
        .m_axis_video_tuser(v_vid_in_axi4s_0_video_out_TUSER),
        .m_axis_video_tvalid(v_vid_in_axi4s_0_video_out_TVALID),
        .vid_active_video(video_image_process_0_pos_image_ACTIVE_VIDEO),
        .vid_data(video_image_process_0_pos_image_DATA),
        .vid_field_id(1'b0),
        .vid_hblank(1'b0),
        .vid_hsync(1'b0),
        .vid_io_in_ce(video_image_process_0_pos_image_clken),
        .vid_io_in_clk(ov5640_capture_data_0_cmos_frame_clk),
        .vid_io_in_reset(1'b0),
        .vid_vblank(1'b0),
        .vid_vsync(video_image_process_0_pos_image_VSYNC));
  system_v_vid_in_axi4s_0_2 v_vid_in_axi4s_1
       (.aclk(Net),
        .aclken(1'b1),
        .aresetn(1'b1),
        .axis_enable(1'b1),
        .m_axis_video_tdata(v_vid_in_axi4s_1_video_out_TDATA),
        .m_axis_video_tlast(v_vid_in_axi4s_1_video_out_TLAST),
        .m_axis_video_tready(v_vid_in_axi4s_1_video_out_TREADY),
        .m_axis_video_tuser(v_vid_in_axi4s_1_video_out_TUSER),
        .m_axis_video_tvalid(v_vid_in_axi4s_1_video_out_TVALID),
        .vid_active_video(video_image_process_1_pos_image_ACTIVE_VIDEO),
        .vid_data(video_image_process_1_pos_image_DATA),
        .vid_field_id(1'b0),
        .vid_hblank(1'b0),
        .vid_hsync(1'b0),
        .vid_io_in_ce(video_image_process_1_pos_image_clken),
        .vid_io_in_clk(ov5640_capture_data_1_cmos_frame_clk),
        .vid_io_in_reset(1'b0),
        .vid_vblank(1'b0),
        .vid_vsync(video_image_process_1_pos_image_VSYNC));
  system_v_vid_in_axi4s_1_0 v_vid_in_axi4s_2
       (.aclk(Net),
        .aclken(1'b1),
        .aresetn(1'b1),
        .axis_enable(1'b1),
        .m_axis_video_tdata(v_vid_in_axi4s_2_video_out_TDATA),
        .m_axis_video_tlast(v_vid_in_axi4s_2_video_out_TLAST),
        .m_axis_video_tready(v_vid_in_axi4s_2_video_out_TREADY),
        .m_axis_video_tuser(v_vid_in_axi4s_2_video_out_TUSER),
        .m_axis_video_tvalid(v_vid_in_axi4s_2_video_out_TVALID),
        .vid_active_video(video_image_process_2_pos_image_ACTIVE_VIDEO),
        .vid_data(video_image_process_2_pos_image_DATA),
        .vid_field_id(1'b0),
        .vid_hblank(1'b0),
        .vid_hsync(1'b0),
        .vid_io_in_ce(video_image_process_2_pos_image_clken),
        .vid_io_in_clk(ov5640_capture_data_2_cmos_frame_clk),
        .vid_io_in_reset(1'b0),
        .vid_vblank(1'b0),
        .vid_vsync(video_image_process_2_pos_image_VSYNC));
  system_video_image_process_0_0 video_image_process_0
       (.clk(ov5640_capture_data_0_cmos_frame_clk),
        .pos_data_valid(video_image_process_0_pos_image_ACTIVE_VIDEO),
        .pos_image_clken(video_image_process_0_pos_image_clken),
        .pos_image_data(video_image_process_0_pos_image_DATA),
        .pos_image_vsync(video_image_process_0_pos_image_VSYNC),
        .pre_data_valid(ov5640_capture_data_0_cmos_rgb_ACTIVE_VIDEO),
        .pre_image_clken(ov5640_capture_data_0_cmos_frame_ce),
        .pre_image_data(ov5640_capture_data_0_cmos_rgb_DATA),
        .pre_image_vsync(ov5640_capture_data_0_cmos_rgb_VSYNC),
        .rst_n(clk_wiz_0_locked));
  system_video_image_process_0_1 video_image_process_1
       (.clk(ov5640_capture_data_1_cmos_frame_clk),
        .pos_data_valid(video_image_process_1_pos_image_ACTIVE_VIDEO),
        .pos_image_clken(video_image_process_1_pos_image_clken),
        .pos_image_data(video_image_process_1_pos_image_DATA),
        .pos_image_vsync(video_image_process_1_pos_image_VSYNC),
        .pre_data_valid(ov5640_capture_data_1_cmos_rgb_ACTIVE_VIDEO),
        .pre_image_clken(ov5640_capture_data_1_cmos_frame_ce),
        .pre_image_data(ov5640_capture_data_1_cmos_rgb_DATA),
        .pre_image_vsync(ov5640_capture_data_1_cmos_rgb_VSYNC),
        .rst_n(clk_wiz_0_locked));
  system_video_image_process_1_0 video_image_process_2
       (.clk(ov5640_capture_data_2_cmos_frame_clk),
        .pos_data_valid(video_image_process_2_pos_image_ACTIVE_VIDEO),
        .pos_image_clken(video_image_process_2_pos_image_clken),
        .pos_image_data(video_image_process_2_pos_image_DATA),
        .pos_image_vsync(video_image_process_2_pos_image_VSYNC),
        .pre_data_valid(ov5640_capture_data_2_cmos_rgb_ACTIVE_VIDEO),
        .pre_image_clken(ov5640_capture_data_2_cmos_frame_ce),
        .pre_image_data(ov5640_capture_data_2_cmos_rgb_DATA),
        .pre_image_vsync(ov5640_capture_data_2_cmos_rgb_VSYNC),
        .rst_n(clk_wiz_0_locked));
  system_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.emio_gpio_i(zynq_ultra_ps_e_0_GPIO_0_TRI_I),
        .emio_gpio_o(zynq_ultra_ps_e_0_GPIO_0_TRI_O),
        .emio_gpio_t(zynq_ultra_ps_e_0_GPIO_0_TRI_T),
        .maxigp2_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR),
        .maxigp2_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST),
        .maxigp2_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE),
        .maxigp2_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID),
        .maxigp2_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN),
        .maxigp2_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK),
        .maxigp2_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT),
        .maxigp2_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS),
        .maxigp2_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY),
        .maxigp2_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE),
        .maxigp2_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID),
        .maxigp2_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR),
        .maxigp2_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST),
        .maxigp2_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE),
        .maxigp2_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID),
        .maxigp2_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN),
        .maxigp2_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK),
        .maxigp2_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT),
        .maxigp2_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS),
        .maxigp2_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY),
        .maxigp2_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE),
        .maxigp2_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID),
        .maxigp2_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID),
        .maxigp2_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY),
        .maxigp2_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP),
        .maxigp2_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID),
        .maxigp2_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA),
        .maxigp2_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID),
        .maxigp2_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST),
        .maxigp2_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY),
        .maxigp2_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP),
        .maxigp2_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID),
        .maxigp2_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA),
        .maxigp2_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST),
        .maxigp2_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY),
        .maxigp2_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB),
        .maxigp2_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID),
        .maxihpm0_lpd_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .pl_clk0(zynq_ultra_ps_e_0_pl_clk0),
        .pl_clk1(Net),
        .pl_resetn0(zynq_ultra_ps_e_0_pl_resetn0),
        .saxigp2_araddr(axi_smc_M00_AXI_ARADDR),
        .saxigp2_arburst(axi_smc_M00_AXI_ARBURST),
        .saxigp2_arcache(axi_smc_M00_AXI_ARCACHE),
        .saxigp2_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_arlen(axi_smc_M00_AXI_ARLEN),
        .saxigp2_arlock(axi_smc_M00_AXI_ARLOCK),
        .saxigp2_arprot(axi_smc_M00_AXI_ARPROT),
        .saxigp2_arqos(axi_smc_M00_AXI_ARQOS),
        .saxigp2_arready(axi_smc_M00_AXI_ARREADY),
        .saxigp2_arsize(axi_smc_M00_AXI_ARSIZE),
        .saxigp2_aruser(1'b0),
        .saxigp2_arvalid(axi_smc_M00_AXI_ARVALID),
        .saxigp2_awaddr(axi_smc_M00_AXI_AWADDR),
        .saxigp2_awburst(axi_smc_M00_AXI_AWBURST),
        .saxigp2_awcache(axi_smc_M00_AXI_AWCACHE),
        .saxigp2_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_awlen(axi_smc_M00_AXI_AWLEN),
        .saxigp2_awlock(axi_smc_M00_AXI_AWLOCK),
        .saxigp2_awprot(axi_smc_M00_AXI_AWPROT),
        .saxigp2_awqos(axi_smc_M00_AXI_AWQOS),
        .saxigp2_awready(axi_smc_M00_AXI_AWREADY),
        .saxigp2_awsize(axi_smc_M00_AXI_AWSIZE),
        .saxigp2_awuser(1'b0),
        .saxigp2_awvalid(axi_smc_M00_AXI_AWVALID),
        .saxigp2_bready(axi_smc_M00_AXI_BREADY),
        .saxigp2_bresp(axi_smc_M00_AXI_BRESP),
        .saxigp2_bvalid(axi_smc_M00_AXI_BVALID),
        .saxigp2_rdata(axi_smc_M00_AXI_RDATA),
        .saxigp2_rlast(axi_smc_M00_AXI_RLAST),
        .saxigp2_rready(axi_smc_M00_AXI_RREADY),
        .saxigp2_rresp(axi_smc_M00_AXI_RRESP),
        .saxigp2_rvalid(axi_smc_M00_AXI_RVALID),
        .saxigp2_wdata(axi_smc_M00_AXI_WDATA),
        .saxigp2_wlast(axi_smc_M00_AXI_WLAST),
        .saxigp2_wready(axi_smc_M00_AXI_WREADY),
        .saxigp2_wstrb(axi_smc_M00_AXI_WSTRB),
        .saxigp2_wvalid(axi_smc_M00_AXI_WVALID),
        .saxihp0_fpd_aclk(Net));
endmodule

module system_ps8_0_axi_periph_9
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arprot,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awprot,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [39:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [39:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [39:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [39:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [39:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [39:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [0:0]M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [39:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [39:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [39:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [39:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [39:0]M05_AXI_araddr;
  output [2:0]M05_AXI_arprot;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [39:0]M05_AXI_awaddr;
  output [2:0]M05_AXI_awprot;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [39:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [15:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [39:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [15:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [15:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [15:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire [39:0]m00_couplers_to_ps8_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m00_couplers_to_ps8_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_ps8_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_ps8_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_ps8_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_ps8_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_WREADY;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m01_couplers_to_ps8_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m01_couplers_to_ps8_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_ps8_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_ps8_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_ps8_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_ps8_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_WREADY;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m02_couplers_to_ps8_0_axi_periph_ARADDR;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_ARREADY;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m02_couplers_to_ps8_0_axi_periph_AWADDR;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_AWREADY;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_AWVALID;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_ps8_0_axi_periph_BRESP;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_ps8_0_axi_periph_RDATA;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_ps8_0_axi_periph_RRESP;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_ps8_0_axi_periph_WDATA;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_WREADY;
  wire [0:0]m02_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m03_couplers_to_ps8_0_axi_periph_ARADDR;
  wire m03_couplers_to_ps8_0_axi_periph_ARREADY;
  wire m03_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m03_couplers_to_ps8_0_axi_periph_AWADDR;
  wire m03_couplers_to_ps8_0_axi_periph_AWREADY;
  wire m03_couplers_to_ps8_0_axi_periph_AWVALID;
  wire m03_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m03_couplers_to_ps8_0_axi_periph_BRESP;
  wire m03_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m03_couplers_to_ps8_0_axi_periph_RDATA;
  wire m03_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m03_couplers_to_ps8_0_axi_periph_RRESP;
  wire m03_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m03_couplers_to_ps8_0_axi_periph_WDATA;
  wire m03_couplers_to_ps8_0_axi_periph_WREADY;
  wire [3:0]m03_couplers_to_ps8_0_axi_periph_WSTRB;
  wire m03_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m04_couplers_to_ps8_0_axi_periph_ARADDR;
  wire m04_couplers_to_ps8_0_axi_periph_ARREADY;
  wire m04_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m04_couplers_to_ps8_0_axi_periph_AWADDR;
  wire m04_couplers_to_ps8_0_axi_periph_AWREADY;
  wire m04_couplers_to_ps8_0_axi_periph_AWVALID;
  wire m04_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m04_couplers_to_ps8_0_axi_periph_BRESP;
  wire m04_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m04_couplers_to_ps8_0_axi_periph_RDATA;
  wire m04_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m04_couplers_to_ps8_0_axi_periph_RRESP;
  wire m04_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m04_couplers_to_ps8_0_axi_periph_WDATA;
  wire m04_couplers_to_ps8_0_axi_periph_WREADY;
  wire [3:0]m04_couplers_to_ps8_0_axi_periph_WSTRB;
  wire m04_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m05_couplers_to_ps8_0_axi_periph_ARADDR;
  wire [2:0]m05_couplers_to_ps8_0_axi_periph_ARPROT;
  wire m05_couplers_to_ps8_0_axi_periph_ARREADY;
  wire m05_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m05_couplers_to_ps8_0_axi_periph_AWADDR;
  wire [2:0]m05_couplers_to_ps8_0_axi_periph_AWPROT;
  wire m05_couplers_to_ps8_0_axi_periph_AWREADY;
  wire m05_couplers_to_ps8_0_axi_periph_AWVALID;
  wire m05_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m05_couplers_to_ps8_0_axi_periph_BRESP;
  wire m05_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m05_couplers_to_ps8_0_axi_periph_RDATA;
  wire m05_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m05_couplers_to_ps8_0_axi_periph_RRESP;
  wire m05_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m05_couplers_to_ps8_0_axi_periph_WDATA;
  wire m05_couplers_to_ps8_0_axi_periph_WREADY;
  wire [3:0]m05_couplers_to_ps8_0_axi_periph_WSTRB;
  wire m05_couplers_to_ps8_0_axi_periph_WVALID;
  wire ps8_0_axi_periph_ACLK_net;
  wire ps8_0_axi_periph_ARESETN_net;
  wire [39:0]ps8_0_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_ARCACHE;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_ARID;
  wire [7:0]ps8_0_axi_periph_to_s00_couplers_ARLEN;
  wire [0:0]ps8_0_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_ARQOS;
  wire ps8_0_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_ARSIZE;
  wire ps8_0_axi_periph_to_s00_couplers_ARVALID;
  wire [39:0]ps8_0_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_AWCACHE;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_AWID;
  wire [7:0]ps8_0_axi_periph_to_s00_couplers_AWLEN;
  wire [0:0]ps8_0_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_AWQOS;
  wire ps8_0_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_AWSIZE;
  wire ps8_0_axi_periph_to_s00_couplers_AWVALID;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_BID;
  wire ps8_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_BRESP;
  wire ps8_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]ps8_0_axi_periph_to_s00_couplers_RDATA;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_RID;
  wire ps8_0_axi_periph_to_s00_couplers_RLAST;
  wire ps8_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_RRESP;
  wire ps8_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]ps8_0_axi_periph_to_s00_couplers_WDATA;
  wire ps8_0_axi_periph_to_s00_couplers_WLAST;
  wire ps8_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_WSTRB;
  wire ps8_0_axi_periph_to_s00_couplers_WVALID;
  wire [39:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [39:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [39:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [39:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [79:40]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [79:40]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [119:80]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [119:80]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [159:120]xbar_to_m03_couplers_ARADDR;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [159:120]xbar_to_m03_couplers_AWADDR;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [199:160]xbar_to_m04_couplers_ARADDR;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [199:160]xbar_to_m04_couplers_AWADDR;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [239:200]xbar_to_m05_couplers_ARADDR;
  wire [17:15]xbar_to_m05_couplers_ARPROT;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [239:200]xbar_to_m05_couplers_AWADDR;
  wire [17:15]xbar_to_m05_couplers_AWPROT;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [17:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [17:0]NLW_xbar_m_axi_awprot_UNCONNECTED;
  wire [23:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_AXI_araddr[39:0] = m00_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[39:0] = m00_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_ps8_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_ps8_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_ps8_0_axi_periph_WDATA;
  assign M00_AXI_wvalid[0] = m00_couplers_to_ps8_0_axi_periph_WVALID;
  assign M01_AXI_araddr[39:0] = m01_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[39:0] = m01_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_ps8_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_ps8_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_ps8_0_axi_periph_WDATA;
  assign M01_AXI_wvalid[0] = m01_couplers_to_ps8_0_axi_periph_WVALID;
  assign M02_AXI_araddr[39:0] = m02_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[39:0] = m02_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_ps8_0_axi_periph_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_ps8_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_ps8_0_axi_periph_WDATA;
  assign M02_AXI_wvalid[0] = m02_couplers_to_ps8_0_axi_periph_WVALID;
  assign M03_AXI_araddr[39:0] = m03_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M03_AXI_arvalid = m03_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M03_AXI_awaddr[39:0] = m03_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M03_AXI_awvalid = m03_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_ps8_0_axi_periph_BREADY;
  assign M03_AXI_rready = m03_couplers_to_ps8_0_axi_periph_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_ps8_0_axi_periph_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_ps8_0_axi_periph_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_ps8_0_axi_periph_WVALID;
  assign M04_AXI_araddr[39:0] = m04_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M04_AXI_arvalid = m04_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M04_AXI_awaddr[39:0] = m04_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M04_AXI_awvalid = m04_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_ps8_0_axi_periph_BREADY;
  assign M04_AXI_rready = m04_couplers_to_ps8_0_axi_periph_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_ps8_0_axi_periph_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_ps8_0_axi_periph_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_ps8_0_axi_periph_WVALID;
  assign M05_AXI_araddr[39:0] = m05_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M05_AXI_arprot[2:0] = m05_couplers_to_ps8_0_axi_periph_ARPROT;
  assign M05_AXI_arvalid = m05_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M05_AXI_awaddr[39:0] = m05_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M05_AXI_awprot[2:0] = m05_couplers_to_ps8_0_axi_periph_AWPROT;
  assign M05_AXI_awvalid = m05_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_ps8_0_axi_periph_BREADY;
  assign M05_AXI_rready = m05_couplers_to_ps8_0_axi_periph_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_ps8_0_axi_periph_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_ps8_0_axi_periph_WSTRB;
  assign M05_AXI_wvalid = m05_couplers_to_ps8_0_axi_periph_WVALID;
  assign S00_AXI_arready = ps8_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = ps8_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[15:0] = ps8_0_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = ps8_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = ps8_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = ps8_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[15:0] = ps8_0_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = ps8_0_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = ps8_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = ps8_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = ps8_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_ps8_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_ps8_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_ps8_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_ps8_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_ps8_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_ps8_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_ps8_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_ps8_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_ps8_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_ps8_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_ps8_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_ps8_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_ps8_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_ps8_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_ps8_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_ps8_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_ps8_0_axi_periph_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_ps8_0_axi_periph_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_ps8_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_ps8_0_axi_periph_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_ps8_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_ps8_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_ps8_0_axi_periph_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_ps8_0_axi_periph_WREADY = M02_AXI_wready[0];
  assign m03_couplers_to_ps8_0_axi_periph_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_ps8_0_axi_periph_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_ps8_0_axi_periph_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_ps8_0_axi_periph_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_ps8_0_axi_periph_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_ps8_0_axi_periph_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_ps8_0_axi_periph_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_ps8_0_axi_periph_WREADY = M03_AXI_wready;
  assign m04_couplers_to_ps8_0_axi_periph_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_ps8_0_axi_periph_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_ps8_0_axi_periph_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_ps8_0_axi_periph_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_ps8_0_axi_periph_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_ps8_0_axi_periph_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_ps8_0_axi_periph_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_ps8_0_axi_periph_WREADY = M04_AXI_wready;
  assign m05_couplers_to_ps8_0_axi_periph_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_ps8_0_axi_periph_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_ps8_0_axi_periph_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_ps8_0_axi_periph_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_ps8_0_axi_periph_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_ps8_0_axi_periph_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_ps8_0_axi_periph_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_ps8_0_axi_periph_WREADY = M05_AXI_wready;
  assign ps8_0_axi_periph_ACLK_net = ACLK;
  assign ps8_0_axi_periph_ARESETN_net = ARESETN;
  assign ps8_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[39:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[15:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[0];
  assign ps8_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign ps8_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[39:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[15:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[0];
  assign ps8_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign ps8_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign ps8_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign ps8_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign ps8_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign ps8_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_N6CHY9 m00_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wvalid(m00_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1YGIC8G m01_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1MV52F6 m02_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wvalid(m02_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_XXQL8Z m03_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m03_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m03_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m03_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m03_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m03_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m03_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m03_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m03_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m03_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m03_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m03_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m03_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wstrb(m03_couplers_to_ps8_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_11NL2LI m04_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m04_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m04_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m04_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m04_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m04_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m04_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m04_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m04_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m04_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m04_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m04_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m04_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wstrb(m04_couplers_to_ps8_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_BM87P3 m05_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m05_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arprot(m05_couplers_to_ps8_0_axi_periph_ARPROT),
        .M_AXI_arready(m05_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awprot(m05_couplers_to_ps8_0_axi_periph_AWPROT),
        .M_AXI_awready(m05_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m05_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m05_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m05_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m05_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m05_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m05_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m05_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m05_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m05_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wstrb(m05_couplers_to_ps8_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m05_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m05_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  s00_couplers_imp_RR89KG s00_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(ps8_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(ps8_0_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(ps8_0_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(ps8_0_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(ps8_0_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(ps8_0_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(ps8_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(ps8_0_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(ps8_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(ps8_0_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(ps8_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(ps8_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(ps8_0_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(ps8_0_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(ps8_0_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(ps8_0_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(ps8_0_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(ps8_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(ps8_0_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(ps8_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(ps8_0_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(ps8_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(ps8_0_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(ps8_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(ps8_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(ps8_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(ps8_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(ps8_0_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(ps8_0_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(ps8_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(ps8_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(ps8_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(ps8_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wlast(ps8_0_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(ps8_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(ps8_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(ps8_0_axi_periph_to_s00_couplers_WVALID));
  system_xbar_9 xbar
       (.aclk(ps8_0_axi_periph_ACLK_net),
        .aresetn(ps8_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m05_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[14:0]}),
        .m_axi_arready({xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m05_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[14:0]}),
        .m_axi_awready({xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[11:0]}),
        .m_axi_wvalid({xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule
