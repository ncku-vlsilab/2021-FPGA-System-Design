// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon May 10 01:19:20 2021
// Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/2021-FPGA-System-Design/Lab5-DSP_module/5-2 verilog
//               template/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_dsp_direct_0_0/design_1_dsp_direct_0_0_stub.v}
// Design      : design_1_dsp_direct_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "dsp_direct,Vivado 2020.2" *)
module design_1_dsp_direct_0_0(clk, A, B, INMODE, ALUMODE, OPMODE, P)
/* synthesis syn_black_box black_box_pad_pin="clk,A[29:0],B[17:0],INMODE[4:0],ALUMODE[3:0],OPMODE[6:0],P[47:0]" */;
  input clk;
  input [29:0]A;
  input [17:0]B;
  input [4:0]INMODE;
  input [3:0]ALUMODE;
  input [6:0]OPMODE;
  output [47:0]P;
endmodule
