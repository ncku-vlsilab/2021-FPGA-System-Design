//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri Mar  5 15:12:38 2021
//Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (B_out,
    G_out,
    R_out,
    clk,
    rst,
    sw);
  output B_out;
  output G_out;
  output R_out;
  input clk;
  input rst;
  input [1:0]sw;

  wire B_out;
  wire G_out;
  wire R_out;
  wire clk;
  wire rst;
  wire [1:0]sw;

  design_1 design_1_i
       (.B_out(B_out),
        .G_out(G_out),
        .R_out(R_out),
        .clk(clk),
        .rst(rst),
        .sw(sw));
endmodule
