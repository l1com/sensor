vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/lib_fifo_v1_0_14
vlib questa_lib/msim/blk_mem_gen_v8_4_4
vlib questa_lib/msim/lib_bmg_v1_0_13
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_24
vlib questa_lib/msim/axi_vdma_v6_3_10
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/v_vid_in_axi4s_v4_0_9
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_8
vlib questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_8
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_register_slice_v2_1_22
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_data_fifo_v2_1_21
vlib questa_lib/msim/axi_crossbar_v2_1_23
vlib questa_lib/msim/axi_protocol_converter_v2_1_22

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 questa_lib/msim/lib_fifo_v1_0_14
vmap blk_mem_gen_v8_4_4 questa_lib/msim/blk_mem_gen_v8_4_4
vmap lib_bmg_v1_0_13 questa_lib/msim/lib_bmg_v1_0_13
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_24 questa_lib/msim/axi_datamover_v5_1_24
vmap axi_vdma_v6_3_10 questa_lib/msim/axi_vdma_v6_3_10
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap v_vid_in_axi4s_v4_0_9 questa_lib/msim/v_vid_in_axi4s_v4_0_9
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 questa_lib/msim/axi_vip_v1_1_8
vmap zynq_ultra_ps_e_vip_v1_0_8 questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_8
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_22 questa_lib/msim/axi_register_slice_v2_1_22
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_21 questa_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 questa_lib/msim/axi_crossbar_v2_1_23
vmap axi_protocol_converter_v2_1_22 questa_lib/msim/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"D:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_4  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_13  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/af67/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_24  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/4ab6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_10  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_10  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/system/ip/system_axi_vdma_0_0/sim/system_axi_vdma_0_0.vhd" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0.v" \
"../../../bd/system/ipshared/8797/src/ov5640_capture_data.v" \
"../../../bd/system/ip/system_ov5640_capture_data_0_0/sim/system_ov5640_capture_data_0_0.v" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/system/ip/system_rst_ps8_0_99M_0/sim/system_rst_ps8_0_99M_0.vhd" \

vlog -work v_vid_in_axi4s_v4_0_9  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_v_vid_in_axi4s_0_0/sim/system_v_vid_in_axi4s_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_8  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../bd/system/ip/system_ov5640_capture_data_0_1/sim/system_ov5640_capture_data_0_1.v" \
"../../../bd/system/ip/system_v_vid_in_axi4s_0_2/sim/system_v_vid_in_axi4s_0_2.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/system/ip/system_axi_vdma_0_1/sim/system_axi_vdma_0_1.vhd" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_video_image_process_0_0/src/blk_mem_gen_0/sim/blk_mem_gen_0.v" \
"../../../bd/system/ipshared/4690/src/Sort3.v" \
"../../../bd/system/ipshared/4690/src/VIP_matrix_generate_3x3_8bit.v" \
"../../../bd/system/ipshared/4690/src/gray_median_filter.v" \
"../../../bd/system/ipshared/4690/src/line_shift_RAM_8bit.v" \
"../../../bd/system/ipshared/4690/src/median_3x3.v" \
"../../../bd/system/ipshared/4690/src/rgb2ycbcr.v" \
"../../../bd/system/ipshared/4690/src/Video_Image_Processor.v" \
"../../../bd/system/ip/system_video_image_process_0_0/sim/system_video_image_process_0_0.v" \
"../../../bd/system/ip/system_video_image_process_0_1/sim/system_video_image_process_0_1.v" \
"../../../bd/system/ip/system_ov5640_capture_data_1_0/sim/system_ov5640_capture_data_1_0.v" \
"../../../bd/system/ip/system_video_image_process_1_0/sim/system_video_image_process_1_0.v" \
"../../../bd/system/ip/system_v_vid_in_axi4s_1_0/sim/system_v_vid_in_axi4s_1_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/system/ip/system_axi_vdma_1_2/sim/system_axi_vdma_1_2.vhd" \
"../../../bd/system/ip/system_rst_ps8_0_149M_0/sim/system_rst_ps8_0_149M_0.vhd" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_addrbound.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Array2xfMat_64_0_800_1280_8_2_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Axi2AxiStream.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Axi2Mat.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_AxiStream2Axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_AxiStream2Mat.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_AxiStream2MatStream_2_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Block_split11_proc72.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Canny_3_0_0_11_800_1280_8_32_false_2_2_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_cols_npc_aligned47.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_cols_npc_aligned63.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_control_s_axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w7_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w7_d2_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w8_d4_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w8_d6_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w10_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w10_d3_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w10_d4_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w11_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w11_d2_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w11_d2_S_x0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w11_d3_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w11_d4_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w16_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w16_d2_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w16_d3_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w29_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w32_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w32_d2_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w32_d2_S_x0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w32_d3_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w32_d3_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w32_d4_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d2_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d2_S_x0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d2_S_x1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d4_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d4_S_x.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w64_d480_A.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_fifo_w128_d2_S.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_gmem1_m_axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_gmem2_m_axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_hls_deadlock_detection_unit.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_last_blk_pxl_width.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_last_blk_pxl_width_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Mat2Axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Mat2Axi_Block_split13_proc.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Mat2Axi_entry67.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_Mat2AxiStream.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_MatStream2AxiStream_2_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mul_32s_29s_32_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mul_mul_16ns_7ns_23_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mul_mul_16ns_11ns_27_3_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mul_mul_16ns_15ns_30_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mul_mul_16ns_16ns_32_3_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mux_32_13_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mux_32_64_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_mux_32_128_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_addrbound_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_AxiStream2Mat_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_last_blk_pxl_width_1_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_last_blk_pxl_width_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_Mat2AxiStream_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xfMat2Array_64_11_800_1280_32_2_1_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_s_buf_V_0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xfExtractPixels_8_24_0_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xfExtractPixels_8_24_0_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xfExtractPixels_8_32_4_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFFindmax3x3_4_0_13_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xfMat2Array_64_11_800_1280_32_2_1_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFSobel3x3_0_3_800_1280_0_4_8_2_2_2_24_32_161_3_9_false_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_s_angle_V_0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_s_buf_V_0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog/canny_accel.v" \
"../../../bd/system/ip/system_canny_accel_0_0/sim/system_canny_accel_0_0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_control_s_axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_gmem3_m_axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_gmem4_m_axi.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_iBuff_V_0.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_iBuff_V_2.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mac_muladd_2ns_8ns_24ns_24_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_8ns_3ns_11_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_6ns_11ns_17_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_10ns_6ns_15_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_10ns_8ns_17_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_12s_6ns_18_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_13ns_11ns_24_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_23ns_6ns_29_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mul_mul_24s_6ns_30_4_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mux_114_64_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_mux_164_64_1_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_oBuff_V.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_PixelProcessNew_1_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_TopDown_11_3_1024_s.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_udiv_11s_6ns_11_15_seq_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_udiv_12ns_11ns_12_16_seq_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel_urem_13ns_3ns_13_17_seq_1.v" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b717/hdl/verilog/edgetracing_accel.v" \
"../../../bd/system/ip/system_edgetracing_accel_0_0/sim/system_edgetracing_accel_0_0.v" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/sim/bd_4223.v" \

