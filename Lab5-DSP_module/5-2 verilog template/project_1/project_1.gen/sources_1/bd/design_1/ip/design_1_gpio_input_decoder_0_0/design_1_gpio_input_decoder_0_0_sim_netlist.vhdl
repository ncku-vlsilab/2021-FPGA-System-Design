-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon May 10 01:19:15 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {d:/2021-FPGA-System-Design/Lab5-DSP_module/5-2 verilog
--               template/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_gpio_input_decoder_0_0/design_1_gpio_input_decoder_0_0_sim_netlist.vhdl}
-- Design      : design_1_gpio_input_decoder_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpio_input_decoder_0_0 is
  port (
    inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_addr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    bram_en : out STD_LOGIC;
    dsp_inmode : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dsp_alumode : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dsp_opmode : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_gpio_input_decoder_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_gpio_input_decoder_0_0 : entity is "design_1_gpio_input_decoder_0_0,gpio_input_decoder,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_gpio_input_decoder_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_gpio_input_decoder_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_gpio_input_decoder_0_0 : entity is "gpio_input_decoder,Vivado 2020.2";
end design_1_gpio_input_decoder_0_0;

architecture STRUCTURE of design_1_gpio_input_decoder_0_0 is
  signal \^inst\ : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  \^inst\(26 downto 0) <= inst(26 downto 0);
  bram_addr(9 downto 0) <= \^inst\(9 downto 0);
  bram_en <= \^inst\(10);
  dsp_alumode(3 downto 0) <= \^inst\(19 downto 16);
  dsp_inmode(4 downto 0) <= \^inst\(15 downto 11);
  dsp_opmode(6 downto 0) <= \^inst\(26 downto 20);
end STRUCTURE;
