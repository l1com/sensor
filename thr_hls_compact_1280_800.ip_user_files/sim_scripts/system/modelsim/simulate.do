onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xilinx_vip -L xpm -L lib_cdc_v1_0_2 -L lib_pkg_v1_0_2 -L fifo_generator_v13_2_5 -L lib_fifo_v1_0_14 -L blk_mem_gen_v8_4_4 -L lib_bmg_v1_0_13 -L lib_srl_fifo_v1_0_2 -L axi_datamover_v5_1_24 -L axi_vdma_v6_3_10 -L xil_defaultlib -L proc_sys_reset_v5_0_13 -L v_vid_in_axi4s_v4_0_9 -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_8 -L zynq_ultra_ps_e_vip_v1_0_8 -L xlconstant_v1_1_7 -L smartconnect_v1_0 -L axi_register_slice_v2_1_22 -L generic_baseblocks_v2_1_0 -L axi_data_fifo_v2_1_21 -L axi_crossbar_v2_1_23 -L axi_protocol_converter_v2_1_22 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.system xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {system.udo}

run -all

quit -force
