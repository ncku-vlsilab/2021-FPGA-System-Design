-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon May 10 01:19:20 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_dsp_direct_0_0_sim_netlist.vhdl
-- Design      : design_1_dsp_direct_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dsp_direct is
  port (
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    clk : in STD_LOGIC;
    B : in STD_LOGIC_VECTOR ( 17 downto 0 );
    A : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ALUMODE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    INMODE : in STD_LOGIC_VECTOR ( 4 downto 0 );
    OPMODE : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dsp_direct;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dsp_direct is
  signal NLW_DSP48E1_inst_CARRYCASCIN_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E1_inst_ACIN_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_DSP48E1_inst_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_DSP48E1_inst_BCIN_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_DSP48E1_inst_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_DSP48E1_inst_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DSP48E1_inst_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of DSP48E1_inst : label is "PRIMITIVE";
begin
DSP48E1_inst: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 0,
      ALUMODEREG => 1,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 0,
      INMODEREG => 1,
      IS_ALUMODE_INVERTED => B"0000",
      IS_CARRYIN_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_INMODE_INVERTED => B"00000",
      IS_OPMODE_INVERTED => B"0000000",
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 0) => A(29 downto 0),
      ACIN(29 downto 0) => NLW_DSP48E1_inst_ACIN_UNCONNECTED(29 downto 0),
      ACOUT(29 downto 0) => NLW_DSP48E1_inst_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => ALUMODE(3 downto 0),
      B(17 downto 0) => B(17 downto 0),
      BCIN(17 downto 0) => NLW_DSP48E1_inst_BCIN_UNCONNECTED(17 downto 0),
      BCOUT(17 downto 0) => NLW_DSP48E1_inst_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => NLW_DSP48E1_inst_CARRYCASCIN_UNCONNECTED,
      CARRYCASCOUT => NLW_DSP48E1_inst_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_DSP48E1_inst_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '1',
      CEB1 => '1',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '1',
      CED => '0',
      CEINMODE => '1',
      CEM => '1',
      CEP => '0',
      CLK => clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => INMODE(4 downto 0),
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_DSP48E1_inst_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => OPMODE(6 downto 0),
      OVERFLOW => NLW_DSP48E1_inst_OVERFLOW_UNCONNECTED,
      P(47 downto 0) => P(47 downto 0),
      PATTERNBDETECT => NLW_DSP48E1_inst_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_DSP48E1_inst_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_DSP48E1_inst_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_DSP48E1_inst_UNDERFLOW_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 29 downto 0 );
    B : in STD_LOGIC_VECTOR ( 17 downto 0 );
    INMODE : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ALUMODE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    OPMODE : in STD_LOGIC_VECTOR ( 6 downto 0 );
    P : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_dsp_direct_0_0,dsp_direct,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "dsp_direct,Vivado 2020.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dsp_direct
     port map (
      A(29 downto 0) => A(29 downto 0),
      ALUMODE(3 downto 0) => ALUMODE(3 downto 0),
      B(17 downto 0) => B(17 downto 0),
      INMODE(4 downto 0) => INMODE(4 downto 0),
      OPMODE(6 downto 0) => OPMODE(6 downto 0),
      P(47 downto 0) => P(47 downto 0),
      clk => clk
    );
end STRUCTURE;
