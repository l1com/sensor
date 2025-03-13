// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


//------------------------------------------------------------------------------------
// Filename:    system_axi_smc_9_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//   Aldec Riviera-PRO Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module system_axi_smc_9 (
  input bit_as_bool aclk,
  input bit_as_bool aclk1,
  input bit_as_bool aresetn,
  input bit [31 : 0] S00_AXI_awaddr,
  input bit [7 : 0] S00_AXI_awlen,
  input bit [2 : 0] S00_AXI_awsize,
  input bit [1 : 0] S00_AXI_awburst,
  input bit [0 : 0] S00_AXI_awlock,
  input bit [3 : 0] S00_AXI_awcache,
  input bit [2 : 0] S00_AXI_awprot,
  input bit [3 : 0] S00_AXI_awqos,
  input bit_as_bool S00_AXI_awvalid,
  output bit_as_bool S00_AXI_awready,
  input bit [63 : 0] S00_AXI_wdata,
  input bit [7 : 0] S00_AXI_wstrb,
  input bit_as_bool S00_AXI_wlast,
  input bit_as_bool S00_AXI_wvalid,
  output bit_as_bool S00_AXI_wready,
  output bit [1 : 0] S00_AXI_bresp,
  output bit_as_bool S00_AXI_bvalid,
  input bit_as_bool S00_AXI_bready,
  input bit [31 : 0] S01_AXI_awaddr,
  input bit [7 : 0] S01_AXI_awlen,
  input bit [2 : 0] S01_AXI_awsize,
  input bit [1 : 0] S01_AXI_awburst,
  input bit [0 : 0] S01_AXI_awlock,
  input bit [3 : 0] S01_AXI_awcache,
  input bit [2 : 0] S01_AXI_awprot,
  input bit [3 : 0] S01_AXI_awqos,
  input bit_as_bool S01_AXI_awvalid,
  output bit_as_bool S01_AXI_awready,
  input bit [63 : 0] S01_AXI_wdata,
  input bit [7 : 0] S01_AXI_wstrb,
  input bit_as_bool S01_AXI_wlast,
  input bit_as_bool S01_AXI_wvalid,
  output bit_as_bool S01_AXI_wready,
  output bit [1 : 0] S01_AXI_bresp,
  output bit_as_bool S01_AXI_bvalid,
  input bit_as_bool S01_AXI_bready,
  input bit [31 : 0] S02_AXI_awaddr,
  input bit [7 : 0] S02_AXI_awlen,
  input bit [2 : 0] S02_AXI_awsize,
  input bit [1 : 0] S02_AXI_awburst,
  input bit [0 : 0] S02_AXI_awlock,
  input bit [3 : 0] S02_AXI_awcache,
  input bit [2 : 0] S02_AXI_awprot,
  input bit [3 : 0] S02_AXI_awqos,
  input bit_as_bool S02_AXI_awvalid,
  output bit_as_bool S02_AXI_awready,
  input bit [63 : 0] S02_AXI_wdata,
  input bit [7 : 0] S02_AXI_wstrb,
  input bit_as_bool S02_AXI_wlast,
  input bit_as_bool S02_AXI_wvalid,
  output bit_as_bool S02_AXI_wready,
  output bit [1 : 0] S02_AXI_bresp,
  output bit_as_bool S02_AXI_bvalid,
  input bit_as_bool S02_AXI_bready,
  input bit [31 : 0] S03_AXI_araddr,
  input bit [7 : 0] S03_AXI_arlen,
  input bit [2 : 0] S03_AXI_arsize,
  input bit [1 : 0] S03_AXI_arburst,
  input bit [0 : 0] S03_AXI_arlock,
  input bit [3 : 0] S03_AXI_arcache,
  input bit [2 : 0] S03_AXI_arprot,
  input bit [3 : 0] S03_AXI_arqos,
  input bit_as_bool S03_AXI_arvalid,
  output bit_as_bool S03_AXI_arready,
  output bit [63 : 0] S03_AXI_rdata,
  output bit [1 : 0] S03_AXI_rresp,
  output bit_as_bool S03_AXI_rlast,
  output bit_as_bool S03_AXI_rvalid,
  input bit_as_bool S03_AXI_rready,
  input bit [63 : 0] S04_AXI_awaddr,
  input bit [7 : 0] S04_AXI_awlen,
  input bit [2 : 0] S04_AXI_awsize,
  input bit [1 : 0] S04_AXI_awburst,
  input bit [0 : 0] S04_AXI_awlock,
  input bit [3 : 0] S04_AXI_awcache,
  input bit [2 : 0] S04_AXI_awprot,
  input bit [3 : 0] S04_AXI_awqos,
  input bit_as_bool S04_AXI_awvalid,
  output bit_as_bool S04_AXI_awready,
  input bit [63 : 0] S04_AXI_wdata,
  input bit [7 : 0] S04_AXI_wstrb,
  input bit_as_bool S04_AXI_wlast,
  input bit_as_bool S04_AXI_wvalid,
  output bit_as_bool S04_AXI_wready,
  output bit [1 : 0] S04_AXI_bresp,
  output bit_as_bool S04_AXI_bvalid,
  input bit_as_bool S04_AXI_bready,
  input bit [63 : 0] S04_AXI_araddr,
  input bit [7 : 0] S04_AXI_arlen,
  input bit [2 : 0] S04_AXI_arsize,
  input bit [1 : 0] S04_AXI_arburst,
  input bit [0 : 0] S04_AXI_arlock,
  input bit [3 : 0] S04_AXI_arcache,
  input bit [2 : 0] S04_AXI_arprot,
  input bit [3 : 0] S04_AXI_arqos,
  input bit_as_bool S04_AXI_arvalid,
  output bit_as_bool S04_AXI_arready,
  output bit [63 : 0] S04_AXI_rdata,
  output bit [1 : 0] S04_AXI_rresp,
  output bit_as_bool S04_AXI_rlast,
  output bit_as_bool S04_AXI_rvalid,
  input bit_as_bool S04_AXI_rready,
  input bit [63 : 0] S05_AXI_awaddr,
  input bit [7 : 0] S05_AXI_awlen,
  input bit [2 : 0] S05_AXI_awsize,
  input bit [1 : 0] S05_AXI_awburst,
  input bit [0 : 0] S05_AXI_awlock,
  input bit [3 : 0] S05_AXI_awcache,
  input bit [2 : 0] S05_AXI_awprot,
  input bit [3 : 0] S05_AXI_awqos,
  input bit_as_bool S05_AXI_awvalid,
  output bit_as_bool S05_AXI_awready,
  input bit [63 : 0] S05_AXI_wdata,
  input bit [7 : 0] S05_AXI_wstrb,
  input bit_as_bool S05_AXI_wlast,
  input bit_as_bool S05_AXI_wvalid,
  output bit_as_bool S05_AXI_wready,
  output bit [1 : 0] S05_AXI_bresp,
  output bit_as_bool S05_AXI_bvalid,
  input bit_as_bool S05_AXI_bready,
  input bit [63 : 0] S05_AXI_araddr,
  input bit [7 : 0] S05_AXI_arlen,
  input bit [2 : 0] S05_AXI_arsize,
  input bit [1 : 0] S05_AXI_arburst,
  input bit [0 : 0] S05_AXI_arlock,
  input bit [3 : 0] S05_AXI_arcache,
  input bit [2 : 0] S05_AXI_arprot,
  input bit [3 : 0] S05_AXI_arqos,
  input bit_as_bool S05_AXI_arvalid,
  output bit_as_bool S05_AXI_arready,
  output bit [63 : 0] S05_AXI_rdata,
  output bit [1 : 0] S05_AXI_rresp,
  output bit_as_bool S05_AXI_rlast,
  output bit_as_bool S05_AXI_rvalid,
  input bit_as_bool S05_AXI_rready,
  input bit [63 : 0] S06_AXI_awaddr,
  input bit [7 : 0] S06_AXI_awlen,
  input bit [2 : 0] S06_AXI_awsize,
  input bit [1 : 0] S06_AXI_awburst,
  input bit [0 : 0] S06_AXI_awlock,
  input bit [3 : 0] S06_AXI_awcache,
  input bit [2 : 0] S06_AXI_awprot,
  input bit [3 : 0] S06_AXI_awqos,
  input bit_as_bool S06_AXI_awvalid,
  output bit_as_bool S06_AXI_awready,
  input bit [63 : 0] S06_AXI_wdata,
  input bit [7 : 0] S06_AXI_wstrb,
  input bit_as_bool S06_AXI_wlast,
  input bit_as_bool S06_AXI_wvalid,
  output bit_as_bool S06_AXI_wready,
  output bit [1 : 0] S06_AXI_bresp,
  output bit_as_bool S06_AXI_bvalid,
  input bit_as_bool S06_AXI_bready,
  input bit [63 : 0] S06_AXI_araddr,
  input bit [7 : 0] S06_AXI_arlen,
  input bit [2 : 0] S06_AXI_arsize,
  input bit [1 : 0] S06_AXI_arburst,
  input bit [0 : 0] S06_AXI_arlock,
  input bit [3 : 0] S06_AXI_arcache,
  input bit [2 : 0] S06_AXI_arprot,
  input bit [3 : 0] S06_AXI_arqos,
  input bit_as_bool S06_AXI_arvalid,
  output bit_as_bool S06_AXI_arready,
  output bit [63 : 0] S06_AXI_rdata,
  output bit [1 : 0] S06_AXI_rresp,
  output bit_as_bool S06_AXI_rlast,
  output bit_as_bool S06_AXI_rvalid,
  input bit_as_bool S06_AXI_rready,
  input bit [63 : 0] S07_AXI_awaddr,
  input bit [7 : 0] S07_AXI_awlen,
  input bit [2 : 0] S07_AXI_awsize,
  input bit [1 : 0] S07_AXI_awburst,
  input bit [0 : 0] S07_AXI_awlock,
  input bit [3 : 0] S07_AXI_awcache,
  input bit [2 : 0] S07_AXI_awprot,
  input bit [3 : 0] S07_AXI_awqos,
  input bit_as_bool S07_AXI_awvalid,
  output bit_as_bool S07_AXI_awready,
  input bit [63 : 0] S07_AXI_wdata,
  input bit [7 : 0] S07_AXI_wstrb,
  input bit_as_bool S07_AXI_wlast,
  input bit_as_bool S07_AXI_wvalid,
  output bit_as_bool S07_AXI_wready,
  output bit [1 : 0] S07_AXI_bresp,
  output bit_as_bool S07_AXI_bvalid,
  input bit_as_bool S07_AXI_bready,
  input bit [63 : 0] S07_AXI_araddr,
  input bit [7 : 0] S07_AXI_arlen,
  input bit [2 : 0] S07_AXI_arsize,
  input bit [1 : 0] S07_AXI_arburst,
  input bit [0 : 0] S07_AXI_arlock,
  input bit [3 : 0] S07_AXI_arcache,
  input bit [2 : 0] S07_AXI_arprot,
  input bit [3 : 0] S07_AXI_arqos,
  input bit_as_bool S07_AXI_arvalid,
  output bit_as_bool S07_AXI_arready,
  output bit [63 : 0] S07_AXI_rdata,
  output bit [1 : 0] S07_AXI_rresp,
  output bit_as_bool S07_AXI_rlast,
  output bit_as_bool S07_AXI_rvalid,
  input bit_as_bool S07_AXI_rready,
  output bit [48 : 0] M00_AXI_awaddr,
  output bit [7 : 0] M00_AXI_awlen,
  output bit [2 : 0] M00_AXI_awsize,
  output bit [1 : 0] M00_AXI_awburst,
  output bit [0 : 0] M00_AXI_awlock,
  output bit [3 : 0] M00_AXI_awcache,
  output bit [2 : 0] M00_AXI_awprot,
  output bit [3 : 0] M00_AXI_awqos,
  output bit_as_bool M00_AXI_awvalid,
  input bit_as_bool M00_AXI_awready,
  output bit [127 : 0] M00_AXI_wdata,
  output bit [15 : 0] M00_AXI_wstrb,
  output bit_as_bool M00_AXI_wlast,
  output bit_as_bool M00_AXI_wvalid,
  input bit_as_bool M00_AXI_wready,
  input bit [1 : 0] M00_AXI_bresp,
  input bit_as_bool M00_AXI_bvalid,
  output bit_as_bool M00_AXI_bready,
  output bit [48 : 0] M00_AXI_araddr,
  output bit [7 : 0] M00_AXI_arlen,
  output bit [2 : 0] M00_AXI_arsize,
  output bit [1 : 0] M00_AXI_arburst,
  output bit [0 : 0] M00_AXI_arlock,
  output bit [3 : 0] M00_AXI_arcache,
  output bit [2 : 0] M00_AXI_arprot,
  output bit [3 : 0] M00_AXI_arqos,
  output bit_as_bool M00_AXI_arvalid,
  input bit_as_bool M00_AXI_arready,
  input bit [127 : 0] M00_AXI_rdata,
  input bit [1 : 0] M00_AXI_rresp,
  input bit_as_bool M00_AXI_rlast,
  input bit_as_bool M00_AXI_rvalid,
  output bit_as_bool M00_AXI_rready
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module system_axi_smc_9 (aclk,aclk1,aresetn,S00_AXI_awaddr,S00_AXI_awlen,S00_AXI_awsize,S00_AXI_awburst,S00_AXI_awlock,S00_AXI_awcache,S00_AXI_awprot,S00_AXI_awqos,S00_AXI_awvalid,S00_AXI_awready,S00_AXI_wdata,S00_AXI_wstrb,S00_AXI_wlast,S00_AXI_wvalid,S00_AXI_wready,S00_AXI_bresp,S00_AXI_bvalid,S00_AXI_bready,S01_AXI_awaddr,S01_AXI_awlen,S01_AXI_awsize,S01_AXI_awburst,S01_AXI_awlock,S01_AXI_awcache,S01_AXI_awprot,S01_AXI_awqos,S01_AXI_awvalid,S01_AXI_awready,S01_AXI_wdata,S01_AXI_wstrb,S01_AXI_wlast,S01_AXI_wvalid,S01_AXI_wready,S01_AXI_bresp,S01_AXI_bvalid,S01_AXI_bready,S02_AXI_awaddr,S02_AXI_awlen,S02_AXI_awsize,S02_AXI_awburst,S02_AXI_awlock,S02_AXI_awcache,S02_AXI_awprot,S02_AXI_awqos,S02_AXI_awvalid,S02_AXI_awready,S02_AXI_wdata,S02_AXI_wstrb,S02_AXI_wlast,S02_AXI_wvalid,S02_AXI_wready,S02_AXI_bresp,S02_AXI_bvalid,S02_AXI_bready,S03_AXI_araddr,S03_AXI_arlen,S03_AXI_arsize,S03_AXI_arburst,S03_AXI_arlock,S03_AXI_arcache,S03_AXI_arprot,S03_AXI_arqos,S03_AXI_arvalid,S03_AXI_arready,S03_AXI_rdata,S03_AXI_rresp,S03_AXI_rlast,S03_AXI_rvalid,S03_AXI_rready,S04_AXI_awaddr,S04_AXI_awlen,S04_AXI_awsize,S04_AXI_awburst,S04_AXI_awlock,S04_AXI_awcache,S04_AXI_awprot,S04_AXI_awqos,S04_AXI_awvalid,S04_AXI_awready,S04_AXI_wdata,S04_AXI_wstrb,S04_AXI_wlast,S04_AXI_wvalid,S04_AXI_wready,S04_AXI_bresp,S04_AXI_bvalid,S04_AXI_bready,S04_AXI_araddr,S04_AXI_arlen,S04_AXI_arsize,S04_AXI_arburst,S04_AXI_arlock,S04_AXI_arcache,S04_AXI_arprot,S04_AXI_arqos,S04_AXI_arvalid,S04_AXI_arready,S04_AXI_rdata,S04_AXI_rresp,S04_AXI_rlast,S04_AXI_rvalid,S04_AXI_rready,S05_AXI_awaddr,S05_AXI_awlen,S05_AXI_awsize,S05_AXI_awburst,S05_AXI_awlock,S05_AXI_awcache,S05_AXI_awprot,S05_AXI_awqos,S05_AXI_awvalid,S05_AXI_awready,S05_AXI_wdata,S05_AXI_wstrb,S05_AXI_wlast,S05_AXI_wvalid,S05_AXI_wready,S05_AXI_bresp,S05_AXI_bvalid,S05_AXI_bready,S05_AXI_araddr,S05_AXI_arlen,S05_AXI_arsize,S05_AXI_arburst,S05_AXI_arlock,S05_AXI_arcache,S05_AXI_arprot,S05_AXI_arqos,S05_AXI_arvalid,S05_AXI_arready,S05_AXI_rdata,S05_AXI_rresp,S05_AXI_rlast,S05_AXI_rvalid,S05_AXI_rready,S06_AXI_awaddr,S06_AXI_awlen,S06_AXI_awsize,S06_AXI_awburst,S06_AXI_awlock,S06_AXI_awcache,S06_AXI_awprot,S06_AXI_awqos,S06_AXI_awvalid,S06_AXI_awready,S06_AXI_wdata,S06_AXI_wstrb,S06_AXI_wlast,S06_AXI_wvalid,S06_AXI_wready,S06_AXI_bresp,S06_AXI_bvalid,S06_AXI_bready,S06_AXI_araddr,S06_AXI_arlen,S06_AXI_arsize,S06_AXI_arburst,S06_AXI_arlock,S06_AXI_arcache,S06_AXI_arprot,S06_AXI_arqos,S06_AXI_arvalid,S06_AXI_arready,S06_AXI_rdata,S06_AXI_rresp,S06_AXI_rlast,S06_AXI_rvalid,S06_AXI_rready,S07_AXI_awaddr,S07_AXI_awlen,S07_AXI_awsize,S07_AXI_awburst,S07_AXI_awlock,S07_AXI_awcache,S07_AXI_awprot,S07_AXI_awqos,S07_AXI_awvalid,S07_AXI_awready,S07_AXI_wdata,S07_AXI_wstrb,S07_AXI_wlast,S07_AXI_wvalid,S07_AXI_wready,S07_AXI_bresp,S07_AXI_bvalid,S07_AXI_bready,S07_AXI_araddr,S07_AXI_arlen,S07_AXI_arsize,S07_AXI_arburst,S07_AXI_arlock,S07_AXI_arcache,S07_AXI_arprot,S07_AXI_arqos,S07_AXI_arvalid,S07_AXI_arready,S07_AXI_rdata,S07_AXI_rresp,S07_AXI_rlast,S07_AXI_rvalid,S07_AXI_rready,M00_AXI_awaddr,M00_AXI_awlen,M00_AXI_awsize,M00_AXI_awburst,M00_AXI_awlock,M00_AXI_awcache,M00_AXI_awprot,M00_AXI_awqos,M00_AXI_awvalid,M00_AXI_awready,M00_AXI_wdata,M00_AXI_wstrb,M00_AXI_wlast,M00_AXI_wvalid,M00_AXI_wready,M00_AXI_bresp,M00_AXI_bvalid,M00_AXI_bready,M00_AXI_araddr,M00_AXI_arlen,M00_AXI_arsize,M00_AXI_arburst,M00_AXI_arlock,M00_AXI_arcache,M00_AXI_arprot,M00_AXI_arqos,M00_AXI_arvalid,M00_AXI_arready,M00_AXI_rdata,M00_AXI_rresp,M00_AXI_rlast,M00_AXI_rvalid,M00_AXI_rready)
(* integer foreign = "SystemC";
*);
  input bit aclk;
  input bit aclk1;
  input bit aresetn;
  input bit [31 : 0] S00_AXI_awaddr;
  input bit [7 : 0] S00_AXI_awlen;
  input bit [2 : 0] S00_AXI_awsize;
  input bit [1 : 0] S00_AXI_awburst;
  input bit [0 : 0] S00_AXI_awlock;
  input bit [3 : 0] S00_AXI_awcache;
  input bit [2 : 0] S00_AXI_awprot;
  input bit [3 : 0] S00_AXI_awqos;
  input bit S00_AXI_awvalid;
  output wire S00_AXI_awready;
  input bit [63 : 0] S00_AXI_wdata;
  input bit [7 : 0] S00_AXI_wstrb;
  input bit S00_AXI_wlast;
  input bit S00_AXI_wvalid;
  output wire S00_AXI_wready;
  output wire [1 : 0] S00_AXI_bresp;
  output wire S00_AXI_bvalid;
  input bit S00_AXI_bready;
  input bit [31 : 0] S01_AXI_awaddr;
  input bit [7 : 0] S01_AXI_awlen;
  input bit [2 : 0] S01_AXI_awsize;
  input bit [1 : 0] S01_AXI_awburst;
  input bit [0 : 0] S01_AXI_awlock;
  input bit [3 : 0] S01_AXI_awcache;
  input bit [2 : 0] S01_AXI_awprot;
  input bit [3 : 0] S01_AXI_awqos;
  input bit S01_AXI_awvalid;
  output wire S01_AXI_awready;
  input bit [63 : 0] S01_AXI_wdata;
  input bit [7 : 0] S01_AXI_wstrb;
  input bit S01_AXI_wlast;
  input bit S01_AXI_wvalid;
  output wire S01_AXI_wready;
  output wire [1 : 0] S01_AXI_bresp;
  output wire S01_AXI_bvalid;
  input bit S01_AXI_bready;
  input bit [31 : 0] S02_AXI_awaddr;
  input bit [7 : 0] S02_AXI_awlen;
  input bit [2 : 0] S02_AXI_awsize;
  input bit [1 : 0] S02_AXI_awburst;
  input bit [0 : 0] S02_AXI_awlock;
  input bit [3 : 0] S02_AXI_awcache;
  input bit [2 : 0] S02_AXI_awprot;
  input bit [3 : 0] S02_AXI_awqos;
  input bit S02_AXI_awvalid;
  output wire S02_AXI_awready;
  input bit [63 : 0] S02_AXI_wdata;
  input bit [7 : 0] S02_AXI_wstrb;
  input bit S02_AXI_wlast;
  input bit S02_AXI_wvalid;
  output wire S02_AXI_wready;
  output wire [1 : 0] S02_AXI_bresp;
  output wire S02_AXI_bvalid;
  input bit S02_AXI_bready;
  input bit [31 : 0] S03_AXI_araddr;
  input bit [7 : 0] S03_AXI_arlen;
  input bit [2 : 0] S03_AXI_arsize;
  input bit [1 : 0] S03_AXI_arburst;
  input bit [0 : 0] S03_AXI_arlock;
  input bit [3 : 0] S03_AXI_arcache;
  input bit [2 : 0] S03_AXI_arprot;
  input bit [3 : 0] S03_AXI_arqos;
  input bit S03_AXI_arvalid;
  output wire S03_AXI_arready;
  output wire [63 : 0] S03_AXI_rdata;
  output wire [1 : 0] S03_AXI_rresp;
  output wire S03_AXI_rlast;
  output wire S03_AXI_rvalid;
  input bit S03_AXI_rready;
  input bit [63 : 0] S04_AXI_awaddr;
  input bit [7 : 0] S04_AXI_awlen;
  input bit [2 : 0] S04_AXI_awsize;
  input bit [1 : 0] S04_AXI_awburst;
  input bit [0 : 0] S04_AXI_awlock;
  input bit [3 : 0] S04_AXI_awcache;
  input bit [2 : 0] S04_AXI_awprot;
  input bit [3 : 0] S04_AXI_awqos;
  input bit S04_AXI_awvalid;
  output wire S04_AXI_awready;
  input bit [63 : 0] S04_AXI_wdata;
  input bit [7 : 0] S04_AXI_wstrb;
  input bit S04_AXI_wlast;
  input bit S04_AXI_wvalid;
  output wire S04_AXI_wready;
  output wire [1 : 0] S04_AXI_bresp;
  output wire S04_AXI_bvalid;
  input bit S04_AXI_bready;
  input bit [63 : 0] S04_AXI_araddr;
  input bit [7 : 0] S04_AXI_arlen;
  input bit [2 : 0] S04_AXI_arsize;
  input bit [1 : 0] S04_AXI_arburst;
  input bit [0 : 0] S04_AXI_arlock;
  input bit [3 : 0] S04_AXI_arcache;
  input bit [2 : 0] S04_AXI_arprot;
  input bit [3 : 0] S04_AXI_arqos;
  input bit S04_AXI_arvalid;
  output wire S04_AXI_arready;
  output wire [63 : 0] S04_AXI_rdata;
  output wire [1 : 0] S04_AXI_rresp;
  output wire S04_AXI_rlast;
  output wire S04_AXI_rvalid;
  input bit S04_AXI_rready;
  input bit [63 : 0] S05_AXI_awaddr;
  input bit [7 : 0] S05_AXI_awlen;
  input bit [2 : 0] S05_AXI_awsize;
  input bit [1 : 0] S05_AXI_awburst;
  input bit [0 : 0] S05_AXI_awlock;
  input bit [3 : 0] S05_AXI_awcache;
  input bit [2 : 0] S05_AXI_awprot;
  input bit [3 : 0] S05_AXI_awqos;
  input bit S05_AXI_awvalid;
  output wire S05_AXI_awready;
  input bit [63 : 0] S05_AXI_wdata;
  input bit [7 : 0] S05_AXI_wstrb;
  input bit S05_AXI_wlast;
  input bit S05_AXI_wvalid;
  output wire S05_AXI_wready;
  output wire [1 : 0] S05_AXI_bresp;
  output wire S05_AXI_bvalid;
  input bit S05_AXI_bready;
  input bit [63 : 0] S05_AXI_araddr;
  input bit [7 : 0] S05_AXI_arlen;
  input bit [2 : 0] S05_AXI_arsize;
  input bit [1 : 0] S05_AXI_arburst;
  input bit [0 : 0] S05_AXI_arlock;
  input bit [3 : 0] S05_AXI_arcache;
  input bit [2 : 0] S05_AXI_arprot;
  input bit [3 : 0] S05_AXI_arqos;
  input bit S05_AXI_arvalid;
  output wire S05_AXI_arready;
  output wire [63 : 0] S05_AXI_rdata;
  output wire [1 : 0] S05_AXI_rresp;
  output wire S05_AXI_rlast;
  output wire S05_AXI_rvalid;
  input bit S05_AXI_rready;
  input bit [63 : 0] S06_AXI_awaddr;
  input bit [7 : 0] S06_AXI_awlen;
  input bit [2 : 0] S06_AXI_awsize;
  input bit [1 : 0] S06_AXI_awburst;
  input bit [0 : 0] S06_AXI_awlock;
  input bit [3 : 0] S06_AXI_awcache;
  input bit [2 : 0] S06_AXI_awprot;
  input bit [3 : 0] S06_AXI_awqos;
  input bit S06_AXI_awvalid;
  output wire S06_AXI_awready;
  input bit [63 : 0] S06_AXI_wdata;
  input bit [7 : 0] S06_AXI_wstrb;
  input bit S06_AXI_wlast;
  input bit S06_AXI_wvalid;
  output wire S06_AXI_wready;
  output wire [1 : 0] S06_AXI_bresp;
  output wire S06_AXI_bvalid;
  input bit S06_AXI_bready;
  input bit [63 : 0] S06_AXI_araddr;
  input bit [7 : 0] S06_AXI_arlen;
  input bit [2 : 0] S06_AXI_arsize;
  input bit [1 : 0] S06_AXI_arburst;
  input bit [0 : 0] S06_AXI_arlock;
  input bit [3 : 0] S06_AXI_arcache;
  input bit [2 : 0] S06_AXI_arprot;
  input bit [3 : 0] S06_AXI_arqos;
  input bit S06_AXI_arvalid;
  output wire S06_AXI_arready;
  output wire [63 : 0] S06_AXI_rdata;
  output wire [1 : 0] S06_AXI_rresp;
  output wire S06_AXI_rlast;
  output wire S06_AXI_rvalid;
  input bit S06_AXI_rready;
  input bit [63 : 0] S07_AXI_awaddr;
  input bit [7 : 0] S07_AXI_awlen;
  input bit [2 : 0] S07_AXI_awsize;
  input bit [1 : 0] S07_AXI_awburst;
  input bit [0 : 0] S07_AXI_awlock;
  input bit [3 : 0] S07_AXI_awcache;
  input bit [2 : 0] S07_AXI_awprot;
  input bit [3 : 0] S07_AXI_awqos;
  input bit S07_AXI_awvalid;
  output wire S07_AXI_awready;
  input bit [63 : 0] S07_AXI_wdata;
  input bit [7 : 0] S07_AXI_wstrb;
  input bit S07_AXI_wlast;
  input bit S07_AXI_wvalid;
  output wire S07_AXI_wready;
  output wire [1 : 0] S07_AXI_bresp;
  output wire S07_AXI_bvalid;
  input bit S07_AXI_bready;
  input bit [63 : 0] S07_AXI_araddr;
  input bit [7 : 0] S07_AXI_arlen;
  input bit [2 : 0] S07_AXI_arsize;
  input bit [1 : 0] S07_AXI_arburst;
  input bit [0 : 0] S07_AXI_arlock;
  input bit [3 : 0] S07_AXI_arcache;
  input bit [2 : 0] S07_AXI_arprot;
  input bit [3 : 0] S07_AXI_arqos;
  input bit S07_AXI_arvalid;
  output wire S07_AXI_arready;
  output wire [63 : 0] S07_AXI_rdata;
  output wire [1 : 0] S07_AXI_rresp;
  output wire S07_AXI_rlast;
  output wire S07_AXI_rvalid;
  input bit S07_AXI_rready;
  output wire [48 : 0] M00_AXI_awaddr;
  output wire [7 : 0] M00_AXI_awlen;
  output wire [2 : 0] M00_AXI_awsize;
  output wire [1 : 0] M00_AXI_awburst;
  output wire [0 : 0] M00_AXI_awlock;
  output wire [3 : 0] M00_AXI_awcache;
  output wire [2 : 0] M00_AXI_awprot;
  output wire [3 : 0] M00_AXI_awqos;
  output wire M00_AXI_awvalid;
  input bit M00_AXI_awready;
  output wire [127 : 0] M00_AXI_wdata;
  output wire [15 : 0] M00_AXI_wstrb;
  output wire M00_AXI_wlast;
  output wire M00_AXI_wvalid;
  input bit M00_AXI_wready;
  input bit [1 : 0] M00_AXI_bresp;
  input bit M00_AXI_bvalid;
  output wire M00_AXI_bready;
  output wire [48 : 0] M00_AXI_araddr;
  output wire [7 : 0] M00_AXI_arlen;
  output wire [2 : 0] M00_AXI_arsize;
  output wire [1 : 0] M00_AXI_arburst;
  output wire [0 : 0] M00_AXI_arlock;
  output wire [3 : 0] M00_AXI_arcache;
  output wire [2 : 0] M00_AXI_arprot;
  output wire [3 : 0] M00_AXI_arqos;
  output wire M00_AXI_arvalid;
  input bit M00_AXI_arready;
  input bit [127 : 0] M00_AXI_rdata;
  input bit [1 : 0] M00_AXI_rresp;
  input bit M00_AXI_rlast;
  input bit M00_AXI_rvalid;
  output wire M00_AXI_rready;
