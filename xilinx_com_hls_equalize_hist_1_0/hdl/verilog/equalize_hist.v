// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="equalize_hist,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=17.189750,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=3,HLS_SYN_DSP=9,HLS_SYN_FF=3184,HLS_SYN_LUT=7552,HLS_VERSION=2018_3}" *)

module equalize_hist (
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP,
        ap_clk,
        ap_rst_n,
        INPUT_STREAM_TDATA,
        INPUT_STREAM_TKEEP,
        INPUT_STREAM_TSTRB,
        INPUT_STREAM_TUSER,
        INPUT_STREAM_TLAST,
        INPUT_STREAM_TID,
        INPUT_STREAM_TDEST,
        OUTPUT_STREAM_TDATA,
        OUTPUT_STREAM_TKEEP,
        OUTPUT_STREAM_TSTRB,
        OUTPUT_STREAM_TUSER,
        OUTPUT_STREAM_TLAST,
        OUTPUT_STREAM_TID,
        OUTPUT_STREAM_TDEST,
        INPUT_STREAM_TVALID,
        INPUT_STREAM_TREADY,
        OUTPUT_STREAM_TVALID,
        OUTPUT_STREAM_TREADY
);

parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_S_AXI_ADDR_WIDTH = 32;

parameter C_S_AXI_AXILITES_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1:0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;
input   ap_clk;
input   ap_rst_n;
input  [23:0] INPUT_STREAM_TDATA;
input  [2:0] INPUT_STREAM_TKEEP;
input  [2:0] INPUT_STREAM_TSTRB;
input  [0:0] INPUT_STREAM_TUSER;
input  [0:0] INPUT_STREAM_TLAST;
input  [0:0] INPUT_STREAM_TID;
input  [0:0] INPUT_STREAM_TDEST;
output  [23:0] OUTPUT_STREAM_TDATA;
output  [2:0] OUTPUT_STREAM_TKEEP;
output  [2:0] OUTPUT_STREAM_TSTRB;
output  [0:0] OUTPUT_STREAM_TUSER;
output  [0:0] OUTPUT_STREAM_TLAST;
output  [0:0] OUTPUT_STREAM_TID;
output  [0:0] OUTPUT_STREAM_TDEST;
input   INPUT_STREAM_TVALID;
output   INPUT_STREAM_TREADY;
output   OUTPUT_STREAM_TVALID;
input   OUTPUT_STREAM_TREADY;

 reg    ap_rst_n_inv;
