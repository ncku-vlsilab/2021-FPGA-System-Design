//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri Mar  5 15:12:38 2021
//Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (B_out,
    G_out,
    R_out,
    clk,
    rst,
    sw);
  output B_out;
  output G_out;
  output R_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN design_1_clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  input [1:0]sw;

  wire [7:0]PWM_Decoder_0_B_time_out;
  wire [7:0]PWM_Decoder_0_G_time_out;
  wire [7:0]PWM_Decoder_0_R_time_out;
  wire RGB_LED_0_B_out;
  wire RGB_LED_0_G_out;
  wire RGB_LED_0_R_out;
  wire clk_1;
  wire rst_1;
  wire [1:0]sw_1;

  assign B_out = RGB_LED_0_B_out;
  assign G_out = RGB_LED_0_G_out;
  assign R_out = RGB_LED_0_R_out;
  assign clk_1 = clk;
  assign rst_1 = rst;
  assign sw_1 = sw[1:0];
  design_1_PWM_Decoder_0_0 PWM_Decoder_0
       (.B_time_out(PWM_Decoder_0_B_time_out),
        .G_time_out(PWM_Decoder_0_G_time_out),
        .R_time_out(PWM_Decoder_0_R_time_out),
        .sw(sw_1));
  design_1_RGB_LED_0_0 RGB_LED_0
       (.B_out(RGB_LED_0_B_out),
        .B_time_in(PWM_Decoder_0_B_time_out),
        .G_out(RGB_LED_0_G_out),
        .G_time_in(PWM_Decoder_0_G_time_out),
        .R_out(RGB_LED_0_R_out),
        .R_time_in(PWM_Decoder_0_R_time_out),
        .clk(clk_1),
        .rst(rst_1));
endmodule
