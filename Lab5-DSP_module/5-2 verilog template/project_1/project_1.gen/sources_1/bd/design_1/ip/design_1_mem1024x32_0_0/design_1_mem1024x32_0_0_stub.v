// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon May 10 01:20:32 2021
// Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/2021-FPGA-System-Design/Lab5-DSP_module/5-2 verilog
//               template/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_mem1024x32_0_0/design_1_mem1024x32_0_0_stub.v}
// Design      : design_1_mem1024x32_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mem1024x32,Vivado 2020.2" *)
module design_1_mem1024x32_0_0(clk, rst_a, ADDRARDADDR, ENARDEN, WEA, DIADI, 
  ADDRBWRADDR, ENBWREN, DOADO, DOBDO)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_a,ADDRARDADDR[11:0],ENARDEN,WEA[3:0],DIADI[31:0],ADDRBWRADDR[9:0],ENBWREN,DOADO[31:0],DOBDO[31:0]" */;
  input clk;
  input rst_a;
  input [11:0]ADDRARDADDR;
  input ENARDEN;
  input [3:0]WEA;
  input [31:0]DIADI;
  input [9:0]ADDRBWRADDR;
  input ENBWREN;
  output [31:0]DOADO;
  output [31:0]DOBDO;
endmodule