wire   [31:0] rows;
wire   [31:0] cols;
wire    Block_Mat_exit49_pro_U0_ap_start;
wire    Block_Mat_exit49_pro_U0_start_full_n;
wire    Block_Mat_exit49_pro_U0_ap_done;
wire    Block_Mat_exit49_pro_U0_ap_continue;
wire    Block_Mat_exit49_pro_U0_ap_idle;
wire    Block_Mat_exit49_pro_U0_ap_ready;
wire    Block_Mat_exit49_pro_U0_start_out;
wire    Block_Mat_exit49_pro_U0_start_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_0_rows_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_0_rows_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_0_cols_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_0_cols_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_1_rows_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_1_rows_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_1_cols_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_1_cols_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_2_rows_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_2_rows_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_2_cols_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_2_cols_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_3_rows_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_3_rows_V_out_write;
wire   [31:0] Block_Mat_exit49_pro_U0_img_3_cols_V_out_din;
wire    Block_Mat_exit49_pro_U0_img_3_cols_V_out_write;
wire    AXIvideo2Mat_U0_ap_start;
wire    AXIvideo2Mat_U0_ap_done;
wire    AXIvideo2Mat_U0_ap_continue;
wire    AXIvideo2Mat_U0_ap_idle;
wire    AXIvideo2Mat_U0_ap_ready;
wire    AXIvideo2Mat_U0_start_out;
wire    AXIvideo2Mat_U0_start_write;
wire    AXIvideo2Mat_U0_INPUT_STREAM_TREADY;
wire    AXIvideo2Mat_U0_img_rows_V_read;
wire    AXIvideo2Mat_U0_img_cols_V_read;
wire   [7:0] AXIvideo2Mat_U0_img_data_stream_0_V_din;
wire    AXIvideo2Mat_U0_img_data_stream_0_V_write;
wire   [7:0] AXIvideo2Mat_U0_img_data_stream_1_V_din;
wire    AXIvideo2Mat_U0_img_data_stream_1_V_write;
wire   [7:0] AXIvideo2Mat_U0_img_data_stream_2_V_din;
wire    AXIvideo2Mat_U0_img_data_stream_2_V_write;
wire   [31:0] AXIvideo2Mat_U0_img_rows_V_out_din;
wire    AXIvideo2Mat_U0_img_rows_V_out_write;
wire   [31:0] AXIvideo2Mat_U0_img_cols_V_out_din;
wire    AXIvideo2Mat_U0_img_cols_V_out_write;
wire    CvtColor_U0_ap_start;
wire    CvtColor_U0_ap_done;
wire    CvtColor_U0_ap_continue;
wire    CvtColor_U0_ap_idle;
wire    CvtColor_U0_ap_ready;
wire    CvtColor_U0_p_src_rows_V_read;
wire    CvtColor_U0_p_src_cols_V_read;
wire    CvtColor_U0_p_src_data_stream_0_V_read;
wire    CvtColor_U0_p_src_data_stream_1_V_read;
wire    CvtColor_U0_p_src_data_stream_2_V_read;
wire   [7:0] CvtColor_U0_p_dst_data_stream_V_din;
wire    CvtColor_U0_p_dst_data_stream_V_write;
wire    Equalize_U0_ap_start;
wire    Equalize_U0_ap_done;
wire    Equalize_U0_ap_continue;
wire    Equalize_U0_ap_idle;
wire    Equalize_U0_ap_ready;
wire    Equalize_U0_p_src_rows_V_read;
wire    Equalize_U0_p_src_cols_V_read;
wire    Equalize_U0_p_src_data_stream_V_read;
wire   [7:0] Equalize_U0_p_dst_data_stream_V_din;
wire    Equalize_U0_p_dst_data_stream_V_write;
wire    CvtColor_1_U0_ap_start;
wire    CvtColor_1_U0_ap_done;
wire    CvtColor_1_U0_ap_continue;
wire    CvtColor_1_U0_ap_idle;
wire    CvtColor_1_U0_ap_ready;
wire    CvtColor_1_U0_p_src_rows_V_read;
wire    CvtColor_1_U0_p_src_cols_V_read;
wire    CvtColor_1_U0_p_src_data_stream_V_read;
wire   [7:0] CvtColor_1_U0_p_dst_data_stream_0_V_din;
wire    CvtColor_1_U0_p_dst_data_stream_0_V_write;
wire   [7:0] CvtColor_1_U0_p_dst_data_stream_1_V_din;
wire    CvtColor_1_U0_p_dst_data_stream_1_V_write;
wire   [7:0] CvtColor_1_U0_p_dst_data_stream_2_V_din;
wire    CvtColor_1_U0_p_dst_data_stream_2_V_write;
wire    Mat2AXIvideo_U0_ap_start;
wire    Mat2AXIvideo_U0_ap_done;
wire    Mat2AXIvideo_U0_ap_continue;
wire    Mat2AXIvideo_U0_ap_idle;
wire    Mat2AXIvideo_U0_ap_ready;
wire    Mat2AXIvideo_U0_img_rows_V_read;
wire    Mat2AXIvideo_U0_img_cols_V_read;
wire    Mat2AXIvideo_U0_img_data_stream_0_V_read;
wire    Mat2AXIvideo_U0_img_data_stream_1_V_read;
wire    Mat2AXIvideo_U0_img_data_stream_2_V_read;
wire   [23:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TDATA;
wire    Mat2AXIvideo_U0_OUTPUT_STREAM_TVALID;
wire   [2:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TKEEP;
wire   [2:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TSTRB;
wire   [0:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TUSER;
wire   [0:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TLAST;
wire   [0:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TID;
wire   [0:0] Mat2AXIvideo_U0_OUTPUT_STREAM_TDEST;
wire    ap_sync_continue;
wire    img_0_rows_V_c_full_n;
wire   [31:0] img_0_rows_V_c_dout;
wire    img_0_rows_V_c_empty_n;
wire    img_0_cols_V_c_full_n;
wire   [31:0] img_0_cols_V_c_dout;
wire    img_0_cols_V_c_empty_n;
wire    img_1_rows_V_c_full_n;
wire   [31:0] img_1_rows_V_c_dout;
wire    img_1_rows_V_c_empty_n;
wire    img_1_cols_V_c_full_n;
wire   [31:0] img_1_cols_V_c_dout;
wire    img_1_cols_V_c_empty_n;
wire    img_2_rows_V_c_full_n;
wire   [31:0] img_2_rows_V_c_dout;
wire    img_2_rows_V_c_empty_n;
wire    img_2_cols_V_c_full_n;
wire   [31:0] img_2_cols_V_c_dout;
wire    img_2_cols_V_c_empty_n;
wire    img_3_rows_V_c_full_n;
wire   [31:0] img_3_rows_V_c_dout;
wire    img_3_rows_V_c_empty_n;
wire    img_3_cols_V_c_full_n;
wire   [31:0] img_3_cols_V_c_dout;
wire    img_3_cols_V_c_empty_n;
wire    img_0_data_stream_0_full_n;
wire   [7:0] img_0_data_stream_0_dout;
wire    img_0_data_stream_0_empty_n;
wire    img_0_data_stream_1_full_n;
wire   [7:0] img_0_data_stream_1_dout;
wire    img_0_data_stream_1_empty_n;
wire    img_0_data_stream_2_full_n;
wire   [7:0] img_0_data_stream_2_dout;
wire    img_0_data_stream_2_empty_n;
wire    img_0_rows_V_c22_full_n;
wire   [31:0] img_0_rows_V_c22_dout;
wire    img_0_rows_V_c22_empty_n;
wire    img_0_cols_V_c23_full_n;
wire   [31:0] img_0_cols_V_c23_dout;
wire    img_0_cols_V_c23_empty_n;
wire    img_1_data_stream_0_full_n;
wire   [7:0] img_1_data_stream_0_dout;
wire    img_1_data_stream_0_empty_n;
wire    img_2_data_stream_0_full_n;
wire   [7:0] img_2_data_stream_0_dout;
wire    img_2_data_stream_0_empty_n;
wire    img_3_data_stream_0_full_n;
wire   [7:0] img_3_data_stream_0_dout;
wire    img_3_data_stream_0_empty_n;
wire    img_3_data_stream_1_full_n;
wire   [7:0] img_3_data_stream_1_dout;
wire    img_3_data_stream_1_empty_n;
wire    img_3_data_stream_2_full_n;
wire   [7:0] img_3_data_stream_2_dout;
wire    img_3_data_stream_2_empty_n;
wire   [0:0] start_for_Equalize_U0_din;
wire    start_for_Equalize_U0_full_n;
wire   [0:0] start_for_Equalize_U0_dout;
wire    start_for_Equalize_U0_empty_n;
wire   [0:0] start_for_CvtColor_1_U0_din;
wire    start_for_CvtColor_1_U0_full_n;
wire   [0:0] start_for_CvtColor_1_U0_dout;
wire    start_for_CvtColor_1_U0_empty_n;
wire   [0:0] start_for_Mat2AXIvideo_U0_din;
wire    start_for_Mat2AXIvideo_U0_full_n;
wire   [0:0] start_for_Mat2AXIvideo_U0_dout;
wire    start_for_Mat2AXIvideo_U0_empty_n;
wire   [0:0] start_for_CvtColor_U0_din;
wire    start_for_CvtColor_U0_full_n;
wire   [0:0] start_for_CvtColor_U0_dout;
wire    start_for_CvtColor_U0_empty_n;
wire    CvtColor_U0_start_full_n;
wire    CvtColor_U0_start_write;
wire    Equalize_U0_start_full_n;
wire    Equalize_U0_start_write;
wire    CvtColor_1_U0_start_full_n;
wire    CvtColor_1_U0_start_write;
wire    Mat2AXIvideo_U0_start_full_n;
wire    Mat2AXIvideo_U0_start_write;

equalize_hist_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
equalize_hist_AXILiteS_s_axi_U(
    .AWVALID(s_axi_AXILiteS_AWVALID),
    .AWREADY(s_axi_AXILiteS_AWREADY),
    .AWADDR(s_axi_AXILiteS_AWADDR),
    .WVALID(s_axi_AXILiteS_WVALID),
    .WREADY(s_axi_AXILiteS_WREADY),
    .WDATA(s_axi_AXILiteS_WDATA),
    .WSTRB(s_axi_AXILiteS_WSTRB),
    .ARVALID(s_axi_AXILiteS_ARVALID),
    .ARREADY(s_axi_AXILiteS_ARREADY),
    .ARADDR(s_axi_AXILiteS_ARADDR),
    .RVALID(s_axi_AXILiteS_RVALID),
    .RREADY(s_axi_AXILiteS_RREADY),
    .RDATA(s_axi_AXILiteS_RDATA),
    .RRESP(s_axi_AXILiteS_RRESP),
    .BVALID(s_axi_AXILiteS_BVALID),
    .BREADY(s_axi_AXILiteS_BREADY),
    .BRESP(s_axi_AXILiteS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .rows(rows),
    .cols(cols)
);

Block_Mat_exit49_pro Block_Mat_exit49_pro_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_Mat_exit49_pro_U0_ap_start),
    .start_full_n(Block_Mat_exit49_pro_U0_start_full_n),
    .ap_done(Block_Mat_exit49_pro_U0_ap_done),
    .ap_continue(Block_Mat_exit49_pro_U0_ap_continue),
    .ap_idle(Block_Mat_exit49_pro_U0_ap_idle),
    .ap_ready(Block_Mat_exit49_pro_U0_ap_ready),
    .start_out(Block_Mat_exit49_pro_U0_start_out),
    .start_write(Block_Mat_exit49_pro_U0_start_write),
    .rows(rows),
    .cols(cols),
    .img_0_rows_V_out_din(Block_Mat_exit49_pro_U0_img_0_rows_V_out_din),
    .img_0_rows_V_out_full_n(img_0_rows_V_c_full_n),
    .img_0_rows_V_out_write(Block_Mat_exit49_pro_U0_img_0_rows_V_out_write),
    .img_0_cols_V_out_din(Block_Mat_exit49_pro_U0_img_0_cols_V_out_din),
    .img_0_cols_V_out_full_n(img_0_cols_V_c_full_n),
    .img_0_cols_V_out_write(Block_Mat_exit49_pro_U0_img_0_cols_V_out_write),
    .img_1_rows_V_out_din(Block_Mat_exit49_pro_U0_img_1_rows_V_out_din),
    .img_1_rows_V_out_full_n(img_1_rows_V_c_full_n),
    .img_1_rows_V_out_write(Block_Mat_exit49_pro_U0_img_1_rows_V_out_write),
    .img_1_cols_V_out_din(Block_Mat_exit49_pro_U0_img_1_cols_V_out_din),
    .img_1_cols_V_out_full_n(img_1_cols_V_c_full_n),
    .img_1_cols_V_out_write(Block_Mat_exit49_pro_U0_img_1_cols_V_out_write),
    .img_2_rows_V_out_din(Block_Mat_exit49_pro_U0_img_2_rows_V_out_din),
    .img_2_rows_V_out_full_n(img_2_rows_V_c_full_n),
    .img_2_rows_V_out_write(Block_Mat_exit49_pro_U0_img_2_rows_V_out_write),
    .img_2_cols_V_out_din(Block_Mat_exit49_pro_U0_img_2_cols_V_out_din),
    .img_2_cols_V_out_full_n(img_2_cols_V_c_full_n),
    .img_2_cols_V_out_write(Block_Mat_exit49_pro_U0_img_2_cols_V_out_write),
    .img_3_rows_V_out_din(Block_Mat_exit49_pro_U0_img_3_rows_V_out_din),
    .img_3_rows_V_out_full_n(img_3_rows_V_c_full_n),
    .img_3_rows_V_out_write(Block_Mat_exit49_pro_U0_img_3_rows_V_out_write),
    .img_3_cols_V_out_din(Block_Mat_exit49_pro_U0_img_3_cols_V_out_din),
    .img_3_cols_V_out_full_n(img_3_cols_V_c_full_n),
    .img_3_cols_V_out_write(Block_Mat_exit49_pro_U0_img_3_cols_V_out_write)
);

AXIvideo2Mat AXIvideo2Mat_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(AXIvideo2Mat_U0_ap_start),
    .start_full_n(start_for_CvtColor_U0_full_n),
    .ap_done(AXIvideo2Mat_U0_ap_done),
    .ap_continue(AXIvideo2Mat_U0_ap_continue),
    .ap_idle(AXIvideo2Mat_U0_ap_idle),
    .ap_ready(AXIvideo2Mat_U0_ap_ready),
    .start_out(AXIvideo2Mat_U0_start_out),
    .start_write(AXIvideo2Mat_U0_start_write),
    .INPUT_STREAM_TDATA(INPUT_STREAM_TDATA),
    .INPUT_STREAM_TVALID(INPUT_STREAM_TVALID),
    .INPUT_STREAM_TREADY(AXIvideo2Mat_U0_INPUT_STREAM_TREADY),
    .INPUT_STREAM_TKEEP(INPUT_STREAM_TKEEP),
    .INPUT_STREAM_TSTRB(INPUT_STREAM_TSTRB),
    .INPUT_STREAM_TUSER(INPUT_STREAM_TUSER),
    .INPUT_STREAM_TLAST(INPUT_STREAM_TLAST),
    .INPUT_STREAM_TID(INPUT_STREAM_TID),
    .INPUT_STREAM_TDEST(INPUT_STREAM_TDEST),
    .img_rows_V_dout(img_0_rows_V_c_dout),
    .img_rows_V_empty_n(img_0_rows_V_c_empty_n),
    .img_rows_V_read(AXIvideo2Mat_U0_img_rows_V_read),
    .img_cols_V_dout(img_0_cols_V_c_dout),
    .img_cols_V_empty_n(img_0_cols_V_c_empty_n),
    .img_cols_V_read(AXIvideo2Mat_U0_img_cols_V_read),
    .img_data_stream_0_V_din(AXIvideo2Mat_U0_img_data_stream_0_V_din),
    .img_data_stream_0_V_full_n(img_0_data_stream_0_full_n),
    .img_data_stream_0_V_write(AXIvideo2Mat_U0_img_data_stream_0_V_write),
    .img_data_stream_1_V_din(AXIvideo2Mat_U0_img_data_stream_1_V_din),
    .img_data_stream_1_V_full_n(img_0_data_stream_1_full_n),
    .img_data_stream_1_V_write(AXIvideo2Mat_U0_img_data_stream_1_V_write),
    .img_data_stream_2_V_din(AXIvideo2Mat_U0_img_data_stream_2_V_din),
    .img_data_stream_2_V_full_n(img_0_data_stream_2_full_n),
    .img_data_stream_2_V_write(AXIvideo2Mat_U0_img_data_stream_2_V_write),
    .img_rows_V_out_din(AXIvideo2Mat_U0_img_rows_V_out_din),
    .img_rows_V_out_full_n(img_0_rows_V_c22_full_n),
    .img_rows_V_out_write(AXIvideo2Mat_U0_img_rows_V_out_write),
    .img_cols_V_out_din(AXIvideo2Mat_U0_img_cols_V_out_din),
    .img_cols_V_out_full_n(img_0_cols_V_c23_full_n),
    .img_cols_V_out_write(AXIvideo2Mat_U0_img_cols_V_out_write)
);

CvtColor CvtColor_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(CvtColor_U0_ap_start),
    .ap_done(CvtColor_U0_ap_done),
    .ap_continue(CvtColor_U0_ap_continue),
    .ap_idle(CvtColor_U0_ap_idle),
    .ap_ready(CvtColor_U0_ap_ready),
    .p_src_rows_V_dout(img_0_rows_V_c22_dout),
    .p_src_rows_V_empty_n(img_0_rows_V_c22_empty_n),
    .p_src_rows_V_read(CvtColor_U0_p_src_rows_V_read),
    .p_src_cols_V_dout(img_0_cols_V_c23_dout),
    .p_src_cols_V_empty_n(img_0_cols_V_c23_empty_n),
    .p_src_cols_V_read(CvtColor_U0_p_src_cols_V_read),
    .p_src_data_stream_0_V_dout(img_0_data_stream_0_dout),
    .p_src_data_stream_0_V_empty_n(img_0_data_stream_0_empty_n),
    .p_src_data_stream_0_V_read(CvtColor_U0_p_src_data_stream_0_V_read),
    .p_src_data_stream_1_V_dout(img_0_data_stream_1_dout),
    .p_src_data_stream_1_V_empty_n(img_0_data_stream_1_empty_n),
    .p_src_data_stream_1_V_read(CvtColor_U0_p_src_data_stream_1_V_read),
    .p_src_data_stream_2_V_dout(img_0_data_stream_2_dout),
    .p_src_data_stream_2_V_empty_n(img_0_data_stream_2_empty_n),
    .p_src_data_stream_2_V_read(CvtColor_U0_p_src_data_stream_2_V_read),
    .p_dst_data_stream_V_din(CvtColor_U0_p_dst_data_stream_V_din),
    .p_dst_data_stream_V_full_n(img_1_data_stream_0_full_n),
    .p_dst_data_stream_V_write(CvtColor_U0_p_dst_data_stream_V_write)
);

Equalize Equalize_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Equalize_U0_ap_start),
    .ap_done(Equalize_U0_ap_done),
    .ap_continue(Equalize_U0_ap_continue),
    .ap_idle(Equalize_U0_ap_idle),
    .ap_ready(Equalize_U0_ap_ready),
    .p_src_rows_V_dout(img_1_rows_V_c_dout),
    .p_src_rows_V_empty_n(img_1_rows_V_c_empty_n),
    .p_src_rows_V_read(Equalize_U0_p_src_rows_V_read),
    .p_src_cols_V_dout(img_1_cols_V_c_dout),
    .p_src_cols_V_empty_n(img_1_cols_V_c_empty_n),
    .p_src_cols_V_read(Equalize_U0_p_src_cols_V_read),
    .p_src_data_stream_V_dout(img_1_data_stream_0_dout),
    .p_src_data_stream_V_empty_n(img_1_data_stream_0_empty_n),
    .p_src_data_stream_V_read(Equalize_U0_p_src_data_stream_V_read),
    .p_dst_data_stream_V_din(Equalize_U0_p_dst_data_stream_V_din),
    .p_dst_data_stream_V_full_n(img_2_data_stream_0_full_n),
    .p_dst_data_stream_V_write(Equalize_U0_p_dst_data_stream_V_write)
);

CvtColor_1 CvtColor_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(CvtColor_1_U0_ap_start),
    .ap_done(CvtColor_1_U0_ap_done),
    .ap_continue(CvtColor_1_U0_ap_continue),
    .ap_idle(CvtColor_1_U0_ap_idle),
    .ap_ready(CvtColor_1_U0_ap_ready),
    .p_src_rows_V_dout(img_2_rows_V_c_dout),
    .p_src_rows_V_empty_n(img_2_rows_V_c_empty_n),
    .p_src_rows_V_read(CvtColor_1_U0_p_src_rows_V_read),
    .p_src_cols_V_dout(img_2_cols_V_c_dout),
    .p_src_cols_V_empty_n(img_2_cols_V_c_empty_n),
    .p_src_cols_V_read(CvtColor_1_U0_p_src_cols_V_read),
    .p_src_data_stream_V_dout(img_2_data_stream_0_dout),
    .p_src_data_stream_V_empty_n(img_2_data_stream_0_empty_n),
    .p_src_data_stream_V_read(CvtColor_1_U0_p_src_data_stream_V_read),
    .p_dst_data_stream_0_V_din(CvtColor_1_U0_p_dst_data_stream_0_V_din),
    .p_dst_data_stream_0_V_full_n(img_3_data_stream_0_full_n),
    .p_dst_data_stream_0_V_write(CvtColor_1_U0_p_dst_data_stream_0_V_write),
    .p_dst_data_stream_1_V_din(CvtColor_1_U0_p_dst_data_stream_1_V_din),
    .p_dst_data_stream_1_V_full_n(img_3_data_stream_1_full_n),
    .p_dst_data_stream_1_V_write(CvtColor_1_U0_p_dst_data_stream_1_V_write),
    .p_dst_data_stream_2_V_din(CvtColor_1_U0_p_dst_data_stream_2_V_din),
    .p_dst_data_stream_2_V_full_n(img_3_data_stream_2_full_n),
    .p_dst_data_stream_2_V_write(CvtColor_1_U0_p_dst_data_stream_2_V_write)
);