vlog -work xlconstant_v1_1_7  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_0/sim/bd_4223_one_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_1/sim/bd_4223_psr0_0.vhd" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_2/sim/bd_4223_psr_aclk_0.vhd" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_3/sim/bd_4223_psr_aclk1_0.vhd" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_4/sim/bd_4223_arsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_5/sim/bd_4223_rsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_6/sim/bd_4223_awsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_7/sim/bd_4223_wsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_8/sim/bd_4223_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_9/sim/bd_4223_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_10/sim/bd_4223_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_11/sim/bd_4223_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_12/sim/bd_4223_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_13/sim/bd_4223_sawn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_14/sim/bd_4223_swn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_15/sim/bd_4223_sbn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_16/sim/bd_4223_s01mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_17/sim/bd_4223_s01tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_18/sim/bd_4223_s01sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_19/sim/bd_4223_s01a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_20/sim/bd_4223_sawn_1.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_21/sim/bd_4223_swn_1.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_22/sim/bd_4223_sbn_1.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_23/sim/bd_4223_s02mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_24/sim/bd_4223_s02tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_25/sim/bd_4223_s02sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_26/sim/bd_4223_s02a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_27/sim/bd_4223_sawn_2.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_28/sim/bd_4223_swn_2.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_29/sim/bd_4223_sbn_2.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_30/sim/bd_4223_s04mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_31/sim/bd_4223_s04tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_32/sim/bd_4223_s04sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_33/sim/bd_4223_s04a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_34/sim/bd_4223_sarn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_35/sim/bd_4223_srn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_36/sim/bd_4223_sawn_3.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_37/sim/bd_4223_swn_3.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_38/sim/bd_4223_sbn_3.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_39/sim/bd_4223_s05mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_40/sim/bd_4223_s05tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_41/sim/bd_4223_s05sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_42/sim/bd_4223_s05a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_43/sim/bd_4223_sarn_1.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_44/sim/bd_4223_srn_1.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_45/sim/bd_4223_sawn_4.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_46/sim/bd_4223_swn_4.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_47/sim/bd_4223_sbn_4.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_48/sim/bd_4223_s06mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_49/sim/bd_4223_s06tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_50/sim/bd_4223_s06sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_51/sim/bd_4223_s06a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_52/sim/bd_4223_sarn_2.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_53/sim/bd_4223_srn_2.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_54/sim/bd_4223_sawn_5.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_55/sim/bd_4223_swn_5.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_56/sim/bd_4223_sbn_5.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_57/sim/bd_4223_s07mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_58/sim/bd_4223_s07tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_59/sim/bd_4223_s07sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_60/sim/bd_4223_s07a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_61/sim/bd_4223_sarn_3.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_62/sim/bd_4223_srn_3.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_63/sim/bd_4223_sawn_6.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_64/sim/bd_4223_swn_6.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_65/sim/bd_4223_sbn_6.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_66/sim/bd_4223_m00s2a_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_67/sim/bd_4223_m00arn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_68/sim/bd_4223_m00rn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_69/sim/bd_4223_m00awn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_70/sim/bd_4223_m00wn_0.sv" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_71/sim/bd_4223_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7bd7/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv -L axi_vip_v1_1_8 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/bd_0/ip/ip_72/sim/bd_4223_m00e_0.sv" \

vlog -work axi_register_slice_v2_1_22  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_9/sim/system_axi_smc_9.v" \

vlog -work generic_baseblocks_v2_1_0  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_9/sim/system_xbar_9.v" \
"../../../bd/system/sim/system.v" \

vlog -work axi_protocol_converter_v2_1_22  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/7860/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/da1e/hdl" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/9626/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/25b7/hdl/verilog" "+incdir+../../../../thr_hls_compact_1280_800.srcs/sources_1/bd/system/ipshared/896c/hdl/verilog" "+incdir+D:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
"../../../bd/system/ipshared/f32a/hdl/count.v" \
"../../../bd/system/ipshared/f32a/hdl/count_ip_v1_0_S00_AXI.v" \
"../../../bd/system/ipshared/f32a/hdl/count_ip_v1_0.v" \
"../../../bd/system/ip/system_count_ip_0_1/sim/system_count_ip_0_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

