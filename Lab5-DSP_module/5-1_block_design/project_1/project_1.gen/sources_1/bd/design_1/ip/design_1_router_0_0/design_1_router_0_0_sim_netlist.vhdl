-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Mar 15 14:51:32 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {d:/2021-FPGA-offline/Lab5-DSP module/5-1 block
--               design/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_router_0_0/design_1_router_0_0_sim_netlist.vhdl}
-- Design      : design_1_router_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_router_0_0 is
  port (
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A : out STD_LOGIC_VECTOR ( 15 downto 0 );
    B : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_router_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_router_0_0 : entity is "design_1_router_0_0,router,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_router_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_router_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_router_0_0 : entity is "router,Vivado 2020.2";
end design_1_router_0_0;

architecture STRUCTURE of design_1_router_0_0 is
  signal \^din\ : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  A(15 downto 0) <= \^din\(15 downto 0);
  B(15 downto 0) <= \^din\(31 downto 16);
  \^din\(31 downto 0) <= din(31 downto 0);
end STRUCTURE;