Mat2AXIvideo Mat2AXIvideo_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Mat2AXIvideo_U0_ap_start),
    .ap_done(Mat2AXIvideo_U0_ap_done),
    .ap_continue(Mat2AXIvideo_U0_ap_continue),
    .ap_idle(Mat2AXIvideo_U0_ap_idle),
    .ap_ready(Mat2AXIvideo_U0_ap_ready),
    .img_rows_V_dout(img_3_rows_V_c_dout),
    .img_rows_V_empty_n(img_3_rows_V_c_empty_n),
    .img_rows_V_read(Mat2AXIvideo_U0_img_rows_V_read),
    .img_cols_V_dout(img_3_cols_V_c_dout),
    .img_cols_V_empty_n(img_3_cols_V_c_empty_n),
    .img_cols_V_read(Mat2AXIvideo_U0_img_cols_V_read),
    .img_data_stream_0_V_dout(img_3_data_stream_0_dout),
    .img_data_stream_0_V_empty_n(img_3_data_stream_0_empty_n),
    .img_data_stream_0_V_read(Mat2AXIvideo_U0_img_data_stream_0_V_read),
    .img_data_stream_1_V_dout(img_3_data_stream_1_dout),
    .img_data_stream_1_V_empty_n(img_3_data_stream_1_empty_n),
    .img_data_stream_1_V_read(Mat2AXIvideo_U0_img_data_stream_1_V_read),
    .img_data_stream_2_V_dout(img_3_data_stream_2_dout),
    .img_data_stream_2_V_empty_n(img_3_data_stream_2_empty_n),
    .img_data_stream_2_V_read(Mat2AXIvideo_U0_img_data_stream_2_V_read),
    .OUTPUT_STREAM_TDATA(Mat2AXIvideo_U0_OUTPUT_STREAM_TDATA),
    .OUTPUT_STREAM_TVALID(Mat2AXIvideo_U0_OUTPUT_STREAM_TVALID),
    .OUTPUT_STREAM_TREADY(OUTPUT_STREAM_TREADY),
    .OUTPUT_STREAM_TKEEP(Mat2AXIvideo_U0_OUTPUT_STREAM_TKEEP),
    .OUTPUT_STREAM_TSTRB(Mat2AXIvideo_U0_OUTPUT_STREAM_TSTRB),
    .OUTPUT_STREAM_TUSER(Mat2AXIvideo_U0_OUTPUT_STREAM_TUSER),
    .OUTPUT_STREAM_TLAST(Mat2AXIvideo_U0_OUTPUT_STREAM_TLAST),
    .OUTPUT_STREAM_TID(Mat2AXIvideo_U0_OUTPUT_STREAM_TID),
    .OUTPUT_STREAM_TDEST(Mat2AXIvideo_U0_OUTPUT_STREAM_TDEST)
);