endmodule
`endif

`ifdef RIVIERA
(* SC_MODULE_EXPORT *)
module system_axi_smc_9 (aclk,aclk1,aresetn,S00_AXI_awaddr,S00_AXI_awlen,S00_AXI_awsize,S00_AXI_awburst,S00_AXI_awlock,S00_AXI_awcache,S00_AXI_awprot,S00_AXI_awqos,S00_AXI_awvalid,S00_AXI_awready,S00_AXI_wdata,S00_AXI_wstrb,S00_AXI_wlast,S00_AXI_wvalid,S00_AXI_wready,S00_AXI_bresp,S00_AXI_bvalid,S00_AXI_bready,S01_AXI_awaddr,S01_AXI_awlen,S01_AXI_awsize,S01_AXI_awburst,S01_AXI_awlock,S01_AXI_awcache,S01_AXI_awprot,S01_AXI_awqos,S01_AXI_awvalid,S01_AXI_awready,S01_AXI_wdata,S01_AXI_wstrb,S01_AXI_wlast,S01_AXI_wvalid,S01_AXI_wready,S01_AXI_bresp,S01_AXI_bvalid,S01_AXI_bready,S02_AXI_awaddr,S02_AXI_awlen,S02_AXI_awsize,S02_AXI_awburst,S02_AXI_awlock,S02_AXI_awcache,S02_AXI_awprot,S02_AXI_awqos,S02_AXI_awvalid,S02_AXI_awready,S02_AXI_wdata,S02_AXI_wstrb,S02_AXI_wlast,S02_AXI_wvalid,S02_AXI_wready,S02_AXI_bresp,S02_AXI_bvalid,S02_AXI_bready,S03_AXI_araddr,S03_AXI_arlen,S03_AXI_arsize,S03_AXI_arburst,S03_AXI_arlock,S03_AXI_arcache,S03_AXI_arprot,S03_AXI_arqos,S03_AXI_arvalid,S03_AXI_arready,S03_AXI_rdata,S03_AXI_rresp,S03_AXI_rlast,S03_AXI_rvalid,S03_AXI_rready,S04_AXI_awaddr,S04_AXI_awlen,S04_AXI_awsize,S04_AXI_awburst,S04_AXI_awlock,S04_AXI_awcache,S04_AXI_awprot,S04_AXI_awqos,S04_AXI_awvalid,S04_AXI_awready,S04_AXI_wdata,S04_AXI_wstrb,S04_AXI_wlast,S04_AXI_wvalid,S04_AXI_wready,S04_AXI_bresp,S04_AXI_bvalid,S04_AXI_bready,S04_AXI_araddr,S04_AXI_arlen,S04_AXI_arsize,S04_AXI_arburst,S04_AXI_arlock,S04_AXI_arcache,S04_AXI_arprot,S04_AXI_arqos,S04_AXI_arvalid,S04_AXI_arready,S04_AXI_rdata,S04_AXI_rresp,S04_AXI_rlast,S04_AXI_rvalid,S04_AXI_rready,S05_AXI_awaddr,S05_AXI_awlen,S05_AXI_awsize,S05_AXI_awburst,S05_AXI_awlock,S05_AXI_awcache,S05_AXI_awprot,S05_AXI_awqos,S05_AXI_awvalid,S05_AXI_awready,S05_AXI_wdata,S05_AXI_wstrb,S05_AXI_wlast,S05_AXI_wvalid,S05_AXI_wready,S05_AXI_bresp,S05_AXI_bvalid,S05_AXI_bready,S05_AXI_araddr,S05_AXI_arlen,S05_AXI_arsize,S05_AXI_arburst,S05_AXI_arlock,S05_AXI_arcache,S05_AXI_arprot,S05_AXI_arqos,S05_AXI_arvalid,S05_AXI_arready,S05_AXI_rdata,S05_AXI_rresp,S05_AXI_rlast,S05_AXI_rvalid,S05_AXI_rready,S06_AXI_awaddr,S06_AXI_awlen,S06_AXI_awsize,S06_AXI_awburst,S06_AXI_awlock,S06_AXI_awcache,S06_AXI_awprot,S06_AXI_awqos,S06_AXI_awvalid,S06_AXI_awready,S06_AXI_wdata,S06_AXI_wstrb,S06_AXI_wlast,S06_AXI_wvalid,S06_AXI_wready,S06_AXI_bresp,S06_AXI_bvalid,S06_AXI_bready,S06_AXI_araddr,S06_AXI_arlen,S06_AXI_arsize,S06_AXI_arburst,S06_AXI_arlock,S06_AXI_arcache,S06_AXI_arprot,S06_AXI_arqos,S06_AXI_arvalid,S06_AXI_arready,S06_AXI_rdata,S06_AXI_rresp,S06_AXI_rlast,S06_AXI_rvalid,S06_AXI_rready,S07_AXI_awaddr,S07_AXI_awlen,S07_AXI_awsize,S07_AXI_awburst,S07_AXI_awlock,S07_AXI_awcache,S07_AXI_awprot,S07_AXI_awqos,S07_AXI_awvalid,S07_AXI_awready,S07_AXI_wdata,S07_AXI_wstrb,S07_AXI_wlast,S07_AXI_wvalid,S07_AXI_wready,S07_AXI_bresp,S07_AXI_bvalid,S07_AXI_bready,S07_AXI_araddr,S07_AXI_arlen,S07_AXI_arsize,S07_AXI_arburst,S07_AXI_arlock,S07_AXI_arcache,S07_AXI_arprot,S07_AXI_arqos,S07_AXI_arvalid,S07_AXI_arready,S07_AXI_rdata,S07_AXI_rresp,S07_AXI_rlast,S07_AXI_rvalid,S07_AXI_rready,M00_AXI_awaddr,M00_AXI_awlen,M00_AXI_awsize,M00_AXI_awburst,M00_AXI_awlock,M00_AXI_awcache,M00_AXI_awprot,M00_AXI_awqos,M00_AXI_awvalid,M00_AXI_awready,M00_AXI_wdata,M00_AXI_wstrb,M00_AXI_wlast,M00_AXI_wvalid,M00_AXI_wready,M00_AXI_bresp,M00_AXI_bvalid,M00_AXI_bready,M00_AXI_araddr,M00_AXI_arlen,M00_AXI_arsize,M00_AXI_arburst,M00_AXI_arlock,M00_AXI_arcache,M00_AXI_arprot,M00_AXI_arqos,M00_AXI_arvalid,M00_AXI_arready,M00_AXI_rdata,M00_AXI_rresp,M00_AXI_rlast,M00_AXI_rvalid,M00_AXI_rready)
  input bit aclk;
  input bit aclk1;
  input bit aresetn;
  input bit [31 : 0] S00_AXI_awaddr;
  input bit [7 : 0] S00_AXI_awlen;
  input bit [2 : 0] S00_AXI_awsize;
  input bit [1 : 0] S00_AXI_awburst;
  input bit [0 : 0] S00_AXI_awlock;
  input bit [3 : 0] S00_AXI_awcache;
  input bit [2 : 0] S00_AXI_awprot;
  input bit [3 : 0] S00_AXI_awqos;
  input bit S00_AXI_awvalid;
  output wire S00_AXI_awready;
  input bit [63 : 0] S00_AXI_wdata;
  input bit [7 : 0] S00_AXI_wstrb;
  input bit S00_AXI_wlast;
  input bit S00_AXI_wvalid;
  output wire S00_AXI_wready;
  output wire [1 : 0] S00_AXI_bresp;
  output wire S00_AXI_bvalid;
  input bit S00_AXI_bready;
  input bit [31 : 0] S01_AXI_awaddr;
  input bit [7 : 0] S01_AXI_awlen;
  input bit [2 : 0] S01_AXI_awsize;
  input bit [1 : 0] S01_AXI_awburst;
  input bit [0 : 0] S01_AXI_awlock;
  input bit [3 : 0] S01_AXI_awcache;
  input bit [2 : 0] S01_AXI_awprot;
  input bit [3 : 0] S01_AXI_awqos;
  input bit S01_AXI_awvalid;
  output wire S01_AXI_awready;
  input bit [63 : 0] S01_AXI_wdata;
  input bit [7 : 0] S01_AXI_wstrb;
  input bit S01_AXI_wlast;
  input bit S01_AXI_wvalid;
  output wire S01_AXI_wready;
  output wire [1 : 0] S01_AXI_bresp;
  output wire S01_AXI_bvalid;
  input bit S01_AXI_bready;
  input bit [31 : 0] S02_AXI_awaddr;
  input bit [7 : 0] S02_AXI_awlen;
  input bit [2 : 0] S02_AXI_awsize;
  input bit [1 : 0] S02_AXI_awburst;
  input bit [0 : 0] S02_AXI_awlock;
  input bit [3 : 0] S02_AXI_awcache;
  input bit [2 : 0] S02_AXI_awprot;
  input bit [3 : 0] S02_AXI_awqos;
  input bit S02_AXI_awvalid;
  output wire S02_AXI_awready;
  input bit [63 : 0] S02_AXI_wdata;
  input bit [7 : 0] S02_AXI_wstrb;
  input bit S02_AXI_wlast;
  input bit S02_AXI_wvalid;
  output wire S02_AXI_wready;
  output wire [1 : 0] S02_AXI_bresp;
  output wire S02_AXI_bvalid;
  input bit S02_AXI_bready;
  input bit [31 : 0] S03_AXI_araddr;
  input bit [7 : 0] S03_AXI_arlen;
  input bit [2 : 0] S03_AXI_arsize;
  input bit [1 : 0] S03_AXI_arburst;
  input bit [0 : 0] S03_AXI_arlock;
  input bit [3 : 0] S03_AXI_arcache;
  input bit [2 : 0] S03_AXI_arprot;
  input bit [3 : 0] S03_AXI_arqos;
  input bit S03_AXI_arvalid;
  output wire S03_AXI_arready;
  output wire [63 : 0] S03_AXI_rdata;
  output wire [1 : 0] S03_AXI_rresp;
  output wire S03_AXI_rlast;
  output wire S03_AXI_rvalid;
  input bit S03_AXI_rready;
  input bit [63 : 0] S04_AXI_awaddr;
  input bit [7 : 0] S04_AXI_awlen;
  input bit [2 : 0] S04_AXI_awsize;
  input bit [1 : 0] S04_AXI_awburst;
  input bit [0 : 0] S04_AXI_awlock;
  input bit [3 : 0] S04_AXI_awcache;
  input bit [2 : 0] S04_AXI_awprot;
  input bit [3 : 0] S04_AXI_awqos;
  input bit S04_AXI_awvalid;
  output wire S04_AXI_awready;
  input bit [63 : 0] S04_AXI_wdata;
  input bit [7 : 0] S04_AXI_wstrb;
  input bit S04_AXI_wlast;
  input bit S04_AXI_wvalid;
  output wire S04_AXI_wready;
  output wire [1 : 0] S04_AXI_bresp;
  output wire S04_AXI_bvalid;
  input bit S04_AXI_bready;
  input bit [63 : 0] S04_AXI_araddr;
  input bit [7 : 0] S04_AXI_arlen;
  input bit [2 : 0] S04_AXI_arsize;
  input bit [1 : 0] S04_AXI_arburst;
  input bit [0 : 0] S04_AXI_arlock;
  input bit [3 : 0] S04_AXI_arcache;
  input bit [2 : 0] S04_AXI_arprot;
  input bit [3 : 0] S04_AXI_arqos;
  input bit S04_AXI_arvalid;
  output wire S04_AXI_arready;
  output wire [63 : 0] S04_AXI_rdata;
  output wire [1 : 0] S04_AXI_rresp;
  output wire S04_AXI_rlast;
  output wire S04_AXI_rvalid;
  input bit S04_AXI_rready;
  input bit [63 : 0] S05_AXI_awaddr;
  input bit [7 : 0] S05_AXI_awlen;
  input bit [2 : 0] S05_AXI_awsize;
  input bit [1 : 0] S05_AXI_awburst;
  input bit [0 : 0] S05_AXI_awlock;
  input bit [3 : 0] S05_AXI_awcache;
  input bit [2 : 0] S05_AXI_awprot;
  input bit [3 : 0] S05_AXI_awqos;
  input bit S05_AXI_awvalid;
  output wire S05_AXI_awready;
  input bit [63 : 0] S05_AXI_wdata;
  input bit [7 : 0] S05_AXI_wstrb;
  input bit S05_AXI_wlast;
  input bit S05_AXI_wvalid;
  output wire S05_AXI_wready;
  output wire [1 : 0] S05_AXI_bresp;
  output wire S05_AXI_bvalid;
  input bit S05_AXI_bready;
  input bit [63 : 0] S05_AXI_araddr;
  input bit [7 : 0] S05_AXI_arlen;
  input bit [2 : 0] S05_AXI_arsize;
  input bit [1 : 0] S05_AXI_arburst;
  input bit [0 : 0] S05_AXI_arlock;
  input bit [3 : 0] S05_AXI_arcache;
  input bit [2 : 0] S05_AXI_arprot;
  input bit [3 : 0] S05_AXI_arqos;
  input bit S05_AXI_arvalid;
  output wire S05_AXI_arready;
  output wire [63 : 0] S05_AXI_rdata;
  output wire [1 : 0] S05_AXI_rresp;
  output wire S05_AXI_rlast;
  output wire S05_AXI_rvalid;
  input bit S05_AXI_rready;
  input bit [63 : 0] S06_AXI_awaddr;
  input bit [7 : 0] S06_AXI_awlen;
  input bit [2 : 0] S06_AXI_awsize;
  input bit [1 : 0] S06_AXI_awburst;
  input bit [0 : 0] S06_AXI_awlock;
  input bit [3 : 0] S06_AXI_awcache;
  input bit [2 : 0] S06_AXI_awprot;
  input bit [3 : 0] S06_AXI_awqos;
  input bit S06_AXI_awvalid;
  output wire S06_AXI_awready;
  input bit [63 : 0] S06_AXI_wdata;
  input bit [7 : 0] S06_AXI_wstrb;
  input bit S06_AXI_wlast;
  input bit S06_AXI_wvalid;
  output wire S06_AXI_wready;
  output wire [1 : 0] S06_AXI_bresp;
  output wire S06_AXI_bvalid;
  input bit S06_AXI_bready;
  input bit [63 : 0] S06_AXI_araddr;
  input bit [7 : 0] S06_AXI_arlen;
  input bit [2 : 0] S06_AXI_arsize;
  input bit [1 : 0] S06_AXI_arburst;
  input bit [0 : 0] S06_AXI_arlock;
  input bit [3 : 0] S06_AXI_arcache;
  input bit [2 : 0] S06_AXI_arprot;
  input bit [3 : 0] S06_AXI_arqos;
  input bit S06_AXI_arvalid;
  output wire S06_AXI_arready;
  output wire [63 : 0] S06_AXI_rdata;
  output wire [1 : 0] S06_AXI_rresp;
  output wire S06_AXI_rlast;
  output wire S06_AXI_rvalid;
  input bit S06_AXI_rready;
  input bit [63 : 0] S07_AXI_awaddr;
  input bit [7 : 0] S07_AXI_awlen;
  input bit [2 : 0] S07_AXI_awsize;
  input bit [1 : 0] S07_AXI_awburst;
  input bit [0 : 0] S07_AXI_awlock;
  input bit [3 : 0] S07_AXI_awcache;
  input bit [2 : 0] S07_AXI_awprot;
  input bit [3 : 0] S07_AXI_awqos;
  input bit S07_AXI_awvalid;
  output wire S07_AXI_awready;
  input bit [63 : 0] S07_AXI_wdata;
  input bit [7 : 0] S07_AXI_wstrb;
  input bit S07_AXI_wlast;
  input bit S07_AXI_wvalid;
  output wire S07_AXI_wready;
  output wire [1 : 0] S07_AXI_bresp;
  output wire S07_AXI_bvalid;
  input bit S07_AXI_bready;
  input bit [63 : 0] S07_AXI_araddr;
  input bit [7 : 0] S07_AXI_arlen;
  input bit [2 : 0] S07_AXI_arsize;
  input bit [1 : 0] S07_AXI_arburst;
  input bit [0 : 0] S07_AXI_arlock;
  input bit [3 : 0] S07_AXI_arcache;
  input bit [2 : 0] S07_AXI_arprot;
  input bit [3 : 0] S07_AXI_arqos;
  input bit S07_AXI_arvalid;
  output wire S07_AXI_arready;
  output wire [63 : 0] S07_AXI_rdata;
  output wire [1 : 0] S07_AXI_rresp;
  output wire S07_AXI_rlast;
  output wire S07_AXI_rvalid;
  input bit S07_AXI_rready;
  output wire [48 : 0] M00_AXI_awaddr;
  output wire [7 : 0] M00_AXI_awlen;
  output wire [2 : 0] M00_AXI_awsize;
  output wire [1 : 0] M00_AXI_awburst;
  output wire [0 : 0] M00_AXI_awlock;
  output wire [3 : 0] M00_AXI_awcache;
  output wire [2 : 0] M00_AXI_awprot;
  output wire [3 : 0] M00_AXI_awqos;
  output wire M00_AXI_awvalid;
  input bit M00_AXI_awready;
  output wire [127 : 0] M00_AXI_wdata;
  output wire [15 : 0] M00_AXI_wstrb;
  output wire M00_AXI_wlast;
  output wire M00_AXI_wvalid;
  input bit M00_AXI_wready;
  input bit [1 : 0] M00_AXI_bresp;
  input bit M00_AXI_bvalid;
  output wire M00_AXI_bready;
  output wire [48 : 0] M00_AXI_araddr;
  output wire [7 : 0] M00_AXI_arlen;
  output wire [2 : 0] M00_AXI_arsize;
  output wire [1 : 0] M00_AXI_arburst;
  output wire [0 : 0] M00_AXI_arlock;
  output wire [3 : 0] M00_AXI_arcache;
  output wire [2 : 0] M00_AXI_arprot;
  output wire [3 : 0] M00_AXI_arqos;
  output wire M00_AXI_arvalid;
  input bit M00_AXI_arready;
  input bit [127 : 0] M00_AXI_rdata;
  input bit [1 : 0] M00_AXI_rresp;
  input bit M00_AXI_rlast;
  input bit M00_AXI_rvalid;
  output wire M00_AXI_rready;
endmodule
`endif
