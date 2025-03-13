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


#include "system_axi_smc_9_sc.h"

#include "system_axi_smc_9.h"

#include "smartconnect.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
system_axi_smc_9::system_axi_smc_9(const sc_core::sc_module_name& nm) : system_axi_smc_9_sc(nm), aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S01_AXI_awaddr("S01_AXI_awaddr"), S01_AXI_awlen("S01_AXI_awlen"), S01_AXI_awsize("S01_AXI_awsize"), S01_AXI_awburst("S01_AXI_awburst"), S01_AXI_awlock("S01_AXI_awlock"), S01_AXI_awcache("S01_AXI_awcache"), S01_AXI_awprot("S01_AXI_awprot"), S01_AXI_awqos("S01_AXI_awqos"), S01_AXI_awvalid("S01_AXI_awvalid"), S01_AXI_awready("S01_AXI_awready"), S01_AXI_wdata("S01_AXI_wdata"), S01_AXI_wstrb("S01_AXI_wstrb"), S01_AXI_wlast("S01_AXI_wlast"), S01_AXI_wvalid("S01_AXI_wvalid"), S01_AXI_wready("S01_AXI_wready"), S01_AXI_bresp("S01_AXI_bresp"), S01_AXI_bvalid("S01_AXI_bvalid"), S01_AXI_bready("S01_AXI_bready"), S02_AXI_awaddr("S02_AXI_awaddr"), S02_AXI_awlen("S02_AXI_awlen"), S02_AXI_awsize("S02_AXI_awsize"), S02_AXI_awburst("S02_AXI_awburst"), S02_AXI_awlock("S02_AXI_awlock"), S02_AXI_awcache("S02_AXI_awcache"), S02_AXI_awprot("S02_AXI_awprot"), S02_AXI_awqos("S02_AXI_awqos"), S02_AXI_awvalid("S02_AXI_awvalid"), S02_AXI_awready("S02_AXI_awready"), S02_AXI_wdata("S02_AXI_wdata"), S02_AXI_wstrb("S02_AXI_wstrb"), S02_AXI_wlast("S02_AXI_wlast"), S02_AXI_wvalid("S02_AXI_wvalid"), S02_AXI_wready("S02_AXI_wready"), S02_AXI_bresp("S02_AXI_bresp"), S02_AXI_bvalid("S02_AXI_bvalid"), S02_AXI_bready("S02_AXI_bready"), S03_AXI_araddr("S03_AXI_araddr"), S03_AXI_arlen("S03_AXI_arlen"), S03_AXI_arsize("S03_AXI_arsize"), S03_AXI_arburst("S03_AXI_arburst"), S03_AXI_arlock("S03_AXI_arlock"), S03_AXI_arcache("S03_AXI_arcache"), S03_AXI_arprot("S03_AXI_arprot"), S03_AXI_arqos("S03_AXI_arqos"), S03_AXI_arvalid("S03_AXI_arvalid"), S03_AXI_arready("S03_AXI_arready"), S03_AXI_rdata("S03_AXI_rdata"), S03_AXI_rresp("S03_AXI_rresp"), S03_AXI_rlast("S03_AXI_rlast"), S03_AXI_rvalid("S03_AXI_rvalid"), S03_AXI_rready("S03_AXI_rready"), S04_AXI_awaddr("S04_AXI_awaddr"), S04_AXI_awlen("S04_AXI_awlen"), S04_AXI_awsize("S04_AXI_awsize"), S04_AXI_awburst("S04_AXI_awburst"), S04_AXI_awlock("S04_AXI_awlock"), S04_AXI_awcache("S04_AXI_awcache"), S04_AXI_awprot("S04_AXI_awprot"), S04_AXI_awqos("S04_AXI_awqos"), S04_AXI_awvalid("S04_AXI_awvalid"), S04_AXI_awready("S04_AXI_awready"), S04_AXI_wdata("S04_AXI_wdata"), S04_AXI_wstrb("S04_AXI_wstrb"), S04_AXI_wlast("S04_AXI_wlast"), S04_AXI_wvalid("S04_AXI_wvalid"), S04_AXI_wready("S04_AXI_wready"), S04_AXI_bresp("S04_AXI_bresp"), S04_AXI_bvalid("S04_AXI_bvalid"), S04_AXI_bready("S04_AXI_bready"), S04_AXI_araddr("S04_AXI_araddr"), S04_AXI_arlen("S04_AXI_arlen"), S04_AXI_arsize("S04_AXI_arsize"), S04_AXI_arburst("S04_AXI_arburst"), S04_AXI_arlock("S04_AXI_arlock"), S04_AXI_arcache("S04_AXI_arcache"), S04_AXI_arprot("S04_AXI_arprot"), S04_AXI_arqos("S04_AXI_arqos"), S04_AXI_arvalid("S04_AXI_arvalid"), S04_AXI_arready("S04_AXI_arready"), S04_AXI_rdata("S04_AXI_rdata"), S04_AXI_rresp("S04_AXI_rresp"), S04_AXI_rlast("S04_AXI_rlast"), S04_AXI_rvalid("S04_AXI_rvalid"), S04_AXI_rready("S04_AXI_rready"), S05_AXI_awaddr("S05_AXI_awaddr"), S05_AXI_awlen("S05_AXI_awlen"), S05_AXI_awsize("S05_AXI_awsize"), S05_AXI_awburst("S05_AXI_awburst"), S05_AXI_awlock("S05_AXI_awlock"), S05_AXI_awcache("S05_AXI_awcache"), S05_AXI_awprot("S05_AXI_awprot"), S05_AXI_awqos("S05_AXI_awqos"), S05_AXI_awvalid("S05_AXI_awvalid"), S05_AXI_awready("S05_AXI_awready"), S05_AXI_wdata("S05_AXI_wdata"), S05_AXI_wstrb("S05_AXI_wstrb"), S05_AXI_wlast("S05_AXI_wlast"), S05_AXI_wvalid("S05_AXI_wvalid"), S05_AXI_wready("S05_AXI_wready"), S05_AXI_bresp("S05_AXI_bresp"), S05_AXI_bvalid("S05_AXI_bvalid"), S05_AXI_bready("S05_AXI_bready"), S05_AXI_araddr("S05_AXI_araddr"), S05_AXI_arlen("S05_AXI_arlen"), S05_AXI_arsize("S05_AXI_arsize"), S05_AXI_arburst("S05_AXI_arburst"), S05_AXI_arlock("S05_AXI_arlock"), S05_AXI_arcache("S05_AXI_arcache"), S05_AXI_arprot("S05_AXI_arprot"), S05_AXI_arqos("S05_AXI_arqos"), S05_AXI_arvalid("S05_AXI_arvalid"), S05_AXI_arready("S05_AXI_arready"), S05_AXI_rdata("S05_AXI_rdata"), S05_AXI_rresp("S05_AXI_rresp"), S05_AXI_rlast("S05_AXI_rlast"), S05_AXI_rvalid("S05_AXI_rvalid"), S05_AXI_rready("S05_AXI_rready"), S06_AXI_awaddr("S06_AXI_awaddr"), S06_AXI_awlen("S06_AXI_awlen"), S06_AXI_awsize("S06_AXI_awsize"), S06_AXI_awburst("S06_AXI_awburst"), S06_AXI_awlock("S06_AXI_awlock"), S06_AXI_awcache("S06_AXI_awcache"), S06_AXI_awprot("S06_AXI_awprot"), S06_AXI_awqos("S06_AXI_awqos"), S06_AXI_awvalid("S06_AXI_awvalid"), S06_AXI_awready("S06_AXI_awready"), S06_AXI_wdata("S06_AXI_wdata"), S06_AXI_wstrb("S06_AXI_wstrb"), S06_AXI_wlast("S06_AXI_wlast"), S06_AXI_wvalid("S06_AXI_wvalid"), S06_AXI_wready("S06_AXI_wready"), S06_AXI_bresp("S06_AXI_bresp"), S06_AXI_bvalid("S06_AXI_bvalid"), S06_AXI_bready("S06_AXI_bready"), S06_AXI_araddr("S06_AXI_araddr"), S06_AXI_arlen("S06_AXI_arlen"), S06_AXI_arsize("S06_AXI_arsize"), S06_AXI_arburst("S06_AXI_arburst"), S06_AXI_arlock("S06_AXI_arlock"), S06_AXI_arcache("S06_AXI_arcache"), S06_AXI_arprot("S06_AXI_arprot"), S06_AXI_arqos("S06_AXI_arqos"), S06_AXI_arvalid("S06_AXI_arvalid"), S06_AXI_arready("S06_AXI_arready"), S06_AXI_rdata("S06_AXI_rdata"), S06_AXI_rresp("S06_AXI_rresp"), S06_AXI_rlast("S06_AXI_rlast"), S06_AXI_rvalid("S06_AXI_rvalid"), S06_AXI_rready("S06_AXI_rready"), S07_AXI_awaddr("S07_AXI_awaddr"), S07_AXI_awlen("S07_AXI_awlen"), S07_AXI_awsize("S07_AXI_awsize"), S07_AXI_awburst("S07_AXI_awburst"), S07_AXI_awlock("S07_AXI_awlock"), S07_AXI_awcache("S07_AXI_awcache"), S07_AXI_awprot("S07_AXI_awprot"), S07_AXI_awqos("S07_AXI_awqos"), S07_AXI_awvalid("S07_AXI_awvalid"), S07_AXI_awready("S07_AXI_awready"), S07_AXI_wdata("S07_AXI_wdata"), S07_AXI_wstrb("S07_AXI_wstrb"), S07_AXI_wlast("S07_AXI_wlast"), S07_AXI_wvalid("S07_AXI_wvalid"), S07_AXI_wready("S07_AXI_wready"), S07_AXI_bresp("S07_AXI_bresp"), S07_AXI_bvalid("S07_AXI_bvalid"), S07_AXI_bready("S07_AXI_bready"), S07_AXI_araddr("S07_AXI_araddr"), S07_AXI_arlen("S07_AXI_arlen"), S07_AXI_arsize("S07_AXI_arsize"), S07_AXI_arburst("S07_AXI_arburst"), S07_AXI_arlock("S07_AXI_arlock"), S07_AXI_arcache("S07_AXI_arcache"), S07_AXI_arprot("S07_AXI_arprot"), S07_AXI_arqos("S07_AXI_arqos"), S07_AXI_arvalid("S07_AXI_arvalid"), S07_AXI_arready("S07_AXI_arready"), S07_AXI_rdata("S07_AXI_rdata"), S07_AXI_rresp("S07_AXI_rresp"), S07_AXI_rlast("S07_AXI_rlast"), S07_AXI_rvalid("S07_AXI_rvalid"), S07_AXI_rready("S07_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awlen("M00_AXI_awlen"), M00_AXI_awsize("M00_AXI_awsize"), M00_AXI_awburst("M00_AXI_awburst"), M00_AXI_awlock("M00_AXI_awlock"), M00_AXI_awcache("M00_AXI_awcache"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awqos("M00_AXI_awqos"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wlast("M00_AXI_wlast"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arlen("M00_AXI_arlen"), M00_AXI_arsize("M00_AXI_arsize"), M00_AXI_arburst("M00_AXI_arburst"), M00_AXI_arlock("M00_AXI_arlock"), M00_AXI_arcache("M00_AXI_arcache"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arqos("M00_AXI_arqos"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rlast("M00_AXI_rlast"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"),mp_S00_AXI_rd_socket_stub(nullptr),mp_S01_AXI_rd_socket_stub(nullptr),mp_S02_AXI_rd_socket_stub(nullptr),mp_S03_AXI_wr_socket_stub(nullptr)
{

  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S01_AXI_transactor = NULL;
  mp_S01_AXI_awlock_converter = NULL;
  mp_S02_AXI_transactor = NULL;
  mp_S02_AXI_awlock_converter = NULL;
  mp_S03_AXI_transactor = NULL;
  mp_S03_AXI_arlock_converter = NULL;
  mp_S04_AXI_transactor = NULL;
  mp_S04_AXI_awlock_converter = NULL;
  mp_S04_AXI_arlock_converter = NULL;
  mp_S05_AXI_transactor = NULL;
  mp_S05_AXI_awlock_converter = NULL;
  mp_S05_AXI_arlock_converter = NULL;
  mp_S06_AXI_transactor = NULL;
  mp_S06_AXI_awlock_converter = NULL;
  mp_S06_AXI_arlock_converter = NULL;
  mp_S07_AXI_transactor = NULL;
  mp_S07_AXI_awlock_converter = NULL;
  mp_S07_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M00_AXI_awlock_converter = NULL;
  mp_M00_AXI_arlock_converter = NULL;

  // initialize socket stubs
  mp_S00_AXI_rd_socket_stub = NULL;
  mp_S01_AXI_rd_socket_stub = NULL;
  mp_S02_AXI_rd_socket_stub = NULL;
  mp_S03_AXI_wr_socket_stub = NULL;

}

