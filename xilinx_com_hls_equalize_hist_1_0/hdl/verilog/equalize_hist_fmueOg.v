// ==============================================================
// File generated on Fri Aug 27 16:23:28 +0800 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps

module equalize_hist_fmueOg
#(parameter
    ID         = 37,
    NUM_STAGE  = 1,
    din0_WIDTH = 32,
    din1_WIDTH = 32,
    dout_WIDTH = 32
)(
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire        a_tvalid;
wire [31:0] a_tdata;
wire        b_tvalid;
wire [31:0] b_tdata;
wire        r_tvalid;
wire [31:0] r_tdata;
//------------------------Instantiation------------------
equalize_hist_ap_fmul_0_max_dsp_32 equalize_hist_ap_fmul_0_max_dsp_32_u (
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .s_axis_b_tvalid      ( b_tvalid ),
    .s_axis_b_tdata       ( b_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign a_tvalid = 1'b1;
assign a_tdata  = din0;
assign b_tvalid = 1'b1;
assign b_tdata  = din1;
assign dout     = r_tdata;

endmodule
