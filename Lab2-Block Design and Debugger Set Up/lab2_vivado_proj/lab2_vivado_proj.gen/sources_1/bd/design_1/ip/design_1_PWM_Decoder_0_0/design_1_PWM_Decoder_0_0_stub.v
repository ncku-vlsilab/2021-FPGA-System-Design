// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Mar  5 15:13:19 2021
// Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/2021-FPGA-System-Design/Lab2-Block Design and Debugger Set
//               Up/lab2_vivado_proj/lab2_vivado_proj.gen/sources_1/bd/design_1/ip/design_1_PWM_Decoder_0_0/design_1_PWM_Decoder_0_0_stub.v}
// Design      : design_1_PWM_Decoder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "PWM_Decoder,Vivado 2020.2" *)
module design_1_PWM_Decoder_0_0(sw, R_time_out, G_time_out, B_time_out)
/* synthesis syn_black_box black_box_pad_pin="sw[1:0],R_time_out[7:0],G_time_out[7:0],B_time_out[7:0]" */;
  input [1:0]sw;
  output [7:0]R_time_out;
  output [7:0]G_time_out;
  output [7:0]B_time_out;
endmodule
