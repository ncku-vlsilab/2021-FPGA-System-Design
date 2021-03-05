-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Mar  5 15:13:28 2021
-- Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_RGB_LED_0_0_sim_netlist.vhdl
-- Design      : design_1_RGB_LED_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_RGB_LED is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    R_time_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    G_time_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_time_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    R_out : out STD_LOGIC;
    G_out : out STD_LOGIC;
    B_out : out STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_RGB_LED;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_RGB_LED is
  signal B_out_INST_0_i_1_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_2_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_3_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_4_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_5_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_6_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_7_n_0 : STD_LOGIC;
  signal B_out_INST_0_i_8_n_0 : STD_LOGIC;
  signal B_out_INST_0_n_1 : STD_LOGIC;
  signal B_out_INST_0_n_2 : STD_LOGIC;
  signal B_out_INST_0_n_3 : STD_LOGIC;
  signal G_out_INST_0_i_1_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_2_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_3_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_4_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_5_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_6_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_7_n_0 : STD_LOGIC;
  signal G_out_INST_0_i_8_n_0 : STD_LOGIC;
  signal G_out_INST_0_n_1 : STD_LOGIC;
  signal G_out_INST_0_n_2 : STD_LOGIC;
  signal G_out_INST_0_n_3 : STD_LOGIC;
  signal R_out_INST_0_i_1_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_2_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_3_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_4_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_5_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_6_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_7_n_0 : STD_LOGIC;
  signal R_out_INST_0_i_8_n_0 : STD_LOGIC;
  signal R_out_INST_0_n_1 : STD_LOGIC;
  signal R_out_INST_0_n_2 : STD_LOGIC;
  signal R_out_INST_0_n_3 : STD_LOGIC;
  signal counter_256 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \counter_256[7]_i_2_n_0\ : STD_LOGIC;
  signal next_counter_256 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_B_out_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_G_out_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_R_out_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of B_out_INST_0 : label is 11;
  attribute COMPARATOR_THRESHOLD of G_out_INST_0 : label is 11;
  attribute COMPARATOR_THRESHOLD of R_out_INST_0 : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter_256[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter_256[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter_256[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter_256[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter_256[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter_256[7]_i_1\ : label is "soft_lutpair1";
begin
B_out_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => B_out,
      CO(2) => B_out_INST_0_n_1,
      CO(1) => B_out_INST_0_n_2,
      CO(0) => B_out_INST_0_n_3,
      CYINIT => '0',
      DI(3) => B_out_INST_0_i_1_n_0,
      DI(2) => B_out_INST_0_i_2_n_0,
      DI(1) => B_out_INST_0_i_3_n_0,
      DI(0) => B_out_INST_0_i_4_n_0,
      O(3 downto 0) => NLW_B_out_INST_0_O_UNCONNECTED(3 downto 0),
      S(3) => B_out_INST_0_i_5_n_0,
      S(2) => B_out_INST_0_i_6_n_0,
      S(1) => B_out_INST_0_i_7_n_0,
      S(0) => B_out_INST_0_i_8_n_0
    );
B_out_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(7),
      I1 => B_time_in(7),
      I2 => B_time_in(6),
      I3 => counter_256(6),
      O => B_out_INST_0_i_1_n_0
    );
B_out_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(5),
      I1 => B_time_in(5),
      I2 => B_time_in(4),
      I3 => counter_256(4),
      O => B_out_INST_0_i_2_n_0
    );
B_out_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(3),
      I1 => B_time_in(3),
      I2 => B_time_in(2),
      I3 => counter_256(2),
      O => B_out_INST_0_i_3_n_0
    );
B_out_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => B_time_in(0),
      I1 => counter_256(0),
      I2 => counter_256(1),
      I3 => B_time_in(1),
      O => B_out_INST_0_i_4_n_0
    );
B_out_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B_time_in(6),
      I1 => counter_256(6),
      I2 => B_time_in(7),
      I3 => counter_256(7),
      O => B_out_INST_0_i_5_n_0
    );
