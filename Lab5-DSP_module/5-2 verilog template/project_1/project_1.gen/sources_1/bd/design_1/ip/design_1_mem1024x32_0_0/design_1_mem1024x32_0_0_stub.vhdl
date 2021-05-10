-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon May 10 01:20:32 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/2021-FPGA-System-Design/Lab5-DSP_module/5-2 verilog
--               template/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_mem1024x32_0_0/design_1_mem1024x32_0_0_stub.vhdl}
-- Design      : design_1_mem1024x32_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_mem1024x32_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_a : in STD_LOGIC;
    ADDRARDADDR : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ENARDEN : in STD_LOGIC;
    WEA : in STD_LOGIC_VECTOR ( 3 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ADDRBWRADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    ENBWREN : in STD_LOGIC;
    DOADO : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DOBDO : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_mem1024x32_0_0;

architecture stub of design_1_mem1024x32_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_a,ADDRARDADDR[11:0],ENARDEN,WEA[3:0],DIADI[31:0],ADDRBWRADDR[9:0],ENBWREN,DOADO[31:0],DOBDO[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mem1024x32,Vivado 2020.2";
begin
end;
