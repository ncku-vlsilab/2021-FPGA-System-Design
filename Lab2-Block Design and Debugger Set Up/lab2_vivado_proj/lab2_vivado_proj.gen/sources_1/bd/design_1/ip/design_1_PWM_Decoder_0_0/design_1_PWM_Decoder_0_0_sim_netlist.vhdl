-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Mar  5 15:13:19 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {d:/2021-FPGA-System-Design/Lab2-Block Design and Debugger Set
--               Up/lab2_vivado_proj/lab2_vivado_proj.gen/sources_1/bd/design_1/ip/design_1_PWM_Decoder_0_0/design_1_PWM_Decoder_0_0_sim_netlist.vhdl}
-- Design      : design_1_PWM_Decoder_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_PWM_Decoder_0_0 is
  port (
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 );
    R_time_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    G_time_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    B_time_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_PWM_Decoder_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_PWM_Decoder_0_0 : entity is "design_1_PWM_Decoder_0_0,PWM_Decoder,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_PWM_Decoder_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_PWM_Decoder_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_PWM_Decoder_0_0 : entity is "PWM_Decoder,Vivado 2020.2";
end design_1_PWM_Decoder_0_0;

architecture STRUCTURE of design_1_PWM_Decoder_0_0 is
  signal \<const1>\ : STD_LOGIC;
  signal \^g_time_out\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \^sw\ : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  B_time_out(7) <= \^sw\(1);
  B_time_out(6) <= \^sw\(1);
  B_time_out(5) <= \^sw\(1);
  B_time_out(4) <= \^sw\(1);
  B_time_out(3) <= \^sw\(1);
  B_time_out(2) <= \^sw\(1);
  B_time_out(1) <= \^sw\(1);
  B_time_out(0) <= \^sw\(1);
  G_time_out(7) <= \^g_time_out\(7);
  G_time_out(6) <= \^sw\(0);
  G_time_out(5) <= \^sw\(0);
  G_time_out(4) <= \^g_time_out\(7);
  G_time_out(3 downto 2) <= \^sw\(1 downto 0);
  G_time_out(1) <= \^sw\(1);
  G_time_out(0) <= \^g_time_out\(7);
  R_time_out(7) <= \^g_time_out\(7);
  R_time_out(6) <= \<const1>\;
  R_time_out(5) <= \<const1>\;
  R_time_out(4) <= \^g_time_out\(7);
  R_time_out(3) <= \^g_time_out\(7);
  R_time_out(2) <= \<const1>\;
  R_time_out(1) <= \^g_time_out\(7);
  R_time_out(0) <= \^g_time_out\(7);
  \^sw\(1 downto 0) <= sw(1 downto 0);
\G_time_out[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^sw\(0),
      I1 => \^sw\(1),
      O => \^g_time_out\(7)
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