B_out_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B_time_in(4),
      I1 => counter_256(4),
      I2 => B_time_in(5),
      I3 => counter_256(5),
      O => B_out_INST_0_i_6_n_0
    );
B_out_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B_time_in(2),
      I1 => counter_256(2),
      I2 => B_time_in(3),
      I3 => counter_256(3),
      O => B_out_INST_0_i_7_n_0
    );
B_out_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_256(0),
      I1 => B_time_in(0),
      I2 => counter_256(1),
      I3 => B_time_in(1),
      O => B_out_INST_0_i_8_n_0
    );
G_out_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => G_out,
      CO(2) => G_out_INST_0_n_1,
      CO(1) => G_out_INST_0_n_2,
      CO(0) => G_out_INST_0_n_3,
      CYINIT => '0',
      DI(3) => G_out_INST_0_i_1_n_0,
      DI(2) => G_out_INST_0_i_2_n_0,
      DI(1) => G_out_INST_0_i_3_n_0,
      DI(0) => G_out_INST_0_i_4_n_0,
      O(3 downto 0) => NLW_G_out_INST_0_O_UNCONNECTED(3 downto 0),
      S(3) => G_out_INST_0_i_5_n_0,
      S(2) => G_out_INST_0_i_6_n_0,
      S(1) => G_out_INST_0_i_7_n_0,
      S(0) => G_out_INST_0_i_8_n_0
    );
G_out_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(7),
      I1 => G_time_in(7),
      I2 => G_time_in(6),
      I3 => counter_256(6),
      O => G_out_INST_0_i_1_n_0
    );
G_out_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(5),
      I1 => G_time_in(5),
      I2 => G_time_in(4),
      I3 => counter_256(4),
      O => G_out_INST_0_i_2_n_0
    );
G_out_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(3),
      I1 => G_time_in(3),
      I2 => G_time_in(2),
      I3 => counter_256(2),
      O => G_out_INST_0_i_3_n_0
    );
G_out_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => G_time_in(0),
      I1 => counter_256(0),
      I2 => counter_256(1),
      I3 => G_time_in(1),
      O => G_out_INST_0_i_4_n_0
    );
G_out_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => G_time_in(6),
      I1 => counter_256(6),
      I2 => G_time_in(7),
      I3 => counter_256(7),
      O => G_out_INST_0_i_5_n_0
    );
G_out_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => G_time_in(4),
      I1 => counter_256(4),
      I2 => G_time_in(5),
      I3 => counter_256(5),
      O => G_out_INST_0_i_6_n_0
    );
G_out_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => G_time_in(2),
      I1 => counter_256(2),
      I2 => G_time_in(3),
      I3 => counter_256(3),
      O => G_out_INST_0_i_7_n_0
    );
G_out_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_256(0),
      I1 => G_time_in(0),
      I2 => counter_256(1),
      I3 => G_time_in(1),
      O => G_out_INST_0_i_8_n_0
    );
R_out_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => R_out,
      CO(2) => R_out_INST_0_n_1,
      CO(1) => R_out_INST_0_n_2,
      CO(0) => R_out_INST_0_n_3,
      CYINIT => '0',
      DI(3) => R_out_INST_0_i_1_n_0,
      DI(2) => R_out_INST_0_i_2_n_0,
      DI(1) => R_out_INST_0_i_3_n_0,
      DI(0) => R_out_INST_0_i_4_n_0,
      O(3 downto 0) => NLW_R_out_INST_0_O_UNCONNECTED(3 downto 0),
      S(3) => R_out_INST_0_i_5_n_0,
      S(2) => R_out_INST_0_i_6_n_0,
      S(1) => R_out_INST_0_i_7_n_0,
      S(0) => R_out_INST_0_i_8_n_0
    );
R_out_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(7),
      I1 => R_time_in(7),
      I2 => R_time_in(6),
      I3 => counter_256(6),
      O => R_out_INST_0_i_1_n_0
    );