fifo_w32_d2_A img_0_rows_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_0_rows_V_out_din),
    .if_full_n(img_0_rows_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_0_rows_V_out_write),
    .if_dout(img_0_rows_V_c_dout),
    .if_empty_n(img_0_rows_V_c_empty_n),
    .if_read(AXIvideo2Mat_U0_img_rows_V_read)
);

fifo_w32_d2_A img_0_cols_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_0_cols_V_out_din),
    .if_full_n(img_0_cols_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_0_cols_V_out_write),
    .if_dout(img_0_cols_V_c_dout),
    .if_empty_n(img_0_cols_V_c_empty_n),
    .if_read(AXIvideo2Mat_U0_img_cols_V_read)
);

fifo_w32_d4_A img_1_rows_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_1_rows_V_out_din),
    .if_full_n(img_1_rows_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_1_rows_V_out_write),
    .if_dout(img_1_rows_V_c_dout),
    .if_empty_n(img_1_rows_V_c_empty_n),
    .if_read(Equalize_U0_p_src_rows_V_read)
);

fifo_w32_d4_A img_1_cols_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_1_cols_V_out_din),
    .if_full_n(img_1_cols_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_1_cols_V_out_write),
    .if_dout(img_1_cols_V_c_dout),
    .if_empty_n(img_1_cols_V_c_empty_n),
    .if_read(Equalize_U0_p_src_cols_V_read)
);

