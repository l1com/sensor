//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Wed Dec 18 11:27:07 2024
//Host        : L running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
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
    emio_sccb_tri_io);
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
  output cam_rst_n_0;
  output cam_rst_n_1;
  output cam_rst_n_2;
  input cam_vsync_0;
  input cam_vsync_1;
  input cam_vsync_2;
  inout [5:0]emio_sccb_tri_io;

  wire [7:0]cam_data_0;
  wire [7:0]cam_data_1;
  wire [7:0]cam_data_2;
  wire cam_href_0;
  wire cam_href_1;
  wire cam_href_2;
  wire cam_pclk_0;
  wire cam_pclk_1;
  wire cam_pclk_2;
  wire cam_pwdn_0;
  wire cam_pwdn_1;
  wire cam_pwdn_2;
  wire cam_rst_n_0;
  wire cam_rst_n_1;
  wire cam_rst_n_2;
  wire cam_vsync_0;
  wire cam_vsync_1;
  wire cam_vsync_2;
  wire [0:0]emio_sccb_tri_i_0;
  wire [1:1]emio_sccb_tri_i_1;
  wire [2:2]emio_sccb_tri_i_2;
  wire [3:3]emio_sccb_tri_i_3;
  wire [4:4]emio_sccb_tri_i_4;
  wire [5:5]emio_sccb_tri_i_5;
  wire [0:0]emio_sccb_tri_io_0;
  wire [1:1]emio_sccb_tri_io_1;
  wire [2:2]emio_sccb_tri_io_2;
  wire [3:3]emio_sccb_tri_io_3;
  wire [4:4]emio_sccb_tri_io_4;
  wire [5:5]emio_sccb_tri_io_5;
  wire [0:0]emio_sccb_tri_o_0;
  wire [1:1]emio_sccb_tri_o_1;
  wire [2:2]emio_sccb_tri_o_2;
  wire [3:3]emio_sccb_tri_o_3;
  wire [4:4]emio_sccb_tri_o_4;
  wire [5:5]emio_sccb_tri_o_5;
  wire [0:0]emio_sccb_tri_t_0;
  wire [1:1]emio_sccb_tri_t_1;
  wire [2:2]emio_sccb_tri_t_2;
  wire [3:3]emio_sccb_tri_t_3;
  wire [4:4]emio_sccb_tri_t_4;
  wire [5:5]emio_sccb_tri_t_5;

  IOBUF emio_sccb_tri_iobuf_0
       (.I(emio_sccb_tri_o_0),
        .IO(emio_sccb_tri_io[0]),
        .O(emio_sccb_tri_i_0),
        .T(emio_sccb_tri_t_0));
  IOBUF emio_sccb_tri_iobuf_1
       (.I(emio_sccb_tri_o_1),
        .IO(emio_sccb_tri_io[1]),
        .O(emio_sccb_tri_i_1),
        .T(emio_sccb_tri_t_1));
  IOBUF emio_sccb_tri_iobuf_2
       (.I(emio_sccb_tri_o_2),
        .IO(emio_sccb_tri_io[2]),
        .O(emio_sccb_tri_i_2),
        .T(emio_sccb_tri_t_2));
  IOBUF emio_sccb_tri_iobuf_3
       (.I(emio_sccb_tri_o_3),
        .IO(emio_sccb_tri_io[3]),
        .O(emio_sccb_tri_i_3),
        .T(emio_sccb_tri_t_3));
  IOBUF emio_sccb_tri_iobuf_4
       (.I(emio_sccb_tri_o_4),
        .IO(emio_sccb_tri_io[4]),
        .O(emio_sccb_tri_i_4),
        .T(emio_sccb_tri_t_4));
  IOBUF emio_sccb_tri_iobuf_5
       (.I(emio_sccb_tri_o_5),
        .IO(emio_sccb_tri_io[5]),
        .O(emio_sccb_tri_i_5),
        .T(emio_sccb_tri_t_5));
  system system_i
       (.cam_data_0(cam_data_0),
        .cam_data_1(cam_data_1),
        .cam_data_2(cam_data_2),
        .cam_href_0(cam_href_0),
        .cam_href_1(cam_href_1),
        .cam_href_2(cam_href_2),
        .cam_pclk_0(cam_pclk_0),
        .cam_pclk_1(cam_pclk_1),
        .cam_pclk_2(cam_pclk_2),
        .cam_pwdn_0(cam_pwdn_0),
        .cam_pwdn_1(cam_pwdn_1),
        .cam_pwdn_2(cam_pwdn_2),
        .cam_rst_n_0(cam_rst_n_0),
        .cam_rst_n_1(cam_rst_n_1),
        .cam_rst_n_2(cam_rst_n_2),
        .cam_vsync_0(cam_vsync_0),
        .cam_vsync_1(cam_vsync_1),
        .cam_vsync_2(cam_vsync_2),
        .emio_sccb_tri_i({emio_sccb_tri_i_5,emio_sccb_tri_i_4,emio_sccb_tri_i_3,emio_sccb_tri_i_2,emio_sccb_tri_i_1,emio_sccb_tri_i_0}),
        .emio_sccb_tri_o({emio_sccb_tri_o_5,emio_sccb_tri_o_4,emio_sccb_tri_o_3,emio_sccb_tri_o_2,emio_sccb_tri_o_1,emio_sccb_tri_o_0}),
        .emio_sccb_tri_t({emio_sccb_tri_t_5,emio_sccb_tri_t_4,emio_sccb_tri_t_3,emio_sccb_tri_t_2,emio_sccb_tri_t_1,emio_sccb_tri_t_0}));
endmodule