R_out_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(5),
      I1 => R_time_in(5),
      I2 => R_time_in(4),
      I3 => counter_256(4),
      O => R_out_INST_0_i_2_n_0
    );
R_out_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => counter_256(3),
      I1 => R_time_in(3),
      I2 => R_time_in(2),
      I3 => counter_256(2),
      O => R_out_INST_0_i_3_n_0
    );
R_out_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => R_time_in(0),
      I1 => counter_256(0),
      I2 => counter_256(1),
      I3 => R_time_in(1),
      O => R_out_INST_0_i_4_n_0
    );
R_out_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_256(6),
      I1 => R_time_in(6),
      I2 => counter_256(7),
      I3 => R_time_in(7),
      O => R_out_INST_0_i_5_n_0
    );
R_out_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_256(4),
      I1 => R_time_in(4),
      I2 => counter_256(5),
      I3 => R_time_in(5),
      O => R_out_INST_0_i_6_n_0
    );
R_out_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_256(2),
      I1 => R_time_in(2),
      I2 => counter_256(3),
      I3 => R_time_in(3),
      O => R_out_INST_0_i_7_n_0
    );
R_out_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_256(0),
      I1 => R_time_in(0),
      I2 => counter_256(1),
      I3 => R_time_in(1),
      O => R_out_INST_0_i_8_n_0
    );
\counter_256[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_256(0),
      O => next_counter_256(0)
    );
\counter_256[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter_256(0),
      I1 => counter_256(1),
      O => next_counter_256(1)
    );
\counter_256[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter_256(2),
      I1 => counter_256(1),
      I2 => counter_256(0),
      O => next_counter_256(2)
    );
\counter_256[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter_256(3),
      I1 => counter_256(0),
      I2 => counter_256(1),
      I3 => counter_256(2),
      O => next_counter_256(3)
    );
\counter_256[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => counter_256(4),
      I1 => counter_256(3),
      I2 => counter_256(0),
      I3 => counter_256(1),
      I4 => counter_256(2),
      O => next_counter_256(4)
    );
\counter_256[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => counter_256(5),
      I1 => counter_256(4),
      I2 => counter_256(3),
      I3 => counter_256(0),
      I4 => counter_256(1),
      I5 => counter_256(2),
      O => next_counter_256(5)
    );
\counter_256[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter_256(6),
      I1 => \counter_256[7]_i_2_n_0\,
      O => next_counter_256(6)
    );
\counter_256[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter_256(7),
      I1 => \counter_256[7]_i_2_n_0\,
      I2 => counter_256(6),
      O => next_counter_256(7)
    );
\counter_256[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => counter_256(5),
      I1 => counter_256(2),
      I2 => counter_256(1),
      I3 => counter_256(0),
      I4 => counter_256(3),
      I5 => counter_256(4),
      O => \counter_256[7]_i_2_n_0\
    );
\counter_256_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(0),
      Q => counter_256(0)
    );
\counter_256_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(1),
      Q => counter_256(1)
    );
\counter_256_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(2),
      Q => counter_256(2)
    );
\counter_256_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(3),
      Q => counter_256(3)
    );
\counter_256_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(4),
      Q => counter_256(4)
    );
\counter_256_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(5),
      Q => counter_256(5)
    );
\counter_256_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(6),
      Q => counter_256(6)
    );
\counter_256_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => next_counter_256(7),
      Q => counter_256(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    R_time_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    G_time_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_time_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    R_out : out STD_LOGIC;
    G_out : out STD_LOGIC;
    B_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_RGB_LED_0_0,RGB_LED,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "RGB_LED,Vivado 2020.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_RGB_LED
     port map (
      B_out => B_out,
      B_time_in(7 downto 0) => B_time_in(7 downto 0),
      G_out => G_out,
      G_time_in(7 downto 0) => G_time_in(7 downto 0),
      R_out => R_out,
      R_time_in(7 downto 0) => R_time_in(7 downto 0),
      clk => clk,
      rst => rst
    );
end STRUCTURE;
