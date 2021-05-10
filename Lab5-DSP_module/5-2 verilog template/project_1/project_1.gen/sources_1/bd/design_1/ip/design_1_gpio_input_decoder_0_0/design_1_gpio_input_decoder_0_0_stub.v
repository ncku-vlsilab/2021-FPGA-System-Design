// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon May 10 01:19:15 2021
// Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/2021-FPGA-System-Design/Lab5-DSP_module/5-2 verilog
//               template/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_gpio_input_decoder_0_0/design_1_gpio_input_decoder_0_0_stub.v}
// Design      : design_1_gpio_input_decoder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "gpio_input_decoder,Vivado 2020.2" *)
module design_1_gpio_input_decoder_0_0(inst, bram_addr, bram_en, dsp_inmode, 
  dsp_alumode, dsp_opmode)
/* synthesis syn_black_box black_box_pad_pin="inst[31:0],bram_addr[9:0],bram_en,dsp_inmode[4:0],dsp_alumode[3:0],dsp_opmode[6:0]" */;
  input [31:0]inst;
  output [9:0]bram_addr;
  output bram_en;
  output [4:0]dsp_inmode;
  output [3:0]dsp_alumode;
  output [6:0]dsp_opmode;
endmodule