void system_axi_smc_9::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S00_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S00_AXI' transactor parameters
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);

    // S00_AXI' transactor ports

    mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
    mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
    mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
    mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
    mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
    mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
    mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
    mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
    mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
    mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
    mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
    mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
    mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
    mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
    mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
    mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
    mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
    mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
    mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
    mp_S00_AXI_transactor->CLK(aclk);
    mp_S00_AXI_transactor->RST(aresetn);

    // S00_AXI' transactor sockets

    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(mp_S00_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S01_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S01_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S01_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S01_AXI' transactor parameters
    xsc::common_cpp::properties S01_AXI_transactor_param_props;
    S01_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S01_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S01_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S01_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S01_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S01_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S01_AXI_transactor", S01_AXI_transactor_param_props);

    // S01_AXI' transactor ports

    mp_S01_AXI_transactor->AWADDR(S01_AXI_awaddr);
    mp_S01_AXI_transactor->AWLEN(S01_AXI_awlen);
    mp_S01_AXI_transactor->AWSIZE(S01_AXI_awsize);
    mp_S01_AXI_transactor->AWBURST(S01_AXI_awburst);
    mp_S01_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S01_AXI_awlock_converter");
    mp_S01_AXI_awlock_converter->vector_in(S01_AXI_awlock);
    mp_S01_AXI_awlock_converter->scalar_out(m_S01_AXI_awlock_converter_signal);
    mp_S01_AXI_transactor->AWLOCK(m_S01_AXI_awlock_converter_signal);
    mp_S01_AXI_transactor->AWCACHE(S01_AXI_awcache);
    mp_S01_AXI_transactor->AWPROT(S01_AXI_awprot);
    mp_S01_AXI_transactor->AWQOS(S01_AXI_awqos);
    mp_S01_AXI_transactor->AWVALID(S01_AXI_awvalid);
    mp_S01_AXI_transactor->AWREADY(S01_AXI_awready);
    mp_S01_AXI_transactor->WDATA(S01_AXI_wdata);
    mp_S01_AXI_transactor->WSTRB(S01_AXI_wstrb);
    mp_S01_AXI_transactor->WLAST(S01_AXI_wlast);
    mp_S01_AXI_transactor->WVALID(S01_AXI_wvalid);
    mp_S01_AXI_transactor->WREADY(S01_AXI_wready);
    mp_S01_AXI_transactor->BRESP(S01_AXI_bresp);
    mp_S01_AXI_transactor->BVALID(S01_AXI_bvalid);
    mp_S01_AXI_transactor->BREADY(S01_AXI_bready);
    mp_S01_AXI_transactor->CLK(aclk);
    mp_S01_AXI_transactor->RST(aresetn);

    // S01_AXI' transactor sockets

    mp_impl->S01_AXI_tlm_aximm_read_socket->bind(mp_S01_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S01_AXI_tlm_aximm_write_socket->bind(*(mp_S01_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S02_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S02_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S02_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S02_AXI' transactor parameters
    xsc::common_cpp::properties S02_AXI_transactor_param_props;
    S02_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S02_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S02_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S02_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S02_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S02_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S02_AXI_transactor", S02_AXI_transactor_param_props);

    // S02_AXI' transactor ports

    mp_S02_AXI_transactor->AWADDR(S02_AXI_awaddr);
    mp_S02_AXI_transactor->AWLEN(S02_AXI_awlen);
    mp_S02_AXI_transactor->AWSIZE(S02_AXI_awsize);
    mp_S02_AXI_transactor->AWBURST(S02_AXI_awburst);
    mp_S02_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S02_AXI_awlock_converter");
    mp_S02_AXI_awlock_converter->vector_in(S02_AXI_awlock);
    mp_S02_AXI_awlock_converter->scalar_out(m_S02_AXI_awlock_converter_signal);
    mp_S02_AXI_transactor->AWLOCK(m_S02_AXI_awlock_converter_signal);
    mp_S02_AXI_transactor->AWCACHE(S02_AXI_awcache);
    mp_S02_AXI_transactor->AWPROT(S02_AXI_awprot);
    mp_S02_AXI_transactor->AWQOS(S02_AXI_awqos);
    mp_S02_AXI_transactor->AWVALID(S02_AXI_awvalid);
    mp_S02_AXI_transactor->AWREADY(S02_AXI_awready);
    mp_S02_AXI_transactor->WDATA(S02_AXI_wdata);
    mp_S02_AXI_transactor->WSTRB(S02_AXI_wstrb);
    mp_S02_AXI_transactor->WLAST(S02_AXI_wlast);
    mp_S02_AXI_transactor->WVALID(S02_AXI_wvalid);
    mp_S02_AXI_transactor->WREADY(S02_AXI_wready);
    mp_S02_AXI_transactor->BRESP(S02_AXI_bresp);
    mp_S02_AXI_transactor->BVALID(S02_AXI_bvalid);
    mp_S02_AXI_transactor->BREADY(S02_AXI_bready);
    mp_S02_AXI_transactor->CLK(aclk);
    mp_S02_AXI_transactor->RST(aresetn);

    // S02_AXI' transactor sockets

    mp_impl->S02_AXI_tlm_aximm_read_socket->bind(mp_S02_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S02_AXI_tlm_aximm_write_socket->bind(*(mp_S02_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S03_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S03_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S03_AXI_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket", 0);

  // 'S03_AXI' transactor parameters
    xsc::common_cpp::properties S03_AXI_transactor_param_props;
    S03_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S03_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S03_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S03_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S03_AXI_transactor_param_props.addLong("HAS_WSTRB", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BRESP", "0");
    S03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S03_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_ONLY");
    S03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S03_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S03_AXI_transactor", S03_AXI_transactor_param_props);

    // S03_AXI' transactor ports

    mp_S03_AXI_transactor->ARADDR(S03_AXI_araddr);
    mp_S03_AXI_transactor->ARLEN(S03_AXI_arlen);
    mp_S03_AXI_transactor->ARSIZE(S03_AXI_arsize);
    mp_S03_AXI_transactor->ARBURST(S03_AXI_arburst);
    mp_S03_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S03_AXI_arlock_converter");
    mp_S03_AXI_arlock_converter->vector_in(S03_AXI_arlock);
    mp_S03_AXI_arlock_converter->scalar_out(m_S03_AXI_arlock_converter_signal);
    mp_S03_AXI_transactor->ARLOCK(m_S03_AXI_arlock_converter_signal);
    mp_S03_AXI_transactor->ARCACHE(S03_AXI_arcache);
    mp_S03_AXI_transactor->ARPROT(S03_AXI_arprot);
    mp_S03_AXI_transactor->ARQOS(S03_AXI_arqos);
    mp_S03_AXI_transactor->ARVALID(S03_AXI_arvalid);
    mp_S03_AXI_transactor->ARREADY(S03_AXI_arready);
    mp_S03_AXI_transactor->RDATA(S03_AXI_rdata);
    mp_S03_AXI_transactor->RRESP(S03_AXI_rresp);
    mp_S03_AXI_transactor->RLAST(S03_AXI_rlast);
    mp_S03_AXI_transactor->RVALID(S03_AXI_rvalid);
    mp_S03_AXI_transactor->RREADY(S03_AXI_rready);
    mp_S03_AXI_transactor->CLK(aclk);
    mp_S03_AXI_transactor->RST(aresetn);

    // S03_AXI' transactor sockets

    mp_impl->S03_AXI_tlm_aximm_read_socket->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_impl->S03_AXI_tlm_aximm_write_socket->bind(mp_S03_AXI_wr_socket_stub->initiator_socket);
  }
  else
  {
  }

  // configure 'S04_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S04_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S04_AXI' transactor parameters
    xsc::common_cpp::properties S04_AXI_transactor_param_props;
    S04_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S04_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S04_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S04_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S04_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S04_AXI_transactor", S04_AXI_transactor_param_props);

    // S04_AXI' transactor ports

    mp_S04_AXI_transactor->AWADDR(S04_AXI_awaddr);
    mp_S04_AXI_transactor->AWLEN(S04_AXI_awlen);
    mp_S04_AXI_transactor->AWSIZE(S04_AXI_awsize);
    mp_S04_AXI_transactor->AWBURST(S04_AXI_awburst);
    mp_S04_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_awlock_converter");
    mp_S04_AXI_awlock_converter->vector_in(S04_AXI_awlock);
    mp_S04_AXI_awlock_converter->scalar_out(m_S04_AXI_awlock_converter_signal);
    mp_S04_AXI_transactor->AWLOCK(m_S04_AXI_awlock_converter_signal);
    mp_S04_AXI_transactor->AWCACHE(S04_AXI_awcache);
    mp_S04_AXI_transactor->AWPROT(S04_AXI_awprot);
    mp_S04_AXI_transactor->AWQOS(S04_AXI_awqos);
    mp_S04_AXI_transactor->AWVALID(S04_AXI_awvalid);
    mp_S04_AXI_transactor->AWREADY(S04_AXI_awready);
    mp_S04_AXI_transactor->WDATA(S04_AXI_wdata);
    mp_S04_AXI_transactor->WSTRB(S04_AXI_wstrb);
    mp_S04_AXI_transactor->WLAST(S04_AXI_wlast);
    mp_S04_AXI_transactor->WVALID(S04_AXI_wvalid);
    mp_S04_AXI_transactor->WREADY(S04_AXI_wready);
    mp_S04_AXI_transactor->BRESP(S04_AXI_bresp);
    mp_S04_AXI_transactor->BVALID(S04_AXI_bvalid);
    mp_S04_AXI_transactor->BREADY(S04_AXI_bready);
    mp_S04_AXI_transactor->ARADDR(S04_AXI_araddr);
    mp_S04_AXI_transactor->ARLEN(S04_AXI_arlen);
    mp_S04_AXI_transactor->ARSIZE(S04_AXI_arsize);
    mp_S04_AXI_transactor->ARBURST(S04_AXI_arburst);
    mp_S04_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_arlock_converter");
    mp_S04_AXI_arlock_converter->vector_in(S04_AXI_arlock);
    mp_S04_AXI_arlock_converter->scalar_out(m_S04_AXI_arlock_converter_signal);
    mp_S04_AXI_transactor->ARLOCK(m_S04_AXI_arlock_converter_signal);
    mp_S04_AXI_transactor->ARCACHE(S04_AXI_arcache);
    mp_S04_AXI_transactor->ARPROT(S04_AXI_arprot);
    mp_S04_AXI_transactor->ARQOS(S04_AXI_arqos);
    mp_S04_AXI_transactor->ARVALID(S04_AXI_arvalid);
    mp_S04_AXI_transactor->ARREADY(S04_AXI_arready);
    mp_S04_AXI_transactor->RDATA(S04_AXI_rdata);
    mp_S04_AXI_transactor->RRESP(S04_AXI_rresp);
    mp_S04_AXI_transactor->RLAST(S04_AXI_rlast);
    mp_S04_AXI_transactor->RVALID(S04_AXI_rvalid);
    mp_S04_AXI_transactor->RREADY(S04_AXI_rready);
    mp_S04_AXI_transactor->CLK(aclk1);
    mp_S04_AXI_transactor->RST(aresetn);

    // S04_AXI' transactor sockets

    mp_impl->S04_AXI_tlm_aximm_read_socket->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_impl->S04_AXI_tlm_aximm_write_socket->bind(*(mp_S04_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S05_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S05_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S05_AXI' transactor parameters
    xsc::common_cpp::properties S05_AXI_transactor_param_props;
    S05_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S05_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S05_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S05_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S05_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S05_AXI_transactor", S05_AXI_transactor_param_props);

    // S05_AXI' transactor ports

    mp_S05_AXI_transactor->AWADDR(S05_AXI_awaddr);
    mp_S05_AXI_transactor->AWLEN(S05_AXI_awlen);
    mp_S05_AXI_transactor->AWSIZE(S05_AXI_awsize);
    mp_S05_AXI_transactor->AWBURST(S05_AXI_awburst);
    mp_S05_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_awlock_converter");
    mp_S05_AXI_awlock_converter->vector_in(S05_AXI_awlock);
    mp_S05_AXI_awlock_converter->scalar_out(m_S05_AXI_awlock_converter_signal);
    mp_S05_AXI_transactor->AWLOCK(m_S05_AXI_awlock_converter_signal);
    mp_S05_AXI_transactor->AWCACHE(S05_AXI_awcache);
    mp_S05_AXI_transactor->AWPROT(S05_AXI_awprot);
    mp_S05_AXI_transactor->AWQOS(S05_AXI_awqos);
    mp_S05_AXI_transactor->AWVALID(S05_AXI_awvalid);
    mp_S05_AXI_transactor->AWREADY(S05_AXI_awready);
    mp_S05_AXI_transactor->WDATA(S05_AXI_wdata);
    mp_S05_AXI_transactor->WSTRB(S05_AXI_wstrb);
    mp_S05_AXI_transactor->WLAST(S05_AXI_wlast);
    mp_S05_AXI_transactor->WVALID(S05_AXI_wvalid);
    mp_S05_AXI_transactor->WREADY(S05_AXI_wready);
    mp_S05_AXI_transactor->BRESP(S05_AXI_bresp);
    mp_S05_AXI_transactor->BVALID(S05_AXI_bvalid);
    mp_S05_AXI_transactor->BREADY(S05_AXI_bready);
    mp_S05_AXI_transactor->ARADDR(S05_AXI_araddr);
    mp_S05_AXI_transactor->ARLEN(S05_AXI_arlen);
    mp_S05_AXI_transactor->ARSIZE(S05_AXI_arsize);
    mp_S05_AXI_transactor->ARBURST(S05_AXI_arburst);
    mp_S05_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_arlock_converter");
    mp_S05_AXI_arlock_converter->vector_in(S05_AXI_arlock);
    mp_S05_AXI_arlock_converter->scalar_out(m_S05_AXI_arlock_converter_signal);
    mp_S05_AXI_transactor->ARLOCK(m_S05_AXI_arlock_converter_signal);
    mp_S05_AXI_transactor->ARCACHE(S05_AXI_arcache);
    mp_S05_AXI_transactor->ARPROT(S05_AXI_arprot);
    mp_S05_AXI_transactor->ARQOS(S05_AXI_arqos);
    mp_S05_AXI_transactor->ARVALID(S05_AXI_arvalid);
    mp_S05_AXI_transactor->ARREADY(S05_AXI_arready);
    mp_S05_AXI_transactor->RDATA(S05_AXI_rdata);
    mp_S05_AXI_transactor->RRESP(S05_AXI_rresp);
    mp_S05_AXI_transactor->RLAST(S05_AXI_rlast);
    mp_S05_AXI_transactor->RVALID(S05_AXI_rvalid);
    mp_S05_AXI_transactor->RREADY(S05_AXI_rready);
    mp_S05_AXI_transactor->CLK(aclk1);
    mp_S05_AXI_transactor->RST(aresetn);

    // S05_AXI' transactor sockets

    mp_impl->S05_AXI_tlm_aximm_read_socket->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_impl->S05_AXI_tlm_aximm_write_socket->bind(*(mp_S05_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S06_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S06_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S06_AXI' transactor parameters
    xsc::common_cpp::properties S06_AXI_transactor_param_props;
    S06_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S06_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S06_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S06_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S06_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S06_AXI_transactor", S06_AXI_transactor_param_props);

    // S06_AXI' transactor ports

    mp_S06_AXI_transactor->AWADDR(S06_AXI_awaddr);
    mp_S06_AXI_transactor->AWLEN(S06_AXI_awlen);
    mp_S06_AXI_transactor->AWSIZE(S06_AXI_awsize);
    mp_S06_AXI_transactor->AWBURST(S06_AXI_awburst);
    mp_S06_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_awlock_converter");
    mp_S06_AXI_awlock_converter->vector_in(S06_AXI_awlock);
    mp_S06_AXI_awlock_converter->scalar_out(m_S06_AXI_awlock_converter_signal);
    mp_S06_AXI_transactor->AWLOCK(m_S06_AXI_awlock_converter_signal);
    mp_S06_AXI_transactor->AWCACHE(S06_AXI_awcache);
    mp_S06_AXI_transactor->AWPROT(S06_AXI_awprot);
    mp_S06_AXI_transactor->AWQOS(S06_AXI_awqos);
    mp_S06_AXI_transactor->AWVALID(S06_AXI_awvalid);
    mp_S06_AXI_transactor->AWREADY(S06_AXI_awready);
    mp_S06_AXI_transactor->WDATA(S06_AXI_wdata);
    mp_S06_AXI_transactor->WSTRB(S06_AXI_wstrb);
    mp_S06_AXI_transactor->WLAST(S06_AXI_wlast);
    mp_S06_AXI_transactor->WVALID(S06_AXI_wvalid);
    mp_S06_AXI_transactor->WREADY(S06_AXI_wready);
    mp_S06_AXI_transactor->BRESP(S06_AXI_bresp);
    mp_S06_AXI_transactor->BVALID(S06_AXI_bvalid);
    mp_S06_AXI_transactor->BREADY(S06_AXI_bready);
    mp_S06_AXI_transactor->ARADDR(S06_AXI_araddr);
    mp_S06_AXI_transactor->ARLEN(S06_AXI_arlen);
    mp_S06_AXI_transactor->ARSIZE(S06_AXI_arsize);
    mp_S06_AXI_transactor->ARBURST(S06_AXI_arburst);
    mp_S06_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_arlock_converter");
    mp_S06_AXI_arlock_converter->vector_in(S06_AXI_arlock);
    mp_S06_AXI_arlock_converter->scalar_out(m_S06_AXI_arlock_converter_signal);
    mp_S06_AXI_transactor->ARLOCK(m_S06_AXI_arlock_converter_signal);
    mp_S06_AXI_transactor->ARCACHE(S06_AXI_arcache);
    mp_S06_AXI_transactor->ARPROT(S06_AXI_arprot);
    mp_S06_AXI_transactor->ARQOS(S06_AXI_arqos);
    mp_S06_AXI_transactor->ARVALID(S06_AXI_arvalid);
    mp_S06_AXI_transactor->ARREADY(S06_AXI_arready);
    mp_S06_AXI_transactor->RDATA(S06_AXI_rdata);
    mp_S06_AXI_transactor->RRESP(S06_AXI_rresp);
    mp_S06_AXI_transactor->RLAST(S06_AXI_rlast);
    mp_S06_AXI_transactor->RVALID(S06_AXI_rvalid);
    mp_S06_AXI_transactor->RREADY(S06_AXI_rready);
    mp_S06_AXI_transactor->CLK(aclk1);
    mp_S06_AXI_transactor->RST(aresetn);

    // S06_AXI' transactor sockets

    mp_impl->S06_AXI_tlm_aximm_read_socket->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_impl->S06_AXI_tlm_aximm_write_socket->bind(*(mp_S06_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S07_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S07_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S07_AXI' transactor parameters
    xsc::common_cpp::properties S07_AXI_transactor_param_props;
    S07_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S07_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S07_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S07_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S07_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S07_AXI_transactor", S07_AXI_transactor_param_props);

    // S07_AXI' transactor ports

    mp_S07_AXI_transactor->AWADDR(S07_AXI_awaddr);
    mp_S07_AXI_transactor->AWLEN(S07_AXI_awlen);
    mp_S07_AXI_transactor->AWSIZE(S07_AXI_awsize);
    mp_S07_AXI_transactor->AWBURST(S07_AXI_awburst);
    mp_S07_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_awlock_converter");
    mp_S07_AXI_awlock_converter->vector_in(S07_AXI_awlock);
    mp_S07_AXI_awlock_converter->scalar_out(m_S07_AXI_awlock_converter_signal);
    mp_S07_AXI_transactor->AWLOCK(m_S07_AXI_awlock_converter_signal);
    mp_S07_AXI_transactor->AWCACHE(S07_AXI_awcache);
    mp_S07_AXI_transactor->AWPROT(S07_AXI_awprot);
    mp_S07_AXI_transactor->AWQOS(S07_AXI_awqos);
    mp_S07_AXI_transactor->AWVALID(S07_AXI_awvalid);
    mp_S07_AXI_transactor->AWREADY(S07_AXI_awready);
    mp_S07_AXI_transactor->WDATA(S07_AXI_wdata);
    mp_S07_AXI_transactor->WSTRB(S07_AXI_wstrb);
    mp_S07_AXI_transactor->WLAST(S07_AXI_wlast);
    mp_S07_AXI_transactor->WVALID(S07_AXI_wvalid);
    mp_S07_AXI_transactor->WREADY(S07_AXI_wready);
    mp_S07_AXI_transactor->BRESP(S07_AXI_bresp);
    mp_S07_AXI_transactor->BVALID(S07_AXI_bvalid);
    mp_S07_AXI_transactor->BREADY(S07_AXI_bready);
    mp_S07_AXI_transactor->ARADDR(S07_AXI_araddr);
    mp_S07_AXI_transactor->ARLEN(S07_AXI_arlen);
    mp_S07_AXI_transactor->ARSIZE(S07_AXI_arsize);
    mp_S07_AXI_transactor->ARBURST(S07_AXI_arburst);
    mp_S07_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_arlock_converter");
    mp_S07_AXI_arlock_converter->vector_in(S07_AXI_arlock);
    mp_S07_AXI_arlock_converter->scalar_out(m_S07_AXI_arlock_converter_signal);
    mp_S07_AXI_transactor->ARLOCK(m_S07_AXI_arlock_converter_signal);
    mp_S07_AXI_transactor->ARCACHE(S07_AXI_arcache);
    mp_S07_AXI_transactor->ARPROT(S07_AXI_arprot);
    mp_S07_AXI_transactor->ARQOS(S07_AXI_arqos);
    mp_S07_AXI_transactor->ARVALID(S07_AXI_arvalid);
    mp_S07_AXI_transactor->ARREADY(S07_AXI_arready);
    mp_S07_AXI_transactor->RDATA(S07_AXI_rdata);
    mp_S07_AXI_transactor->RRESP(S07_AXI_rresp);
    mp_S07_AXI_transactor->RLAST(S07_AXI_rlast);
    mp_S07_AXI_transactor->RVALID(S07_AXI_rvalid);
    mp_S07_AXI_transactor->RREADY(S07_AXI_rready);
    mp_S07_AXI_transactor->CLK(aclk1);
    mp_S07_AXI_transactor->RST(aresetn);

    // S07_AXI' transactor sockets

    mp_impl->S07_AXI_tlm_aximm_read_socket->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_impl->S07_AXI_tlm_aximm_write_socket->bind(*(mp_S07_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "M00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M00_AXI' transactor parameters
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "128");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "49");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "128");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<128,49,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);

    // M00_AXI' transactor ports

    mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
    mp_M00_AXI_transactor->AWLEN(M00_AXI_awlen);
    mp_M00_AXI_transactor->AWSIZE(M00_AXI_awsize);
    mp_M00_AXI_transactor->AWBURST(M00_AXI_awburst);
    mp_M00_AXI_awlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_awlock_converter");
    mp_M00_AXI_awlock_converter->scalar_in(m_M00_AXI_awlock_converter_signal);
    mp_M00_AXI_awlock_converter->vector_out(M00_AXI_awlock);
    mp_M00_AXI_transactor->AWLOCK(m_M00_AXI_awlock_converter_signal);
    mp_M00_AXI_transactor->AWCACHE(M00_AXI_awcache);
    mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
    mp_M00_AXI_transactor->AWQOS(M00_AXI_awqos);
    mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
    mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
    mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
    mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
    mp_M00_AXI_transactor->WLAST(M00_AXI_wlast);
    mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
    mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
    mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
    mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
    mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
    mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
    mp_M00_AXI_transactor->ARLEN(M00_AXI_arlen);
    mp_M00_AXI_transactor->ARSIZE(M00_AXI_arsize);
    mp_M00_AXI_transactor->ARBURST(M00_AXI_arburst);
    mp_M00_AXI_arlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_arlock_converter");
    mp_M00_AXI_arlock_converter->scalar_in(m_M00_AXI_arlock_converter_signal);
    mp_M00_AXI_arlock_converter->vector_out(M00_AXI_arlock);
    mp_M00_AXI_transactor->ARLOCK(m_M00_AXI_arlock_converter_signal);
    mp_M00_AXI_transactor->ARCACHE(M00_AXI_arcache);
    mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
    mp_M00_AXI_transactor->ARQOS(M00_AXI_arqos);
    mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
    mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
    mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
    mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
    mp_M00_AXI_transactor->RLAST(M00_AXI_rlast);
    mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
    mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
    mp_M00_AXI_transactor->CLK(aclk);
    mp_M00_AXI_transactor->RST(aresetn);

    // M00_AXI' transactor sockets

    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
system_axi_smc_9::system_axi_smc_9(const sc_core::sc_module_name& nm) : system_axi_smc_9_sc(nm), aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S01_AXI_awaddr("S01_AXI_awaddr"), S01_AXI_awlen("S01_AXI_awlen"), S01_AXI_awsize("S01_AXI_awsize"), S01_AXI_awburst("S01_AXI_awburst"), S01_AXI_awlock("S01_AXI_awlock"), S01_AXI_awcache("S01_AXI_awcache"), S01_AXI_awprot("S01_AXI_awprot"), S01_AXI_awqos("S01_AXI_awqos"), S01_AXI_awvalid("S01_AXI_awvalid"), S01_AXI_awready("S01_AXI_awready"), S01_AXI_wdata("S01_AXI_wdata"), S01_AXI_wstrb("S01_AXI_wstrb"), S01_AXI_wlast("S01_AXI_wlast"), S01_AXI_wvalid("S01_AXI_wvalid"), S01_AXI_wready("S01_AXI_wready"), S01_AXI_bresp("S01_AXI_bresp"), S01_AXI_bvalid("S01_AXI_bvalid"), S01_AXI_bready("S01_AXI_bready"), S02_AXI_awaddr("S02_AXI_awaddr"), S02_AXI_awlen("S02_AXI_awlen"), S02_AXI_awsize("S02_AXI_awsize"), S02_AXI_awburst("S02_AXI_awburst"), S02_AXI_awlock("S02_AXI_awlock"), S02_AXI_awcache("S02_AXI_awcache"), S02_AXI_awprot("S02_AXI_awprot"), S02_AXI_awqos("S02_AXI_awqos"), S02_AXI_awvalid("S02_AXI_awvalid"), S02_AXI_awready("S02_AXI_awready"), S02_AXI_wdata("S02_AXI_wdata"), S02_AXI_wstrb("S02_AXI_wstrb"), S02_AXI_wlast("S02_AXI_wlast"), S02_AXI_wvalid("S02_AXI_wvalid"), S02_AXI_wready("S02_AXI_wready"), S02_AXI_bresp("S02_AXI_bresp"), S02_AXI_bvalid("S02_AXI_bvalid"), S02_AXI_bready("S02_AXI_bready"), S03_AXI_araddr("S03_AXI_araddr"), S03_AXI_arlen("S03_AXI_arlen"), S03_AXI_arsize("S03_AXI_arsize"), S03_AXI_arburst("S03_AXI_arburst"), S03_AXI_arlock("S03_AXI_arlock"), S03_AXI_arcache("S03_AXI_arcache"), S03_AXI_arprot("S03_AXI_arprot"), S03_AXI_arqos("S03_AXI_arqos"), S03_AXI_arvalid("S03_AXI_arvalid"), S03_AXI_arready("S03_AXI_arready"), S03_AXI_rdata("S03_AXI_rdata"), S03_AXI_rresp("S03_AXI_rresp"), S03_AXI_rlast("S03_AXI_rlast"), S03_AXI_rvalid("S03_AXI_rvalid"), S03_AXI_rready("S03_AXI_rready"), S04_AXI_awaddr("S04_AXI_awaddr"), S04_AXI_awlen("S04_AXI_awlen"), S04_AXI_awsize("S04_AXI_awsize"), S04_AXI_awburst("S04_AXI_awburst"), S04_AXI_awlock("S04_AXI_awlock"), S04_AXI_awcache("S04_AXI_awcache"), S04_AXI_awprot("S04_AXI_awprot"), S04_AXI_awqos("S04_AXI_awqos"), S04_AXI_awvalid("S04_AXI_awvalid"), S04_AXI_awready("S04_AXI_awready"), S04_AXI_wdata("S04_AXI_wdata"), S04_AXI_wstrb("S04_AXI_wstrb"), S04_AXI_wlast("S04_AXI_wlast"), S04_AXI_wvalid("S04_AXI_wvalid"), S04_AXI_wready("S04_AXI_wready"), S04_AXI_bresp("S04_AXI_bresp"), S04_AXI_bvalid("S04_AXI_bvalid"), S04_AXI_bready("S04_AXI_bready"), S04_AXI_araddr("S04_AXI_araddr"), S04_AXI_arlen("S04_AXI_arlen"), S04_AXI_arsize("S04_AXI_arsize"), S04_AXI_arburst("S04_AXI_arburst"), S04_AXI_arlock("S04_AXI_arlock"), S04_AXI_arcache("S04_AXI_arcache"), S04_AXI_arprot("S04_AXI_arprot"), S04_AXI_arqos("S04_AXI_arqos"), S04_AXI_arvalid("S04_AXI_arvalid"), S04_AXI_arready("S04_AXI_arready"), S04_AXI_rdata("S04_AXI_rdata"), S04_AXI_rresp("S04_AXI_rresp"), S04_AXI_rlast("S04_AXI_rlast"), S04_AXI_rvalid("S04_AXI_rvalid"), S04_AXI_rready("S04_AXI_rready"), S05_AXI_awaddr("S05_AXI_awaddr"), S05_AXI_awlen("S05_AXI_awlen"), S05_AXI_awsize("S05_AXI_awsize"), S05_AXI_awburst("S05_AXI_awburst"), S05_AXI_awlock("S05_AXI_awlock"), S05_AXI_awcache("S05_AXI_awcache"), S05_AXI_awprot("S05_AXI_awprot"), S05_AXI_awqos("S05_AXI_awqos"), S05_AXI_awvalid("S05_AXI_awvalid"), S05_AXI_awready("S05_AXI_awready"), S05_AXI_wdata("S05_AXI_wdata"), S05_AXI_wstrb("S05_AXI_wstrb"), S05_AXI_wlast("S05_AXI_wlast"), S05_AXI_wvalid("S05_AXI_wvalid"), S05_AXI_wready("S05_AXI_wready"), S05_AXI_bresp("S05_AXI_bresp"), S05_AXI_bvalid("S05_AXI_bvalid"), S05_AXI_bready("S05_AXI_bready"), S05_AXI_araddr("S05_AXI_araddr"), S05_AXI_arlen("S05_AXI_arlen"), S05_AXI_arsize("S05_AXI_arsize"), S05_AXI_arburst("S05_AXI_arburst"), S05_AXI_arlock("S05_AXI_arlock"), S05_AXI_arcache("S05_AXI_arcache"), S05_AXI_arprot("S05_AXI_arprot"), S05_AXI_arqos("S05_AXI_arqos"), S05_AXI_arvalid("S05_AXI_arvalid"), S05_AXI_arready("S05_AXI_arready"), S05_AXI_rdata("S05_AXI_rdata"), S05_AXI_rresp("S05_AXI_rresp"), S05_AXI_rlast("S05_AXI_rlast"), S05_AXI_rvalid("S05_AXI_rvalid"), S05_AXI_rready("S05_AXI_rready"), S06_AXI_awaddr("S06_AXI_awaddr"), S06_AXI_awlen("S06_AXI_awlen"), S06_AXI_awsize("S06_AXI_awsize"), S06_AXI_awburst("S06_AXI_awburst"), S06_AXI_awlock("S06_AXI_awlock"), S06_AXI_awcache("S06_AXI_awcache"), S06_AXI_awprot("S06_AXI_awprot"), S06_AXI_awqos("S06_AXI_awqos"), S06_AXI_awvalid("S06_AXI_awvalid"), S06_AXI_awready("S06_AXI_awready"), S06_AXI_wdata("S06_AXI_wdata"), S06_AXI_wstrb("S06_AXI_wstrb"), S06_AXI_wlast("S06_AXI_wlast"), S06_AXI_wvalid("S06_AXI_wvalid"), S06_AXI_wready("S06_AXI_wready"), S06_AXI_bresp("S06_AXI_bresp"), S06_AXI_bvalid("S06_AXI_bvalid"), S06_AXI_bready("S06_AXI_bready"), S06_AXI_araddr("S06_AXI_araddr"), S06_AXI_arlen("S06_AXI_arlen"), S06_AXI_arsize("S06_AXI_arsize"), S06_AXI_arburst("S06_AXI_arburst"), S06_AXI_arlock("S06_AXI_arlock"), S06_AXI_arcache("S06_AXI_arcache"), S06_AXI_arprot("S06_AXI_arprot"), S06_AXI_arqos("S06_AXI_arqos"), S06_AXI_arvalid("S06_AXI_arvalid"), S06_AXI_arready("S06_AXI_arready"), S06_AXI_rdata("S06_AXI_rdata"), S06_AXI_rresp("S06_AXI_rresp"), S06_AXI_rlast("S06_AXI_rlast"), S06_AXI_rvalid("S06_AXI_rvalid"), S06_AXI_rready("S06_AXI_rready"), S07_AXI_awaddr("S07_AXI_awaddr"), S07_AXI_awlen("S07_AXI_awlen"), S07_AXI_awsize("S07_AXI_awsize"), S07_AXI_awburst("S07_AXI_awburst"), S07_AXI_awlock("S07_AXI_awlock"), S07_AXI_awcache("S07_AXI_awcache"), S07_AXI_awprot("S07_AXI_awprot"), S07_AXI_awqos("S07_AXI_awqos"), S07_AXI_awvalid("S07_AXI_awvalid"), S07_AXI_awready("S07_AXI_awready"), S07_AXI_wdata("S07_AXI_wdata"), S07_AXI_wstrb("S07_AXI_wstrb"), S07_AXI_wlast("S07_AXI_wlast"), S07_AXI_wvalid("S07_AXI_wvalid"), S07_AXI_wready("S07_AXI_wready"), S07_AXI_bresp("S07_AXI_bresp"), S07_AXI_bvalid("S07_AXI_bvalid"), S07_AXI_bready("S07_AXI_bready"), S07_AXI_araddr("S07_AXI_araddr"), S07_AXI_arlen("S07_AXI_arlen"), S07_AXI_arsize("S07_AXI_arsize"), S07_AXI_arburst("S07_AXI_arburst"), S07_AXI_arlock("S07_AXI_arlock"), S07_AXI_arcache("S07_AXI_arcache"), S07_AXI_arprot("S07_AXI_arprot"), S07_AXI_arqos("S07_AXI_arqos"), S07_AXI_arvalid("S07_AXI_arvalid"), S07_AXI_arready("S07_AXI_arready"), S07_AXI_rdata("S07_AXI_rdata"), S07_AXI_rresp("S07_AXI_rresp"), S07_AXI_rlast("S07_AXI_rlast"), S07_AXI_rvalid("S07_AXI_rvalid"), S07_AXI_rready("S07_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awlen("M00_AXI_awlen"), M00_AXI_awsize("M00_AXI_awsize"), M00_AXI_awburst("M00_AXI_awburst"), M00_AXI_awlock("M00_AXI_awlock"), M00_AXI_awcache("M00_AXI_awcache"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awqos("M00_AXI_awqos"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wlast("M00_AXI_wlast"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arlen("M00_AXI_arlen"), M00_AXI_arsize("M00_AXI_arsize"), M00_AXI_arburst("M00_AXI_arburst"), M00_AXI_arlock("M00_AXI_arlock"), M00_AXI_arcache("M00_AXI_arcache"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arqos("M00_AXI_arqos"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rlast("M00_AXI_rlast"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"),mp_S00_AXI_rd_socket_stub(nullptr),mp_S01_AXI_rd_socket_stub(nullptr),mp_S02_AXI_rd_socket_stub(nullptr),mp_S03_AXI_wr_socket_stub(nullptr)
{

  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S01_AXI_transactor = NULL;
  mp_S01_AXI_awlock_converter = NULL;
  mp_S02_AXI_transactor = NULL;
  mp_S02_AXI_awlock_converter = NULL;
  mp_S03_AXI_transactor = NULL;
  mp_S03_AXI_arlock_converter = NULL;
  mp_S04_AXI_transactor = NULL;
  mp_S04_AXI_awlock_converter = NULL;
  mp_S04_AXI_arlock_converter = NULL;
  mp_S05_AXI_transactor = NULL;
  mp_S05_AXI_awlock_converter = NULL;
  mp_S05_AXI_arlock_converter = NULL;
  mp_S06_AXI_transactor = NULL;
  mp_S06_AXI_awlock_converter = NULL;
  mp_S06_AXI_arlock_converter = NULL;
  mp_S07_AXI_transactor = NULL;
  mp_S07_AXI_awlock_converter = NULL;
  mp_S07_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M00_AXI_awlock_converter = NULL;
  mp_M00_AXI_arlock_converter = NULL;

  // initialize socket stubs
  mp_S00_AXI_rd_socket_stub = NULL;
  mp_S01_AXI_rd_socket_stub = NULL;
  mp_S02_AXI_rd_socket_stub = NULL;
  mp_S03_AXI_wr_socket_stub = NULL;

}

void system_axi_smc_9::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S00_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S00_AXI' transactor parameters
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);

    // S00_AXI' transactor ports

    mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
    mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
    mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
    mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
    mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
    mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
    mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
    mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
    mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
    mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
    mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
    mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
    mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
    mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
    mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
    mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
    mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
    mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
    mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
    mp_S00_AXI_transactor->CLK(aclk);
    mp_S00_AXI_transactor->RST(aresetn);

    // S00_AXI' transactor sockets

    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(mp_S00_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S01_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S01_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S01_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S01_AXI' transactor parameters
    xsc::common_cpp::properties S01_AXI_transactor_param_props;
    S01_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S01_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S01_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S01_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S01_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S01_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S01_AXI_transactor", S01_AXI_transactor_param_props);

    // S01_AXI' transactor ports

    mp_S01_AXI_transactor->AWADDR(S01_AXI_awaddr);
    mp_S01_AXI_transactor->AWLEN(S01_AXI_awlen);
    mp_S01_AXI_transactor->AWSIZE(S01_AXI_awsize);
    mp_S01_AXI_transactor->AWBURST(S01_AXI_awburst);
    mp_S01_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S01_AXI_awlock_converter");
    mp_S01_AXI_awlock_converter->vector_in(S01_AXI_awlock);
    mp_S01_AXI_awlock_converter->scalar_out(m_S01_AXI_awlock_converter_signal);
    mp_S01_AXI_transactor->AWLOCK(m_S01_AXI_awlock_converter_signal);
    mp_S01_AXI_transactor->AWCACHE(S01_AXI_awcache);
    mp_S01_AXI_transactor->AWPROT(S01_AXI_awprot);
    mp_S01_AXI_transactor->AWQOS(S01_AXI_awqos);
    mp_S01_AXI_transactor->AWVALID(S01_AXI_awvalid);
    mp_S01_AXI_transactor->AWREADY(S01_AXI_awready);
    mp_S01_AXI_transactor->WDATA(S01_AXI_wdata);
    mp_S01_AXI_transactor->WSTRB(S01_AXI_wstrb);
    mp_S01_AXI_transactor->WLAST(S01_AXI_wlast);
    mp_S01_AXI_transactor->WVALID(S01_AXI_wvalid);
    mp_S01_AXI_transactor->WREADY(S01_AXI_wready);
    mp_S01_AXI_transactor->BRESP(S01_AXI_bresp);
    mp_S01_AXI_transactor->BVALID(S01_AXI_bvalid);
    mp_S01_AXI_transactor->BREADY(S01_AXI_bready);
    mp_S01_AXI_transactor->CLK(aclk);
    mp_S01_AXI_transactor->RST(aresetn);

    // S01_AXI' transactor sockets

    mp_impl->S01_AXI_tlm_aximm_read_socket->bind(mp_S01_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S01_AXI_tlm_aximm_write_socket->bind(*(mp_S01_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S02_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S02_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S02_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S02_AXI' transactor parameters
    xsc::common_cpp::properties S02_AXI_transactor_param_props;
    S02_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S02_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S02_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S02_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S02_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S02_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S02_AXI_transactor", S02_AXI_transactor_param_props);

    // S02_AXI' transactor ports

    mp_S02_AXI_transactor->AWADDR(S02_AXI_awaddr);
    mp_S02_AXI_transactor->AWLEN(S02_AXI_awlen);
    mp_S02_AXI_transactor->AWSIZE(S02_AXI_awsize);
    mp_S02_AXI_transactor->AWBURST(S02_AXI_awburst);
    mp_S02_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S02_AXI_awlock_converter");
    mp_S02_AXI_awlock_converter->vector_in(S02_AXI_awlock);
    mp_S02_AXI_awlock_converter->scalar_out(m_S02_AXI_awlock_converter_signal);
    mp_S02_AXI_transactor->AWLOCK(m_S02_AXI_awlock_converter_signal);
    mp_S02_AXI_transactor->AWCACHE(S02_AXI_awcache);
    mp_S02_AXI_transactor->AWPROT(S02_AXI_awprot);
    mp_S02_AXI_transactor->AWQOS(S02_AXI_awqos);
    mp_S02_AXI_transactor->AWVALID(S02_AXI_awvalid);
    mp_S02_AXI_transactor->AWREADY(S02_AXI_awready);
    mp_S02_AXI_transactor->WDATA(S02_AXI_wdata);
    mp_S02_AXI_transactor->WSTRB(S02_AXI_wstrb);
    mp_S02_AXI_transactor->WLAST(S02_AXI_wlast);
    mp_S02_AXI_transactor->WVALID(S02_AXI_wvalid);
    mp_S02_AXI_transactor->WREADY(S02_AXI_wready);
    mp_S02_AXI_transactor->BRESP(S02_AXI_bresp);
    mp_S02_AXI_transactor->BVALID(S02_AXI_bvalid);
    mp_S02_AXI_transactor->BREADY(S02_AXI_bready);
    mp_S02_AXI_transactor->CLK(aclk);
    mp_S02_AXI_transactor->RST(aresetn);

    // S02_AXI' transactor sockets

    mp_impl->S02_AXI_tlm_aximm_read_socket->bind(mp_S02_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S02_AXI_tlm_aximm_write_socket->bind(*(mp_S02_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S03_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S03_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S03_AXI_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket", 0);

  // 'S03_AXI' transactor parameters
    xsc::common_cpp::properties S03_AXI_transactor_param_props;
    S03_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S03_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S03_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S03_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S03_AXI_transactor_param_props.addLong("HAS_WSTRB", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BRESP", "0");
    S03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S03_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_ONLY");
    S03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S03_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S03_AXI_transactor", S03_AXI_transactor_param_props);

    // S03_AXI' transactor ports

    mp_S03_AXI_transactor->ARADDR(S03_AXI_araddr);
    mp_S03_AXI_transactor->ARLEN(S03_AXI_arlen);
    mp_S03_AXI_transactor->ARSIZE(S03_AXI_arsize);
    mp_S03_AXI_transactor->ARBURST(S03_AXI_arburst);
    mp_S03_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S03_AXI_arlock_converter");
    mp_S03_AXI_arlock_converter->vector_in(S03_AXI_arlock);
    mp_S03_AXI_arlock_converter->scalar_out(m_S03_AXI_arlock_converter_signal);
    mp_S03_AXI_transactor->ARLOCK(m_S03_AXI_arlock_converter_signal);
    mp_S03_AXI_transactor->ARCACHE(S03_AXI_arcache);
    mp_S03_AXI_transactor->ARPROT(S03_AXI_arprot);
    mp_S03_AXI_transactor->ARQOS(S03_AXI_arqos);
    mp_S03_AXI_transactor->ARVALID(S03_AXI_arvalid);
    mp_S03_AXI_transactor->ARREADY(S03_AXI_arready);
    mp_S03_AXI_transactor->RDATA(S03_AXI_rdata);
    mp_S03_AXI_transactor->RRESP(S03_AXI_rresp);
    mp_S03_AXI_transactor->RLAST(S03_AXI_rlast);
    mp_S03_AXI_transactor->RVALID(S03_AXI_rvalid);
    mp_S03_AXI_transactor->RREADY(S03_AXI_rready);
    mp_S03_AXI_transactor->CLK(aclk);
    mp_S03_AXI_transactor->RST(aresetn);

    // S03_AXI' transactor sockets

    mp_impl->S03_AXI_tlm_aximm_read_socket->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_impl->S03_AXI_tlm_aximm_write_socket->bind(mp_S03_AXI_wr_socket_stub->initiator_socket);
  }
  else
  {
  }

  // configure 'S04_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S04_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S04_AXI' transactor parameters
    xsc::common_cpp::properties S04_AXI_transactor_param_props;
    S04_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S04_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S04_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S04_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S04_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S04_AXI_transactor", S04_AXI_transactor_param_props);

    // S04_AXI' transactor ports

    mp_S04_AXI_transactor->AWADDR(S04_AXI_awaddr);
    mp_S04_AXI_transactor->AWLEN(S04_AXI_awlen);
    mp_S04_AXI_transactor->AWSIZE(S04_AXI_awsize);
    mp_S04_AXI_transactor->AWBURST(S04_AXI_awburst);
    mp_S04_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_awlock_converter");
    mp_S04_AXI_awlock_converter->vector_in(S04_AXI_awlock);
    mp_S04_AXI_awlock_converter->scalar_out(m_S04_AXI_awlock_converter_signal);
    mp_S04_AXI_transactor->AWLOCK(m_S04_AXI_awlock_converter_signal);
    mp_S04_AXI_transactor->AWCACHE(S04_AXI_awcache);
    mp_S04_AXI_transactor->AWPROT(S04_AXI_awprot);
    mp_S04_AXI_transactor->AWQOS(S04_AXI_awqos);
    mp_S04_AXI_transactor->AWVALID(S04_AXI_awvalid);
    mp_S04_AXI_transactor->AWREADY(S04_AXI_awready);
    mp_S04_AXI_transactor->WDATA(S04_AXI_wdata);
    mp_S04_AXI_transactor->WSTRB(S04_AXI_wstrb);
    mp_S04_AXI_transactor->WLAST(S04_AXI_wlast);
    mp_S04_AXI_transactor->WVALID(S04_AXI_wvalid);
    mp_S04_AXI_transactor->WREADY(S04_AXI_wready);
    mp_S04_AXI_transactor->BRESP(S04_AXI_bresp);
    mp_S04_AXI_transactor->BVALID(S04_AXI_bvalid);
    mp_S04_AXI_transactor->BREADY(S04_AXI_bready);
    mp_S04_AXI_transactor->ARADDR(S04_AXI_araddr);
    mp_S04_AXI_transactor->ARLEN(S04_AXI_arlen);
    mp_S04_AXI_transactor->ARSIZE(S04_AXI_arsize);
    mp_S04_AXI_transactor->ARBURST(S04_AXI_arburst);
    mp_S04_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_arlock_converter");
    mp_S04_AXI_arlock_converter->vector_in(S04_AXI_arlock);
    mp_S04_AXI_arlock_converter->scalar_out(m_S04_AXI_arlock_converter_signal);
    mp_S04_AXI_transactor->ARLOCK(m_S04_AXI_arlock_converter_signal);
    mp_S04_AXI_transactor->ARCACHE(S04_AXI_arcache);
    mp_S04_AXI_transactor->ARPROT(S04_AXI_arprot);
    mp_S04_AXI_transactor->ARQOS(S04_AXI_arqos);
    mp_S04_AXI_transactor->ARVALID(S04_AXI_arvalid);
    mp_S04_AXI_transactor->ARREADY(S04_AXI_arready);
    mp_S04_AXI_transactor->RDATA(S04_AXI_rdata);
    mp_S04_AXI_transactor->RRESP(S04_AXI_rresp);
    mp_S04_AXI_transactor->RLAST(S04_AXI_rlast);
    mp_S04_AXI_transactor->RVALID(S04_AXI_rvalid);
    mp_S04_AXI_transactor->RREADY(S04_AXI_rready);
    mp_S04_AXI_transactor->CLK(aclk1);
    mp_S04_AXI_transactor->RST(aresetn);

    // S04_AXI' transactor sockets

    mp_impl->S04_AXI_tlm_aximm_read_socket->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_impl->S04_AXI_tlm_aximm_write_socket->bind(*(mp_S04_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S05_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S05_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S05_AXI' transactor parameters
    xsc::common_cpp::properties S05_AXI_transactor_param_props;
    S05_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S05_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S05_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S05_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S05_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S05_AXI_transactor", S05_AXI_transactor_param_props);

    // S05_AXI' transactor ports

    mp_S05_AXI_transactor->AWADDR(S05_AXI_awaddr);
    mp_S05_AXI_transactor->AWLEN(S05_AXI_awlen);
    mp_S05_AXI_transactor->AWSIZE(S05_AXI_awsize);
    mp_S05_AXI_transactor->AWBURST(S05_AXI_awburst);
    mp_S05_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_awlock_converter");
    mp_S05_AXI_awlock_converter->vector_in(S05_AXI_awlock);
    mp_S05_AXI_awlock_converter->scalar_out(m_S05_AXI_awlock_converter_signal);
    mp_S05_AXI_transactor->AWLOCK(m_S05_AXI_awlock_converter_signal);
    mp_S05_AXI_transactor->AWCACHE(S05_AXI_awcache);
    mp_S05_AXI_transactor->AWPROT(S05_AXI_awprot);
    mp_S05_AXI_transactor->AWQOS(S05_AXI_awqos);
    mp_S05_AXI_transactor->AWVALID(S05_AXI_awvalid);
    mp_S05_AXI_transactor->AWREADY(S05_AXI_awready);
    mp_S05_AXI_transactor->WDATA(S05_AXI_wdata);
    mp_S05_AXI_transactor->WSTRB(S05_AXI_wstrb);
    mp_S05_AXI_transactor->WLAST(S05_AXI_wlast);
    mp_S05_AXI_transactor->WVALID(S05_AXI_wvalid);
    mp_S05_AXI_transactor->WREADY(S05_AXI_wready);
    mp_S05_AXI_transactor->BRESP(S05_AXI_bresp);
    mp_S05_AXI_transactor->BVALID(S05_AXI_bvalid);
    mp_S05_AXI_transactor->BREADY(S05_AXI_bready);
    mp_S05_AXI_transactor->ARADDR(S05_AXI_araddr);
    mp_S05_AXI_transactor->ARLEN(S05_AXI_arlen);
    mp_S05_AXI_transactor->ARSIZE(S05_AXI_arsize);
    mp_S05_AXI_transactor->ARBURST(S05_AXI_arburst);
    mp_S05_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_arlock_converter");
    mp_S05_AXI_arlock_converter->vector_in(S05_AXI_arlock);
    mp_S05_AXI_arlock_converter->scalar_out(m_S05_AXI_arlock_converter_signal);
    mp_S05_AXI_transactor->ARLOCK(m_S05_AXI_arlock_converter_signal);
    mp_S05_AXI_transactor->ARCACHE(S05_AXI_arcache);
    mp_S05_AXI_transactor->ARPROT(S05_AXI_arprot);
    mp_S05_AXI_transactor->ARQOS(S05_AXI_arqos);
    mp_S05_AXI_transactor->ARVALID(S05_AXI_arvalid);
    mp_S05_AXI_transactor->ARREADY(S05_AXI_arready);
    mp_S05_AXI_transactor->RDATA(S05_AXI_rdata);
    mp_S05_AXI_transactor->RRESP(S05_AXI_rresp);
    mp_S05_AXI_transactor->RLAST(S05_AXI_rlast);
    mp_S05_AXI_transactor->RVALID(S05_AXI_rvalid);
    mp_S05_AXI_transactor->RREADY(S05_AXI_rready);
    mp_S05_AXI_transactor->CLK(aclk1);
    mp_S05_AXI_transactor->RST(aresetn);

    // S05_AXI' transactor sockets

    mp_impl->S05_AXI_tlm_aximm_read_socket->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_impl->S05_AXI_tlm_aximm_write_socket->bind(*(mp_S05_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S06_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S06_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S06_AXI' transactor parameters
    xsc::common_cpp::properties S06_AXI_transactor_param_props;
    S06_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S06_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S06_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S06_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S06_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S06_AXI_transactor", S06_AXI_transactor_param_props);

    // S06_AXI' transactor ports

    mp_S06_AXI_transactor->AWADDR(S06_AXI_awaddr);
    mp_S06_AXI_transactor->AWLEN(S06_AXI_awlen);
    mp_S06_AXI_transactor->AWSIZE(S06_AXI_awsize);
    mp_S06_AXI_transactor->AWBURST(S06_AXI_awburst);
    mp_S06_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_awlock_converter");
    mp_S06_AXI_awlock_converter->vector_in(S06_AXI_awlock);
    mp_S06_AXI_awlock_converter->scalar_out(m_S06_AXI_awlock_converter_signal);
    mp_S06_AXI_transactor->AWLOCK(m_S06_AXI_awlock_converter_signal);
    mp_S06_AXI_transactor->AWCACHE(S06_AXI_awcache);
    mp_S06_AXI_transactor->AWPROT(S06_AXI_awprot);
    mp_S06_AXI_transactor->AWQOS(S06_AXI_awqos);
    mp_S06_AXI_transactor->AWVALID(S06_AXI_awvalid);
    mp_S06_AXI_transactor->AWREADY(S06_AXI_awready);
    mp_S06_AXI_transactor->WDATA(S06_AXI_wdata);
    mp_S06_AXI_transactor->WSTRB(S06_AXI_wstrb);
    mp_S06_AXI_transactor->WLAST(S06_AXI_wlast);
    mp_S06_AXI_transactor->WVALID(S06_AXI_wvalid);
    mp_S06_AXI_transactor->WREADY(S06_AXI_wready);
    mp_S06_AXI_transactor->BRESP(S06_AXI_bresp);
    mp_S06_AXI_transactor->BVALID(S06_AXI_bvalid);
    mp_S06_AXI_transactor->BREADY(S06_AXI_bready);
    mp_S06_AXI_transactor->ARADDR(S06_AXI_araddr);
    mp_S06_AXI_transactor->ARLEN(S06_AXI_arlen);
    mp_S06_AXI_transactor->ARSIZE(S06_AXI_arsize);
    mp_S06_AXI_transactor->ARBURST(S06_AXI_arburst);
    mp_S06_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_arlock_converter");
    mp_S06_AXI_arlock_converter->vector_in(S06_AXI_arlock);
    mp_S06_AXI_arlock_converter->scalar_out(m_S06_AXI_arlock_converter_signal);
    mp_S06_AXI_transactor->ARLOCK(m_S06_AXI_arlock_converter_signal);
    mp_S06_AXI_transactor->ARCACHE(S06_AXI_arcache);
    mp_S06_AXI_transactor->ARPROT(S06_AXI_arprot);
    mp_S06_AXI_transactor->ARQOS(S06_AXI_arqos);
    mp_S06_AXI_transactor->ARVALID(S06_AXI_arvalid);
    mp_S06_AXI_transactor->ARREADY(S06_AXI_arready);
    mp_S06_AXI_transactor->RDATA(S06_AXI_rdata);
    mp_S06_AXI_transactor->RRESP(S06_AXI_rresp);
    mp_S06_AXI_transactor->RLAST(S06_AXI_rlast);
    mp_S06_AXI_transactor->RVALID(S06_AXI_rvalid);
    mp_S06_AXI_transactor->RREADY(S06_AXI_rready);
    mp_S06_AXI_transactor->CLK(aclk1);
    mp_S06_AXI_transactor->RST(aresetn);

    // S06_AXI' transactor sockets

    mp_impl->S06_AXI_tlm_aximm_read_socket->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_impl->S06_AXI_tlm_aximm_write_socket->bind(*(mp_S06_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S07_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S07_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S07_AXI' transactor parameters
    xsc::common_cpp::properties S07_AXI_transactor_param_props;
    S07_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S07_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S07_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S07_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S07_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S07_AXI_transactor", S07_AXI_transactor_param_props);

    // S07_AXI' transactor ports

    mp_S07_AXI_transactor->AWADDR(S07_AXI_awaddr);
    mp_S07_AXI_transactor->AWLEN(S07_AXI_awlen);
    mp_S07_AXI_transactor->AWSIZE(S07_AXI_awsize);
    mp_S07_AXI_transactor->AWBURST(S07_AXI_awburst);
    mp_S07_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_awlock_converter");
    mp_S07_AXI_awlock_converter->vector_in(S07_AXI_awlock);
    mp_S07_AXI_awlock_converter->scalar_out(m_S07_AXI_awlock_converter_signal);
    mp_S07_AXI_transactor->AWLOCK(m_S07_AXI_awlock_converter_signal);
    mp_S07_AXI_transactor->AWCACHE(S07_AXI_awcache);
    mp_S07_AXI_transactor->AWPROT(S07_AXI_awprot);
    mp_S07_AXI_transactor->AWQOS(S07_AXI_awqos);
    mp_S07_AXI_transactor->AWVALID(S07_AXI_awvalid);
    mp_S07_AXI_transactor->AWREADY(S07_AXI_awready);
    mp_S07_AXI_transactor->WDATA(S07_AXI_wdata);
    mp_S07_AXI_transactor->WSTRB(S07_AXI_wstrb);
    mp_S07_AXI_transactor->WLAST(S07_AXI_wlast);
    mp_S07_AXI_transactor->WVALID(S07_AXI_wvalid);
    mp_S07_AXI_transactor->WREADY(S07_AXI_wready);
    mp_S07_AXI_transactor->BRESP(S07_AXI_bresp);
    mp_S07_AXI_transactor->BVALID(S07_AXI_bvalid);
    mp_S07_AXI_transactor->BREADY(S07_AXI_bready);
    mp_S07_AXI_transactor->ARADDR(S07_AXI_araddr);
    mp_S07_AXI_transactor->ARLEN(S07_AXI_arlen);
    mp_S07_AXI_transactor->ARSIZE(S07_AXI_arsize);
    mp_S07_AXI_transactor->ARBURST(S07_AXI_arburst);
    mp_S07_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_arlock_converter");
    mp_S07_AXI_arlock_converter->vector_in(S07_AXI_arlock);
    mp_S07_AXI_arlock_converter->scalar_out(m_S07_AXI_arlock_converter_signal);
    mp_S07_AXI_transactor->ARLOCK(m_S07_AXI_arlock_converter_signal);
    mp_S07_AXI_transactor->ARCACHE(S07_AXI_arcache);
    mp_S07_AXI_transactor->ARPROT(S07_AXI_arprot);
    mp_S07_AXI_transactor->ARQOS(S07_AXI_arqos);
    mp_S07_AXI_transactor->ARVALID(S07_AXI_arvalid);
    mp_S07_AXI_transactor->ARREADY(S07_AXI_arready);
    mp_S07_AXI_transactor->RDATA(S07_AXI_rdata);
    mp_S07_AXI_transactor->RRESP(S07_AXI_rresp);
    mp_S07_AXI_transactor->RLAST(S07_AXI_rlast);
    mp_S07_AXI_transactor->RVALID(S07_AXI_rvalid);
    mp_S07_AXI_transactor->RREADY(S07_AXI_rready);
    mp_S07_AXI_transactor->CLK(aclk1);
    mp_S07_AXI_transactor->RST(aresetn);

    // S07_AXI' transactor sockets

    mp_impl->S07_AXI_tlm_aximm_read_socket->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_impl->S07_AXI_tlm_aximm_write_socket->bind(*(mp_S07_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "M00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M00_AXI' transactor parameters
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "128");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "49");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "128");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<128,49,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);

    // M00_AXI' transactor ports

    mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
    mp_M00_AXI_transactor->AWLEN(M00_AXI_awlen);
    mp_M00_AXI_transactor->AWSIZE(M00_AXI_awsize);
    mp_M00_AXI_transactor->AWBURST(M00_AXI_awburst);
    mp_M00_AXI_awlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_awlock_converter");
    mp_M00_AXI_awlock_converter->scalar_in(m_M00_AXI_awlock_converter_signal);
    mp_M00_AXI_awlock_converter->vector_out(M00_AXI_awlock);
    mp_M00_AXI_transactor->AWLOCK(m_M00_AXI_awlock_converter_signal);
    mp_M00_AXI_transactor->AWCACHE(M00_AXI_awcache);
    mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
    mp_M00_AXI_transactor->AWQOS(M00_AXI_awqos);
    mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
    mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
    mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
    mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
    mp_M00_AXI_transactor->WLAST(M00_AXI_wlast);
    mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
    mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
    mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
    mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
    mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
    mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
    mp_M00_AXI_transactor->ARLEN(M00_AXI_arlen);
    mp_M00_AXI_transactor->ARSIZE(M00_AXI_arsize);
    mp_M00_AXI_transactor->ARBURST(M00_AXI_arburst);
    mp_M00_AXI_arlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_arlock_converter");
    mp_M00_AXI_arlock_converter->scalar_in(m_M00_AXI_arlock_converter_signal);
    mp_M00_AXI_arlock_converter->vector_out(M00_AXI_arlock);
    mp_M00_AXI_transactor->ARLOCK(m_M00_AXI_arlock_converter_signal);
    mp_M00_AXI_transactor->ARCACHE(M00_AXI_arcache);
    mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
    mp_M00_AXI_transactor->ARQOS(M00_AXI_arqos);
    mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
    mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
    mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
    mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
    mp_M00_AXI_transactor->RLAST(M00_AXI_rlast);
    mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
    mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
    mp_M00_AXI_transactor->CLK(aclk);
    mp_M00_AXI_transactor->RST(aresetn);

    // M00_AXI' transactor sockets

    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XM_SYSTEMC




#ifdef RIVIERA
system_axi_smc_9::system_axi_smc_9(const sc_core::sc_module_name& nm) : system_axi_smc_9_sc(nm), aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S01_AXI_awaddr("S01_AXI_awaddr"), S01_AXI_awlen("S01_AXI_awlen"), S01_AXI_awsize("S01_AXI_awsize"), S01_AXI_awburst("S01_AXI_awburst"), S01_AXI_awlock("S01_AXI_awlock"), S01_AXI_awcache("S01_AXI_awcache"), S01_AXI_awprot("S01_AXI_awprot"), S01_AXI_awqos("S01_AXI_awqos"), S01_AXI_awvalid("S01_AXI_awvalid"), S01_AXI_awready("S01_AXI_awready"), S01_AXI_wdata("S01_AXI_wdata"), S01_AXI_wstrb("S01_AXI_wstrb"), S01_AXI_wlast("S01_AXI_wlast"), S01_AXI_wvalid("S01_AXI_wvalid"), S01_AXI_wready("S01_AXI_wready"), S01_AXI_bresp("S01_AXI_bresp"), S01_AXI_bvalid("S01_AXI_bvalid"), S01_AXI_bready("S01_AXI_bready"), S02_AXI_awaddr("S02_AXI_awaddr"), S02_AXI_awlen("S02_AXI_awlen"), S02_AXI_awsize("S02_AXI_awsize"), S02_AXI_awburst("S02_AXI_awburst"), S02_AXI_awlock("S02_AXI_awlock"), S02_AXI_awcache("S02_AXI_awcache"), S02_AXI_awprot("S02_AXI_awprot"), S02_AXI_awqos("S02_AXI_awqos"), S02_AXI_awvalid("S02_AXI_awvalid"), S02_AXI_awready("S02_AXI_awready"), S02_AXI_wdata("S02_AXI_wdata"), S02_AXI_wstrb("S02_AXI_wstrb"), S02_AXI_wlast("S02_AXI_wlast"), S02_AXI_wvalid("S02_AXI_wvalid"), S02_AXI_wready("S02_AXI_wready"), S02_AXI_bresp("S02_AXI_bresp"), S02_AXI_bvalid("S02_AXI_bvalid"), S02_AXI_bready("S02_AXI_bready"), S03_AXI_araddr("S03_AXI_araddr"), S03_AXI_arlen("S03_AXI_arlen"), S03_AXI_arsize("S03_AXI_arsize"), S03_AXI_arburst("S03_AXI_arburst"), S03_AXI_arlock("S03_AXI_arlock"), S03_AXI_arcache("S03_AXI_arcache"), S03_AXI_arprot("S03_AXI_arprot"), S03_AXI_arqos("S03_AXI_arqos"), S03_AXI_arvalid("S03_AXI_arvalid"), S03_AXI_arready("S03_AXI_arready"), S03_AXI_rdata("S03_AXI_rdata"), S03_AXI_rresp("S03_AXI_rresp"), S03_AXI_rlast("S03_AXI_rlast"), S03_AXI_rvalid("S03_AXI_rvalid"), S03_AXI_rready("S03_AXI_rready"), S04_AXI_awaddr("S04_AXI_awaddr"), S04_AXI_awlen("S04_AXI_awlen"), S04_AXI_awsize("S04_AXI_awsize"), S04_AXI_awburst("S04_AXI_awburst"), S04_AXI_awlock("S04_AXI_awlock"), S04_AXI_awcache("S04_AXI_awcache"), S04_AXI_awprot("S04_AXI_awprot"), S04_AXI_awqos("S04_AXI_awqos"), S04_AXI_awvalid("S04_AXI_awvalid"), S04_AXI_awready("S04_AXI_awready"), S04_AXI_wdata("S04_AXI_wdata"), S04_AXI_wstrb("S04_AXI_wstrb"), S04_AXI_wlast("S04_AXI_wlast"), S04_AXI_wvalid("S04_AXI_wvalid"), S04_AXI_wready("S04_AXI_wready"), S04_AXI_bresp("S04_AXI_bresp"), S04_AXI_bvalid("S04_AXI_bvalid"), S04_AXI_bready("S04_AXI_bready"), S04_AXI_araddr("S04_AXI_araddr"), S04_AXI_arlen("S04_AXI_arlen"), S04_AXI_arsize("S04_AXI_arsize"), S04_AXI_arburst("S04_AXI_arburst"), S04_AXI_arlock("S04_AXI_arlock"), S04_AXI_arcache("S04_AXI_arcache"), S04_AXI_arprot("S04_AXI_arprot"), S04_AXI_arqos("S04_AXI_arqos"), S04_AXI_arvalid("S04_AXI_arvalid"), S04_AXI_arready("S04_AXI_arready"), S04_AXI_rdata("S04_AXI_rdata"), S04_AXI_rresp("S04_AXI_rresp"), S04_AXI_rlast("S04_AXI_rlast"), S04_AXI_rvalid("S04_AXI_rvalid"), S04_AXI_rready("S04_AXI_rready"), S05_AXI_awaddr("S05_AXI_awaddr"), S05_AXI_awlen("S05_AXI_awlen"), S05_AXI_awsize("S05_AXI_awsize"), S05_AXI_awburst("S05_AXI_awburst"), S05_AXI_awlock("S05_AXI_awlock"), S05_AXI_awcache("S05_AXI_awcache"), S05_AXI_awprot("S05_AXI_awprot"), S05_AXI_awqos("S05_AXI_awqos"), S05_AXI_awvalid("S05_AXI_awvalid"), S05_AXI_awready("S05_AXI_awready"), S05_AXI_wdata("S05_AXI_wdata"), S05_AXI_wstrb("S05_AXI_wstrb"), S05_AXI_wlast("S05_AXI_wlast"), S05_AXI_wvalid("S05_AXI_wvalid"), S05_AXI_wready("S05_AXI_wready"), S05_AXI_bresp("S05_AXI_bresp"), S05_AXI_bvalid("S05_AXI_bvalid"), S05_AXI_bready("S05_AXI_bready"), S05_AXI_araddr("S05_AXI_araddr"), S05_AXI_arlen("S05_AXI_arlen"), S05_AXI_arsize("S05_AXI_arsize"), S05_AXI_arburst("S05_AXI_arburst"), S05_AXI_arlock("S05_AXI_arlock"), S05_AXI_arcache("S05_AXI_arcache"), S05_AXI_arprot("S05_AXI_arprot"), S05_AXI_arqos("S05_AXI_arqos"), S05_AXI_arvalid("S05_AXI_arvalid"), S05_AXI_arready("S05_AXI_arready"), S05_AXI_rdata("S05_AXI_rdata"), S05_AXI_rresp("S05_AXI_rresp"), S05_AXI_rlast("S05_AXI_rlast"), S05_AXI_rvalid("S05_AXI_rvalid"), S05_AXI_rready("S05_AXI_rready"), S06_AXI_awaddr("S06_AXI_awaddr"), S06_AXI_awlen("S06_AXI_awlen"), S06_AXI_awsize("S06_AXI_awsize"), S06_AXI_awburst("S06_AXI_awburst"), S06_AXI_awlock("S06_AXI_awlock"), S06_AXI_awcache("S06_AXI_awcache"), S06_AXI_awprot("S06_AXI_awprot"), S06_AXI_awqos("S06_AXI_awqos"), S06_AXI_awvalid("S06_AXI_awvalid"), S06_AXI_awready("S06_AXI_awready"), S06_AXI_wdata("S06_AXI_wdata"), S06_AXI_wstrb("S06_AXI_wstrb"), S06_AXI_wlast("S06_AXI_wlast"), S06_AXI_wvalid("S06_AXI_wvalid"), S06_AXI_wready("S06_AXI_wready"), S06_AXI_bresp("S06_AXI_bresp"), S06_AXI_bvalid("S06_AXI_bvalid"), S06_AXI_bready("S06_AXI_bready"), S06_AXI_araddr("S06_AXI_araddr"), S06_AXI_arlen("S06_AXI_arlen"), S06_AXI_arsize("S06_AXI_arsize"), S06_AXI_arburst("S06_AXI_arburst"), S06_AXI_arlock("S06_AXI_arlock"), S06_AXI_arcache("S06_AXI_arcache"), S06_AXI_arprot("S06_AXI_arprot"), S06_AXI_arqos("S06_AXI_arqos"), S06_AXI_arvalid("S06_AXI_arvalid"), S06_AXI_arready("S06_AXI_arready"), S06_AXI_rdata("S06_AXI_rdata"), S06_AXI_rresp("S06_AXI_rresp"), S06_AXI_rlast("S06_AXI_rlast"), S06_AXI_rvalid("S06_AXI_rvalid"), S06_AXI_rready("S06_AXI_rready"), S07_AXI_awaddr("S07_AXI_awaddr"), S07_AXI_awlen("S07_AXI_awlen"), S07_AXI_awsize("S07_AXI_awsize"), S07_AXI_awburst("S07_AXI_awburst"), S07_AXI_awlock("S07_AXI_awlock"), S07_AXI_awcache("S07_AXI_awcache"), S07_AXI_awprot("S07_AXI_awprot"), S07_AXI_awqos("S07_AXI_awqos"), S07_AXI_awvalid("S07_AXI_awvalid"), S07_AXI_awready("S07_AXI_awready"), S07_AXI_wdata("S07_AXI_wdata"), S07_AXI_wstrb("S07_AXI_wstrb"), S07_AXI_wlast("S07_AXI_wlast"), S07_AXI_wvalid("S07_AXI_wvalid"), S07_AXI_wready("S07_AXI_wready"), S07_AXI_bresp("S07_AXI_bresp"), S07_AXI_bvalid("S07_AXI_bvalid"), S07_AXI_bready("S07_AXI_bready"), S07_AXI_araddr("S07_AXI_araddr"), S07_AXI_arlen("S07_AXI_arlen"), S07_AXI_arsize("S07_AXI_arsize"), S07_AXI_arburst("S07_AXI_arburst"), S07_AXI_arlock("S07_AXI_arlock"), S07_AXI_arcache("S07_AXI_arcache"), S07_AXI_arprot("S07_AXI_arprot"), S07_AXI_arqos("S07_AXI_arqos"), S07_AXI_arvalid("S07_AXI_arvalid"), S07_AXI_arready("S07_AXI_arready"), S07_AXI_rdata("S07_AXI_rdata"), S07_AXI_rresp("S07_AXI_rresp"), S07_AXI_rlast("S07_AXI_rlast"), S07_AXI_rvalid("S07_AXI_rvalid"), S07_AXI_rready("S07_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awlen("M00_AXI_awlen"), M00_AXI_awsize("M00_AXI_awsize"), M00_AXI_awburst("M00_AXI_awburst"), M00_AXI_awlock("M00_AXI_awlock"), M00_AXI_awcache("M00_AXI_awcache"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awqos("M00_AXI_awqos"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wlast("M00_AXI_wlast"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arlen("M00_AXI_arlen"), M00_AXI_arsize("M00_AXI_arsize"), M00_AXI_arburst("M00_AXI_arburst"), M00_AXI_arlock("M00_AXI_arlock"), M00_AXI_arcache("M00_AXI_arcache"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arqos("M00_AXI_arqos"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rlast("M00_AXI_rlast"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"),mp_S00_AXI_rd_socket_stub(nullptr),mp_S01_AXI_rd_socket_stub(nullptr),mp_S02_AXI_rd_socket_stub(nullptr),mp_S03_AXI_wr_socket_stub(nullptr)
{

  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S01_AXI_transactor = NULL;
  mp_S01_AXI_awlock_converter = NULL;
  mp_S02_AXI_transactor = NULL;
  mp_S02_AXI_awlock_converter = NULL;
  mp_S03_AXI_transactor = NULL;
  mp_S03_AXI_arlock_converter = NULL;
  mp_S04_AXI_transactor = NULL;
  mp_S04_AXI_awlock_converter = NULL;
  mp_S04_AXI_arlock_converter = NULL;
  mp_S05_AXI_transactor = NULL;
  mp_S05_AXI_awlock_converter = NULL;
  mp_S05_AXI_arlock_converter = NULL;
  mp_S06_AXI_transactor = NULL;
  mp_S06_AXI_awlock_converter = NULL;
  mp_S06_AXI_arlock_converter = NULL;
  mp_S07_AXI_transactor = NULL;
  mp_S07_AXI_awlock_converter = NULL;
  mp_S07_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M00_AXI_awlock_converter = NULL;
  mp_M00_AXI_arlock_converter = NULL;

  // initialize socket stubs
  mp_S00_AXI_rd_socket_stub = NULL;
  mp_S01_AXI_rd_socket_stub = NULL;
  mp_S02_AXI_rd_socket_stub = NULL;
  mp_S03_AXI_wr_socket_stub = NULL;

}

void system_axi_smc_9::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S00_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S00_AXI' transactor parameters
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);

    // S00_AXI' transactor ports

    mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
    mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
    mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
    mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
    mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
    mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
    mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
    mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
    mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
    mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
    mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
    mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
    mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
    mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
    mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
    mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
    mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
    mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
    mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
    mp_S00_AXI_transactor->CLK(aclk);
    mp_S00_AXI_transactor->RST(aresetn);

    // S00_AXI' transactor sockets

    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(mp_S00_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S01_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S01_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S01_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S01_AXI' transactor parameters
    xsc::common_cpp::properties S01_AXI_transactor_param_props;
    S01_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S01_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S01_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S01_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S01_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S01_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S01_AXI_transactor", S01_AXI_transactor_param_props);

    // S01_AXI' transactor ports

    mp_S01_AXI_transactor->AWADDR(S01_AXI_awaddr);
    mp_S01_AXI_transactor->AWLEN(S01_AXI_awlen);
    mp_S01_AXI_transactor->AWSIZE(S01_AXI_awsize);
    mp_S01_AXI_transactor->AWBURST(S01_AXI_awburst);
    mp_S01_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S01_AXI_awlock_converter");
    mp_S01_AXI_awlock_converter->vector_in(S01_AXI_awlock);
    mp_S01_AXI_awlock_converter->scalar_out(m_S01_AXI_awlock_converter_signal);
    mp_S01_AXI_transactor->AWLOCK(m_S01_AXI_awlock_converter_signal);
    mp_S01_AXI_transactor->AWCACHE(S01_AXI_awcache);
    mp_S01_AXI_transactor->AWPROT(S01_AXI_awprot);
    mp_S01_AXI_transactor->AWQOS(S01_AXI_awqos);
    mp_S01_AXI_transactor->AWVALID(S01_AXI_awvalid);
    mp_S01_AXI_transactor->AWREADY(S01_AXI_awready);
    mp_S01_AXI_transactor->WDATA(S01_AXI_wdata);
    mp_S01_AXI_transactor->WSTRB(S01_AXI_wstrb);
    mp_S01_AXI_transactor->WLAST(S01_AXI_wlast);
    mp_S01_AXI_transactor->WVALID(S01_AXI_wvalid);
    mp_S01_AXI_transactor->WREADY(S01_AXI_wready);
    mp_S01_AXI_transactor->BRESP(S01_AXI_bresp);
    mp_S01_AXI_transactor->BVALID(S01_AXI_bvalid);
    mp_S01_AXI_transactor->BREADY(S01_AXI_bready);
    mp_S01_AXI_transactor->CLK(aclk);
    mp_S01_AXI_transactor->RST(aresetn);

    // S01_AXI' transactor sockets

    mp_impl->S01_AXI_tlm_aximm_read_socket->bind(mp_S01_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S01_AXI_tlm_aximm_write_socket->bind(*(mp_S01_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S02_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S02_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S02_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);

  // 'S02_AXI' transactor parameters
    xsc::common_cpp::properties S02_AXI_transactor_param_props;
    S02_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S02_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S02_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S02_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S02_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S02_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S02_AXI_transactor", S02_AXI_transactor_param_props);

    // S02_AXI' transactor ports

    mp_S02_AXI_transactor->AWADDR(S02_AXI_awaddr);
    mp_S02_AXI_transactor->AWLEN(S02_AXI_awlen);
    mp_S02_AXI_transactor->AWSIZE(S02_AXI_awsize);
    mp_S02_AXI_transactor->AWBURST(S02_AXI_awburst);
    mp_S02_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S02_AXI_awlock_converter");
    mp_S02_AXI_awlock_converter->vector_in(S02_AXI_awlock);
    mp_S02_AXI_awlock_converter->scalar_out(m_S02_AXI_awlock_converter_signal);
    mp_S02_AXI_transactor->AWLOCK(m_S02_AXI_awlock_converter_signal);
    mp_S02_AXI_transactor->AWCACHE(S02_AXI_awcache);
    mp_S02_AXI_transactor->AWPROT(S02_AXI_awprot);
    mp_S02_AXI_transactor->AWQOS(S02_AXI_awqos);
    mp_S02_AXI_transactor->AWVALID(S02_AXI_awvalid);
    mp_S02_AXI_transactor->AWREADY(S02_AXI_awready);
    mp_S02_AXI_transactor->WDATA(S02_AXI_wdata);
    mp_S02_AXI_transactor->WSTRB(S02_AXI_wstrb);
    mp_S02_AXI_transactor->WLAST(S02_AXI_wlast);
    mp_S02_AXI_transactor->WVALID(S02_AXI_wvalid);
    mp_S02_AXI_transactor->WREADY(S02_AXI_wready);
    mp_S02_AXI_transactor->BRESP(S02_AXI_bresp);
    mp_S02_AXI_transactor->BVALID(S02_AXI_bvalid);
    mp_S02_AXI_transactor->BREADY(S02_AXI_bready);
    mp_S02_AXI_transactor->CLK(aclk);
    mp_S02_AXI_transactor->RST(aresetn);

    // S02_AXI' transactor sockets

    mp_impl->S02_AXI_tlm_aximm_read_socket->bind(mp_S02_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S02_AXI_tlm_aximm_write_socket->bind(*(mp_S02_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S03_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S03_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs
    mp_S03_AXI_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket", 0);

  // 'S03_AXI' transactor parameters
    xsc::common_cpp::properties S03_AXI_transactor_param_props;
    S03_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S03_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S03_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S03_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S03_AXI_transactor_param_props.addLong("HAS_WSTRB", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BRESP", "0");
    S03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S03_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_ONLY");
    S03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S03_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S03_AXI_transactor", S03_AXI_transactor_param_props);

    // S03_AXI' transactor ports

    mp_S03_AXI_transactor->ARADDR(S03_AXI_araddr);
    mp_S03_AXI_transactor->ARLEN(S03_AXI_arlen);
    mp_S03_AXI_transactor->ARSIZE(S03_AXI_arsize);
    mp_S03_AXI_transactor->ARBURST(S03_AXI_arburst);
    mp_S03_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S03_AXI_arlock_converter");
    mp_S03_AXI_arlock_converter->vector_in(S03_AXI_arlock);
    mp_S03_AXI_arlock_converter->scalar_out(m_S03_AXI_arlock_converter_signal);
    mp_S03_AXI_transactor->ARLOCK(m_S03_AXI_arlock_converter_signal);
    mp_S03_AXI_transactor->ARCACHE(S03_AXI_arcache);
    mp_S03_AXI_transactor->ARPROT(S03_AXI_arprot);
    mp_S03_AXI_transactor->ARQOS(S03_AXI_arqos);
    mp_S03_AXI_transactor->ARVALID(S03_AXI_arvalid);
    mp_S03_AXI_transactor->ARREADY(S03_AXI_arready);
    mp_S03_AXI_transactor->RDATA(S03_AXI_rdata);
    mp_S03_AXI_transactor->RRESP(S03_AXI_rresp);
    mp_S03_AXI_transactor->RLAST(S03_AXI_rlast);
    mp_S03_AXI_transactor->RVALID(S03_AXI_rvalid);
    mp_S03_AXI_transactor->RREADY(S03_AXI_rready);
    mp_S03_AXI_transactor->CLK(aclk);
    mp_S03_AXI_transactor->RST(aresetn);

    // S03_AXI' transactor sockets

    mp_impl->S03_AXI_tlm_aximm_read_socket->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_impl->S03_AXI_tlm_aximm_write_socket->bind(mp_S03_AXI_wr_socket_stub->initiator_socket);
  }
  else
  {
  }

  // configure 'S04_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S04_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S04_AXI' transactor parameters
    xsc::common_cpp::properties S04_AXI_transactor_param_props;
    S04_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S04_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S04_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S04_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S04_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S04_AXI_transactor", S04_AXI_transactor_param_props);

    // S04_AXI' transactor ports

    mp_S04_AXI_transactor->AWADDR(S04_AXI_awaddr);
    mp_S04_AXI_transactor->AWLEN(S04_AXI_awlen);
    mp_S04_AXI_transactor->AWSIZE(S04_AXI_awsize);
    mp_S04_AXI_transactor->AWBURST(S04_AXI_awburst);
    mp_S04_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_awlock_converter");
    mp_S04_AXI_awlock_converter->vector_in(S04_AXI_awlock);
    mp_S04_AXI_awlock_converter->scalar_out(m_S04_AXI_awlock_converter_signal);
    mp_S04_AXI_transactor->AWLOCK(m_S04_AXI_awlock_converter_signal);
    mp_S04_AXI_transactor->AWCACHE(S04_AXI_awcache);
    mp_S04_AXI_transactor->AWPROT(S04_AXI_awprot);
    mp_S04_AXI_transactor->AWQOS(S04_AXI_awqos);
    mp_S04_AXI_transactor->AWVALID(S04_AXI_awvalid);
    mp_S04_AXI_transactor->AWREADY(S04_AXI_awready);
    mp_S04_AXI_transactor->WDATA(S04_AXI_wdata);
    mp_S04_AXI_transactor->WSTRB(S04_AXI_wstrb);
    mp_S04_AXI_transactor->WLAST(S04_AXI_wlast);
    mp_S04_AXI_transactor->WVALID(S04_AXI_wvalid);
    mp_S04_AXI_transactor->WREADY(S04_AXI_wready);
    mp_S04_AXI_transactor->BRESP(S04_AXI_bresp);
    mp_S04_AXI_transactor->BVALID(S04_AXI_bvalid);
    mp_S04_AXI_transactor->BREADY(S04_AXI_bready);
    mp_S04_AXI_transactor->ARADDR(S04_AXI_araddr);
    mp_S04_AXI_transactor->ARLEN(S04_AXI_arlen);
    mp_S04_AXI_transactor->ARSIZE(S04_AXI_arsize);
    mp_S04_AXI_transactor->ARBURST(S04_AXI_arburst);
    mp_S04_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_arlock_converter");
    mp_S04_AXI_arlock_converter->vector_in(S04_AXI_arlock);
    mp_S04_AXI_arlock_converter->scalar_out(m_S04_AXI_arlock_converter_signal);
    mp_S04_AXI_transactor->ARLOCK(m_S04_AXI_arlock_converter_signal);
    mp_S04_AXI_transactor->ARCACHE(S04_AXI_arcache);
    mp_S04_AXI_transactor->ARPROT(S04_AXI_arprot);
    mp_S04_AXI_transactor->ARQOS(S04_AXI_arqos);
    mp_S04_AXI_transactor->ARVALID(S04_AXI_arvalid);
    mp_S04_AXI_transactor->ARREADY(S04_AXI_arready);
    mp_S04_AXI_transactor->RDATA(S04_AXI_rdata);
    mp_S04_AXI_transactor->RRESP(S04_AXI_rresp);
    mp_S04_AXI_transactor->RLAST(S04_AXI_rlast);
    mp_S04_AXI_transactor->RVALID(S04_AXI_rvalid);
    mp_S04_AXI_transactor->RREADY(S04_AXI_rready);
    mp_S04_AXI_transactor->CLK(aclk1);
    mp_S04_AXI_transactor->RST(aresetn);

    // S04_AXI' transactor sockets

    mp_impl->S04_AXI_tlm_aximm_read_socket->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_impl->S04_AXI_tlm_aximm_write_socket->bind(*(mp_S04_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S05_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S05_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S05_AXI' transactor parameters
    xsc::common_cpp::properties S05_AXI_transactor_param_props;
    S05_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S05_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S05_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S05_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S05_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S05_AXI_transactor", S05_AXI_transactor_param_props);

    // S05_AXI' transactor ports

    mp_S05_AXI_transactor->AWADDR(S05_AXI_awaddr);
    mp_S05_AXI_transactor->AWLEN(S05_AXI_awlen);
    mp_S05_AXI_transactor->AWSIZE(S05_AXI_awsize);
    mp_S05_AXI_transactor->AWBURST(S05_AXI_awburst);
    mp_S05_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_awlock_converter");
    mp_S05_AXI_awlock_converter->vector_in(S05_AXI_awlock);
    mp_S05_AXI_awlock_converter->scalar_out(m_S05_AXI_awlock_converter_signal);
    mp_S05_AXI_transactor->AWLOCK(m_S05_AXI_awlock_converter_signal);
    mp_S05_AXI_transactor->AWCACHE(S05_AXI_awcache);
    mp_S05_AXI_transactor->AWPROT(S05_AXI_awprot);
    mp_S05_AXI_transactor->AWQOS(S05_AXI_awqos);
    mp_S05_AXI_transactor->AWVALID(S05_AXI_awvalid);
    mp_S05_AXI_transactor->AWREADY(S05_AXI_awready);
    mp_S05_AXI_transactor->WDATA(S05_AXI_wdata);
    mp_S05_AXI_transactor->WSTRB(S05_AXI_wstrb);
    mp_S05_AXI_transactor->WLAST(S05_AXI_wlast);
    mp_S05_AXI_transactor->WVALID(S05_AXI_wvalid);
    mp_S05_AXI_transactor->WREADY(S05_AXI_wready);
    mp_S05_AXI_transactor->BRESP(S05_AXI_bresp);
    mp_S05_AXI_transactor->BVALID(S05_AXI_bvalid);
    mp_S05_AXI_transactor->BREADY(S05_AXI_bready);
    mp_S05_AXI_transactor->ARADDR(S05_AXI_araddr);
    mp_S05_AXI_transactor->ARLEN(S05_AXI_arlen);
    mp_S05_AXI_transactor->ARSIZE(S05_AXI_arsize);
    mp_S05_AXI_transactor->ARBURST(S05_AXI_arburst);
    mp_S05_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_arlock_converter");
    mp_S05_AXI_arlock_converter->vector_in(S05_AXI_arlock);
    mp_S05_AXI_arlock_converter->scalar_out(m_S05_AXI_arlock_converter_signal);
    mp_S05_AXI_transactor->ARLOCK(m_S05_AXI_arlock_converter_signal);
    mp_S05_AXI_transactor->ARCACHE(S05_AXI_arcache);
    mp_S05_AXI_transactor->ARPROT(S05_AXI_arprot);
    mp_S05_AXI_transactor->ARQOS(S05_AXI_arqos);
    mp_S05_AXI_transactor->ARVALID(S05_AXI_arvalid);
    mp_S05_AXI_transactor->ARREADY(S05_AXI_arready);
    mp_S05_AXI_transactor->RDATA(S05_AXI_rdata);
    mp_S05_AXI_transactor->RRESP(S05_AXI_rresp);
    mp_S05_AXI_transactor->RLAST(S05_AXI_rlast);
    mp_S05_AXI_transactor->RVALID(S05_AXI_rvalid);
    mp_S05_AXI_transactor->RREADY(S05_AXI_rready);
    mp_S05_AXI_transactor->CLK(aclk1);
    mp_S05_AXI_transactor->RST(aresetn);

    // S05_AXI' transactor sockets

    mp_impl->S05_AXI_tlm_aximm_read_socket->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_impl->S05_AXI_tlm_aximm_write_socket->bind(*(mp_S05_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S06_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S06_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S06_AXI' transactor parameters
    xsc::common_cpp::properties S06_AXI_transactor_param_props;
    S06_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S06_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S06_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S06_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S06_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S06_AXI_transactor", S06_AXI_transactor_param_props);

    // S06_AXI' transactor ports

    mp_S06_AXI_transactor->AWADDR(S06_AXI_awaddr);
    mp_S06_AXI_transactor->AWLEN(S06_AXI_awlen);
    mp_S06_AXI_transactor->AWSIZE(S06_AXI_awsize);
    mp_S06_AXI_transactor->AWBURST(S06_AXI_awburst);
    mp_S06_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_awlock_converter");
    mp_S06_AXI_awlock_converter->vector_in(S06_AXI_awlock);
    mp_S06_AXI_awlock_converter->scalar_out(m_S06_AXI_awlock_converter_signal);
    mp_S06_AXI_transactor->AWLOCK(m_S06_AXI_awlock_converter_signal);
    mp_S06_AXI_transactor->AWCACHE(S06_AXI_awcache);
    mp_S06_AXI_transactor->AWPROT(S06_AXI_awprot);
    mp_S06_AXI_transactor->AWQOS(S06_AXI_awqos);
    mp_S06_AXI_transactor->AWVALID(S06_AXI_awvalid);
    mp_S06_AXI_transactor->AWREADY(S06_AXI_awready);
    mp_S06_AXI_transactor->WDATA(S06_AXI_wdata);
    mp_S06_AXI_transactor->WSTRB(S06_AXI_wstrb);
    mp_S06_AXI_transactor->WLAST(S06_AXI_wlast);
    mp_S06_AXI_transactor->WVALID(S06_AXI_wvalid);
    mp_S06_AXI_transactor->WREADY(S06_AXI_wready);
    mp_S06_AXI_transactor->BRESP(S06_AXI_bresp);
    mp_S06_AXI_transactor->BVALID(S06_AXI_bvalid);
    mp_S06_AXI_transactor->BREADY(S06_AXI_bready);
    mp_S06_AXI_transactor->ARADDR(S06_AXI_araddr);
    mp_S06_AXI_transactor->ARLEN(S06_AXI_arlen);
    mp_S06_AXI_transactor->ARSIZE(S06_AXI_arsize);
    mp_S06_AXI_transactor->ARBURST(S06_AXI_arburst);
    mp_S06_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_arlock_converter");
    mp_S06_AXI_arlock_converter->vector_in(S06_AXI_arlock);
    mp_S06_AXI_arlock_converter->scalar_out(m_S06_AXI_arlock_converter_signal);
    mp_S06_AXI_transactor->ARLOCK(m_S06_AXI_arlock_converter_signal);
    mp_S06_AXI_transactor->ARCACHE(S06_AXI_arcache);
    mp_S06_AXI_transactor->ARPROT(S06_AXI_arprot);
    mp_S06_AXI_transactor->ARQOS(S06_AXI_arqos);
    mp_S06_AXI_transactor->ARVALID(S06_AXI_arvalid);
    mp_S06_AXI_transactor->ARREADY(S06_AXI_arready);
    mp_S06_AXI_transactor->RDATA(S06_AXI_rdata);
    mp_S06_AXI_transactor->RRESP(S06_AXI_rresp);
    mp_S06_AXI_transactor->RLAST(S06_AXI_rlast);
    mp_S06_AXI_transactor->RVALID(S06_AXI_rvalid);
    mp_S06_AXI_transactor->RREADY(S06_AXI_rready);
    mp_S06_AXI_transactor->CLK(aclk1);
    mp_S06_AXI_transactor->RST(aresetn);

    // S06_AXI' transactor sockets

    mp_impl->S06_AXI_tlm_aximm_read_socket->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_impl->S06_AXI_tlm_aximm_write_socket->bind(*(mp_S06_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'S07_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S07_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S07_AXI' transactor parameters
    xsc::common_cpp::properties S07_AXI_transactor_param_props;
    S07_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S07_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S07_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S07_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S07_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S07_AXI_transactor", S07_AXI_transactor_param_props);

    // S07_AXI' transactor ports

    mp_S07_AXI_transactor->AWADDR(S07_AXI_awaddr);
    mp_S07_AXI_transactor->AWLEN(S07_AXI_awlen);
    mp_S07_AXI_transactor->AWSIZE(S07_AXI_awsize);
    mp_S07_AXI_transactor->AWBURST(S07_AXI_awburst);
    mp_S07_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_awlock_converter");
    mp_S07_AXI_awlock_converter->vector_in(S07_AXI_awlock);
    mp_S07_AXI_awlock_converter->scalar_out(m_S07_AXI_awlock_converter_signal);
    mp_S07_AXI_transactor->AWLOCK(m_S07_AXI_awlock_converter_signal);
    mp_S07_AXI_transactor->AWCACHE(S07_AXI_awcache);
    mp_S07_AXI_transactor->AWPROT(S07_AXI_awprot);
    mp_S07_AXI_transactor->AWQOS(S07_AXI_awqos);
    mp_S07_AXI_transactor->AWVALID(S07_AXI_awvalid);
    mp_S07_AXI_transactor->AWREADY(S07_AXI_awready);
    mp_S07_AXI_transactor->WDATA(S07_AXI_wdata);
    mp_S07_AXI_transactor->WSTRB(S07_AXI_wstrb);
    mp_S07_AXI_transactor->WLAST(S07_AXI_wlast);
    mp_S07_AXI_transactor->WVALID(S07_AXI_wvalid);
    mp_S07_AXI_transactor->WREADY(S07_AXI_wready);
    mp_S07_AXI_transactor->BRESP(S07_AXI_bresp);
    mp_S07_AXI_transactor->BVALID(S07_AXI_bvalid);
    mp_S07_AXI_transactor->BREADY(S07_AXI_bready);
    mp_S07_AXI_transactor->ARADDR(S07_AXI_araddr);
    mp_S07_AXI_transactor->ARLEN(S07_AXI_arlen);
    mp_S07_AXI_transactor->ARSIZE(S07_AXI_arsize);
    mp_S07_AXI_transactor->ARBURST(S07_AXI_arburst);
    mp_S07_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_arlock_converter");
    mp_S07_AXI_arlock_converter->vector_in(S07_AXI_arlock);
    mp_S07_AXI_arlock_converter->scalar_out(m_S07_AXI_arlock_converter_signal);
    mp_S07_AXI_transactor->ARLOCK(m_S07_AXI_arlock_converter_signal);
    mp_S07_AXI_transactor->ARCACHE(S07_AXI_arcache);
    mp_S07_AXI_transactor->ARPROT(S07_AXI_arprot);
    mp_S07_AXI_transactor->ARQOS(S07_AXI_arqos);
    mp_S07_AXI_transactor->ARVALID(S07_AXI_arvalid);
    mp_S07_AXI_transactor->ARREADY(S07_AXI_arready);
    mp_S07_AXI_transactor->RDATA(S07_AXI_rdata);
    mp_S07_AXI_transactor->RRESP(S07_AXI_rresp);
    mp_S07_AXI_transactor->RLAST(S07_AXI_rlast);
    mp_S07_AXI_transactor->RVALID(S07_AXI_rvalid);
    mp_S07_AXI_transactor->RREADY(S07_AXI_rready);
    mp_S07_AXI_transactor->CLK(aclk1);
    mp_S07_AXI_transactor->RST(aresetn);

    // S07_AXI' transactor sockets

    mp_impl->S07_AXI_tlm_aximm_read_socket->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_impl->S07_AXI_tlm_aximm_write_socket->bind(*(mp_S07_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "M00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M00_AXI' transactor parameters
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "128");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "49");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "128");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<128,49,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);

    // M00_AXI' transactor ports

    mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
    mp_M00_AXI_transactor->AWLEN(M00_AXI_awlen);
    mp_M00_AXI_transactor->AWSIZE(M00_AXI_awsize);
    mp_M00_AXI_transactor->AWBURST(M00_AXI_awburst);
    mp_M00_AXI_awlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_awlock_converter");
    mp_M00_AXI_awlock_converter->scalar_in(m_M00_AXI_awlock_converter_signal);
    mp_M00_AXI_awlock_converter->vector_out(M00_AXI_awlock);
    mp_M00_AXI_transactor->AWLOCK(m_M00_AXI_awlock_converter_signal);
    mp_M00_AXI_transactor->AWCACHE(M00_AXI_awcache);
    mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
    mp_M00_AXI_transactor->AWQOS(M00_AXI_awqos);
    mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
    mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
    mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
    mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
    mp_M00_AXI_transactor->WLAST(M00_AXI_wlast);
    mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
    mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
    mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
    mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
    mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
    mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
    mp_M00_AXI_transactor->ARLEN(M00_AXI_arlen);
    mp_M00_AXI_transactor->ARSIZE(M00_AXI_arsize);
    mp_M00_AXI_transactor->ARBURST(M00_AXI_arburst);
    mp_M00_AXI_arlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_arlock_converter");
    mp_M00_AXI_arlock_converter->scalar_in(m_M00_AXI_arlock_converter_signal);
    mp_M00_AXI_arlock_converter->vector_out(M00_AXI_arlock);
    mp_M00_AXI_transactor->ARLOCK(m_M00_AXI_arlock_converter_signal);
    mp_M00_AXI_transactor->ARCACHE(M00_AXI_arcache);
    mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
    mp_M00_AXI_transactor->ARQOS(M00_AXI_arqos);
    mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
    mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
    mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
    mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
    mp_M00_AXI_transactor->RLAST(M00_AXI_rlast);
    mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
    mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
    mp_M00_AXI_transactor->CLK(aclk);
    mp_M00_AXI_transactor->RST(aresetn);

    // M00_AXI' transactor sockets

    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // RIVIERA




#ifdef VCSSYSTEMC
system_axi_smc_9::system_axi_smc_9(const sc_core::sc_module_name& nm) : system_axi_smc_9_sc(nm),  aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S01_AXI_awaddr("S01_AXI_awaddr"), S01_AXI_awlen("S01_AXI_awlen"), S01_AXI_awsize("S01_AXI_awsize"), S01_AXI_awburst("S01_AXI_awburst"), S01_AXI_awlock("S01_AXI_awlock"), S01_AXI_awcache("S01_AXI_awcache"), S01_AXI_awprot("S01_AXI_awprot"), S01_AXI_awqos("S01_AXI_awqos"), S01_AXI_awvalid("S01_AXI_awvalid"), S01_AXI_awready("S01_AXI_awready"), S01_AXI_wdata("S01_AXI_wdata"), S01_AXI_wstrb("S01_AXI_wstrb"), S01_AXI_wlast("S01_AXI_wlast"), S01_AXI_wvalid("S01_AXI_wvalid"), S01_AXI_wready("S01_AXI_wready"), S01_AXI_bresp("S01_AXI_bresp"), S01_AXI_bvalid("S01_AXI_bvalid"), S01_AXI_bready("S01_AXI_bready"), S02_AXI_awaddr("S02_AXI_awaddr"), S02_AXI_awlen("S02_AXI_awlen"), S02_AXI_awsize("S02_AXI_awsize"), S02_AXI_awburst("S02_AXI_awburst"), S02_AXI_awlock("S02_AXI_awlock"), S02_AXI_awcache("S02_AXI_awcache"), S02_AXI_awprot("S02_AXI_awprot"), S02_AXI_awqos("S02_AXI_awqos"), S02_AXI_awvalid("S02_AXI_awvalid"), S02_AXI_awready("S02_AXI_awready"), S02_AXI_wdata("S02_AXI_wdata"), S02_AXI_wstrb("S02_AXI_wstrb"), S02_AXI_wlast("S02_AXI_wlast"), S02_AXI_wvalid("S02_AXI_wvalid"), S02_AXI_wready("S02_AXI_wready"), S02_AXI_bresp("S02_AXI_bresp"), S02_AXI_bvalid("S02_AXI_bvalid"), S02_AXI_bready("S02_AXI_bready"), S03_AXI_araddr("S03_AXI_araddr"), S03_AXI_arlen("S03_AXI_arlen"), S03_AXI_arsize("S03_AXI_arsize"), S03_AXI_arburst("S03_AXI_arburst"), S03_AXI_arlock("S03_AXI_arlock"), S03_AXI_arcache("S03_AXI_arcache"), S03_AXI_arprot("S03_AXI_arprot"), S03_AXI_arqos("S03_AXI_arqos"), S03_AXI_arvalid("S03_AXI_arvalid"), S03_AXI_arready("S03_AXI_arready"), S03_AXI_rdata("S03_AXI_rdata"), S03_AXI_rresp("S03_AXI_rresp"), S03_AXI_rlast("S03_AXI_rlast"), S03_AXI_rvalid("S03_AXI_rvalid"), S03_AXI_rready("S03_AXI_rready"), S04_AXI_awaddr("S04_AXI_awaddr"), S04_AXI_awlen("S04_AXI_awlen"), S04_AXI_awsize("S04_AXI_awsize"), S04_AXI_awburst("S04_AXI_awburst"), S04_AXI_awlock("S04_AXI_awlock"), S04_AXI_awcache("S04_AXI_awcache"), S04_AXI_awprot("S04_AXI_awprot"), S04_AXI_awqos("S04_AXI_awqos"), S04_AXI_awvalid("S04_AXI_awvalid"), S04_AXI_awready("S04_AXI_awready"), S04_AXI_wdata("S04_AXI_wdata"), S04_AXI_wstrb("S04_AXI_wstrb"), S04_AXI_wlast("S04_AXI_wlast"), S04_AXI_wvalid("S04_AXI_wvalid"), S04_AXI_wready("S04_AXI_wready"), S04_AXI_bresp("S04_AXI_bresp"), S04_AXI_bvalid("S04_AXI_bvalid"), S04_AXI_bready("S04_AXI_bready"), S04_AXI_araddr("S04_AXI_araddr"), S04_AXI_arlen("S04_AXI_arlen"), S04_AXI_arsize("S04_AXI_arsize"), S04_AXI_arburst("S04_AXI_arburst"), S04_AXI_arlock("S04_AXI_arlock"), S04_AXI_arcache("S04_AXI_arcache"), S04_AXI_arprot("S04_AXI_arprot"), S04_AXI_arqos("S04_AXI_arqos"), S04_AXI_arvalid("S04_AXI_arvalid"), S04_AXI_arready("S04_AXI_arready"), S04_AXI_rdata("S04_AXI_rdata"), S04_AXI_rresp("S04_AXI_rresp"), S04_AXI_rlast("S04_AXI_rlast"), S04_AXI_rvalid("S04_AXI_rvalid"), S04_AXI_rready("S04_AXI_rready"), S05_AXI_awaddr("S05_AXI_awaddr"), S05_AXI_awlen("S05_AXI_awlen"), S05_AXI_awsize("S05_AXI_awsize"), S05_AXI_awburst("S05_AXI_awburst"), S05_AXI_awlock("S05_AXI_awlock"), S05_AXI_awcache("S05_AXI_awcache"), S05_AXI_awprot("S05_AXI_awprot"), S05_AXI_awqos("S05_AXI_awqos"), S05_AXI_awvalid("S05_AXI_awvalid"), S05_AXI_awready("S05_AXI_awready"), S05_AXI_wdata("S05_AXI_wdata"), S05_AXI_wstrb("S05_AXI_wstrb"), S05_AXI_wlast("S05_AXI_wlast"), S05_AXI_wvalid("S05_AXI_wvalid"), S05_AXI_wready("S05_AXI_wready"), S05_AXI_bresp("S05_AXI_bresp"), S05_AXI_bvalid("S05_AXI_bvalid"), S05_AXI_bready("S05_AXI_bready"), S05_AXI_araddr("S05_AXI_araddr"), S05_AXI_arlen("S05_AXI_arlen"), S05_AXI_arsize("S05_AXI_arsize"), S05_AXI_arburst("S05_AXI_arburst"), S05_AXI_arlock("S05_AXI_arlock"), S05_AXI_arcache("S05_AXI_arcache"), S05_AXI_arprot("S05_AXI_arprot"), S05_AXI_arqos("S05_AXI_arqos"), S05_AXI_arvalid("S05_AXI_arvalid"), S05_AXI_arready("S05_AXI_arready"), S05_AXI_rdata("S05_AXI_rdata"), S05_AXI_rresp("S05_AXI_rresp"), S05_AXI_rlast("S05_AXI_rlast"), S05_AXI_rvalid("S05_AXI_rvalid"), S05_AXI_rready("S05_AXI_rready"), S06_AXI_awaddr("S06_AXI_awaddr"), S06_AXI_awlen("S06_AXI_awlen"), S06_AXI_awsize("S06_AXI_awsize"), S06_AXI_awburst("S06_AXI_awburst"), S06_AXI_awlock("S06_AXI_awlock"), S06_AXI_awcache("S06_AXI_awcache"), S06_AXI_awprot("S06_AXI_awprot"), S06_AXI_awqos("S06_AXI_awqos"), S06_AXI_awvalid("S06_AXI_awvalid"), S06_AXI_awready("S06_AXI_awready"), S06_AXI_wdata("S06_AXI_wdata"), S06_AXI_wstrb("S06_AXI_wstrb"), S06_AXI_wlast("S06_AXI_wlast"), S06_AXI_wvalid("S06_AXI_wvalid"), S06_AXI_wready("S06_AXI_wready"), S06_AXI_bresp("S06_AXI_bresp"), S06_AXI_bvalid("S06_AXI_bvalid"), S06_AXI_bready("S06_AXI_bready"), S06_AXI_araddr("S06_AXI_araddr"), S06_AXI_arlen("S06_AXI_arlen"), S06_AXI_arsize("S06_AXI_arsize"), S06_AXI_arburst("S06_AXI_arburst"), S06_AXI_arlock("S06_AXI_arlock"), S06_AXI_arcache("S06_AXI_arcache"), S06_AXI_arprot("S06_AXI_arprot"), S06_AXI_arqos("S06_AXI_arqos"), S06_AXI_arvalid("S06_AXI_arvalid"), S06_AXI_arready("S06_AXI_arready"), S06_AXI_rdata("S06_AXI_rdata"), S06_AXI_rresp("S06_AXI_rresp"), S06_AXI_rlast("S06_AXI_rlast"), S06_AXI_rvalid("S06_AXI_rvalid"), S06_AXI_rready("S06_AXI_rready"), S07_AXI_awaddr("S07_AXI_awaddr"), S07_AXI_awlen("S07_AXI_awlen"), S07_AXI_awsize("S07_AXI_awsize"), S07_AXI_awburst("S07_AXI_awburst"), S07_AXI_awlock("S07_AXI_awlock"), S07_AXI_awcache("S07_AXI_awcache"), S07_AXI_awprot("S07_AXI_awprot"), S07_AXI_awqos("S07_AXI_awqos"), S07_AXI_awvalid("S07_AXI_awvalid"), S07_AXI_awready("S07_AXI_awready"), S07_AXI_wdata("S07_AXI_wdata"), S07_AXI_wstrb("S07_AXI_wstrb"), S07_AXI_wlast("S07_AXI_wlast"), S07_AXI_wvalid("S07_AXI_wvalid"), S07_AXI_wready("S07_AXI_wready"), S07_AXI_bresp("S07_AXI_bresp"), S07_AXI_bvalid("S07_AXI_bvalid"), S07_AXI_bready("S07_AXI_bready"), S07_AXI_araddr("S07_AXI_araddr"), S07_AXI_arlen("S07_AXI_arlen"), S07_AXI_arsize("S07_AXI_arsize"), S07_AXI_arburst("S07_AXI_arburst"), S07_AXI_arlock("S07_AXI_arlock"), S07_AXI_arcache("S07_AXI_arcache"), S07_AXI_arprot("S07_AXI_arprot"), S07_AXI_arqos("S07_AXI_arqos"), S07_AXI_arvalid("S07_AXI_arvalid"), S07_AXI_arready("S07_AXI_arready"), S07_AXI_rdata("S07_AXI_rdata"), S07_AXI_rresp("S07_AXI_rresp"), S07_AXI_rlast("S07_AXI_rlast"), S07_AXI_rvalid("S07_AXI_rvalid"), S07_AXI_rready("S07_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awlen("M00_AXI_awlen"), M00_AXI_awsize("M00_AXI_awsize"), M00_AXI_awburst("M00_AXI_awburst"), M00_AXI_awlock("M00_AXI_awlock"), M00_AXI_awcache("M00_AXI_awcache"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awqos("M00_AXI_awqos"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wlast("M00_AXI_wlast"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arlen("M00_AXI_arlen"), M00_AXI_arsize("M00_AXI_arsize"), M00_AXI_arburst("M00_AXI_arburst"), M00_AXI_arlock("M00_AXI_arlock"), M00_AXI_arcache("M00_AXI_arcache"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arqos("M00_AXI_arqos"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rlast("M00_AXI_rlast"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"),mp_S00_AXI_rd_socket_stub(nullptr),mp_S01_AXI_rd_socket_stub(nullptr),mp_S02_AXI_rd_socket_stub(nullptr),mp_S03_AXI_wr_socket_stub(nullptr)
{
  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S01_AXI_transactor = NULL;
  mp_S01_AXI_awlock_converter = NULL;
  mp_S02_AXI_transactor = NULL;
  mp_S02_AXI_awlock_converter = NULL;
  mp_S03_AXI_transactor = NULL;
  mp_S03_AXI_arlock_converter = NULL;
  mp_S04_AXI_transactor = NULL;
  mp_S04_AXI_awlock_converter = NULL;
  mp_S04_AXI_arlock_converter = NULL;
  mp_S05_AXI_transactor = NULL;
  mp_S05_AXI_awlock_converter = NULL;
  mp_S05_AXI_arlock_converter = NULL;
  mp_S06_AXI_transactor = NULL;
  mp_S06_AXI_awlock_converter = NULL;
  mp_S06_AXI_arlock_converter = NULL;
  mp_S07_AXI_transactor = NULL;
  mp_S07_AXI_awlock_converter = NULL;
  mp_S07_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M00_AXI_awlock_converter = NULL;
  mp_M00_AXI_arlock_converter = NULL;

  // Instantiate Socket Stubs
  mp_S00_AXI_rd_socket_stub = NULL;
  mp_S01_AXI_rd_socket_stub = NULL;
  mp_S02_AXI_rd_socket_stub = NULL;
  mp_S03_AXI_wr_socket_stub = NULL;

  // configure S00_AXI_transactor
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);
  mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
  mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
  mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
  mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
  mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
  mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
  mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
  mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
  mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
  mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
  mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
  mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
  mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
  mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
  mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
  mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
  mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
  mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
  mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
  mp_S00_AXI_transactor->CLK(aclk);
  mp_S00_AXI_transactor->RST(aresetn);
  // configure S01_AXI_transactor
    xsc::common_cpp::properties S01_AXI_transactor_param_props;
    S01_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S01_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S01_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S01_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S01_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S01_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S01_AXI_transactor", S01_AXI_transactor_param_props);
  mp_S01_AXI_transactor->AWADDR(S01_AXI_awaddr);
  mp_S01_AXI_transactor->AWLEN(S01_AXI_awlen);
  mp_S01_AXI_transactor->AWSIZE(S01_AXI_awsize);
  mp_S01_AXI_transactor->AWBURST(S01_AXI_awburst);
  mp_S01_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S01_AXI_awlock_converter");
  mp_S01_AXI_awlock_converter->vector_in(S01_AXI_awlock);
  mp_S01_AXI_awlock_converter->scalar_out(m_S01_AXI_awlock_converter_signal);
  mp_S01_AXI_transactor->AWLOCK(m_S01_AXI_awlock_converter_signal);
  mp_S01_AXI_transactor->AWCACHE(S01_AXI_awcache);
  mp_S01_AXI_transactor->AWPROT(S01_AXI_awprot);
  mp_S01_AXI_transactor->AWQOS(S01_AXI_awqos);
  mp_S01_AXI_transactor->AWVALID(S01_AXI_awvalid);
  mp_S01_AXI_transactor->AWREADY(S01_AXI_awready);
  mp_S01_AXI_transactor->WDATA(S01_AXI_wdata);
  mp_S01_AXI_transactor->WSTRB(S01_AXI_wstrb);
  mp_S01_AXI_transactor->WLAST(S01_AXI_wlast);
  mp_S01_AXI_transactor->WVALID(S01_AXI_wvalid);
  mp_S01_AXI_transactor->WREADY(S01_AXI_wready);
  mp_S01_AXI_transactor->BRESP(S01_AXI_bresp);
  mp_S01_AXI_transactor->BVALID(S01_AXI_bvalid);
  mp_S01_AXI_transactor->BREADY(S01_AXI_bready);
  mp_S01_AXI_transactor->CLK(aclk);
  mp_S01_AXI_transactor->RST(aresetn);
  // configure S02_AXI_transactor
    xsc::common_cpp::properties S02_AXI_transactor_param_props;
    S02_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S02_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S02_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S02_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S02_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S02_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S02_AXI_transactor", S02_AXI_transactor_param_props);
  mp_S02_AXI_transactor->AWADDR(S02_AXI_awaddr);
  mp_S02_AXI_transactor->AWLEN(S02_AXI_awlen);
  mp_S02_AXI_transactor->AWSIZE(S02_AXI_awsize);
  mp_S02_AXI_transactor->AWBURST(S02_AXI_awburst);
  mp_S02_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S02_AXI_awlock_converter");
  mp_S02_AXI_awlock_converter->vector_in(S02_AXI_awlock);
  mp_S02_AXI_awlock_converter->scalar_out(m_S02_AXI_awlock_converter_signal);
  mp_S02_AXI_transactor->AWLOCK(m_S02_AXI_awlock_converter_signal);
  mp_S02_AXI_transactor->AWCACHE(S02_AXI_awcache);
  mp_S02_AXI_transactor->AWPROT(S02_AXI_awprot);
  mp_S02_AXI_transactor->AWQOS(S02_AXI_awqos);
  mp_S02_AXI_transactor->AWVALID(S02_AXI_awvalid);
  mp_S02_AXI_transactor->AWREADY(S02_AXI_awready);
  mp_S02_AXI_transactor->WDATA(S02_AXI_wdata);
  mp_S02_AXI_transactor->WSTRB(S02_AXI_wstrb);
  mp_S02_AXI_transactor->WLAST(S02_AXI_wlast);
  mp_S02_AXI_transactor->WVALID(S02_AXI_wvalid);
  mp_S02_AXI_transactor->WREADY(S02_AXI_wready);
  mp_S02_AXI_transactor->BRESP(S02_AXI_bresp);
  mp_S02_AXI_transactor->BVALID(S02_AXI_bvalid);
  mp_S02_AXI_transactor->BREADY(S02_AXI_bready);
  mp_S02_AXI_transactor->CLK(aclk);
  mp_S02_AXI_transactor->RST(aresetn);
  // configure S03_AXI_transactor
    xsc::common_cpp::properties S03_AXI_transactor_param_props;
    S03_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S03_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S03_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S03_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S03_AXI_transactor_param_props.addLong("HAS_WSTRB", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BRESP", "0");
    S03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S03_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_ONLY");
    S03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S03_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S03_AXI_transactor", S03_AXI_transactor_param_props);
  mp_S03_AXI_transactor->ARADDR(S03_AXI_araddr);
  mp_S03_AXI_transactor->ARLEN(S03_AXI_arlen);
  mp_S03_AXI_transactor->ARSIZE(S03_AXI_arsize);
  mp_S03_AXI_transactor->ARBURST(S03_AXI_arburst);
  mp_S03_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S03_AXI_arlock_converter");
  mp_S03_AXI_arlock_converter->vector_in(S03_AXI_arlock);
  mp_S03_AXI_arlock_converter->scalar_out(m_S03_AXI_arlock_converter_signal);
  mp_S03_AXI_transactor->ARLOCK(m_S03_AXI_arlock_converter_signal);
  mp_S03_AXI_transactor->ARCACHE(S03_AXI_arcache);
  mp_S03_AXI_transactor->ARPROT(S03_AXI_arprot);
  mp_S03_AXI_transactor->ARQOS(S03_AXI_arqos);
  mp_S03_AXI_transactor->ARVALID(S03_AXI_arvalid);
  mp_S03_AXI_transactor->ARREADY(S03_AXI_arready);
  mp_S03_AXI_transactor->RDATA(S03_AXI_rdata);
  mp_S03_AXI_transactor->RRESP(S03_AXI_rresp);
  mp_S03_AXI_transactor->RLAST(S03_AXI_rlast);
  mp_S03_AXI_transactor->RVALID(S03_AXI_rvalid);
  mp_S03_AXI_transactor->RREADY(S03_AXI_rready);
  mp_S03_AXI_transactor->CLK(aclk);
  mp_S03_AXI_transactor->RST(aresetn);
  // configure S04_AXI_transactor
    xsc::common_cpp::properties S04_AXI_transactor_param_props;
    S04_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S04_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S04_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S04_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S04_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S04_AXI_transactor", S04_AXI_transactor_param_props);
  mp_S04_AXI_transactor->AWADDR(S04_AXI_awaddr);
  mp_S04_AXI_transactor->AWLEN(S04_AXI_awlen);
  mp_S04_AXI_transactor->AWSIZE(S04_AXI_awsize);
  mp_S04_AXI_transactor->AWBURST(S04_AXI_awburst);
  mp_S04_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_awlock_converter");
  mp_S04_AXI_awlock_converter->vector_in(S04_AXI_awlock);
  mp_S04_AXI_awlock_converter->scalar_out(m_S04_AXI_awlock_converter_signal);
  mp_S04_AXI_transactor->AWLOCK(m_S04_AXI_awlock_converter_signal);
  mp_S04_AXI_transactor->AWCACHE(S04_AXI_awcache);
  mp_S04_AXI_transactor->AWPROT(S04_AXI_awprot);
  mp_S04_AXI_transactor->AWQOS(S04_AXI_awqos);
  mp_S04_AXI_transactor->AWVALID(S04_AXI_awvalid);
  mp_S04_AXI_transactor->AWREADY(S04_AXI_awready);
  mp_S04_AXI_transactor->WDATA(S04_AXI_wdata);
  mp_S04_AXI_transactor->WSTRB(S04_AXI_wstrb);
  mp_S04_AXI_transactor->WLAST(S04_AXI_wlast);
  mp_S04_AXI_transactor->WVALID(S04_AXI_wvalid);
  mp_S04_AXI_transactor->WREADY(S04_AXI_wready);
  mp_S04_AXI_transactor->BRESP(S04_AXI_bresp);
  mp_S04_AXI_transactor->BVALID(S04_AXI_bvalid);
  mp_S04_AXI_transactor->BREADY(S04_AXI_bready);
  mp_S04_AXI_transactor->ARADDR(S04_AXI_araddr);
  mp_S04_AXI_transactor->ARLEN(S04_AXI_arlen);
  mp_S04_AXI_transactor->ARSIZE(S04_AXI_arsize);
  mp_S04_AXI_transactor->ARBURST(S04_AXI_arburst);
  mp_S04_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_arlock_converter");
  mp_S04_AXI_arlock_converter->vector_in(S04_AXI_arlock);
  mp_S04_AXI_arlock_converter->scalar_out(m_S04_AXI_arlock_converter_signal);
  mp_S04_AXI_transactor->ARLOCK(m_S04_AXI_arlock_converter_signal);
  mp_S04_AXI_transactor->ARCACHE(S04_AXI_arcache);
  mp_S04_AXI_transactor->ARPROT(S04_AXI_arprot);
  mp_S04_AXI_transactor->ARQOS(S04_AXI_arqos);
  mp_S04_AXI_transactor->ARVALID(S04_AXI_arvalid);
  mp_S04_AXI_transactor->ARREADY(S04_AXI_arready);
  mp_S04_AXI_transactor->RDATA(S04_AXI_rdata);
  mp_S04_AXI_transactor->RRESP(S04_AXI_rresp);
  mp_S04_AXI_transactor->RLAST(S04_AXI_rlast);
  mp_S04_AXI_transactor->RVALID(S04_AXI_rvalid);
  mp_S04_AXI_transactor->RREADY(S04_AXI_rready);
  mp_S04_AXI_transactor->CLK(aclk1);
  mp_S04_AXI_transactor->RST(aresetn);
  // configure S05_AXI_transactor
    xsc::common_cpp::properties S05_AXI_transactor_param_props;
    S05_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S05_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S05_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S05_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S05_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S05_AXI_transactor", S05_AXI_transactor_param_props);
  mp_S05_AXI_transactor->AWADDR(S05_AXI_awaddr);
  mp_S05_AXI_transactor->AWLEN(S05_AXI_awlen);
  mp_S05_AXI_transactor->AWSIZE(S05_AXI_awsize);
  mp_S05_AXI_transactor->AWBURST(S05_AXI_awburst);
  mp_S05_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_awlock_converter");
  mp_S05_AXI_awlock_converter->vector_in(S05_AXI_awlock);
  mp_S05_AXI_awlock_converter->scalar_out(m_S05_AXI_awlock_converter_signal);
  mp_S05_AXI_transactor->AWLOCK(m_S05_AXI_awlock_converter_signal);
  mp_S05_AXI_transactor->AWCACHE(S05_AXI_awcache);
  mp_S05_AXI_transactor->AWPROT(S05_AXI_awprot);
  mp_S05_AXI_transactor->AWQOS(S05_AXI_awqos);
  mp_S05_AXI_transactor->AWVALID(S05_AXI_awvalid);
  mp_S05_AXI_transactor->AWREADY(S05_AXI_awready);
  mp_S05_AXI_transactor->WDATA(S05_AXI_wdata);
  mp_S05_AXI_transactor->WSTRB(S05_AXI_wstrb);
  mp_S05_AXI_transactor->WLAST(S05_AXI_wlast);
  mp_S05_AXI_transactor->WVALID(S05_AXI_wvalid);
  mp_S05_AXI_transactor->WREADY(S05_AXI_wready);
  mp_S05_AXI_transactor->BRESP(S05_AXI_bresp);
  mp_S05_AXI_transactor->BVALID(S05_AXI_bvalid);
  mp_S05_AXI_transactor->BREADY(S05_AXI_bready);
  mp_S05_AXI_transactor->ARADDR(S05_AXI_araddr);
  mp_S05_AXI_transactor->ARLEN(S05_AXI_arlen);
  mp_S05_AXI_transactor->ARSIZE(S05_AXI_arsize);
  mp_S05_AXI_transactor->ARBURST(S05_AXI_arburst);
  mp_S05_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_arlock_converter");
  mp_S05_AXI_arlock_converter->vector_in(S05_AXI_arlock);
  mp_S05_AXI_arlock_converter->scalar_out(m_S05_AXI_arlock_converter_signal);
  mp_S05_AXI_transactor->ARLOCK(m_S05_AXI_arlock_converter_signal);
  mp_S05_AXI_transactor->ARCACHE(S05_AXI_arcache);
  mp_S05_AXI_transactor->ARPROT(S05_AXI_arprot);
  mp_S05_AXI_transactor->ARQOS(S05_AXI_arqos);
  mp_S05_AXI_transactor->ARVALID(S05_AXI_arvalid);
  mp_S05_AXI_transactor->ARREADY(S05_AXI_arready);
  mp_S05_AXI_transactor->RDATA(S05_AXI_rdata);
  mp_S05_AXI_transactor->RRESP(S05_AXI_rresp);
  mp_S05_AXI_transactor->RLAST(S05_AXI_rlast);
  mp_S05_AXI_transactor->RVALID(S05_AXI_rvalid);
  mp_S05_AXI_transactor->RREADY(S05_AXI_rready);
  mp_S05_AXI_transactor->CLK(aclk1);
  mp_S05_AXI_transactor->RST(aresetn);
  // configure S06_AXI_transactor
    xsc::common_cpp::properties S06_AXI_transactor_param_props;
    S06_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S06_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S06_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S06_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S06_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S06_AXI_transactor", S06_AXI_transactor_param_props);
  mp_S06_AXI_transactor->AWADDR(S06_AXI_awaddr);
  mp_S06_AXI_transactor->AWLEN(S06_AXI_awlen);
  mp_S06_AXI_transactor->AWSIZE(S06_AXI_awsize);
  mp_S06_AXI_transactor->AWBURST(S06_AXI_awburst);
  mp_S06_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_awlock_converter");
  mp_S06_AXI_awlock_converter->vector_in(S06_AXI_awlock);
  mp_S06_AXI_awlock_converter->scalar_out(m_S06_AXI_awlock_converter_signal);
  mp_S06_AXI_transactor->AWLOCK(m_S06_AXI_awlock_converter_signal);
  mp_S06_AXI_transactor->AWCACHE(S06_AXI_awcache);
  mp_S06_AXI_transactor->AWPROT(S06_AXI_awprot);
  mp_S06_AXI_transactor->AWQOS(S06_AXI_awqos);
  mp_S06_AXI_transactor->AWVALID(S06_AXI_awvalid);
  mp_S06_AXI_transactor->AWREADY(S06_AXI_awready);
  mp_S06_AXI_transactor->WDATA(S06_AXI_wdata);
  mp_S06_AXI_transactor->WSTRB(S06_AXI_wstrb);
  mp_S06_AXI_transactor->WLAST(S06_AXI_wlast);
  mp_S06_AXI_transactor->WVALID(S06_AXI_wvalid);
  mp_S06_AXI_transactor->WREADY(S06_AXI_wready);
  mp_S06_AXI_transactor->BRESP(S06_AXI_bresp);
  mp_S06_AXI_transactor->BVALID(S06_AXI_bvalid);
  mp_S06_AXI_transactor->BREADY(S06_AXI_bready);
  mp_S06_AXI_transactor->ARADDR(S06_AXI_araddr);
  mp_S06_AXI_transactor->ARLEN(S06_AXI_arlen);
  mp_S06_AXI_transactor->ARSIZE(S06_AXI_arsize);
  mp_S06_AXI_transactor->ARBURST(S06_AXI_arburst);
  mp_S06_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_arlock_converter");
  mp_S06_AXI_arlock_converter->vector_in(S06_AXI_arlock);
  mp_S06_AXI_arlock_converter->scalar_out(m_S06_AXI_arlock_converter_signal);
  mp_S06_AXI_transactor->ARLOCK(m_S06_AXI_arlock_converter_signal);
  mp_S06_AXI_transactor->ARCACHE(S06_AXI_arcache);
  mp_S06_AXI_transactor->ARPROT(S06_AXI_arprot);
  mp_S06_AXI_transactor->ARQOS(S06_AXI_arqos);
  mp_S06_AXI_transactor->ARVALID(S06_AXI_arvalid);
  mp_S06_AXI_transactor->ARREADY(S06_AXI_arready);
  mp_S06_AXI_transactor->RDATA(S06_AXI_rdata);
  mp_S06_AXI_transactor->RRESP(S06_AXI_rresp);
  mp_S06_AXI_transactor->RLAST(S06_AXI_rlast);
  mp_S06_AXI_transactor->RVALID(S06_AXI_rvalid);
  mp_S06_AXI_transactor->RREADY(S06_AXI_rready);
  mp_S06_AXI_transactor->CLK(aclk1);
  mp_S06_AXI_transactor->RST(aresetn);
  // configure S07_AXI_transactor
    xsc::common_cpp::properties S07_AXI_transactor_param_props;
    S07_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S07_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S07_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S07_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S07_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S07_AXI_transactor", S07_AXI_transactor_param_props);
  mp_S07_AXI_transactor->AWADDR(S07_AXI_awaddr);
  mp_S07_AXI_transactor->AWLEN(S07_AXI_awlen);
  mp_S07_AXI_transactor->AWSIZE(S07_AXI_awsize);
  mp_S07_AXI_transactor->AWBURST(S07_AXI_awburst);
  mp_S07_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_awlock_converter");
  mp_S07_AXI_awlock_converter->vector_in(S07_AXI_awlock);
  mp_S07_AXI_awlock_converter->scalar_out(m_S07_AXI_awlock_converter_signal);
  mp_S07_AXI_transactor->AWLOCK(m_S07_AXI_awlock_converter_signal);
  mp_S07_AXI_transactor->AWCACHE(S07_AXI_awcache);
  mp_S07_AXI_transactor->AWPROT(S07_AXI_awprot);
  mp_S07_AXI_transactor->AWQOS(S07_AXI_awqos);
  mp_S07_AXI_transactor->AWVALID(S07_AXI_awvalid);
  mp_S07_AXI_transactor->AWREADY(S07_AXI_awready);
  mp_S07_AXI_transactor->WDATA(S07_AXI_wdata);
  mp_S07_AXI_transactor->WSTRB(S07_AXI_wstrb);
  mp_S07_AXI_transactor->WLAST(S07_AXI_wlast);
  mp_S07_AXI_transactor->WVALID(S07_AXI_wvalid);
  mp_S07_AXI_transactor->WREADY(S07_AXI_wready);
  mp_S07_AXI_transactor->BRESP(S07_AXI_bresp);
  mp_S07_AXI_transactor->BVALID(S07_AXI_bvalid);
  mp_S07_AXI_transactor->BREADY(S07_AXI_bready);
  mp_S07_AXI_transactor->ARADDR(S07_AXI_araddr);
  mp_S07_AXI_transactor->ARLEN(S07_AXI_arlen);
  mp_S07_AXI_transactor->ARSIZE(S07_AXI_arsize);
  mp_S07_AXI_transactor->ARBURST(S07_AXI_arburst);
  mp_S07_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_arlock_converter");
  mp_S07_AXI_arlock_converter->vector_in(S07_AXI_arlock);
  mp_S07_AXI_arlock_converter->scalar_out(m_S07_AXI_arlock_converter_signal);
  mp_S07_AXI_transactor->ARLOCK(m_S07_AXI_arlock_converter_signal);
  mp_S07_AXI_transactor->ARCACHE(S07_AXI_arcache);
  mp_S07_AXI_transactor->ARPROT(S07_AXI_arprot);
  mp_S07_AXI_transactor->ARQOS(S07_AXI_arqos);
  mp_S07_AXI_transactor->ARVALID(S07_AXI_arvalid);
  mp_S07_AXI_transactor->ARREADY(S07_AXI_arready);
  mp_S07_AXI_transactor->RDATA(S07_AXI_rdata);
  mp_S07_AXI_transactor->RRESP(S07_AXI_rresp);
  mp_S07_AXI_transactor->RLAST(S07_AXI_rlast);
  mp_S07_AXI_transactor->RVALID(S07_AXI_rvalid);
  mp_S07_AXI_transactor->RREADY(S07_AXI_rready);
  mp_S07_AXI_transactor->CLK(aclk1);
  mp_S07_AXI_transactor->RST(aresetn);
  // configure M00_AXI_transactor
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "128");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "49");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "128");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<128,49,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);
  mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
  mp_M00_AXI_transactor->AWLEN(M00_AXI_awlen);
  mp_M00_AXI_transactor->AWSIZE(M00_AXI_awsize);
  mp_M00_AXI_transactor->AWBURST(M00_AXI_awburst);
  mp_M00_AXI_awlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_awlock_converter");
  mp_M00_AXI_awlock_converter->scalar_in(m_M00_AXI_awlock_converter_signal);
  mp_M00_AXI_awlock_converter->vector_out(M00_AXI_awlock);
  mp_M00_AXI_transactor->AWLOCK(m_M00_AXI_awlock_converter_signal);
  mp_M00_AXI_transactor->AWCACHE(M00_AXI_awcache);
  mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
  mp_M00_AXI_transactor->AWQOS(M00_AXI_awqos);
  mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
  mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
  mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
  mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
  mp_M00_AXI_transactor->WLAST(M00_AXI_wlast);
  mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
  mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
  mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
  mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
  mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
  mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
  mp_M00_AXI_transactor->ARLEN(M00_AXI_arlen);
  mp_M00_AXI_transactor->ARSIZE(M00_AXI_arsize);
  mp_M00_AXI_transactor->ARBURST(M00_AXI_arburst);
  mp_M00_AXI_arlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_arlock_converter");
  mp_M00_AXI_arlock_converter->scalar_in(m_M00_AXI_arlock_converter_signal);
  mp_M00_AXI_arlock_converter->vector_out(M00_AXI_arlock);
  mp_M00_AXI_transactor->ARLOCK(m_M00_AXI_arlock_converter_signal);
  mp_M00_AXI_transactor->ARCACHE(M00_AXI_arcache);
  mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
  mp_M00_AXI_transactor->ARQOS(M00_AXI_arqos);
  mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
  mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
  mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
  mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
  mp_M00_AXI_transactor->RLAST(M00_AXI_rlast);
  mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
  mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
  mp_M00_AXI_transactor->CLK(aclk);
  mp_M00_AXI_transactor->RST(aresetn);

  // initialize transactors stubs
  S00_AXI_transactor_target_wr_socket_stub = nullptr;
  S01_AXI_transactor_target_wr_socket_stub = nullptr;
  S02_AXI_transactor_target_wr_socket_stub = nullptr;
  S03_AXI_transactor_target_rd_socket_stub = nullptr;
  S04_AXI_transactor_target_wr_socket_stub = nullptr;
  S04_AXI_transactor_target_rd_socket_stub = nullptr;
  S05_AXI_transactor_target_wr_socket_stub = nullptr;
  S05_AXI_transactor_target_rd_socket_stub = nullptr;
  S06_AXI_transactor_target_wr_socket_stub = nullptr;
  S06_AXI_transactor_target_rd_socket_stub = nullptr;
  S07_AXI_transactor_target_wr_socket_stub = nullptr;
  S07_AXI_transactor_target_rd_socket_stub = nullptr;
  M00_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M00_AXI_transactor_initiator_rd_socket_stub = nullptr;

}

void system_axi_smc_9::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S00_AXI_TLM_MODE") != 1)
  {
    mp_S00_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);
    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(mp_S00_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  
  }
  else
  {
    S00_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S00_AXI_transactor_target_wr_socket_stub->bind(*(mp_S00_AXI_transactor->wr_socket));
    mp_S00_AXI_transactor->disable_transactor();
  }

  // configure 'S01_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S01_AXI_TLM_MODE") != 1)
  {
    mp_S01_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);
    mp_impl->S01_AXI_tlm_aximm_read_socket->bind(mp_S01_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S01_AXI_tlm_aximm_write_socket->bind(*(mp_S01_AXI_transactor->wr_socket));
  
  }
  else
  {
    S01_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S01_AXI_transactor_target_wr_socket_stub->bind(*(mp_S01_AXI_transactor->wr_socket));
    mp_S01_AXI_transactor->disable_transactor();
  }

  // configure 'S02_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S02_AXI_TLM_MODE") != 1)
  {
    mp_S02_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);
    mp_impl->S02_AXI_tlm_aximm_read_socket->bind(mp_S02_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S02_AXI_tlm_aximm_write_socket->bind(*(mp_S02_AXI_transactor->wr_socket));
  
  }
  else
  {
    S02_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S02_AXI_transactor_target_wr_socket_stub->bind(*(mp_S02_AXI_transactor->wr_socket));
    mp_S02_AXI_transactor->disable_transactor();
  }

  // configure 'S03_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S03_AXI_TLM_MODE") != 1)
  {
    mp_impl->S03_AXI_tlm_aximm_read_socket->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_S03_AXI_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket", 0);
    mp_impl->S03_AXI_tlm_aximm_write_socket->bind(mp_S03_AXI_wr_socket_stub->initiator_socket);
  
  }
  else
  {
    S03_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S03_AXI_transactor_target_rd_socket_stub->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_S03_AXI_transactor->disable_transactor();
  }

  // configure 'S04_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S04_AXI_TLM_MODE") != 1)
  {
    mp_impl->S04_AXI_tlm_aximm_read_socket->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_impl->S04_AXI_tlm_aximm_write_socket->bind(*(mp_S04_AXI_transactor->wr_socket));
  
  }
  else
  {
    S04_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S04_AXI_transactor_target_wr_socket_stub->bind(*(mp_S04_AXI_transactor->wr_socket));
    S04_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S04_AXI_transactor_target_rd_socket_stub->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_S04_AXI_transactor->disable_transactor();
  }

  // configure 'S05_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S05_AXI_TLM_MODE") != 1)
  {
    mp_impl->S05_AXI_tlm_aximm_read_socket->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_impl->S05_AXI_tlm_aximm_write_socket->bind(*(mp_S05_AXI_transactor->wr_socket));
  
  }
  else
  {
    S05_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S05_AXI_transactor_target_wr_socket_stub->bind(*(mp_S05_AXI_transactor->wr_socket));
    S05_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S05_AXI_transactor_target_rd_socket_stub->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_S05_AXI_transactor->disable_transactor();
  }

  // configure 'S06_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S06_AXI_TLM_MODE") != 1)
  {
    mp_impl->S06_AXI_tlm_aximm_read_socket->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_impl->S06_AXI_tlm_aximm_write_socket->bind(*(mp_S06_AXI_transactor->wr_socket));
  
  }
  else
  {
    S06_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S06_AXI_transactor_target_wr_socket_stub->bind(*(mp_S06_AXI_transactor->wr_socket));
    S06_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S06_AXI_transactor_target_rd_socket_stub->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_S06_AXI_transactor->disable_transactor();
  }

  // configure 'S07_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S07_AXI_TLM_MODE") != 1)
  {
    mp_impl->S07_AXI_tlm_aximm_read_socket->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_impl->S07_AXI_tlm_aximm_write_socket->bind(*(mp_S07_AXI_transactor->wr_socket));
  
  }
  else
  {
    S07_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S07_AXI_transactor_target_wr_socket_stub->bind(*(mp_S07_AXI_transactor->wr_socket));
    S07_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S07_AXI_transactor_target_rd_socket_stub->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_S07_AXI_transactor->disable_transactor();
  }

  // configure 'M00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "M00_AXI_TLM_MODE") != 1)
  {
    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  
  }
  else
  {
    M00_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M00_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M00_AXI_transactor->wr_socket));
    M00_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M00_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_M00_AXI_transactor->disable_transactor();
  }

}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
system_axi_smc_9::system_axi_smc_9(const sc_core::sc_module_name& nm) : system_axi_smc_9_sc(nm),  aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S01_AXI_awaddr("S01_AXI_awaddr"), S01_AXI_awlen("S01_AXI_awlen"), S01_AXI_awsize("S01_AXI_awsize"), S01_AXI_awburst("S01_AXI_awburst"), S01_AXI_awlock("S01_AXI_awlock"), S01_AXI_awcache("S01_AXI_awcache"), S01_AXI_awprot("S01_AXI_awprot"), S01_AXI_awqos("S01_AXI_awqos"), S01_AXI_awvalid("S01_AXI_awvalid"), S01_AXI_awready("S01_AXI_awready"), S01_AXI_wdata("S01_AXI_wdata"), S01_AXI_wstrb("S01_AXI_wstrb"), S01_AXI_wlast("S01_AXI_wlast"), S01_AXI_wvalid("S01_AXI_wvalid"), S01_AXI_wready("S01_AXI_wready"), S01_AXI_bresp("S01_AXI_bresp"), S01_AXI_bvalid("S01_AXI_bvalid"), S01_AXI_bready("S01_AXI_bready"), S02_AXI_awaddr("S02_AXI_awaddr"), S02_AXI_awlen("S02_AXI_awlen"), S02_AXI_awsize("S02_AXI_awsize"), S02_AXI_awburst("S02_AXI_awburst"), S02_AXI_awlock("S02_AXI_awlock"), S02_AXI_awcache("S02_AXI_awcache"), S02_AXI_awprot("S02_AXI_awprot"), S02_AXI_awqos("S02_AXI_awqos"), S02_AXI_awvalid("S02_AXI_awvalid"), S02_AXI_awready("S02_AXI_awready"), S02_AXI_wdata("S02_AXI_wdata"), S02_AXI_wstrb("S02_AXI_wstrb"), S02_AXI_wlast("S02_AXI_wlast"), S02_AXI_wvalid("S02_AXI_wvalid"), S02_AXI_wready("S02_AXI_wready"), S02_AXI_bresp("S02_AXI_bresp"), S02_AXI_bvalid("S02_AXI_bvalid"), S02_AXI_bready("S02_AXI_bready"), S03_AXI_araddr("S03_AXI_araddr"), S03_AXI_arlen("S03_AXI_arlen"), S03_AXI_arsize("S03_AXI_arsize"), S03_AXI_arburst("S03_AXI_arburst"), S03_AXI_arlock("S03_AXI_arlock"), S03_AXI_arcache("S03_AXI_arcache"), S03_AXI_arprot("S03_AXI_arprot"), S03_AXI_arqos("S03_AXI_arqos"), S03_AXI_arvalid("S03_AXI_arvalid"), S03_AXI_arready("S03_AXI_arready"), S03_AXI_rdata("S03_AXI_rdata"), S03_AXI_rresp("S03_AXI_rresp"), S03_AXI_rlast("S03_AXI_rlast"), S03_AXI_rvalid("S03_AXI_rvalid"), S03_AXI_rready("S03_AXI_rready"), S04_AXI_awaddr("S04_AXI_awaddr"), S04_AXI_awlen("S04_AXI_awlen"), S04_AXI_awsize("S04_AXI_awsize"), S04_AXI_awburst("S04_AXI_awburst"), S04_AXI_awlock("S04_AXI_awlock"), S04_AXI_awcache("S04_AXI_awcache"), S04_AXI_awprot("S04_AXI_awprot"), S04_AXI_awqos("S04_AXI_awqos"), S04_AXI_awvalid("S04_AXI_awvalid"), S04_AXI_awready("S04_AXI_awready"), S04_AXI_wdata("S04_AXI_wdata"), S04_AXI_wstrb("S04_AXI_wstrb"), S04_AXI_wlast("S04_AXI_wlast"), S04_AXI_wvalid("S04_AXI_wvalid"), S04_AXI_wready("S04_AXI_wready"), S04_AXI_bresp("S04_AXI_bresp"), S04_AXI_bvalid("S04_AXI_bvalid"), S04_AXI_bready("S04_AXI_bready"), S04_AXI_araddr("S04_AXI_araddr"), S04_AXI_arlen("S04_AXI_arlen"), S04_AXI_arsize("S04_AXI_arsize"), S04_AXI_arburst("S04_AXI_arburst"), S04_AXI_arlock("S04_AXI_arlock"), S04_AXI_arcache("S04_AXI_arcache"), S04_AXI_arprot("S04_AXI_arprot"), S04_AXI_arqos("S04_AXI_arqos"), S04_AXI_arvalid("S04_AXI_arvalid"), S04_AXI_arready("S04_AXI_arready"), S04_AXI_rdata("S04_AXI_rdata"), S04_AXI_rresp("S04_AXI_rresp"), S04_AXI_rlast("S04_AXI_rlast"), S04_AXI_rvalid("S04_AXI_rvalid"), S04_AXI_rready("S04_AXI_rready"), S05_AXI_awaddr("S05_AXI_awaddr"), S05_AXI_awlen("S05_AXI_awlen"), S05_AXI_awsize("S05_AXI_awsize"), S05_AXI_awburst("S05_AXI_awburst"), S05_AXI_awlock("S05_AXI_awlock"), S05_AXI_awcache("S05_AXI_awcache"), S05_AXI_awprot("S05_AXI_awprot"), S05_AXI_awqos("S05_AXI_awqos"), S05_AXI_awvalid("S05_AXI_awvalid"), S05_AXI_awready("S05_AXI_awready"), S05_AXI_wdata("S05_AXI_wdata"), S05_AXI_wstrb("S05_AXI_wstrb"), S05_AXI_wlast("S05_AXI_wlast"), S05_AXI_wvalid("S05_AXI_wvalid"), S05_AXI_wready("S05_AXI_wready"), S05_AXI_bresp("S05_AXI_bresp"), S05_AXI_bvalid("S05_AXI_bvalid"), S05_AXI_bready("S05_AXI_bready"), S05_AXI_araddr("S05_AXI_araddr"), S05_AXI_arlen("S05_AXI_arlen"), S05_AXI_arsize("S05_AXI_arsize"), S05_AXI_arburst("S05_AXI_arburst"), S05_AXI_arlock("S05_AXI_arlock"), S05_AXI_arcache("S05_AXI_arcache"), S05_AXI_arprot("S05_AXI_arprot"), S05_AXI_arqos("S05_AXI_arqos"), S05_AXI_arvalid("S05_AXI_arvalid"), S05_AXI_arready("S05_AXI_arready"), S05_AXI_rdata("S05_AXI_rdata"), S05_AXI_rresp("S05_AXI_rresp"), S05_AXI_rlast("S05_AXI_rlast"), S05_AXI_rvalid("S05_AXI_rvalid"), S05_AXI_rready("S05_AXI_rready"), S06_AXI_awaddr("S06_AXI_awaddr"), S06_AXI_awlen("S06_AXI_awlen"), S06_AXI_awsize("S06_AXI_awsize"), S06_AXI_awburst("S06_AXI_awburst"), S06_AXI_awlock("S06_AXI_awlock"), S06_AXI_awcache("S06_AXI_awcache"), S06_AXI_awprot("S06_AXI_awprot"), S06_AXI_awqos("S06_AXI_awqos"), S06_AXI_awvalid("S06_AXI_awvalid"), S06_AXI_awready("S06_AXI_awready"), S06_AXI_wdata("S06_AXI_wdata"), S06_AXI_wstrb("S06_AXI_wstrb"), S06_AXI_wlast("S06_AXI_wlast"), S06_AXI_wvalid("S06_AXI_wvalid"), S06_AXI_wready("S06_AXI_wready"), S06_AXI_bresp("S06_AXI_bresp"), S06_AXI_bvalid("S06_AXI_bvalid"), S06_AXI_bready("S06_AXI_bready"), S06_AXI_araddr("S06_AXI_araddr"), S06_AXI_arlen("S06_AXI_arlen"), S06_AXI_arsize("S06_AXI_arsize"), S06_AXI_arburst("S06_AXI_arburst"), S06_AXI_arlock("S06_AXI_arlock"), S06_AXI_arcache("S06_AXI_arcache"), S06_AXI_arprot("S06_AXI_arprot"), S06_AXI_arqos("S06_AXI_arqos"), S06_AXI_arvalid("S06_AXI_arvalid"), S06_AXI_arready("S06_AXI_arready"), S06_AXI_rdata("S06_AXI_rdata"), S06_AXI_rresp("S06_AXI_rresp"), S06_AXI_rlast("S06_AXI_rlast"), S06_AXI_rvalid("S06_AXI_rvalid"), S06_AXI_rready("S06_AXI_rready"), S07_AXI_awaddr("S07_AXI_awaddr"), S07_AXI_awlen("S07_AXI_awlen"), S07_AXI_awsize("S07_AXI_awsize"), S07_AXI_awburst("S07_AXI_awburst"), S07_AXI_awlock("S07_AXI_awlock"), S07_AXI_awcache("S07_AXI_awcache"), S07_AXI_awprot("S07_AXI_awprot"), S07_AXI_awqos("S07_AXI_awqos"), S07_AXI_awvalid("S07_AXI_awvalid"), S07_AXI_awready("S07_AXI_awready"), S07_AXI_wdata("S07_AXI_wdata"), S07_AXI_wstrb("S07_AXI_wstrb"), S07_AXI_wlast("S07_AXI_wlast"), S07_AXI_wvalid("S07_AXI_wvalid"), S07_AXI_wready("S07_AXI_wready"), S07_AXI_bresp("S07_AXI_bresp"), S07_AXI_bvalid("S07_AXI_bvalid"), S07_AXI_bready("S07_AXI_bready"), S07_AXI_araddr("S07_AXI_araddr"), S07_AXI_arlen("S07_AXI_arlen"), S07_AXI_arsize("S07_AXI_arsize"), S07_AXI_arburst("S07_AXI_arburst"), S07_AXI_arlock("S07_AXI_arlock"), S07_AXI_arcache("S07_AXI_arcache"), S07_AXI_arprot("S07_AXI_arprot"), S07_AXI_arqos("S07_AXI_arqos"), S07_AXI_arvalid("S07_AXI_arvalid"), S07_AXI_arready("S07_AXI_arready"), S07_AXI_rdata("S07_AXI_rdata"), S07_AXI_rresp("S07_AXI_rresp"), S07_AXI_rlast("S07_AXI_rlast"), S07_AXI_rvalid("S07_AXI_rvalid"), S07_AXI_rready("S07_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awlen("M00_AXI_awlen"), M00_AXI_awsize("M00_AXI_awsize"), M00_AXI_awburst("M00_AXI_awburst"), M00_AXI_awlock("M00_AXI_awlock"), M00_AXI_awcache("M00_AXI_awcache"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awqos("M00_AXI_awqos"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wlast("M00_AXI_wlast"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arlen("M00_AXI_arlen"), M00_AXI_arsize("M00_AXI_arsize"), M00_AXI_arburst("M00_AXI_arburst"), M00_AXI_arlock("M00_AXI_arlock"), M00_AXI_arcache("M00_AXI_arcache"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arqos("M00_AXI_arqos"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rlast("M00_AXI_rlast"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"),mp_S00_AXI_rd_socket_stub(nullptr),mp_S01_AXI_rd_socket_stub(nullptr),mp_S02_AXI_rd_socket_stub(nullptr),mp_S03_AXI_wr_socket_stub(nullptr)
{
  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S01_AXI_transactor = NULL;
  mp_S01_AXI_awlock_converter = NULL;
  mp_S02_AXI_transactor = NULL;
  mp_S02_AXI_awlock_converter = NULL;
  mp_S03_AXI_transactor = NULL;
  mp_S03_AXI_arlock_converter = NULL;
  mp_S04_AXI_transactor = NULL;
  mp_S04_AXI_awlock_converter = NULL;
  mp_S04_AXI_arlock_converter = NULL;
  mp_S05_AXI_transactor = NULL;
  mp_S05_AXI_awlock_converter = NULL;
  mp_S05_AXI_arlock_converter = NULL;
  mp_S06_AXI_transactor = NULL;
  mp_S06_AXI_awlock_converter = NULL;
  mp_S06_AXI_arlock_converter = NULL;
  mp_S07_AXI_transactor = NULL;
  mp_S07_AXI_awlock_converter = NULL;
  mp_S07_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M00_AXI_awlock_converter = NULL;
  mp_M00_AXI_arlock_converter = NULL;

  // Instantiate Socket Stubs
  mp_S00_AXI_rd_socket_stub = NULL;
  mp_S01_AXI_rd_socket_stub = NULL;
  mp_S02_AXI_rd_socket_stub = NULL;
  mp_S03_AXI_wr_socket_stub = NULL;

  // configure S00_AXI_transactor
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);
  mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
  mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
  mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
  mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
  mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
  mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
  mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
  mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
  mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
  mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
  mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
  mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
  mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
  mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
  mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
  mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
  mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
  mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
  mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
  mp_S00_AXI_transactor->CLK(aclk);
  mp_S00_AXI_transactor->RST(aresetn);
  // configure S01_AXI_transactor
    xsc::common_cpp::properties S01_AXI_transactor_param_props;
    S01_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S01_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S01_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S01_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S01_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S01_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S01_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S01_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S01_AXI_transactor", S01_AXI_transactor_param_props);
  mp_S01_AXI_transactor->AWADDR(S01_AXI_awaddr);
  mp_S01_AXI_transactor->AWLEN(S01_AXI_awlen);
  mp_S01_AXI_transactor->AWSIZE(S01_AXI_awsize);
  mp_S01_AXI_transactor->AWBURST(S01_AXI_awburst);
  mp_S01_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S01_AXI_awlock_converter");
  mp_S01_AXI_awlock_converter->vector_in(S01_AXI_awlock);
  mp_S01_AXI_awlock_converter->scalar_out(m_S01_AXI_awlock_converter_signal);
  mp_S01_AXI_transactor->AWLOCK(m_S01_AXI_awlock_converter_signal);
  mp_S01_AXI_transactor->AWCACHE(S01_AXI_awcache);
  mp_S01_AXI_transactor->AWPROT(S01_AXI_awprot);
  mp_S01_AXI_transactor->AWQOS(S01_AXI_awqos);
  mp_S01_AXI_transactor->AWVALID(S01_AXI_awvalid);
  mp_S01_AXI_transactor->AWREADY(S01_AXI_awready);
  mp_S01_AXI_transactor->WDATA(S01_AXI_wdata);
  mp_S01_AXI_transactor->WSTRB(S01_AXI_wstrb);
  mp_S01_AXI_transactor->WLAST(S01_AXI_wlast);
  mp_S01_AXI_transactor->WVALID(S01_AXI_wvalid);
  mp_S01_AXI_transactor->WREADY(S01_AXI_wready);
  mp_S01_AXI_transactor->BRESP(S01_AXI_bresp);
  mp_S01_AXI_transactor->BVALID(S01_AXI_bvalid);
  mp_S01_AXI_transactor->BREADY(S01_AXI_bready);
  mp_S01_AXI_transactor->CLK(aclk);
  mp_S01_AXI_transactor->RST(aresetn);
  // configure S02_AXI_transactor
    xsc::common_cpp::properties S02_AXI_transactor_param_props;
    S02_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S02_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S02_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S02_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S02_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RRESP", "0");
    S02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S02_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S02_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "WRITE_ONLY");
    S02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S02_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S02_AXI_transactor", S02_AXI_transactor_param_props);
  mp_S02_AXI_transactor->AWADDR(S02_AXI_awaddr);
  mp_S02_AXI_transactor->AWLEN(S02_AXI_awlen);
  mp_S02_AXI_transactor->AWSIZE(S02_AXI_awsize);
  mp_S02_AXI_transactor->AWBURST(S02_AXI_awburst);
  mp_S02_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S02_AXI_awlock_converter");
  mp_S02_AXI_awlock_converter->vector_in(S02_AXI_awlock);
  mp_S02_AXI_awlock_converter->scalar_out(m_S02_AXI_awlock_converter_signal);
  mp_S02_AXI_transactor->AWLOCK(m_S02_AXI_awlock_converter_signal);
  mp_S02_AXI_transactor->AWCACHE(S02_AXI_awcache);
  mp_S02_AXI_transactor->AWPROT(S02_AXI_awprot);
  mp_S02_AXI_transactor->AWQOS(S02_AXI_awqos);
  mp_S02_AXI_transactor->AWVALID(S02_AXI_awvalid);
  mp_S02_AXI_transactor->AWREADY(S02_AXI_awready);
  mp_S02_AXI_transactor->WDATA(S02_AXI_wdata);
  mp_S02_AXI_transactor->WSTRB(S02_AXI_wstrb);
  mp_S02_AXI_transactor->WLAST(S02_AXI_wlast);
  mp_S02_AXI_transactor->WVALID(S02_AXI_wvalid);
  mp_S02_AXI_transactor->WREADY(S02_AXI_wready);
  mp_S02_AXI_transactor->BRESP(S02_AXI_bresp);
  mp_S02_AXI_transactor->BVALID(S02_AXI_bvalid);
  mp_S02_AXI_transactor->BREADY(S02_AXI_bready);
  mp_S02_AXI_transactor->CLK(aclk);
  mp_S02_AXI_transactor->RST(aresetn);
  // configure S03_AXI_transactor
    xsc::common_cpp::properties S03_AXI_transactor_param_props;
    S03_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S03_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    S03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "32");
    S03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S03_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S03_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S03_AXI_transactor_param_props.addLong("HAS_WSTRB", "0");
    S03_AXI_transactor_param_props.addLong("HAS_BRESP", "0");
    S03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    S03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "64");
    S03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S03_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S03_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_ONLY");
    S03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_S03_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,32,1,1,1,1,1,1>("S03_AXI_transactor", S03_AXI_transactor_param_props);
  mp_S03_AXI_transactor->ARADDR(S03_AXI_araddr);
  mp_S03_AXI_transactor->ARLEN(S03_AXI_arlen);
  mp_S03_AXI_transactor->ARSIZE(S03_AXI_arsize);
  mp_S03_AXI_transactor->ARBURST(S03_AXI_arburst);
  mp_S03_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S03_AXI_arlock_converter");
  mp_S03_AXI_arlock_converter->vector_in(S03_AXI_arlock);
  mp_S03_AXI_arlock_converter->scalar_out(m_S03_AXI_arlock_converter_signal);
  mp_S03_AXI_transactor->ARLOCK(m_S03_AXI_arlock_converter_signal);
  mp_S03_AXI_transactor->ARCACHE(S03_AXI_arcache);
  mp_S03_AXI_transactor->ARPROT(S03_AXI_arprot);
  mp_S03_AXI_transactor->ARQOS(S03_AXI_arqos);
  mp_S03_AXI_transactor->ARVALID(S03_AXI_arvalid);
  mp_S03_AXI_transactor->ARREADY(S03_AXI_arready);
  mp_S03_AXI_transactor->RDATA(S03_AXI_rdata);
  mp_S03_AXI_transactor->RRESP(S03_AXI_rresp);
  mp_S03_AXI_transactor->RLAST(S03_AXI_rlast);
  mp_S03_AXI_transactor->RVALID(S03_AXI_rvalid);
  mp_S03_AXI_transactor->RREADY(S03_AXI_rready);
  mp_S03_AXI_transactor->CLK(aclk);
  mp_S03_AXI_transactor->RST(aresetn);
  // configure S04_AXI_transactor
    xsc::common_cpp::properties S04_AXI_transactor_param_props;
    S04_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S04_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S04_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S04_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S04_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S04_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S04_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S04_AXI_transactor", S04_AXI_transactor_param_props);
  mp_S04_AXI_transactor->AWADDR(S04_AXI_awaddr);
  mp_S04_AXI_transactor->AWLEN(S04_AXI_awlen);
  mp_S04_AXI_transactor->AWSIZE(S04_AXI_awsize);
  mp_S04_AXI_transactor->AWBURST(S04_AXI_awburst);
  mp_S04_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_awlock_converter");
  mp_S04_AXI_awlock_converter->vector_in(S04_AXI_awlock);
  mp_S04_AXI_awlock_converter->scalar_out(m_S04_AXI_awlock_converter_signal);
  mp_S04_AXI_transactor->AWLOCK(m_S04_AXI_awlock_converter_signal);
  mp_S04_AXI_transactor->AWCACHE(S04_AXI_awcache);
  mp_S04_AXI_transactor->AWPROT(S04_AXI_awprot);
  mp_S04_AXI_transactor->AWQOS(S04_AXI_awqos);
  mp_S04_AXI_transactor->AWVALID(S04_AXI_awvalid);
  mp_S04_AXI_transactor->AWREADY(S04_AXI_awready);
  mp_S04_AXI_transactor->WDATA(S04_AXI_wdata);
  mp_S04_AXI_transactor->WSTRB(S04_AXI_wstrb);
  mp_S04_AXI_transactor->WLAST(S04_AXI_wlast);
  mp_S04_AXI_transactor->WVALID(S04_AXI_wvalid);
  mp_S04_AXI_transactor->WREADY(S04_AXI_wready);
  mp_S04_AXI_transactor->BRESP(S04_AXI_bresp);
  mp_S04_AXI_transactor->BVALID(S04_AXI_bvalid);
  mp_S04_AXI_transactor->BREADY(S04_AXI_bready);
  mp_S04_AXI_transactor->ARADDR(S04_AXI_araddr);
  mp_S04_AXI_transactor->ARLEN(S04_AXI_arlen);
  mp_S04_AXI_transactor->ARSIZE(S04_AXI_arsize);
  mp_S04_AXI_transactor->ARBURST(S04_AXI_arburst);
  mp_S04_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S04_AXI_arlock_converter");
  mp_S04_AXI_arlock_converter->vector_in(S04_AXI_arlock);
  mp_S04_AXI_arlock_converter->scalar_out(m_S04_AXI_arlock_converter_signal);
  mp_S04_AXI_transactor->ARLOCK(m_S04_AXI_arlock_converter_signal);
  mp_S04_AXI_transactor->ARCACHE(S04_AXI_arcache);
  mp_S04_AXI_transactor->ARPROT(S04_AXI_arprot);
  mp_S04_AXI_transactor->ARQOS(S04_AXI_arqos);
  mp_S04_AXI_transactor->ARVALID(S04_AXI_arvalid);
  mp_S04_AXI_transactor->ARREADY(S04_AXI_arready);
  mp_S04_AXI_transactor->RDATA(S04_AXI_rdata);
  mp_S04_AXI_transactor->RRESP(S04_AXI_rresp);
  mp_S04_AXI_transactor->RLAST(S04_AXI_rlast);
  mp_S04_AXI_transactor->RVALID(S04_AXI_rvalid);
  mp_S04_AXI_transactor->RREADY(S04_AXI_rready);
  mp_S04_AXI_transactor->CLK(aclk1);
  mp_S04_AXI_transactor->RST(aresetn);
  // configure S05_AXI_transactor
    xsc::common_cpp::properties S05_AXI_transactor_param_props;
    S05_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S05_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S05_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S05_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S05_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S05_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S05_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S05_AXI_transactor", S05_AXI_transactor_param_props);
  mp_S05_AXI_transactor->AWADDR(S05_AXI_awaddr);
  mp_S05_AXI_transactor->AWLEN(S05_AXI_awlen);
  mp_S05_AXI_transactor->AWSIZE(S05_AXI_awsize);
  mp_S05_AXI_transactor->AWBURST(S05_AXI_awburst);
  mp_S05_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_awlock_converter");
  mp_S05_AXI_awlock_converter->vector_in(S05_AXI_awlock);
  mp_S05_AXI_awlock_converter->scalar_out(m_S05_AXI_awlock_converter_signal);
  mp_S05_AXI_transactor->AWLOCK(m_S05_AXI_awlock_converter_signal);
  mp_S05_AXI_transactor->AWCACHE(S05_AXI_awcache);
  mp_S05_AXI_transactor->AWPROT(S05_AXI_awprot);
  mp_S05_AXI_transactor->AWQOS(S05_AXI_awqos);
  mp_S05_AXI_transactor->AWVALID(S05_AXI_awvalid);
  mp_S05_AXI_transactor->AWREADY(S05_AXI_awready);
  mp_S05_AXI_transactor->WDATA(S05_AXI_wdata);
  mp_S05_AXI_transactor->WSTRB(S05_AXI_wstrb);
  mp_S05_AXI_transactor->WLAST(S05_AXI_wlast);
  mp_S05_AXI_transactor->WVALID(S05_AXI_wvalid);
  mp_S05_AXI_transactor->WREADY(S05_AXI_wready);
  mp_S05_AXI_transactor->BRESP(S05_AXI_bresp);
  mp_S05_AXI_transactor->BVALID(S05_AXI_bvalid);
  mp_S05_AXI_transactor->BREADY(S05_AXI_bready);
  mp_S05_AXI_transactor->ARADDR(S05_AXI_araddr);
  mp_S05_AXI_transactor->ARLEN(S05_AXI_arlen);
  mp_S05_AXI_transactor->ARSIZE(S05_AXI_arsize);
  mp_S05_AXI_transactor->ARBURST(S05_AXI_arburst);
  mp_S05_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S05_AXI_arlock_converter");
  mp_S05_AXI_arlock_converter->vector_in(S05_AXI_arlock);
  mp_S05_AXI_arlock_converter->scalar_out(m_S05_AXI_arlock_converter_signal);
  mp_S05_AXI_transactor->ARLOCK(m_S05_AXI_arlock_converter_signal);
  mp_S05_AXI_transactor->ARCACHE(S05_AXI_arcache);
  mp_S05_AXI_transactor->ARPROT(S05_AXI_arprot);
  mp_S05_AXI_transactor->ARQOS(S05_AXI_arqos);
  mp_S05_AXI_transactor->ARVALID(S05_AXI_arvalid);
  mp_S05_AXI_transactor->ARREADY(S05_AXI_arready);
  mp_S05_AXI_transactor->RDATA(S05_AXI_rdata);
  mp_S05_AXI_transactor->RRESP(S05_AXI_rresp);
  mp_S05_AXI_transactor->RLAST(S05_AXI_rlast);
  mp_S05_AXI_transactor->RVALID(S05_AXI_rvalid);
  mp_S05_AXI_transactor->RREADY(S05_AXI_rready);
  mp_S05_AXI_transactor->CLK(aclk1);
  mp_S05_AXI_transactor->RST(aresetn);
  // configure S06_AXI_transactor
    xsc::common_cpp::properties S06_AXI_transactor_param_props;
    S06_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S06_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S06_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S06_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S06_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S06_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S06_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S06_AXI_transactor", S06_AXI_transactor_param_props);
  mp_S06_AXI_transactor->AWADDR(S06_AXI_awaddr);
  mp_S06_AXI_transactor->AWLEN(S06_AXI_awlen);
  mp_S06_AXI_transactor->AWSIZE(S06_AXI_awsize);
  mp_S06_AXI_transactor->AWBURST(S06_AXI_awburst);
  mp_S06_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_awlock_converter");
  mp_S06_AXI_awlock_converter->vector_in(S06_AXI_awlock);
  mp_S06_AXI_awlock_converter->scalar_out(m_S06_AXI_awlock_converter_signal);
  mp_S06_AXI_transactor->AWLOCK(m_S06_AXI_awlock_converter_signal);
  mp_S06_AXI_transactor->AWCACHE(S06_AXI_awcache);
  mp_S06_AXI_transactor->AWPROT(S06_AXI_awprot);
  mp_S06_AXI_transactor->AWQOS(S06_AXI_awqos);
  mp_S06_AXI_transactor->AWVALID(S06_AXI_awvalid);
  mp_S06_AXI_transactor->AWREADY(S06_AXI_awready);
  mp_S06_AXI_transactor->WDATA(S06_AXI_wdata);
  mp_S06_AXI_transactor->WSTRB(S06_AXI_wstrb);
  mp_S06_AXI_transactor->WLAST(S06_AXI_wlast);
  mp_S06_AXI_transactor->WVALID(S06_AXI_wvalid);
  mp_S06_AXI_transactor->WREADY(S06_AXI_wready);
  mp_S06_AXI_transactor->BRESP(S06_AXI_bresp);
  mp_S06_AXI_transactor->BVALID(S06_AXI_bvalid);
  mp_S06_AXI_transactor->BREADY(S06_AXI_bready);
  mp_S06_AXI_transactor->ARADDR(S06_AXI_araddr);
  mp_S06_AXI_transactor->ARLEN(S06_AXI_arlen);
  mp_S06_AXI_transactor->ARSIZE(S06_AXI_arsize);
  mp_S06_AXI_transactor->ARBURST(S06_AXI_arburst);
  mp_S06_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S06_AXI_arlock_converter");
  mp_S06_AXI_arlock_converter->vector_in(S06_AXI_arlock);
  mp_S06_AXI_arlock_converter->scalar_out(m_S06_AXI_arlock_converter_signal);
  mp_S06_AXI_transactor->ARLOCK(m_S06_AXI_arlock_converter_signal);
  mp_S06_AXI_transactor->ARCACHE(S06_AXI_arcache);
  mp_S06_AXI_transactor->ARPROT(S06_AXI_arprot);
  mp_S06_AXI_transactor->ARQOS(S06_AXI_arqos);
  mp_S06_AXI_transactor->ARVALID(S06_AXI_arvalid);
  mp_S06_AXI_transactor->ARREADY(S06_AXI_arready);
  mp_S06_AXI_transactor->RDATA(S06_AXI_rdata);
  mp_S06_AXI_transactor->RRESP(S06_AXI_rresp);
  mp_S06_AXI_transactor->RLAST(S06_AXI_rlast);
  mp_S06_AXI_transactor->RVALID(S06_AXI_rvalid);
  mp_S06_AXI_transactor->RREADY(S06_AXI_rready);
  mp_S06_AXI_transactor->CLK(aclk1);
  mp_S06_AXI_transactor->RST(aresetn);
  // configure S07_AXI_transactor
    xsc::common_cpp::properties S07_AXI_transactor_param_props;
    S07_AXI_transactor_param_props.addLong("DATA_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "64");
    S07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S07_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S07_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S07_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    S07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    S07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    S07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S07_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S07_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    S07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk0");

    mp_S07_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<64,64,1,1,1,1,1,1>("S07_AXI_transactor", S07_AXI_transactor_param_props);
  mp_S07_AXI_transactor->AWADDR(S07_AXI_awaddr);
  mp_S07_AXI_transactor->AWLEN(S07_AXI_awlen);
  mp_S07_AXI_transactor->AWSIZE(S07_AXI_awsize);
  mp_S07_AXI_transactor->AWBURST(S07_AXI_awburst);
  mp_S07_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_awlock_converter");
  mp_S07_AXI_awlock_converter->vector_in(S07_AXI_awlock);
  mp_S07_AXI_awlock_converter->scalar_out(m_S07_AXI_awlock_converter_signal);
  mp_S07_AXI_transactor->AWLOCK(m_S07_AXI_awlock_converter_signal);
  mp_S07_AXI_transactor->AWCACHE(S07_AXI_awcache);
  mp_S07_AXI_transactor->AWPROT(S07_AXI_awprot);
  mp_S07_AXI_transactor->AWQOS(S07_AXI_awqos);
  mp_S07_AXI_transactor->AWVALID(S07_AXI_awvalid);
  mp_S07_AXI_transactor->AWREADY(S07_AXI_awready);
  mp_S07_AXI_transactor->WDATA(S07_AXI_wdata);
  mp_S07_AXI_transactor->WSTRB(S07_AXI_wstrb);
  mp_S07_AXI_transactor->WLAST(S07_AXI_wlast);
  mp_S07_AXI_transactor->WVALID(S07_AXI_wvalid);
  mp_S07_AXI_transactor->WREADY(S07_AXI_wready);
  mp_S07_AXI_transactor->BRESP(S07_AXI_bresp);
  mp_S07_AXI_transactor->BVALID(S07_AXI_bvalid);
  mp_S07_AXI_transactor->BREADY(S07_AXI_bready);
  mp_S07_AXI_transactor->ARADDR(S07_AXI_araddr);
  mp_S07_AXI_transactor->ARLEN(S07_AXI_arlen);
  mp_S07_AXI_transactor->ARSIZE(S07_AXI_arsize);
  mp_S07_AXI_transactor->ARBURST(S07_AXI_arburst);
  mp_S07_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S07_AXI_arlock_converter");
  mp_S07_AXI_arlock_converter->vector_in(S07_AXI_arlock);
  mp_S07_AXI_arlock_converter->scalar_out(m_S07_AXI_arlock_converter_signal);
  mp_S07_AXI_transactor->ARLOCK(m_S07_AXI_arlock_converter_signal);
  mp_S07_AXI_transactor->ARCACHE(S07_AXI_arcache);
  mp_S07_AXI_transactor->ARPROT(S07_AXI_arprot);
  mp_S07_AXI_transactor->ARQOS(S07_AXI_arqos);
  mp_S07_AXI_transactor->ARVALID(S07_AXI_arvalid);
  mp_S07_AXI_transactor->ARREADY(S07_AXI_arready);
  mp_S07_AXI_transactor->RDATA(S07_AXI_rdata);
  mp_S07_AXI_transactor->RRESP(S07_AXI_rresp);
  mp_S07_AXI_transactor->RLAST(S07_AXI_rlast);
  mp_S07_AXI_transactor->RVALID(S07_AXI_rvalid);
  mp_S07_AXI_transactor->RREADY(S07_AXI_rready);
  mp_S07_AXI_transactor->CLK(aclk1);
  mp_S07_AXI_transactor->RST(aresetn);
  // configure M00_AXI_transactor
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "128");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "149998505");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "49");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "16");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "128");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.000");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_zynq_ultra_ps_e_0_0_pl_clk1");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<128,49,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);
  mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
  mp_M00_AXI_transactor->AWLEN(M00_AXI_awlen);
  mp_M00_AXI_transactor->AWSIZE(M00_AXI_awsize);
  mp_M00_AXI_transactor->AWBURST(M00_AXI_awburst);
  mp_M00_AXI_awlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_awlock_converter");
  mp_M00_AXI_awlock_converter->scalar_in(m_M00_AXI_awlock_converter_signal);
  mp_M00_AXI_awlock_converter->vector_out(M00_AXI_awlock);
  mp_M00_AXI_transactor->AWLOCK(m_M00_AXI_awlock_converter_signal);
  mp_M00_AXI_transactor->AWCACHE(M00_AXI_awcache);
  mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
  mp_M00_AXI_transactor->AWQOS(M00_AXI_awqos);
  mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
  mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
  mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
  mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
  mp_M00_AXI_transactor->WLAST(M00_AXI_wlast);
  mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
  mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
  mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
  mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
  mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
  mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
  mp_M00_AXI_transactor->ARLEN(M00_AXI_arlen);
  mp_M00_AXI_transactor->ARSIZE(M00_AXI_arsize);
  mp_M00_AXI_transactor->ARBURST(M00_AXI_arburst);
  mp_M00_AXI_arlock_converter = new xsc::common::scalar2vectorN_converter<1>("M00_AXI_arlock_converter");
  mp_M00_AXI_arlock_converter->scalar_in(m_M00_AXI_arlock_converter_signal);
  mp_M00_AXI_arlock_converter->vector_out(M00_AXI_arlock);
  mp_M00_AXI_transactor->ARLOCK(m_M00_AXI_arlock_converter_signal);
  mp_M00_AXI_transactor->ARCACHE(M00_AXI_arcache);
  mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
  mp_M00_AXI_transactor->ARQOS(M00_AXI_arqos);
  mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
  mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
  mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
  mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
  mp_M00_AXI_transactor->RLAST(M00_AXI_rlast);
  mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
  mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
  mp_M00_AXI_transactor->CLK(aclk);
  mp_M00_AXI_transactor->RST(aresetn);

  // initialize transactors stubs
  S00_AXI_transactor_target_wr_socket_stub = nullptr;
  S01_AXI_transactor_target_wr_socket_stub = nullptr;
  S02_AXI_transactor_target_wr_socket_stub = nullptr;
  S03_AXI_transactor_target_rd_socket_stub = nullptr;
  S04_AXI_transactor_target_wr_socket_stub = nullptr;
  S04_AXI_transactor_target_rd_socket_stub = nullptr;
  S05_AXI_transactor_target_wr_socket_stub = nullptr;
  S05_AXI_transactor_target_rd_socket_stub = nullptr;
  S06_AXI_transactor_target_wr_socket_stub = nullptr;
  S06_AXI_transactor_target_rd_socket_stub = nullptr;
  S07_AXI_transactor_target_wr_socket_stub = nullptr;
  S07_AXI_transactor_target_rd_socket_stub = nullptr;
  M00_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M00_AXI_transactor_initiator_rd_socket_stub = nullptr;

}

void system_axi_smc_9::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S00_AXI_TLM_MODE") != 1)
  {
    mp_S00_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);
    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(mp_S00_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  
  }
  else
  {
    S00_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S00_AXI_transactor_target_wr_socket_stub->bind(*(mp_S00_AXI_transactor->wr_socket));
    mp_S00_AXI_transactor->disable_transactor();
  }

  // configure 'S01_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S01_AXI_TLM_MODE") != 1)
  {
    mp_S01_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);
    mp_impl->S01_AXI_tlm_aximm_read_socket->bind(mp_S01_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S01_AXI_tlm_aximm_write_socket->bind(*(mp_S01_AXI_transactor->wr_socket));
  
  }
  else
  {
    S01_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S01_AXI_transactor_target_wr_socket_stub->bind(*(mp_S01_AXI_transactor->wr_socket));
    mp_S01_AXI_transactor->disable_transactor();
  }

  // configure 'S02_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S02_AXI_TLM_MODE") != 1)
  {
    mp_S02_AXI_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket", 0);
    mp_impl->S02_AXI_tlm_aximm_read_socket->bind(mp_S02_AXI_rd_socket_stub->initiator_socket);
    mp_impl->S02_AXI_tlm_aximm_write_socket->bind(*(mp_S02_AXI_transactor->wr_socket));
  
  }
  else
  {
    S02_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S02_AXI_transactor_target_wr_socket_stub->bind(*(mp_S02_AXI_transactor->wr_socket));
    mp_S02_AXI_transactor->disable_transactor();
  }

  // configure 'S03_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S03_AXI_TLM_MODE") != 1)
  {
    mp_impl->S03_AXI_tlm_aximm_read_socket->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_S03_AXI_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket", 0);
    mp_impl->S03_AXI_tlm_aximm_write_socket->bind(mp_S03_AXI_wr_socket_stub->initiator_socket);
  
  }
  else
  {
    S03_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S03_AXI_transactor_target_rd_socket_stub->bind(*(mp_S03_AXI_transactor->rd_socket));
    mp_S03_AXI_transactor->disable_transactor();
  }

  // configure 'S04_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S04_AXI_TLM_MODE") != 1)
  {
    mp_impl->S04_AXI_tlm_aximm_read_socket->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_impl->S04_AXI_tlm_aximm_write_socket->bind(*(mp_S04_AXI_transactor->wr_socket));
  
  }
  else
  {
    S04_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S04_AXI_transactor_target_wr_socket_stub->bind(*(mp_S04_AXI_transactor->wr_socket));
    S04_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S04_AXI_transactor_target_rd_socket_stub->bind(*(mp_S04_AXI_transactor->rd_socket));
    mp_S04_AXI_transactor->disable_transactor();
  }

  // configure 'S05_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S05_AXI_TLM_MODE") != 1)
  {
    mp_impl->S05_AXI_tlm_aximm_read_socket->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_impl->S05_AXI_tlm_aximm_write_socket->bind(*(mp_S05_AXI_transactor->wr_socket));
  
  }
  else
  {
    S05_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S05_AXI_transactor_target_wr_socket_stub->bind(*(mp_S05_AXI_transactor->wr_socket));
    S05_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S05_AXI_transactor_target_rd_socket_stub->bind(*(mp_S05_AXI_transactor->rd_socket));
    mp_S05_AXI_transactor->disable_transactor();
  }

  // configure 'S06_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S06_AXI_TLM_MODE") != 1)
  {
    mp_impl->S06_AXI_tlm_aximm_read_socket->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_impl->S06_AXI_tlm_aximm_write_socket->bind(*(mp_S06_AXI_transactor->wr_socket));
  
  }
  else
  {
    S06_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S06_AXI_transactor_target_wr_socket_stub->bind(*(mp_S06_AXI_transactor->wr_socket));
    S06_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S06_AXI_transactor_target_rd_socket_stub->bind(*(mp_S06_AXI_transactor->rd_socket));
    mp_S06_AXI_transactor->disable_transactor();
  }

  // configure 'S07_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S07_AXI_TLM_MODE") != 1)
  {
    mp_impl->S07_AXI_tlm_aximm_read_socket->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_impl->S07_AXI_tlm_aximm_write_socket->bind(*(mp_S07_AXI_transactor->wr_socket));
  
  }
  else
  {
    S07_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S07_AXI_transactor_target_wr_socket_stub->bind(*(mp_S07_AXI_transactor->wr_socket));
    S07_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S07_AXI_transactor_target_rd_socket_stub->bind(*(mp_S07_AXI_transactor->rd_socket));
    mp_S07_AXI_transactor->disable_transactor();
  }

  // configure 'M00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "M00_AXI_TLM_MODE") != 1)
  {
    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  
  }
  else
  {
    M00_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M00_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M00_AXI_transactor->wr_socket));
    M00_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M00_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_M00_AXI_transactor->disable_transactor();
  }

}

#endif // MTI_SYSTEMC




system_axi_smc_9::~system_axi_smc_9()
{
  delete mp_S00_AXI_transactor;
  delete mp_S00_AXI_awlock_converter;
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S00_AXI_TLM_MODE") != 1)
  {
    delete mp_S00_AXI_rd_socket_stub;
  }

  delete mp_S01_AXI_transactor;
  delete mp_S01_AXI_awlock_converter;
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S01_AXI_TLM_MODE") != 1)
  {
    delete mp_S01_AXI_rd_socket_stub;
  }

  delete mp_S02_AXI_transactor;
  delete mp_S02_AXI_awlock_converter;
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S02_AXI_TLM_MODE") != 1)
  {
    delete mp_S02_AXI_rd_socket_stub;
  }

  delete mp_S03_AXI_transactor;
  delete mp_S03_AXI_arlock_converter;
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_smc_9", "S03_AXI_TLM_MODE") != 1)
  {
    delete mp_S03_AXI_wr_socket_stub;
  }

  delete mp_S04_AXI_transactor;
  delete mp_S04_AXI_awlock_converter;
  delete mp_S04_AXI_arlock_converter;

  delete mp_S05_AXI_transactor;
  delete mp_S05_AXI_awlock_converter;
  delete mp_S05_AXI_arlock_converter;

  delete mp_S06_AXI_transactor;
  delete mp_S06_AXI_awlock_converter;
  delete mp_S06_AXI_arlock_converter;

  delete mp_S07_AXI_transactor;
  delete mp_S07_AXI_awlock_converter;
  delete mp_S07_AXI_arlock_converter;

  delete mp_M00_AXI_transactor;
  delete mp_M00_AXI_awlock_converter;
  delete mp_M00_AXI_arlock_converter;

}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(system_axi_smc_9);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(system_axi_smc_9);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(system_axi_smc_9);
SC_REGISTER_BV(128);
#endif