fifo_w32_d5_A img_2_rows_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_2_rows_V_out_din),
    .if_full_n(img_2_rows_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_2_rows_V_out_write),
    .if_dout(img_2_rows_V_c_dout),
    .if_empty_n(img_2_rows_V_c_empty_n),
    .if_read(CvtColor_1_U0_p_src_rows_V_read)
);

fifo_w32_d5_A img_2_cols_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_2_cols_V_out_din),
    .if_full_n(img_2_cols_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_2_cols_V_out_write),
    .if_dout(img_2_cols_V_c_dout),
    .if_empty_n(img_2_cols_V_c_empty_n),
    .if_read(CvtColor_1_U0_p_src_cols_V_read)
);

fifo_w32_d6_A img_3_rows_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_3_rows_V_out_din),
    .if_full_n(img_3_rows_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_3_rows_V_out_write),
    .if_dout(img_3_rows_V_c_dout),
    .if_empty_n(img_3_rows_V_c_empty_n),
    .if_read(Mat2AXIvideo_U0_img_rows_V_read)
);

fifo_w32_d6_A img_3_cols_V_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_Mat_exit49_pro_U0_img_3_cols_V_out_din),
    .if_full_n(img_3_cols_V_c_full_n),
    .if_write(Block_Mat_exit49_pro_U0_img_3_cols_V_out_write),
    .if_dout(img_3_cols_V_c_dout),
    .if_empty_n(img_3_cols_V_c_empty_n),
    .if_read(Mat2AXIvideo_U0_img_cols_V_read)
);

