-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon May 10 01:19:15 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/2021-FPGA-System-Design/Lab5-DSP_module/5-2 verilog
--               template/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_gpio_input_decoder_0_0/design_1_gpio_input_decoder_0_0_stub.vhdl}
-- Design      : design_1_gpio_input_decoder_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_gpio_input_decoder_0_0 is
  Port ( 
    inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_addr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    bram_en : out STD_LOGIC;
    dsp_inmode : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dsp_alumode : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dsp_opmode : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

end design_1_gpio_input_decoder_0_0;

architecture stub of design_1_gpio_input_decoder_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "inst[31:0],bram_addr[9:0],bram_en,dsp_inmode[4:0],dsp_alumode[3:0],dsp_opmode[6:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "gpio_input_decoder,Vivado 2020.2";
begin
end;