fifo_w8_d2_A img_0_data_stream_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2Mat_U0_img_data_stream_0_V_din),
    .if_full_n(img_0_data_stream_0_full_n),
    .if_write(AXIvideo2Mat_U0_img_data_stream_0_V_write),
    .if_dout(img_0_data_stream_0_dout),
    .if_empty_n(img_0_data_stream_0_empty_n),
    .if_read(CvtColor_U0_p_src_data_stream_0_V_read)
);

fifo_w8_d2_A img_0_data_stream_1_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2Mat_U0_img_data_stream_1_V_din),
    .if_full_n(img_0_data_stream_1_full_n),
    .if_write(AXIvideo2Mat_U0_img_data_stream_1_V_write),
    .if_dout(img_0_data_stream_1_dout),
    .if_empty_n(img_0_data_stream_1_empty_n),
    .if_read(CvtColor_U0_p_src_data_stream_1_V_read)
);

fifo_w8_d2_A img_0_data_stream_2_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2Mat_U0_img_data_stream_2_V_din),
    .if_full_n(img_0_data_stream_2_full_n),
    .if_write(AXIvideo2Mat_U0_img_data_stream_2_V_write),
    .if_dout(img_0_data_stream_2_dout),
    .if_empty_n(img_0_data_stream_2_empty_n),
    .if_read(CvtColor_U0_p_src_data_stream_2_V_read)
);

fifo_w32_d2_A img_0_rows_V_c22_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2Mat_U0_img_rows_V_out_din),
    .if_full_n(img_0_rows_V_c22_full_n),
    .if_write(AXIvideo2Mat_U0_img_rows_V_out_write),
    .if_dout(img_0_rows_V_c22_dout),
    .if_empty_n(img_0_rows_V_c22_empty_n),
    .if_read(CvtColor_U0_p_src_rows_V_read)
);

fifo_w32_d2_A img_0_cols_V_c23_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(AXIvideo2Mat_U0_img_cols_V_out_din),
    .if_full_n(img_0_cols_V_c23_full_n),
    .if_write(AXIvideo2Mat_U0_img_cols_V_out_write),
    .if_dout(img_0_cols_V_c23_dout),
    .if_empty_n(img_0_cols_V_c23_empty_n),
    .if_read(CvtColor_U0_p_src_cols_V_read)
);

fifo_w8_d2_A img_1_data_stream_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(CvtColor_U0_p_dst_data_stream_V_din),
    .if_full_n(img_1_data_stream_0_full_n),
    .if_write(CvtColor_U0_p_dst_data_stream_V_write),
    .if_dout(img_1_data_stream_0_dout),
    .if_empty_n(img_1_data_stream_0_empty_n),
    .if_read(Equalize_U0_p_src_data_stream_V_read)
);

fifo_w8_d2_A img_2_data_stream_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Equalize_U0_p_dst_data_stream_V_din),
    .if_full_n(img_2_data_stream_0_full_n),
    .if_write(Equalize_U0_p_dst_data_stream_V_write),
    .if_dout(img_2_data_stream_0_dout),
    .if_empty_n(img_2_data_stream_0_empty_n),
    .if_read(CvtColor_1_U0_p_src_data_stream_V_read)
);

fifo_w8_d2_A img_3_data_stream_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(CvtColor_1_U0_p_dst_data_stream_0_V_din),
    .if_full_n(img_3_data_stream_0_full_n),
    .if_write(CvtColor_1_U0_p_dst_data_stream_0_V_write),
    .if_dout(img_3_data_stream_0_dout),
    .if_empty_n(img_3_data_stream_0_empty_n),
    .if_read(Mat2AXIvideo_U0_img_data_stream_0_V_read)
);

fifo_w8_d2_A img_3_data_stream_1_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(CvtColor_1_U0_p_dst_data_stream_1_V_din),
    .if_full_n(img_3_data_stream_1_full_n),
    .if_write(CvtColor_1_U0_p_dst_data_stream_1_V_write),
    .if_dout(img_3_data_stream_1_dout),
    .if_empty_n(img_3_data_stream_1_empty_n),
    .if_read(Mat2AXIvideo_U0_img_data_stream_1_V_read)
);

fifo_w8_d2_A img_3_data_stream_2_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(CvtColor_1_U0_p_dst_data_stream_2_V_din),
    .if_full_n(img_3_data_stream_2_full_n),
    .if_write(CvtColor_1_U0_p_dst_data_stream_2_V_write),
    .if_dout(img_3_data_stream_2_dout),
    .if_empty_n(img_3_data_stream_2_empty_n),
    .if_read(Mat2AXIvideo_U0_img_data_stream_2_V_read)
);

start_for_EqualizjbC start_for_EqualizjbC_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_Equalize_U0_din),
    .if_full_n(start_for_Equalize_U0_full_n),
    .if_write(Block_Mat_exit49_pro_U0_start_write),
    .if_dout(start_for_Equalize_U0_dout),
    .if_empty_n(start_for_Equalize_U0_empty_n),
    .if_read(Equalize_U0_ap_ready)
);

start_for_CvtColokbM start_for_CvtColokbM_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_CvtColor_1_U0_din),
    .if_full_n(start_for_CvtColor_1_U0_full_n),
    .if_write(Block_Mat_exit49_pro_U0_start_write),
    .if_dout(start_for_CvtColor_1_U0_dout),
    .if_empty_n(start_for_CvtColor_1_U0_empty_n),
    .if_read(CvtColor_1_U0_ap_ready)
);

start_for_Mat2AXIlbW start_for_Mat2AXIlbW_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_Mat2AXIvideo_U0_din),
    .if_full_n(start_for_Mat2AXIvideo_U0_full_n),
    .if_write(Block_Mat_exit49_pro_U0_start_write),
    .if_dout(start_for_Mat2AXIvideo_U0_dout),
    .if_empty_n(start_for_Mat2AXIvideo_U0_empty_n),
    .if_read(Mat2AXIvideo_U0_ap_ready)
);

start_for_CvtColomb6 start_for_CvtColomb6_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_CvtColor_U0_din),
    .if_full_n(start_for_CvtColor_U0_full_n),
    .if_write(AXIvideo2Mat_U0_start_write),
    .if_dout(start_for_CvtColor_U0_dout),
    .if_empty_n(start_for_CvtColor_U0_empty_n),
    .if_read(CvtColor_U0_ap_ready)
);

assign AXIvideo2Mat_U0_ap_continue = 1'b1;

assign AXIvideo2Mat_U0_ap_start = 1'b1;

assign Block_Mat_exit49_pro_U0_ap_continue = 1'b1;

assign Block_Mat_exit49_pro_U0_ap_start = 1'b1;

assign Block_Mat_exit49_pro_U0_start_full_n = (start_for_Mat2AXIvideo_U0_full_n & start_for_Equalize_U0_full_n & start_for_CvtColor_1_U0_full_n);

assign CvtColor_1_U0_ap_continue = 1'b1;

assign CvtColor_1_U0_ap_start = start_for_CvtColor_1_U0_empty_n;

assign CvtColor_1_U0_start_full_n = 1'b1;

assign CvtColor_1_U0_start_write = 1'b0;

assign CvtColor_U0_ap_continue = 1'b1;

assign CvtColor_U0_ap_start = start_for_CvtColor_U0_empty_n;

assign CvtColor_U0_start_full_n = 1'b1;

assign CvtColor_U0_start_write = 1'b0;

assign Equalize_U0_ap_continue = 1'b1;

assign Equalize_U0_ap_start = start_for_Equalize_U0_empty_n;

assign Equalize_U0_start_full_n = 1'b1;

assign Equalize_U0_start_write = 1'b0;

assign INPUT_STREAM_TREADY = AXIvideo2Mat_U0_INPUT_STREAM_TREADY;

assign Mat2AXIvideo_U0_ap_continue = 1'b1;

assign Mat2AXIvideo_U0_ap_start = start_for_Mat2AXIvideo_U0_empty_n;

assign Mat2AXIvideo_U0_start_full_n = 1'b1;

assign Mat2AXIvideo_U0_start_write = 1'b0;

assign OUTPUT_STREAM_TDATA = Mat2AXIvideo_U0_OUTPUT_STREAM_TDATA;

assign OUTPUT_STREAM_TDEST = Mat2AXIvideo_U0_OUTPUT_STREAM_TDEST;

assign OUTPUT_STREAM_TID = Mat2AXIvideo_U0_OUTPUT_STREAM_TID;

assign OUTPUT_STREAM_TKEEP = Mat2AXIvideo_U0_OUTPUT_STREAM_TKEEP;

assign OUTPUT_STREAM_TLAST = Mat2AXIvideo_U0_OUTPUT_STREAM_TLAST;

assign OUTPUT_STREAM_TSTRB = Mat2AXIvideo_U0_OUTPUT_STREAM_TSTRB;

assign OUTPUT_STREAM_TUSER = Mat2AXIvideo_U0_OUTPUT_STREAM_TUSER;

assign OUTPUT_STREAM_TVALID = Mat2AXIvideo_U0_OUTPUT_STREAM_TVALID;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_continue = 1'b0;

assign start_for_CvtColor_1_U0_din = 1'b1;

assign start_for_CvtColor_U0_din = 1'b1;

assign start_for_Equalize_U0_din = 1'b1;

assign start_for_Mat2AXIvideo_U0_din = 1'b1;

endmodule //equalize_hist
