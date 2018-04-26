library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity code_400 is
  port(
    c1      : in std_logic;
    a_din_l : in std_logic_vector(31 downto 0);
    b_din_l : in std_logic_vector(31 downto 0);
    d_din_l : in std_logic_vector(31 downto 0);
    e_din_l : in std_logic_vector(31 downto 0);
    f_dout_l : out std_logic_vector(31 downto 0);
    c_dout_l : out std_logic_vector(31 downto 0)
  );
end code_400;

architecture rtl of code_400 is

  -- input signals, regrouped and on clock
  signal Y1 : std_logic_vector(79 downto 0);
  signal Y2 : std_logic_vector(49 downto 0);
  signal Y4 : std_logic_vector(7  downto 0);

  -- grouping of the outputs lv-01
  signal zgrp_lv01_bin00 : std_logic_vector(712 downto 0);

  -- grouping of the outputs lv-02
  signal zgrp_lv02_bin00 : std_logic_vector(178 downto 0);

  -- grouping of the outputs lv-03
  signal zgrp_lv03_bin00 : std_logic_vector(44 downto 0);

  -- grouping of the outputs lv-04
  signal zgrp_lv04_bin00 : std_logic_vector(11 downto 0);

  -- grouping of the outputs lv-05
  signal zgrp_lv05_bin00 : std_logic_vector(3 downto 0);

  -- grouping of the outputs lv-06
  signal zgrp_lv06_bin00 : std_logic_vector(1 downto 0);

  -- grouping of the outputs lv-07
  signal zgrp_lv07_bin00 : std_logic_vector(0 downto 0);

  -- final grouping
  signal zgrp_lv08 : std_logic_vector(0 downto 0);

begin
  -- send the signal out, C is 32-bit LVDS, F is 8-bit NIM, mapping is very tricky
  c_dout_l(0 downto 0) <= zgrp_lv08;
  c_dout_l(31 downto 1) <= (others => '0');
  f_dout_l(0) <= zgrp_lv08(0);
  f_dout_l(1) <= zgrp_lv08(0);
  f_dout_l(2) <= '0';
  f_dout_l(3) <= '0';
  f_dout_l(4) <= '0';
  f_dout_l(5) <= '0';
  f_dout_l(6) <= '0';
  f_dout_l(7) <= '0';
  f_dout_l(8) <= '0';
  f_dout_l(9) <= '0';
  f_dout_l(10) <= '0';
  f_dout_l(11) <= '0';
  f_dout_l(12) <= zgrp_lv08(0);
  f_dout_l(13) <= zgrp_lv08(0);
  f_dout_l(14) <= '0';
  f_dout_l(15) <= '0';
  f_dout_l(16) <= zgrp_lv08(0);
  f_dout_l(17) <= zgrp_lv08(0);
  f_dout_l(18) <= '0';
  f_dout_l(19) <= '0';
  f_dout_l(20) <= '0';
  f_dout_l(21) <= '0';
  f_dout_l(22) <= '0';
  f_dout_l(23) <= '0';
  f_dout_l(24) <= '0';
  f_dout_l(25) <= '0';
  f_dout_l(26) <= '0';
  f_dout_l(27) <= '0';
  f_dout_l(28) <= zgrp_lv08(0);
  f_dout_l(29) <= zgrp_lv08(0);
  f_dout_l(30) <= '0';
  f_dout_l(31) <= '0';

  -- put DP1 signal on clock
  sigAssignmentY1 : process(c1)
  begin
    if rising_edge(c1) then
      if d_din_l(18) = '1' then
        Y1(0) <= '1';
      else
        Y1(0) <= '0';
      end if;
      if d_din_l(19) = '1' then
        Y1(1) <= '1';
      else
        Y1(1) <= '0';
      end if;
      if d_din_l(20) = '1' then
        Y1(2) <= '1';
      else
        Y1(2) <= '0';
      end if;
      if d_din_l(21) = '1' then
        Y1(3) <= '1';
      else
        Y1(3) <= '0';
      end if;
      if d_din_l(22) = '1' then
        Y1(4) <= '1';
      else
        Y1(4) <= '0';
      end if;
      if d_din_l(23) = '1' then
        Y1(5) <= '1';
      else
        Y1(5) <= '0';
      end if;
      if d_din_l(24) = '1' then
        Y1(6) <= '1';
      else
        Y1(6) <= '0';
      end if;
      if d_din_l(25) = '1' then
        Y1(7) <= '1';
      else
        Y1(7) <= '0';
      end if;
      if d_din_l(26) = '1' then
        Y1(8) <= '1';
      else
        Y1(8) <= '0';
      end if;
      if d_din_l(27) = '1' then
        Y1(9) <= '1';
      else
        Y1(9) <= '0';
      end if;
      if d_din_l(28) = '1' then
        Y1(10) <= '1';
      else
        Y1(10) <= '0';
      end if;
      if d_din_l(29) = '1' then
        Y1(11) <= '1';
      else
        Y1(11) <= '0';
      end if;
      if d_din_l(30) = '1' then
        Y1(12) <= '1';
      else
        Y1(12) <= '0';
      end if;
      if d_din_l(31) = '1' then
        Y1(13) <= '1';
      else
        Y1(13) <= '0';
      end if;
      if d_din_l(0) = '1' then
        Y1(14) <= '1';
      else
        Y1(14) <= '0';
      end if;
      if d_din_l(1) = '1' then
        Y1(15) <= '1';
      else
        Y1(15) <= '0';
      end if;
      if d_din_l(2) = '1' then
        Y1(16) <= '1';
      else
        Y1(16) <= '0';
      end if;
      if d_din_l(3) = '1' then
        Y1(17) <= '1';
      else
        Y1(17) <= '0';
      end if;
      if d_din_l(4) = '1' then
        Y1(18) <= '1';
      else
        Y1(18) <= '0';
      end if;
      if d_din_l(5) = '1' then
        Y1(19) <= '1';
      else
        Y1(19) <= '0';
      end if;
      if d_din_l(6) = '1' then
        Y1(20) <= '1';
      else
        Y1(20) <= '0';
      end if;
      if d_din_l(7) = '1' then
        Y1(21) <= '1';
      else
        Y1(21) <= '0';
      end if;
      if d_din_l(8) = '1' then
        Y1(22) <= '1';
      else
        Y1(22) <= '0';
      end if;
      if d_din_l(9) = '1' then
        Y1(23) <= '1';
      else
        Y1(23) <= '0';
      end if;
      if d_din_l(10) = '1' then
        Y1(24) <= '1';
      else
        Y1(24) <= '0';
      end if;
      if d_din_l(11) = '1' then
        Y1(25) <= '1';
      else
        Y1(25) <= '0';
      end if;
      if d_din_l(12) = '1' then
        Y1(26) <= '1';
      else
        Y1(26) <= '0';
      end if;
      if d_din_l(13) = '1' then
        Y1(27) <= '1';
      else
        Y1(27) <= '0';
      end if;
      if d_din_l(14) = '1' then
        Y1(28) <= '1';
      else
        Y1(28) <= '0';
      end if;
      if d_din_l(15) = '1' then
        Y1(29) <= '1';
      else
        Y1(29) <= '0';
      end if;
      Y1(30) <= '0';
      Y1(31) <= '0';
      Y1(32) <= '0';
      Y1(33) <= '0';
      Y1(34) <= '0';
      Y1(35) <= '0';
      Y1(36) <= '0';
      Y1(37) <= '0';
      Y1(38) <= '0';
      Y1(39) <= '0';
      Y1(40) <= '0';
      Y1(41) <= '0';
      Y1(42) <= '0';
      Y1(43) <= '0';
      Y1(44) <= '0';
      Y1(45) <= '0';
      Y1(46) <= '0';
      Y1(47) <= '0';
      Y1(48) <= '0';
      Y1(49) <= '0';
      Y1(50) <= '0';
      Y1(51) <= '0';
      Y1(52) <= '0';
      Y1(53) <= '0';
      Y1(54) <= '0';
      Y1(55) <= '0';
      Y1(56) <= '0';
      Y1(57) <= '0';
      Y1(58) <= '0';
      Y1(59) <= '0';
      Y1(60) <= '0';
      Y1(61) <= '0';
      Y1(62) <= '0';
      Y1(63) <= '0';
      Y1(64) <= '0';
      Y1(65) <= '0';
      Y1(66) <= '0';
      Y1(67) <= '0';
      Y1(68) <= '0';
      Y1(69) <= '0';
      Y1(70) <= '0';
      Y1(71) <= '0';
      Y1(72) <= '0';
      Y1(73) <= '0';
      Y1(74) <= '0';
      Y1(75) <= '0';
      Y1(76) <= '0';
      Y1(77) <= '0';
      Y1(78) <= '0';
      Y1(79) <= '0';
    end if;
  end process;

  -- put DP2 signal on clock
  sigAssignmentY2 : process(c1)
  begin
    if rising_edge(c1) then
      if a_din_l(16) = '1' then
        Y2(0) <= '1';
      else
        Y2(0) <= '0';
      end if;
      if a_din_l(17) = '1' then
        Y2(1) <= '1';
      else
        Y2(1) <= '0';
      end if;
      if a_din_l(18) = '1' then
        Y2(2) <= '1';
      else
        Y2(2) <= '0';
      end if;
      if a_din_l(19) = '1' then
        Y2(3) <= '1';
      else
        Y2(3) <= '0';
      end if;
      if a_din_l(20) = '1' then
        Y2(4) <= '1';
      else
        Y2(4) <= '0';
      end if;
      if a_din_l(21) = '1' then
        Y2(5) <= '1';
      else
        Y2(5) <= '0';
      end if;
      if a_din_l(22) = '1' then
        Y2(6) <= '1';
      else
        Y2(6) <= '0';
      end if;
      if a_din_l(23) = '1' then
        Y2(7) <= '1';
      else
        Y2(7) <= '0';
      end if;
      if a_din_l(24) = '1' then
        Y2(8) <= '1';
      else
        Y2(8) <= '0';
      end if;
      if a_din_l(25) = '1' then
        Y2(9) <= '1';
      else
        Y2(9) <= '0';
      end if;
      if a_din_l(26) = '1' then
        Y2(10) <= '1';
      else
        Y2(10) <= '0';
      end if;
      if a_din_l(27) = '1' then
        Y2(11) <= '1';
      else
        Y2(11) <= '0';
      end if;
      if a_din_l(28) = '1' then
        Y2(12) <= '1';
      else
        Y2(12) <= '0';
      end if;
      if a_din_l(29) = '1' then
        Y2(13) <= '1';
      else
        Y2(13) <= '0';
      end if;
      if a_din_l(30) = '1' then
        Y2(14) <= '1';
      else
        Y2(14) <= '0';
      end if;
      if a_din_l(31) = '1' then
        Y2(15) <= '1';
      else
        Y2(15) <= '0';
      end if;
      if b_din_l(16) = '1' then
        Y2(16) <= '1';
      else
        Y2(16) <= '0';
      end if;
      if b_din_l(17) = '1' then
        Y2(17) <= '1';
      else
        Y2(17) <= '0';
      end if;
      if b_din_l(18) = '1' then
        Y2(18) <= '1';
      else
        Y2(18) <= '0';
      end if;
      if b_din_l(19) = '1' then
        Y2(19) <= '1';
      else
        Y2(19) <= '0';
      end if;
      if b_din_l(20) = '1' then
        Y2(20) <= '1';
      else
        Y2(20) <= '0';
      end if;
      if b_din_l(21) = '1' then
        Y2(21) <= '1';
      else
        Y2(21) <= '0';
      end if;
      if b_din_l(22) = '1' then
        Y2(22) <= '1';
      else
        Y2(22) <= '0';
      end if;
      if b_din_l(23) = '1' then
        Y2(23) <= '1';
      else
        Y2(23) <= '0';
      end if;
      if b_din_l(24) = '1' then
        Y2(24) <= '1';
      else
        Y2(24) <= '0';
      end if;
      if b_din_l(25) = '1' then
        Y2(25) <= '1';
      else
        Y2(25) <= '0';
      end if;
      if b_din_l(26) = '1' then
        Y2(26) <= '1';
      else
        Y2(26) <= '0';
      end if;
      if b_din_l(27) = '1' then
        Y2(27) <= '1';
      else
        Y2(27) <= '0';
      end if;
      if b_din_l(28) = '1' then
        Y2(28) <= '1';
      else
        Y2(28) <= '0';
      end if;
      if b_din_l(29) = '1' then
        Y2(29) <= '1';
      else
        Y2(29) <= '0';
      end if;
      if b_din_l(30) = '1' then
        Y2(30) <= '1';
      else
        Y2(30) <= '0';
      end if;
      if b_din_l(31) = '1' then
        Y2(31) <= '1';
      else
        Y2(31) <= '0';
      end if;
      if b_din_l(0) = '1' then
        Y2(32) <= '1';
      else
        Y2(32) <= '0';
      end if;
      if b_din_l(1) = '1' then
        Y2(33) <= '1';
      else
        Y2(33) <= '0';
      end if;
      if b_din_l(2) = '1' then
        Y2(34) <= '1';
      else
        Y2(34) <= '0';
      end if;
      if b_din_l(3) = '1' then
        Y2(35) <= '1';
      else
        Y2(35) <= '0';
      end if;
      if b_din_l(4) = '1' then
        Y2(36) <= '1';
      else
        Y2(36) <= '0';
      end if;
      if b_din_l(5) = '1' then
        Y2(37) <= '1';
      else
        Y2(37) <= '0';
      end if;
      if b_din_l(6) = '1' then
        Y2(38) <= '1';
      else
        Y2(38) <= '0';
      end if;
      if b_din_l(7) = '1' then
        Y2(39) <= '1';
      else
        Y2(39) <= '0';
      end if;
      if b_din_l(8) = '1' then
        Y2(40) <= '1';
      else
        Y2(40) <= '0';
      end if;
      if b_din_l(9) = '1' then
        Y2(41) <= '1';
      else
        Y2(41) <= '0';
      end if;
      if b_din_l(10) = '1' then
        Y2(42) <= '1';
      else
        Y2(42) <= '0';
      end if;
      if b_din_l(11) = '1' then
        Y2(43) <= '1';
      else
        Y2(43) <= '0';
      end if;
      if b_din_l(12) = '1' then
        Y2(44) <= '1';
      else
        Y2(44) <= '0';
      end if;
      if b_din_l(13) = '1' then
        Y2(45) <= '1';
      else
        Y2(45) <= '0';
      end if;
      if b_din_l(14) = '1' then
        Y2(46) <= '1';
      else
        Y2(46) <= '0';
      end if;
      if b_din_l(15) = '1' then
        Y2(47) <= '1';
      else
        Y2(47) <= '0';
      end if;
      if d_din_l(16) = '1' then
        Y2(48) <= '1';
      else
        Y2(48) <= '0';
      end if;
      if d_din_l(17) = '1' then
        Y2(49) <= '1';
      else
        Y2(49) <= '0';
      end if;
    end if;
  end process;

-- OR the 2 ends of H4Y and put it on clock
  sigAssignmentY4 : process(c1)
  begin
    if rising_edge(c1) then
      if a_din_l(2) = '1' then
        Y4(0) <= '1';
      else
        Y4(0) <= '0';
      end if;
      if a_din_l(3) = '1' then
        Y4(1) <= '1';
      else
        Y4(1) <= '0';
      end if;
      if a_din_l(4) = '1' then
        Y4(2) <= '1';
      else
        Y4(2) <= '0';
      end if;
      if a_din_l(5) = '1' then
        Y4(3) <= '1';
      else
        Y4(3) <= '0';
      end if;
      if a_din_l(6) = '1' then
        Y4(4) <= '1';
      else
        Y4(4) <= '0';
      end if;
      if a_din_l(7) = '1' then
        Y4(5) <= '1';
      else
        Y4(5) <= '0';
      end if;
      if a_din_l(8) = '1' then
        Y4(6) <= '1';
      else
        Y4(6) <= '0';
      end if;
      if a_din_l(9) = '1' then
        Y4(7) <= '1';
      else
        Y4(7) <= '0';
      end if;
    end if;
  end process;

  lut_lv01 : process(c1)
  begin
    if rising_edge(c1) then
      if (Y1(0) = '1') and (Y2(6) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(0) <= '1';
      else
        zgrp_lv01_bin00(0) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(7) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(1) <= '1';
      else
        zgrp_lv01_bin00(1) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(8) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(2) <= '1';
      else
        zgrp_lv01_bin00(2) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(8) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(3) <= '1';
      else
        zgrp_lv01_bin00(3) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(9) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(4) <= '1';
      else
        zgrp_lv01_bin00(4) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(9) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(5) <= '1';
      else
        zgrp_lv01_bin00(5) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(9) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(6) <= '1';
      else
        zgrp_lv01_bin00(6) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(10) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(7) <= '1';
      else
        zgrp_lv01_bin00(7) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(10) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(8) <= '1';
      else
        zgrp_lv01_bin00(8) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(10) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(9) <= '1';
      else
        zgrp_lv01_bin00(9) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(10) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(10) <= '1';
      else
        zgrp_lv01_bin00(10) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(11) = '1') and (Y4(1) = '1') then
        zgrp_lv01_bin00(11) <= '1';
      else
        zgrp_lv01_bin00(11) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(9) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(12) <= '1';
      else
        zgrp_lv01_bin00(12) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(9) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(13) <= '1';
      else
        zgrp_lv01_bin00(13) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(10) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(14) <= '1';
      else
        zgrp_lv01_bin00(14) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(10) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(15) <= '1';
      else
        zgrp_lv01_bin00(15) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(10) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(16) <= '1';
      else
        zgrp_lv01_bin00(16) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(10) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(17) <= '1';
      else
        zgrp_lv01_bin00(17) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(11) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(18) <= '1';
      else
        zgrp_lv01_bin00(18) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(11) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(19) <= '1';
      else
        zgrp_lv01_bin00(19) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(11) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(20) <= '1';
      else
        zgrp_lv01_bin00(20) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(11) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(21) <= '1';
      else
        zgrp_lv01_bin00(21) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(11) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(22) <= '1';
      else
        zgrp_lv01_bin00(22) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(12) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(23) <= '1';
      else
        zgrp_lv01_bin00(23) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(12) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(24) <= '1';
      else
        zgrp_lv01_bin00(24) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(12) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(25) <= '1';
      else
        zgrp_lv01_bin00(25) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(12) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(26) <= '1';
      else
        zgrp_lv01_bin00(26) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(12) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(27) <= '1';
      else
        zgrp_lv01_bin00(27) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(13) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(28) <= '1';
      else
        zgrp_lv01_bin00(28) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(13) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(29) <= '1';
      else
        zgrp_lv01_bin00(29) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(13) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(30) <= '1';
      else
        zgrp_lv01_bin00(30) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(13) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(31) <= '1';
      else
        zgrp_lv01_bin00(31) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(13) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(32) <= '1';
      else
        zgrp_lv01_bin00(32) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(13) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(33) <= '1';
      else
        zgrp_lv01_bin00(33) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(34) <= '1';
      else
        zgrp_lv01_bin00(34) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(35) <= '1';
      else
        zgrp_lv01_bin00(35) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(36) <= '1';
      else
        zgrp_lv01_bin00(36) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(37) <= '1';
      else
        zgrp_lv01_bin00(37) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(38) <= '1';
      else
        zgrp_lv01_bin00(38) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(39) <= '1';
      else
        zgrp_lv01_bin00(39) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(14) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(40) <= '1';
      else
        zgrp_lv01_bin00(40) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(41) <= '1';
      else
        zgrp_lv01_bin00(41) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(42) <= '1';
      else
        zgrp_lv01_bin00(42) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(43) <= '1';
      else
        zgrp_lv01_bin00(43) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(44) <= '1';
      else
        zgrp_lv01_bin00(44) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(45) <= '1';
      else
        zgrp_lv01_bin00(45) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(46) <= '1';
      else
        zgrp_lv01_bin00(46) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(15) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(47) <= '1';
      else
        zgrp_lv01_bin00(47) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(48) <= '1';
      else
        zgrp_lv01_bin00(48) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(49) <= '1';
      else
        zgrp_lv01_bin00(49) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(50) <= '1';
      else
        zgrp_lv01_bin00(50) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(51) <= '1';
      else
        zgrp_lv01_bin00(51) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(52) <= '1';
      else
        zgrp_lv01_bin00(52) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(53) <= '1';
      else
        zgrp_lv01_bin00(53) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(16) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(54) <= '1';
      else
        zgrp_lv01_bin00(54) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(17) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(55) <= '1';
      else
        zgrp_lv01_bin00(55) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(17) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(56) <= '1';
      else
        zgrp_lv01_bin00(56) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(17) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(57) <= '1';
      else
        zgrp_lv01_bin00(57) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(17) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(58) <= '1';
      else
        zgrp_lv01_bin00(58) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(17) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(59) <= '1';
      else
        zgrp_lv01_bin00(59) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(18) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(60) <= '1';
      else
        zgrp_lv01_bin00(60) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(18) = '1') and (Y4(2) = '1') then
        zgrp_lv01_bin00(61) <= '1';
      else
        zgrp_lv01_bin00(61) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(15) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(62) <= '1';
      else
        zgrp_lv01_bin00(62) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(15) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(63) <= '1';
      else
        zgrp_lv01_bin00(63) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(16) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(64) <= '1';
      else
        zgrp_lv01_bin00(64) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(16) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(65) <= '1';
      else
        zgrp_lv01_bin00(65) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(16) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(66) <= '1';
      else
        zgrp_lv01_bin00(66) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(16) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(67) <= '1';
      else
        zgrp_lv01_bin00(67) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(16) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(68) <= '1';
      else
        zgrp_lv01_bin00(68) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(16) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(69) <= '1';
      else
        zgrp_lv01_bin00(69) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(70) <= '1';
      else
        zgrp_lv01_bin00(70) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(71) <= '1';
      else
        zgrp_lv01_bin00(71) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(72) <= '1';
      else
        zgrp_lv01_bin00(72) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(73) <= '1';
      else
        zgrp_lv01_bin00(73) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(74) <= '1';
      else
        zgrp_lv01_bin00(74) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(75) <= '1';
      else
        zgrp_lv01_bin00(75) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(76) <= '1';
      else
        zgrp_lv01_bin00(76) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(77) <= '1';
      else
        zgrp_lv01_bin00(77) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(17) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(78) <= '1';
      else
        zgrp_lv01_bin00(78) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(79) <= '1';
      else
        zgrp_lv01_bin00(79) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(80) <= '1';
      else
        zgrp_lv01_bin00(80) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(81) <= '1';
      else
        zgrp_lv01_bin00(81) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(82) <= '1';
      else
        zgrp_lv01_bin00(82) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(83) <= '1';
      else
        zgrp_lv01_bin00(83) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(84) <= '1';
      else
        zgrp_lv01_bin00(84) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(85) <= '1';
      else
        zgrp_lv01_bin00(85) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(86) <= '1';
      else
        zgrp_lv01_bin00(86) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(87) <= '1';
      else
        zgrp_lv01_bin00(87) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(18) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(88) <= '1';
      else
        zgrp_lv01_bin00(88) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(89) <= '1';
      else
        zgrp_lv01_bin00(89) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(90) <= '1';
      else
        zgrp_lv01_bin00(90) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(91) <= '1';
      else
        zgrp_lv01_bin00(91) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(92) <= '1';
      else
        zgrp_lv01_bin00(92) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(93) <= '1';
      else
        zgrp_lv01_bin00(93) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(94) <= '1';
      else
        zgrp_lv01_bin00(94) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(95) <= '1';
      else
        zgrp_lv01_bin00(95) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(96) <= '1';
      else
        zgrp_lv01_bin00(96) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(97) <= '1';
      else
        zgrp_lv01_bin00(97) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(19) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(98) <= '1';
      else
        zgrp_lv01_bin00(98) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(99) <= '1';
      else
        zgrp_lv01_bin00(99) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(100) <= '1';
      else
        zgrp_lv01_bin00(100) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(101) <= '1';
      else
        zgrp_lv01_bin00(101) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(102) <= '1';
      else
        zgrp_lv01_bin00(102) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(103) <= '1';
      else
        zgrp_lv01_bin00(103) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(104) <= '1';
      else
        zgrp_lv01_bin00(104) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(105) <= '1';
      else
        zgrp_lv01_bin00(105) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(106) <= '1';
      else
        zgrp_lv01_bin00(106) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(107) <= '1';
      else
        zgrp_lv01_bin00(107) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(108) <= '1';
      else
        zgrp_lv01_bin00(108) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(20) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(109) <= '1';
      else
        zgrp_lv01_bin00(109) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(110) <= '1';
      else
        zgrp_lv01_bin00(110) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(111) <= '1';
      else
        zgrp_lv01_bin00(111) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(112) <= '1';
      else
        zgrp_lv01_bin00(112) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(113) <= '1';
      else
        zgrp_lv01_bin00(113) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(114) <= '1';
      else
        zgrp_lv01_bin00(114) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(115) <= '1';
      else
        zgrp_lv01_bin00(115) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(116) <= '1';
      else
        zgrp_lv01_bin00(116) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(117) <= '1';
      else
        zgrp_lv01_bin00(117) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(118) <= '1';
      else
        zgrp_lv01_bin00(118) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(119) <= '1';
      else
        zgrp_lv01_bin00(119) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(120) <= '1';
      else
        zgrp_lv01_bin00(120) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(21) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(121) <= '1';
      else
        zgrp_lv01_bin00(121) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(122) <= '1';
      else
        zgrp_lv01_bin00(122) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(123) <= '1';
      else
        zgrp_lv01_bin00(123) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(124) <= '1';
      else
        zgrp_lv01_bin00(124) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(125) <= '1';
      else
        zgrp_lv01_bin00(125) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(126) <= '1';
      else
        zgrp_lv01_bin00(126) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(127) <= '1';
      else
        zgrp_lv01_bin00(127) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(128) <= '1';
      else
        zgrp_lv01_bin00(128) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(129) <= '1';
      else
        zgrp_lv01_bin00(129) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(130) <= '1';
      else
        zgrp_lv01_bin00(130) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(131) <= '1';
      else
        zgrp_lv01_bin00(131) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(22) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(132) <= '1';
      else
        zgrp_lv01_bin00(132) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(133) <= '1';
      else
        zgrp_lv01_bin00(133) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(134) <= '1';
      else
        zgrp_lv01_bin00(134) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(135) <= '1';
      else
        zgrp_lv01_bin00(135) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(136) <= '1';
      else
        zgrp_lv01_bin00(136) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(137) <= '1';
      else
        zgrp_lv01_bin00(137) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(138) <= '1';
      else
        zgrp_lv01_bin00(138) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(139) <= '1';
      else
        zgrp_lv01_bin00(139) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(23) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(140) <= '1';
      else
        zgrp_lv01_bin00(140) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(24) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(141) <= '1';
      else
        zgrp_lv01_bin00(141) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(24) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(142) <= '1';
      else
        zgrp_lv01_bin00(142) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(24) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(143) <= '1';
      else
        zgrp_lv01_bin00(143) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(24) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(144) <= '1';
      else
        zgrp_lv01_bin00(144) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(24) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(145) <= '1';
      else
        zgrp_lv01_bin00(145) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(24) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(146) <= '1';
      else
        zgrp_lv01_bin00(146) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(25) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(147) <= '1';
      else
        zgrp_lv01_bin00(147) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(25) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(148) <= '1';
      else
        zgrp_lv01_bin00(148) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(25) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(149) <= '1';
      else
        zgrp_lv01_bin00(149) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(25) = '1') and (Y4(3) = '1') then
        zgrp_lv01_bin00(150) <= '1';
      else
        zgrp_lv01_bin00(150) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(21) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(151) <= '1';
      else
        zgrp_lv01_bin00(151) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(21) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(152) <= '1';
      else
        zgrp_lv01_bin00(152) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(22) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(153) <= '1';
      else
        zgrp_lv01_bin00(153) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(22) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(154) <= '1';
      else
        zgrp_lv01_bin00(154) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(22) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(155) <= '1';
      else
        zgrp_lv01_bin00(155) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(22) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(156) <= '1';
      else
        zgrp_lv01_bin00(156) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(22) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(157) <= '1';
      else
        zgrp_lv01_bin00(157) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(22) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(158) <= '1';
      else
        zgrp_lv01_bin00(158) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(159) <= '1';
      else
        zgrp_lv01_bin00(159) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(160) <= '1';
      else
        zgrp_lv01_bin00(160) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(161) <= '1';
      else
        zgrp_lv01_bin00(161) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(162) <= '1';
      else
        zgrp_lv01_bin00(162) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(163) <= '1';
      else
        zgrp_lv01_bin00(163) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(164) <= '1';
      else
        zgrp_lv01_bin00(164) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(165) <= '1';
      else
        zgrp_lv01_bin00(165) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(166) <= '1';
      else
        zgrp_lv01_bin00(166) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(23) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(167) <= '1';
      else
        zgrp_lv01_bin00(167) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(168) <= '1';
      else
        zgrp_lv01_bin00(168) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(169) <= '1';
      else
        zgrp_lv01_bin00(169) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(170) <= '1';
      else
        zgrp_lv01_bin00(170) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(171) <= '1';
      else
        zgrp_lv01_bin00(171) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(172) <= '1';
      else
        zgrp_lv01_bin00(172) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(173) <= '1';
      else
        zgrp_lv01_bin00(173) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(174) <= '1';
      else
        zgrp_lv01_bin00(174) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(175) <= '1';
      else
        zgrp_lv01_bin00(175) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(176) <= '1';
      else
        zgrp_lv01_bin00(176) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(177) <= '1';
      else
        zgrp_lv01_bin00(177) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(178) <= '1';
      else
        zgrp_lv01_bin00(178) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(24) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(179) <= '1';
      else
        zgrp_lv01_bin00(179) <= '0';
      end if;
      if (Y1(0) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(180) <= '1';
      else
        zgrp_lv01_bin00(180) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(181) <= '1';
      else
        zgrp_lv01_bin00(181) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(182) <= '1';
      else
        zgrp_lv01_bin00(182) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(183) <= '1';
      else
        zgrp_lv01_bin00(183) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(184) <= '1';
      else
        zgrp_lv01_bin00(184) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(185) <= '1';
      else
        zgrp_lv01_bin00(185) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(186) <= '1';
      else
        zgrp_lv01_bin00(186) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(187) <= '1';
      else
        zgrp_lv01_bin00(187) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(188) <= '1';
      else
        zgrp_lv01_bin00(188) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(189) <= '1';
      else
        zgrp_lv01_bin00(189) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(190) <= '1';
      else
        zgrp_lv01_bin00(190) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(191) <= '1';
      else
        zgrp_lv01_bin00(191) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(192) <= '1';
      else
        zgrp_lv01_bin00(192) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(193) <= '1';
      else
        zgrp_lv01_bin00(193) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(25) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(194) <= '1';
      else
        zgrp_lv01_bin00(194) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(195) <= '1';
      else
        zgrp_lv01_bin00(195) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(196) <= '1';
      else
        zgrp_lv01_bin00(196) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(197) <= '1';
      else
        zgrp_lv01_bin00(197) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(198) <= '1';
      else
        zgrp_lv01_bin00(198) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(199) <= '1';
      else
        zgrp_lv01_bin00(199) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(200) <= '1';
      else
        zgrp_lv01_bin00(200) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(201) <= '1';
      else
        zgrp_lv01_bin00(201) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(202) <= '1';
      else
        zgrp_lv01_bin00(202) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(203) <= '1';
      else
        zgrp_lv01_bin00(203) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(204) <= '1';
      else
        zgrp_lv01_bin00(204) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(205) <= '1';
      else
        zgrp_lv01_bin00(205) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(206) <= '1';
      else
        zgrp_lv01_bin00(206) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(207) <= '1';
      else
        zgrp_lv01_bin00(207) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(208) <= '1';
      else
        zgrp_lv01_bin00(208) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(26) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(209) <= '1';
      else
        zgrp_lv01_bin00(209) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(210) <= '1';
      else
        zgrp_lv01_bin00(210) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(211) <= '1';
      else
        zgrp_lv01_bin00(211) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(212) <= '1';
      else
        zgrp_lv01_bin00(212) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(213) <= '1';
      else
        zgrp_lv01_bin00(213) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(214) <= '1';
      else
        zgrp_lv01_bin00(214) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(215) <= '1';
      else
        zgrp_lv01_bin00(215) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(216) <= '1';
      else
        zgrp_lv01_bin00(216) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(217) <= '1';
      else
        zgrp_lv01_bin00(217) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(218) <= '1';
      else
        zgrp_lv01_bin00(218) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(219) <= '1';
      else
        zgrp_lv01_bin00(219) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(220) <= '1';
      else
        zgrp_lv01_bin00(220) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(221) <= '1';
      else
        zgrp_lv01_bin00(221) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(222) <= '1';
      else
        zgrp_lv01_bin00(222) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(223) <= '1';
      else
        zgrp_lv01_bin00(223) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(27) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(224) <= '1';
      else
        zgrp_lv01_bin00(224) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(225) <= '1';
      else
        zgrp_lv01_bin00(225) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(226) <= '1';
      else
        zgrp_lv01_bin00(226) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(227) <= '1';
      else
        zgrp_lv01_bin00(227) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(228) <= '1';
      else
        zgrp_lv01_bin00(228) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(229) <= '1';
      else
        zgrp_lv01_bin00(229) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(230) <= '1';
      else
        zgrp_lv01_bin00(230) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(231) <= '1';
      else
        zgrp_lv01_bin00(231) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(232) <= '1';
      else
        zgrp_lv01_bin00(232) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(233) <= '1';
      else
        zgrp_lv01_bin00(233) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(234) <= '1';
      else
        zgrp_lv01_bin00(234) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(235) <= '1';
      else
        zgrp_lv01_bin00(235) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(236) <= '1';
      else
        zgrp_lv01_bin00(236) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(237) <= '1';
      else
        zgrp_lv01_bin00(237) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(28) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(238) <= '1';
      else
        zgrp_lv01_bin00(238) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(239) <= '1';
      else
        zgrp_lv01_bin00(239) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(240) <= '1';
      else
        zgrp_lv01_bin00(240) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(241) <= '1';
      else
        zgrp_lv01_bin00(241) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(242) <= '1';
      else
        zgrp_lv01_bin00(242) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(243) <= '1';
      else
        zgrp_lv01_bin00(243) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(244) <= '1';
      else
        zgrp_lv01_bin00(244) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(245) <= '1';
      else
        zgrp_lv01_bin00(245) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(246) <= '1';
      else
        zgrp_lv01_bin00(246) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(247) <= '1';
      else
        zgrp_lv01_bin00(247) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(248) <= '1';
      else
        zgrp_lv01_bin00(248) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(249) <= '1';
      else
        zgrp_lv01_bin00(249) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(250) <= '1';
      else
        zgrp_lv01_bin00(250) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(29) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(251) <= '1';
      else
        zgrp_lv01_bin00(251) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(252) <= '1';
      else
        zgrp_lv01_bin00(252) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(253) <= '1';
      else
        zgrp_lv01_bin00(253) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(254) <= '1';
      else
        zgrp_lv01_bin00(254) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(255) <= '1';
      else
        zgrp_lv01_bin00(255) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(256) <= '1';
      else
        zgrp_lv01_bin00(256) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(257) <= '1';
      else
        zgrp_lv01_bin00(257) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(258) <= '1';
      else
        zgrp_lv01_bin00(258) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(259) <= '1';
      else
        zgrp_lv01_bin00(259) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(260) <= '1';
      else
        zgrp_lv01_bin00(260) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(30) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(261) <= '1';
      else
        zgrp_lv01_bin00(261) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(262) <= '1';
      else
        zgrp_lv01_bin00(262) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(263) <= '1';
      else
        zgrp_lv01_bin00(263) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(264) <= '1';
      else
        zgrp_lv01_bin00(264) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(265) <= '1';
      else
        zgrp_lv01_bin00(265) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(266) <= '1';
      else
        zgrp_lv01_bin00(266) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(267) <= '1';
      else
        zgrp_lv01_bin00(267) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(31) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(268) <= '1';
      else
        zgrp_lv01_bin00(268) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(32) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(269) <= '1';
      else
        zgrp_lv01_bin00(269) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(32) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(270) <= '1';
      else
        zgrp_lv01_bin00(270) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(32) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(271) <= '1';
      else
        zgrp_lv01_bin00(271) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(32) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(272) <= '1';
      else
        zgrp_lv01_bin00(272) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(32) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(273) <= '1';
      else
        zgrp_lv01_bin00(273) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(33) = '1') and (Y4(4) = '1') then
        zgrp_lv01_bin00(274) <= '1';
      else
        zgrp_lv01_bin00(274) <= '0';
      end if;
      if (Y1(1) = '1') and (Y2(28) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(275) <= '1';
      else
        zgrp_lv01_bin00(275) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(28) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(276) <= '1';
      else
        zgrp_lv01_bin00(276) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(28) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(277) <= '1';
      else
        zgrp_lv01_bin00(277) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(28) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(278) <= '1';
      else
        zgrp_lv01_bin00(278) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(28) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(279) <= '1';
      else
        zgrp_lv01_bin00(279) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(280) <= '1';
      else
        zgrp_lv01_bin00(280) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(281) <= '1';
      else
        zgrp_lv01_bin00(281) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(282) <= '1';
      else
        zgrp_lv01_bin00(282) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(283) <= '1';
      else
        zgrp_lv01_bin00(283) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(284) <= '1';
      else
        zgrp_lv01_bin00(284) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(285) <= '1';
      else
        zgrp_lv01_bin00(285) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(29) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(286) <= '1';
      else
        zgrp_lv01_bin00(286) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(287) <= '1';
      else
        zgrp_lv01_bin00(287) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(288) <= '1';
      else
        zgrp_lv01_bin00(288) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(289) <= '1';
      else
        zgrp_lv01_bin00(289) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(290) <= '1';
      else
        zgrp_lv01_bin00(290) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(291) <= '1';
      else
        zgrp_lv01_bin00(291) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(292) <= '1';
      else
        zgrp_lv01_bin00(292) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(293) <= '1';
      else
        zgrp_lv01_bin00(293) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(294) <= '1';
      else
        zgrp_lv01_bin00(294) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(295) <= '1';
      else
        zgrp_lv01_bin00(295) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(296) <= '1';
      else
        zgrp_lv01_bin00(296) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(30) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(297) <= '1';
      else
        zgrp_lv01_bin00(297) <= '0';
      end if;
      if (Y1(2) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(298) <= '1';
      else
        zgrp_lv01_bin00(298) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(299) <= '1';
      else
        zgrp_lv01_bin00(299) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(300) <= '1';
      else
        zgrp_lv01_bin00(300) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(301) <= '1';
      else
        zgrp_lv01_bin00(301) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(302) <= '1';
      else
        zgrp_lv01_bin00(302) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(303) <= '1';
      else
        zgrp_lv01_bin00(303) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(304) <= '1';
      else
        zgrp_lv01_bin00(304) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(305) <= '1';
      else
        zgrp_lv01_bin00(305) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(306) <= '1';
      else
        zgrp_lv01_bin00(306) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(307) <= '1';
      else
        zgrp_lv01_bin00(307) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(308) <= '1';
      else
        zgrp_lv01_bin00(308) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(309) <= '1';
      else
        zgrp_lv01_bin00(309) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(310) <= '1';
      else
        zgrp_lv01_bin00(310) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(31) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(311) <= '1';
      else
        zgrp_lv01_bin00(311) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(312) <= '1';
      else
        zgrp_lv01_bin00(312) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(313) <= '1';
      else
        zgrp_lv01_bin00(313) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(314) <= '1';
      else
        zgrp_lv01_bin00(314) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(315) <= '1';
      else
        zgrp_lv01_bin00(315) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(316) <= '1';
      else
        zgrp_lv01_bin00(316) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(317) <= '1';
      else
        zgrp_lv01_bin00(317) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(318) <= '1';
      else
        zgrp_lv01_bin00(318) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(319) <= '1';
      else
        zgrp_lv01_bin00(319) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(320) <= '1';
      else
        zgrp_lv01_bin00(320) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(321) <= '1';
      else
        zgrp_lv01_bin00(321) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(322) <= '1';
      else
        zgrp_lv01_bin00(322) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(323) <= '1';
      else
        zgrp_lv01_bin00(323) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(324) <= '1';
      else
        zgrp_lv01_bin00(324) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(325) <= '1';
      else
        zgrp_lv01_bin00(325) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(326) <= '1';
      else
        zgrp_lv01_bin00(326) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(32) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(327) <= '1';
      else
        zgrp_lv01_bin00(327) <= '0';
      end if;
      if (Y1(3) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(328) <= '1';
      else
        zgrp_lv01_bin00(328) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(329) <= '1';
      else
        zgrp_lv01_bin00(329) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(330) <= '1';
      else
        zgrp_lv01_bin00(330) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(331) <= '1';
      else
        zgrp_lv01_bin00(331) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(332) <= '1';
      else
        zgrp_lv01_bin00(332) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(333) <= '1';
      else
        zgrp_lv01_bin00(333) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(334) <= '1';
      else
        zgrp_lv01_bin00(334) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(335) <= '1';
      else
        zgrp_lv01_bin00(335) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(336) <= '1';
      else
        zgrp_lv01_bin00(336) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(337) <= '1';
      else
        zgrp_lv01_bin00(337) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(338) <= '1';
      else
        zgrp_lv01_bin00(338) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(339) <= '1';
      else
        zgrp_lv01_bin00(339) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(340) <= '1';
      else
        zgrp_lv01_bin00(340) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(341) <= '1';
      else
        zgrp_lv01_bin00(341) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(342) <= '1';
      else
        zgrp_lv01_bin00(342) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(343) <= '1';
      else
        zgrp_lv01_bin00(343) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(344) <= '1';
      else
        zgrp_lv01_bin00(344) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(33) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(345) <= '1';
      else
        zgrp_lv01_bin00(345) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(346) <= '1';
      else
        zgrp_lv01_bin00(346) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(347) <= '1';
      else
        zgrp_lv01_bin00(347) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(348) <= '1';
      else
        zgrp_lv01_bin00(348) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(349) <= '1';
      else
        zgrp_lv01_bin00(349) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(350) <= '1';
      else
        zgrp_lv01_bin00(350) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(351) <= '1';
      else
        zgrp_lv01_bin00(351) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(352) <= '1';
      else
        zgrp_lv01_bin00(352) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(353) <= '1';
      else
        zgrp_lv01_bin00(353) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(354) <= '1';
      else
        zgrp_lv01_bin00(354) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(355) <= '1';
      else
        zgrp_lv01_bin00(355) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(356) <= '1';
      else
        zgrp_lv01_bin00(356) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(357) <= '1';
      else
        zgrp_lv01_bin00(357) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(358) <= '1';
      else
        zgrp_lv01_bin00(358) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(359) <= '1';
      else
        zgrp_lv01_bin00(359) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(360) <= '1';
      else
        zgrp_lv01_bin00(360) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(361) <= '1';
      else
        zgrp_lv01_bin00(361) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(34) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(362) <= '1';
      else
        zgrp_lv01_bin00(362) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(363) <= '1';
      else
        zgrp_lv01_bin00(363) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(364) <= '1';
      else
        zgrp_lv01_bin00(364) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(365) <= '1';
      else
        zgrp_lv01_bin00(365) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(366) <= '1';
      else
        zgrp_lv01_bin00(366) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(367) <= '1';
      else
        zgrp_lv01_bin00(367) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(368) <= '1';
      else
        zgrp_lv01_bin00(368) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(369) <= '1';
      else
        zgrp_lv01_bin00(369) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(370) <= '1';
      else
        zgrp_lv01_bin00(370) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(371) <= '1';
      else
        zgrp_lv01_bin00(371) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(372) <= '1';
      else
        zgrp_lv01_bin00(372) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(373) <= '1';
      else
        zgrp_lv01_bin00(373) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(374) <= '1';
      else
        zgrp_lv01_bin00(374) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(375) <= '1';
      else
        zgrp_lv01_bin00(375) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(376) <= '1';
      else
        zgrp_lv01_bin00(376) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(377) <= '1';
      else
        zgrp_lv01_bin00(377) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(35) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(378) <= '1';
      else
        zgrp_lv01_bin00(378) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(379) <= '1';
      else
        zgrp_lv01_bin00(379) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(380) <= '1';
      else
        zgrp_lv01_bin00(380) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(381) <= '1';
      else
        zgrp_lv01_bin00(381) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(382) <= '1';
      else
        zgrp_lv01_bin00(382) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(383) <= '1';
      else
        zgrp_lv01_bin00(383) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(384) <= '1';
      else
        zgrp_lv01_bin00(384) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(385) <= '1';
      else
        zgrp_lv01_bin00(385) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(386) <= '1';
      else
        zgrp_lv01_bin00(386) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(387) <= '1';
      else
        zgrp_lv01_bin00(387) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(388) <= '1';
      else
        zgrp_lv01_bin00(388) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(389) <= '1';
      else
        zgrp_lv01_bin00(389) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(390) <= '1';
      else
        zgrp_lv01_bin00(390) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(391) <= '1';
      else
        zgrp_lv01_bin00(391) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(36) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(392) <= '1';
      else
        zgrp_lv01_bin00(392) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(393) <= '1';
      else
        zgrp_lv01_bin00(393) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(394) <= '1';
      else
        zgrp_lv01_bin00(394) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(395) <= '1';
      else
        zgrp_lv01_bin00(395) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(396) <= '1';
      else
        zgrp_lv01_bin00(396) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(397) <= '1';
      else
        zgrp_lv01_bin00(397) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(398) <= '1';
      else
        zgrp_lv01_bin00(398) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(399) <= '1';
      else
        zgrp_lv01_bin00(399) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(400) <= '1';
      else
        zgrp_lv01_bin00(400) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(401) <= '1';
      else
        zgrp_lv01_bin00(401) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(402) <= '1';
      else
        zgrp_lv01_bin00(402) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(403) <= '1';
      else
        zgrp_lv01_bin00(403) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(37) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(404) <= '1';
      else
        zgrp_lv01_bin00(404) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(405) <= '1';
      else
        zgrp_lv01_bin00(405) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(406) <= '1';
      else
        zgrp_lv01_bin00(406) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(407) <= '1';
      else
        zgrp_lv01_bin00(407) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(408) <= '1';
      else
        zgrp_lv01_bin00(408) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(409) <= '1';
      else
        zgrp_lv01_bin00(409) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(410) <= '1';
      else
        zgrp_lv01_bin00(410) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(411) <= '1';
      else
        zgrp_lv01_bin00(411) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(38) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(412) <= '1';
      else
        zgrp_lv01_bin00(412) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(39) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(413) <= '1';
      else
        zgrp_lv01_bin00(413) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(39) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(414) <= '1';
      else
        zgrp_lv01_bin00(414) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(39) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(415) <= '1';
      else
        zgrp_lv01_bin00(415) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(39) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(416) <= '1';
      else
        zgrp_lv01_bin00(416) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(39) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(417) <= '1';
      else
        zgrp_lv01_bin00(417) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(39) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(418) <= '1';
      else
        zgrp_lv01_bin00(418) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(40) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(419) <= '1';
      else
        zgrp_lv01_bin00(419) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(40) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(420) <= '1';
      else
        zgrp_lv01_bin00(420) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(40) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(421) <= '1';
      else
        zgrp_lv01_bin00(421) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(40) = '1') and (Y4(5) = '1') then
        zgrp_lv01_bin00(422) <= '1';
      else
        zgrp_lv01_bin00(422) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(34) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(423) <= '1';
      else
        zgrp_lv01_bin00(423) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(34) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(424) <= '1';
      else
        zgrp_lv01_bin00(424) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(35) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(425) <= '1';
      else
        zgrp_lv01_bin00(425) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(35) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(426) <= '1';
      else
        zgrp_lv01_bin00(426) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(35) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(427) <= '1';
      else
        zgrp_lv01_bin00(427) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(35) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(428) <= '1';
      else
        zgrp_lv01_bin00(428) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(35) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(429) <= '1';
      else
        zgrp_lv01_bin00(429) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(35) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(430) <= '1';
      else
        zgrp_lv01_bin00(430) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(431) <= '1';
      else
        zgrp_lv01_bin00(431) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(432) <= '1';
      else
        zgrp_lv01_bin00(432) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(433) <= '1';
      else
        zgrp_lv01_bin00(433) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(434) <= '1';
      else
        zgrp_lv01_bin00(434) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(435) <= '1';
      else
        zgrp_lv01_bin00(435) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(436) <= '1';
      else
        zgrp_lv01_bin00(436) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(437) <= '1';
      else
        zgrp_lv01_bin00(437) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(438) <= '1';
      else
        zgrp_lv01_bin00(438) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(36) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(439) <= '1';
      else
        zgrp_lv01_bin00(439) <= '0';
      end if;
      if (Y1(4) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(440) <= '1';
      else
        zgrp_lv01_bin00(440) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(441) <= '1';
      else
        zgrp_lv01_bin00(441) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(442) <= '1';
      else
        zgrp_lv01_bin00(442) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(443) <= '1';
      else
        zgrp_lv01_bin00(443) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(444) <= '1';
      else
        zgrp_lv01_bin00(444) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(445) <= '1';
      else
        zgrp_lv01_bin00(445) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(446) <= '1';
      else
        zgrp_lv01_bin00(446) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(447) <= '1';
      else
        zgrp_lv01_bin00(447) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(448) <= '1';
      else
        zgrp_lv01_bin00(448) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(449) <= '1';
      else
        zgrp_lv01_bin00(449) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(450) <= '1';
      else
        zgrp_lv01_bin00(450) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(451) <= '1';
      else
        zgrp_lv01_bin00(451) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(37) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(452) <= '1';
      else
        zgrp_lv01_bin00(452) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(453) <= '1';
      else
        zgrp_lv01_bin00(453) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(454) <= '1';
      else
        zgrp_lv01_bin00(454) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(455) <= '1';
      else
        zgrp_lv01_bin00(455) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(456) <= '1';
      else
        zgrp_lv01_bin00(456) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(457) <= '1';
      else
        zgrp_lv01_bin00(457) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(458) <= '1';
      else
        zgrp_lv01_bin00(458) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(459) <= '1';
      else
        zgrp_lv01_bin00(459) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(460) <= '1';
      else
        zgrp_lv01_bin00(460) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(461) <= '1';
      else
        zgrp_lv01_bin00(461) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(462) <= '1';
      else
        zgrp_lv01_bin00(462) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(463) <= '1';
      else
        zgrp_lv01_bin00(463) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(464) <= '1';
      else
        zgrp_lv01_bin00(464) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(465) <= '1';
      else
        zgrp_lv01_bin00(465) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(466) <= '1';
      else
        zgrp_lv01_bin00(466) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(38) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(467) <= '1';
      else
        zgrp_lv01_bin00(467) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(468) <= '1';
      else
        zgrp_lv01_bin00(468) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(469) <= '1';
      else
        zgrp_lv01_bin00(469) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(470) <= '1';
      else
        zgrp_lv01_bin00(470) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(471) <= '1';
      else
        zgrp_lv01_bin00(471) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(472) <= '1';
      else
        zgrp_lv01_bin00(472) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(473) <= '1';
      else
        zgrp_lv01_bin00(473) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(474) <= '1';
      else
        zgrp_lv01_bin00(474) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(475) <= '1';
      else
        zgrp_lv01_bin00(475) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(476) <= '1';
      else
        zgrp_lv01_bin00(476) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(477) <= '1';
      else
        zgrp_lv01_bin00(477) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(478) <= '1';
      else
        zgrp_lv01_bin00(478) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(479) <= '1';
      else
        zgrp_lv01_bin00(479) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(480) <= '1';
      else
        zgrp_lv01_bin00(480) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(481) <= '1';
      else
        zgrp_lv01_bin00(481) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(482) <= '1';
      else
        zgrp_lv01_bin00(482) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(483) <= '1';
      else
        zgrp_lv01_bin00(483) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(484) <= '1';
      else
        zgrp_lv01_bin00(484) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(39) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(485) <= '1';
      else
        zgrp_lv01_bin00(485) <= '0';
      end if;
      if (Y1(5) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(486) <= '1';
      else
        zgrp_lv01_bin00(486) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(487) <= '1';
      else
        zgrp_lv01_bin00(487) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(488) <= '1';
      else
        zgrp_lv01_bin00(488) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(489) <= '1';
      else
        zgrp_lv01_bin00(489) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(490) <= '1';
      else
        zgrp_lv01_bin00(490) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(491) <= '1';
      else
        zgrp_lv01_bin00(491) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(492) <= '1';
      else
        zgrp_lv01_bin00(492) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(493) <= '1';
      else
        zgrp_lv01_bin00(493) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(494) <= '1';
      else
        zgrp_lv01_bin00(494) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(495) <= '1';
      else
        zgrp_lv01_bin00(495) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(496) <= '1';
      else
        zgrp_lv01_bin00(496) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(497) <= '1';
      else
        zgrp_lv01_bin00(497) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(498) <= '1';
      else
        zgrp_lv01_bin00(498) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(499) <= '1';
      else
        zgrp_lv01_bin00(499) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(500) <= '1';
      else
        zgrp_lv01_bin00(500) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(501) <= '1';
      else
        zgrp_lv01_bin00(501) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(502) <= '1';
      else
        zgrp_lv01_bin00(502) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(503) <= '1';
      else
        zgrp_lv01_bin00(503) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(504) <= '1';
      else
        zgrp_lv01_bin00(504) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(505) <= '1';
      else
        zgrp_lv01_bin00(505) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(40) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(506) <= '1';
      else
        zgrp_lv01_bin00(506) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(507) <= '1';
      else
        zgrp_lv01_bin00(507) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(508) <= '1';
      else
        zgrp_lv01_bin00(508) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(509) <= '1';
      else
        zgrp_lv01_bin00(509) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(510) <= '1';
      else
        zgrp_lv01_bin00(510) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(511) <= '1';
      else
        zgrp_lv01_bin00(511) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(512) <= '1';
      else
        zgrp_lv01_bin00(512) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(513) <= '1';
      else
        zgrp_lv01_bin00(513) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(514) <= '1';
      else
        zgrp_lv01_bin00(514) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(515) <= '1';
      else
        zgrp_lv01_bin00(515) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(516) <= '1';
      else
        zgrp_lv01_bin00(516) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(517) <= '1';
      else
        zgrp_lv01_bin00(517) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(518) <= '1';
      else
        zgrp_lv01_bin00(518) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(519) <= '1';
      else
        zgrp_lv01_bin00(519) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(520) <= '1';
      else
        zgrp_lv01_bin00(520) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(521) <= '1';
      else
        zgrp_lv01_bin00(521) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(522) <= '1';
      else
        zgrp_lv01_bin00(522) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(523) <= '1';
      else
        zgrp_lv01_bin00(523) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(524) <= '1';
      else
        zgrp_lv01_bin00(524) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(525) <= '1';
      else
        zgrp_lv01_bin00(525) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(41) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(526) <= '1';
      else
        zgrp_lv01_bin00(526) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(527) <= '1';
      else
        zgrp_lv01_bin00(527) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(528) <= '1';
      else
        zgrp_lv01_bin00(528) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(529) <= '1';
      else
        zgrp_lv01_bin00(529) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(530) <= '1';
      else
        zgrp_lv01_bin00(530) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(531) <= '1';
      else
        zgrp_lv01_bin00(531) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(532) <= '1';
      else
        zgrp_lv01_bin00(532) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(533) <= '1';
      else
        zgrp_lv01_bin00(533) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(534) <= '1';
      else
        zgrp_lv01_bin00(534) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(535) <= '1';
      else
        zgrp_lv01_bin00(535) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(536) <= '1';
      else
        zgrp_lv01_bin00(536) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(537) <= '1';
      else
        zgrp_lv01_bin00(537) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(538) <= '1';
      else
        zgrp_lv01_bin00(538) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(539) <= '1';
      else
        zgrp_lv01_bin00(539) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(540) <= '1';
      else
        zgrp_lv01_bin00(540) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(541) <= '1';
      else
        zgrp_lv01_bin00(541) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(542) <= '1';
      else
        zgrp_lv01_bin00(542) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(42) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(543) <= '1';
      else
        zgrp_lv01_bin00(543) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(544) <= '1';
      else
        zgrp_lv01_bin00(544) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(545) <= '1';
      else
        zgrp_lv01_bin00(545) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(546) <= '1';
      else
        zgrp_lv01_bin00(546) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(547) <= '1';
      else
        zgrp_lv01_bin00(547) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(548) <= '1';
      else
        zgrp_lv01_bin00(548) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(549) <= '1';
      else
        zgrp_lv01_bin00(549) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(550) <= '1';
      else
        zgrp_lv01_bin00(550) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(551) <= '1';
      else
        zgrp_lv01_bin00(551) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(552) <= '1';
      else
        zgrp_lv01_bin00(552) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(553) <= '1';
      else
        zgrp_lv01_bin00(553) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(554) <= '1';
      else
        zgrp_lv01_bin00(554) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(555) <= '1';
      else
        zgrp_lv01_bin00(555) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(556) <= '1';
      else
        zgrp_lv01_bin00(556) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(557) <= '1';
      else
        zgrp_lv01_bin00(557) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(43) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(558) <= '1';
      else
        zgrp_lv01_bin00(558) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(559) <= '1';
      else
        zgrp_lv01_bin00(559) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(560) <= '1';
      else
        zgrp_lv01_bin00(560) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(561) <= '1';
      else
        zgrp_lv01_bin00(561) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(562) <= '1';
      else
        zgrp_lv01_bin00(562) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(563) <= '1';
      else
        zgrp_lv01_bin00(563) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(564) <= '1';
      else
        zgrp_lv01_bin00(564) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(565) <= '1';
      else
        zgrp_lv01_bin00(565) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(566) <= '1';
      else
        zgrp_lv01_bin00(566) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(567) <= '1';
      else
        zgrp_lv01_bin00(567) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(568) <= '1';
      else
        zgrp_lv01_bin00(568) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(569) <= '1';
      else
        zgrp_lv01_bin00(569) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(570) <= '1';
      else
        zgrp_lv01_bin00(570) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(44) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(571) <= '1';
      else
        zgrp_lv01_bin00(571) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(572) <= '1';
      else
        zgrp_lv01_bin00(572) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(573) <= '1';
      else
        zgrp_lv01_bin00(573) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(574) <= '1';
      else
        zgrp_lv01_bin00(574) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(575) <= '1';
      else
        zgrp_lv01_bin00(575) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(576) <= '1';
      else
        zgrp_lv01_bin00(576) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(577) <= '1';
      else
        zgrp_lv01_bin00(577) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(578) <= '1';
      else
        zgrp_lv01_bin00(578) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(579) <= '1';
      else
        zgrp_lv01_bin00(579) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(45) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(580) <= '1';
      else
        zgrp_lv01_bin00(580) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(581) <= '1';
      else
        zgrp_lv01_bin00(581) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(582) <= '1';
      else
        zgrp_lv01_bin00(582) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(583) <= '1';
      else
        zgrp_lv01_bin00(583) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(584) <= '1';
      else
        zgrp_lv01_bin00(584) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(585) <= '1';
      else
        zgrp_lv01_bin00(585) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(586) <= '1';
      else
        zgrp_lv01_bin00(586) <= '0';
      end if;
      if (Y1(29) = '1') and (Y2(46) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(587) <= '1';
      else
        zgrp_lv01_bin00(587) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(47) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(588) <= '1';
      else
        zgrp_lv01_bin00(588) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(47) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(589) <= '1';
      else
        zgrp_lv01_bin00(589) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(47) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(590) <= '1';
      else
        zgrp_lv01_bin00(590) <= '0';
      end if;
      if (Y1(29) = '1') and (Y2(47) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(591) <= '1';
      else
        zgrp_lv01_bin00(591) <= '0';
      end if;
      if (Y1(30) = '1') and (Y2(47) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(592) <= '1';
      else
        zgrp_lv01_bin00(592) <= '0';
      end if;
      if (Y1(30) = '1') and (Y2(48) = '1') and (Y4(6) = '1') then
        zgrp_lv01_bin00(593) <= '1';
      else
        zgrp_lv01_bin00(593) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(41) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(594) <= '1';
      else
        zgrp_lv01_bin00(594) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(41) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(595) <= '1';
      else
        zgrp_lv01_bin00(595) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(41) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(596) <= '1';
      else
        zgrp_lv01_bin00(596) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(41) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(597) <= '1';
      else
        zgrp_lv01_bin00(597) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(598) <= '1';
      else
        zgrp_lv01_bin00(598) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(599) <= '1';
      else
        zgrp_lv01_bin00(599) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(600) <= '1';
      else
        zgrp_lv01_bin00(600) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(601) <= '1';
      else
        zgrp_lv01_bin00(601) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(602) <= '1';
      else
        zgrp_lv01_bin00(602) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(603) <= '1';
      else
        zgrp_lv01_bin00(603) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(604) <= '1';
      else
        zgrp_lv01_bin00(604) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(42) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(605) <= '1';
      else
        zgrp_lv01_bin00(605) <= '0';
      end if;
      if (Y1(6) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(606) <= '1';
      else
        zgrp_lv01_bin00(606) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(607) <= '1';
      else
        zgrp_lv01_bin00(607) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(608) <= '1';
      else
        zgrp_lv01_bin00(608) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(609) <= '1';
      else
        zgrp_lv01_bin00(609) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(610) <= '1';
      else
        zgrp_lv01_bin00(610) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(611) <= '1';
      else
        zgrp_lv01_bin00(611) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(612) <= '1';
      else
        zgrp_lv01_bin00(612) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(613) <= '1';
      else
        zgrp_lv01_bin00(613) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(614) <= '1';
      else
        zgrp_lv01_bin00(614) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(615) <= '1';
      else
        zgrp_lv01_bin00(615) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(43) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(616) <= '1';
      else
        zgrp_lv01_bin00(616) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(617) <= '1';
      else
        zgrp_lv01_bin00(617) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(618) <= '1';
      else
        zgrp_lv01_bin00(618) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(619) <= '1';
      else
        zgrp_lv01_bin00(619) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(620) <= '1';
      else
        zgrp_lv01_bin00(620) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(621) <= '1';
      else
        zgrp_lv01_bin00(621) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(622) <= '1';
      else
        zgrp_lv01_bin00(622) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(623) <= '1';
      else
        zgrp_lv01_bin00(623) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(624) <= '1';
      else
        zgrp_lv01_bin00(624) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(625) <= '1';
      else
        zgrp_lv01_bin00(625) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(626) <= '1';
      else
        zgrp_lv01_bin00(626) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(627) <= '1';
      else
        zgrp_lv01_bin00(627) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(628) <= '1';
      else
        zgrp_lv01_bin00(628) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(44) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(629) <= '1';
      else
        zgrp_lv01_bin00(629) <= '0';
      end if;
      if (Y1(7) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(630) <= '1';
      else
        zgrp_lv01_bin00(630) <= '0';
      end if;
      if (Y1(8) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(631) <= '1';
      else
        zgrp_lv01_bin00(631) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(632) <= '1';
      else
        zgrp_lv01_bin00(632) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(633) <= '1';
      else
        zgrp_lv01_bin00(633) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(634) <= '1';
      else
        zgrp_lv01_bin00(634) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(635) <= '1';
      else
        zgrp_lv01_bin00(635) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(636) <= '1';
      else
        zgrp_lv01_bin00(636) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(637) <= '1';
      else
        zgrp_lv01_bin00(637) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(638) <= '1';
      else
        zgrp_lv01_bin00(638) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(639) <= '1';
      else
        zgrp_lv01_bin00(639) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(640) <= '1';
      else
        zgrp_lv01_bin00(640) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(641) <= '1';
      else
        zgrp_lv01_bin00(641) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(642) <= '1';
      else
        zgrp_lv01_bin00(642) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(643) <= '1';
      else
        zgrp_lv01_bin00(643) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(644) <= '1';
      else
        zgrp_lv01_bin00(644) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(645) <= '1';
      else
        zgrp_lv01_bin00(645) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(45) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(646) <= '1';
      else
        zgrp_lv01_bin00(646) <= '0';
      end if;
      if (Y1(9) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(647) <= '1';
      else
        zgrp_lv01_bin00(647) <= '0';
      end if;
      if (Y1(10) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(648) <= '1';
      else
        zgrp_lv01_bin00(648) <= '0';
      end if;
      if (Y1(11) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(649) <= '1';
      else
        zgrp_lv01_bin00(649) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(650) <= '1';
      else
        zgrp_lv01_bin00(650) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(651) <= '1';
      else
        zgrp_lv01_bin00(651) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(652) <= '1';
      else
        zgrp_lv01_bin00(652) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(653) <= '1';
      else
        zgrp_lv01_bin00(653) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(654) <= '1';
      else
        zgrp_lv01_bin00(654) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(655) <= '1';
      else
        zgrp_lv01_bin00(655) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(656) <= '1';
      else
        zgrp_lv01_bin00(656) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(657) <= '1';
      else
        zgrp_lv01_bin00(657) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(658) <= '1';
      else
        zgrp_lv01_bin00(658) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(659) <= '1';
      else
        zgrp_lv01_bin00(659) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(660) <= '1';
      else
        zgrp_lv01_bin00(660) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(661) <= '1';
      else
        zgrp_lv01_bin00(661) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(662) <= '1';
      else
        zgrp_lv01_bin00(662) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(663) <= '1';
      else
        zgrp_lv01_bin00(663) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(46) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(664) <= '1';
      else
        zgrp_lv01_bin00(664) <= '0';
      end if;
      if (Y1(12) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(665) <= '1';
      else
        zgrp_lv01_bin00(665) <= '0';
      end if;
      if (Y1(13) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(666) <= '1';
      else
        zgrp_lv01_bin00(666) <= '0';
      end if;
      if (Y1(14) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(667) <= '1';
      else
        zgrp_lv01_bin00(667) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(668) <= '1';
      else
        zgrp_lv01_bin00(668) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(669) <= '1';
      else
        zgrp_lv01_bin00(669) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(670) <= '1';
      else
        zgrp_lv01_bin00(670) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(671) <= '1';
      else
        zgrp_lv01_bin00(671) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(672) <= '1';
      else
        zgrp_lv01_bin00(672) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(673) <= '1';
      else
        zgrp_lv01_bin00(673) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(674) <= '1';
      else
        zgrp_lv01_bin00(674) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(675) <= '1';
      else
        zgrp_lv01_bin00(675) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(676) <= '1';
      else
        zgrp_lv01_bin00(676) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(677) <= '1';
      else
        zgrp_lv01_bin00(677) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(678) <= '1';
      else
        zgrp_lv01_bin00(678) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(679) <= '1';
      else
        zgrp_lv01_bin00(679) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(680) <= '1';
      else
        zgrp_lv01_bin00(680) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(681) <= '1';
      else
        zgrp_lv01_bin00(681) <= '0';
      end if;
      if (Y1(29) = '1') and (Y2(47) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(682) <= '1';
      else
        zgrp_lv01_bin00(682) <= '0';
      end if;
      if (Y1(15) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(683) <= '1';
      else
        zgrp_lv01_bin00(683) <= '0';
      end if;
      if (Y1(16) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(684) <= '1';
      else
        zgrp_lv01_bin00(684) <= '0';
      end if;
      if (Y1(17) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(685) <= '1';
      else
        zgrp_lv01_bin00(685) <= '0';
      end if;
      if (Y1(18) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(686) <= '1';
      else
        zgrp_lv01_bin00(686) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(687) <= '1';
      else
        zgrp_lv01_bin00(687) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(688) <= '1';
      else
        zgrp_lv01_bin00(688) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(689) <= '1';
      else
        zgrp_lv01_bin00(689) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(690) <= '1';
      else
        zgrp_lv01_bin00(690) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(691) <= '1';
      else
        zgrp_lv01_bin00(691) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(692) <= '1';
      else
        zgrp_lv01_bin00(692) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(693) <= '1';
      else
        zgrp_lv01_bin00(693) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(694) <= '1';
      else
        zgrp_lv01_bin00(694) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(695) <= '1';
      else
        zgrp_lv01_bin00(695) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(696) <= '1';
      else
        zgrp_lv01_bin00(696) <= '0';
      end if;
      if (Y1(29) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(697) <= '1';
      else
        zgrp_lv01_bin00(697) <= '0';
      end if;
      if (Y1(30) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(698) <= '1';
      else
        zgrp_lv01_bin00(698) <= '0';
      end if;
      if (Y1(31) = '1') and (Y2(48) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(699) <= '1';
      else
        zgrp_lv01_bin00(699) <= '0';
      end if;
      if (Y1(19) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(700) <= '1';
      else
        zgrp_lv01_bin00(700) <= '0';
      end if;
      if (Y1(20) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(701) <= '1';
      else
        zgrp_lv01_bin00(701) <= '0';
      end if;
      if (Y1(21) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(702) <= '1';
      else
        zgrp_lv01_bin00(702) <= '0';
      end if;
      if (Y1(22) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(703) <= '1';
      else
        zgrp_lv01_bin00(703) <= '0';
      end if;
      if (Y1(23) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(704) <= '1';
      else
        zgrp_lv01_bin00(704) <= '0';
      end if;
      if (Y1(24) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(705) <= '1';
      else
        zgrp_lv01_bin00(705) <= '0';
      end if;
      if (Y1(25) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(706) <= '1';
      else
        zgrp_lv01_bin00(706) <= '0';
      end if;
      if (Y1(26) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(707) <= '1';
      else
        zgrp_lv01_bin00(707) <= '0';
      end if;
      if (Y1(27) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(708) <= '1';
      else
        zgrp_lv01_bin00(708) <= '0';
      end if;
      if (Y1(28) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(709) <= '1';
      else
        zgrp_lv01_bin00(709) <= '0';
      end if;
      if (Y1(29) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(710) <= '1';
      else
        zgrp_lv01_bin00(710) <= '0';
      end if;
      if (Y1(30) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(711) <= '1';
      else
        zgrp_lv01_bin00(711) <= '0';
      end if;
      if (Y1(31) = '1') and (Y2(49) = '1') and (Y4(7) = '1') then
        zgrp_lv01_bin00(712) <= '1';
      else
        zgrp_lv01_bin00(712) <= '0';
      end if;
    end if;
  end process;

  lut_lv02 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv01_bin00(0) = '1') or (zgrp_lv01_bin00(1) = '1') or (zgrp_lv01_bin00(2) = '1') or (zgrp_lv01_bin00(3) = '1') then
        zgrp_lv02_bin00(0) <= '1';
      else
        zgrp_lv02_bin00(0) <= '0';
      end if;
      if (zgrp_lv01_bin00(4) = '1') or (zgrp_lv01_bin00(5) = '1') or (zgrp_lv01_bin00(6) = '1') or (zgrp_lv01_bin00(7) = '1') then
        zgrp_lv02_bin00(1) <= '1';
      else
        zgrp_lv02_bin00(1) <= '0';
      end if;
      if (zgrp_lv01_bin00(8) = '1') or (zgrp_lv01_bin00(9) = '1') or (zgrp_lv01_bin00(10) = '1') or (zgrp_lv01_bin00(11) = '1') then
        zgrp_lv02_bin00(2) <= '1';
      else
        zgrp_lv02_bin00(2) <= '0';
      end if;
      if (zgrp_lv01_bin00(12) = '1') or (zgrp_lv01_bin00(13) = '1') or (zgrp_lv01_bin00(14) = '1') or (zgrp_lv01_bin00(15) = '1') then
        zgrp_lv02_bin00(3) <= '1';
      else
        zgrp_lv02_bin00(3) <= '0';
      end if;
      if (zgrp_lv01_bin00(16) = '1') or (zgrp_lv01_bin00(17) = '1') or (zgrp_lv01_bin00(18) = '1') or (zgrp_lv01_bin00(19) = '1') then
        zgrp_lv02_bin00(4) <= '1';
      else
        zgrp_lv02_bin00(4) <= '0';
      end if;
      if (zgrp_lv01_bin00(20) = '1') or (zgrp_lv01_bin00(21) = '1') or (zgrp_lv01_bin00(22) = '1') or (zgrp_lv01_bin00(23) = '1') then
        zgrp_lv02_bin00(5) <= '1';
      else
        zgrp_lv02_bin00(5) <= '0';
      end if;
      if (zgrp_lv01_bin00(24) = '1') or (zgrp_lv01_bin00(25) = '1') or (zgrp_lv01_bin00(26) = '1') or (zgrp_lv01_bin00(27) = '1') then
        zgrp_lv02_bin00(6) <= '1';
      else
        zgrp_lv02_bin00(6) <= '0';
      end if;
      if (zgrp_lv01_bin00(28) = '1') or (zgrp_lv01_bin00(29) = '1') or (zgrp_lv01_bin00(30) = '1') or (zgrp_lv01_bin00(31) = '1') then
        zgrp_lv02_bin00(7) <= '1';
      else
        zgrp_lv02_bin00(7) <= '0';
      end if;
      if (zgrp_lv01_bin00(32) = '1') or (zgrp_lv01_bin00(33) = '1') or (zgrp_lv01_bin00(34) = '1') or (zgrp_lv01_bin00(35) = '1') then
        zgrp_lv02_bin00(8) <= '1';
      else
        zgrp_lv02_bin00(8) <= '0';
      end if;
      if (zgrp_lv01_bin00(36) = '1') or (zgrp_lv01_bin00(37) = '1') or (zgrp_lv01_bin00(38) = '1') or (zgrp_lv01_bin00(39) = '1') then
        zgrp_lv02_bin00(9) <= '1';
      else
        zgrp_lv02_bin00(9) <= '0';
      end if;
      if (zgrp_lv01_bin00(40) = '1') or (zgrp_lv01_bin00(41) = '1') or (zgrp_lv01_bin00(42) = '1') or (zgrp_lv01_bin00(43) = '1') then
        zgrp_lv02_bin00(10) <= '1';
      else
        zgrp_lv02_bin00(10) <= '0';
      end if;
      if (zgrp_lv01_bin00(44) = '1') or (zgrp_lv01_bin00(45) = '1') or (zgrp_lv01_bin00(46) = '1') or (zgrp_lv01_bin00(47) = '1') then
        zgrp_lv02_bin00(11) <= '1';
      else
        zgrp_lv02_bin00(11) <= '0';
      end if;
      if (zgrp_lv01_bin00(48) = '1') or (zgrp_lv01_bin00(49) = '1') or (zgrp_lv01_bin00(50) = '1') or (zgrp_lv01_bin00(51) = '1') then
        zgrp_lv02_bin00(12) <= '1';
      else
        zgrp_lv02_bin00(12) <= '0';
      end if;
      if (zgrp_lv01_bin00(52) = '1') or (zgrp_lv01_bin00(53) = '1') or (zgrp_lv01_bin00(54) = '1') or (zgrp_lv01_bin00(55) = '1') then
        zgrp_lv02_bin00(13) <= '1';
      else
        zgrp_lv02_bin00(13) <= '0';
      end if;
      if (zgrp_lv01_bin00(56) = '1') or (zgrp_lv01_bin00(57) = '1') or (zgrp_lv01_bin00(58) = '1') or (zgrp_lv01_bin00(59) = '1') then
        zgrp_lv02_bin00(14) <= '1';
      else
        zgrp_lv02_bin00(14) <= '0';
      end if;
      if (zgrp_lv01_bin00(60) = '1') or (zgrp_lv01_bin00(61) = '1') or (zgrp_lv01_bin00(62) = '1') or (zgrp_lv01_bin00(63) = '1') then
        zgrp_lv02_bin00(15) <= '1';
      else
        zgrp_lv02_bin00(15) <= '0';
      end if;
      if (zgrp_lv01_bin00(64) = '1') or (zgrp_lv01_bin00(65) = '1') or (zgrp_lv01_bin00(66) = '1') or (zgrp_lv01_bin00(67) = '1') then
        zgrp_lv02_bin00(16) <= '1';
      else
        zgrp_lv02_bin00(16) <= '0';
      end if;
      if (zgrp_lv01_bin00(68) = '1') or (zgrp_lv01_bin00(69) = '1') or (zgrp_lv01_bin00(70) = '1') or (zgrp_lv01_bin00(71) = '1') then
        zgrp_lv02_bin00(17) <= '1';
      else
        zgrp_lv02_bin00(17) <= '0';
      end if;
      if (zgrp_lv01_bin00(72) = '1') or (zgrp_lv01_bin00(73) = '1') or (zgrp_lv01_bin00(74) = '1') or (zgrp_lv01_bin00(75) = '1') then
        zgrp_lv02_bin00(18) <= '1';
      else
        zgrp_lv02_bin00(18) <= '0';
      end if;
      if (zgrp_lv01_bin00(76) = '1') or (zgrp_lv01_bin00(77) = '1') or (zgrp_lv01_bin00(78) = '1') or (zgrp_lv01_bin00(79) = '1') then
        zgrp_lv02_bin00(19) <= '1';
      else
        zgrp_lv02_bin00(19) <= '0';
      end if;
      if (zgrp_lv01_bin00(80) = '1') or (zgrp_lv01_bin00(81) = '1') or (zgrp_lv01_bin00(82) = '1') or (zgrp_lv01_bin00(83) = '1') then
        zgrp_lv02_bin00(20) <= '1';
      else
        zgrp_lv02_bin00(20) <= '0';
      end if;
      if (zgrp_lv01_bin00(84) = '1') or (zgrp_lv01_bin00(85) = '1') or (zgrp_lv01_bin00(86) = '1') or (zgrp_lv01_bin00(87) = '1') then
        zgrp_lv02_bin00(21) <= '1';
      else
        zgrp_lv02_bin00(21) <= '0';
      end if;
      if (zgrp_lv01_bin00(88) = '1') or (zgrp_lv01_bin00(89) = '1') or (zgrp_lv01_bin00(90) = '1') or (zgrp_lv01_bin00(91) = '1') then
        zgrp_lv02_bin00(22) <= '1';
      else
        zgrp_lv02_bin00(22) <= '0';
      end if;
      if (zgrp_lv01_bin00(92) = '1') or (zgrp_lv01_bin00(93) = '1') or (zgrp_lv01_bin00(94) = '1') or (zgrp_lv01_bin00(95) = '1') then
        zgrp_lv02_bin00(23) <= '1';
      else
        zgrp_lv02_bin00(23) <= '0';
      end if;
      if (zgrp_lv01_bin00(96) = '1') or (zgrp_lv01_bin00(97) = '1') or (zgrp_lv01_bin00(98) = '1') or (zgrp_lv01_bin00(99) = '1') then
        zgrp_lv02_bin00(24) <= '1';
      else
        zgrp_lv02_bin00(24) <= '0';
      end if;
      if (zgrp_lv01_bin00(100) = '1') or (zgrp_lv01_bin00(101) = '1') or (zgrp_lv01_bin00(102) = '1') or (zgrp_lv01_bin00(103) = '1') then
        zgrp_lv02_bin00(25) <= '1';
      else
        zgrp_lv02_bin00(25) <= '0';
      end if;
      if (zgrp_lv01_bin00(104) = '1') or (zgrp_lv01_bin00(105) = '1') or (zgrp_lv01_bin00(106) = '1') or (zgrp_lv01_bin00(107) = '1') then
        zgrp_lv02_bin00(26) <= '1';
      else
        zgrp_lv02_bin00(26) <= '0';
      end if;
      if (zgrp_lv01_bin00(108) = '1') or (zgrp_lv01_bin00(109) = '1') or (zgrp_lv01_bin00(110) = '1') or (zgrp_lv01_bin00(111) = '1') then
        zgrp_lv02_bin00(27) <= '1';
      else
        zgrp_lv02_bin00(27) <= '0';
      end if;
      if (zgrp_lv01_bin00(112) = '1') or (zgrp_lv01_bin00(113) = '1') or (zgrp_lv01_bin00(114) = '1') or (zgrp_lv01_bin00(115) = '1') then
        zgrp_lv02_bin00(28) <= '1';
      else
        zgrp_lv02_bin00(28) <= '0';
      end if;
      if (zgrp_lv01_bin00(116) = '1') or (zgrp_lv01_bin00(117) = '1') or (zgrp_lv01_bin00(118) = '1') or (zgrp_lv01_bin00(119) = '1') then
        zgrp_lv02_bin00(29) <= '1';
      else
        zgrp_lv02_bin00(29) <= '0';
      end if;
      if (zgrp_lv01_bin00(120) = '1') or (zgrp_lv01_bin00(121) = '1') or (zgrp_lv01_bin00(122) = '1') or (zgrp_lv01_bin00(123) = '1') then
        zgrp_lv02_bin00(30) <= '1';
      else
        zgrp_lv02_bin00(30) <= '0';
      end if;
      if (zgrp_lv01_bin00(124) = '1') or (zgrp_lv01_bin00(125) = '1') or (zgrp_lv01_bin00(126) = '1') or (zgrp_lv01_bin00(127) = '1') then
        zgrp_lv02_bin00(31) <= '1';
      else
        zgrp_lv02_bin00(31) <= '0';
      end if;
      if (zgrp_lv01_bin00(128) = '1') or (zgrp_lv01_bin00(129) = '1') or (zgrp_lv01_bin00(130) = '1') or (zgrp_lv01_bin00(131) = '1') then
        zgrp_lv02_bin00(32) <= '1';
      else
        zgrp_lv02_bin00(32) <= '0';
      end if;
      if (zgrp_lv01_bin00(132) = '1') or (zgrp_lv01_bin00(133) = '1') or (zgrp_lv01_bin00(134) = '1') or (zgrp_lv01_bin00(135) = '1') then
        zgrp_lv02_bin00(33) <= '1';
      else
        zgrp_lv02_bin00(33) <= '0';
      end if;
      if (zgrp_lv01_bin00(136) = '1') or (zgrp_lv01_bin00(137) = '1') or (zgrp_lv01_bin00(138) = '1') or (zgrp_lv01_bin00(139) = '1') then
        zgrp_lv02_bin00(34) <= '1';
      else
        zgrp_lv02_bin00(34) <= '0';
      end if;
      if (zgrp_lv01_bin00(140) = '1') or (zgrp_lv01_bin00(141) = '1') or (zgrp_lv01_bin00(142) = '1') or (zgrp_lv01_bin00(143) = '1') then
        zgrp_lv02_bin00(35) <= '1';
      else
        zgrp_lv02_bin00(35) <= '0';
      end if;
      if (zgrp_lv01_bin00(144) = '1') or (zgrp_lv01_bin00(145) = '1') or (zgrp_lv01_bin00(146) = '1') or (zgrp_lv01_bin00(147) = '1') then
        zgrp_lv02_bin00(36) <= '1';
      else
        zgrp_lv02_bin00(36) <= '0';
      end if;
      if (zgrp_lv01_bin00(148) = '1') or (zgrp_lv01_bin00(149) = '1') or (zgrp_lv01_bin00(150) = '1') or (zgrp_lv01_bin00(151) = '1') then
        zgrp_lv02_bin00(37) <= '1';
      else
        zgrp_lv02_bin00(37) <= '0';
      end if;
      if (zgrp_lv01_bin00(152) = '1') or (zgrp_lv01_bin00(153) = '1') or (zgrp_lv01_bin00(154) = '1') or (zgrp_lv01_bin00(155) = '1') then
        zgrp_lv02_bin00(38) <= '1';
      else
        zgrp_lv02_bin00(38) <= '0';
      end if;
      if (zgrp_lv01_bin00(156) = '1') or (zgrp_lv01_bin00(157) = '1') or (zgrp_lv01_bin00(158) = '1') or (zgrp_lv01_bin00(159) = '1') then
        zgrp_lv02_bin00(39) <= '1';
      else
        zgrp_lv02_bin00(39) <= '0';
      end if;
      if (zgrp_lv01_bin00(160) = '1') or (zgrp_lv01_bin00(161) = '1') or (zgrp_lv01_bin00(162) = '1') or (zgrp_lv01_bin00(163) = '1') then
        zgrp_lv02_bin00(40) <= '1';
      else
        zgrp_lv02_bin00(40) <= '0';
      end if;
      if (zgrp_lv01_bin00(164) = '1') or (zgrp_lv01_bin00(165) = '1') or (zgrp_lv01_bin00(166) = '1') or (zgrp_lv01_bin00(167) = '1') then
        zgrp_lv02_bin00(41) <= '1';
      else
        zgrp_lv02_bin00(41) <= '0';
      end if;
      if (zgrp_lv01_bin00(168) = '1') or (zgrp_lv01_bin00(169) = '1') or (zgrp_lv01_bin00(170) = '1') or (zgrp_lv01_bin00(171) = '1') then
        zgrp_lv02_bin00(42) <= '1';
      else
        zgrp_lv02_bin00(42) <= '0';
      end if;
      if (zgrp_lv01_bin00(172) = '1') or (zgrp_lv01_bin00(173) = '1') or (zgrp_lv01_bin00(174) = '1') or (zgrp_lv01_bin00(175) = '1') then
        zgrp_lv02_bin00(43) <= '1';
      else
        zgrp_lv02_bin00(43) <= '0';
      end if;
      if (zgrp_lv01_bin00(176) = '1') or (zgrp_lv01_bin00(177) = '1') or (zgrp_lv01_bin00(178) = '1') or (zgrp_lv01_bin00(179) = '1') then
        zgrp_lv02_bin00(44) <= '1';
      else
        zgrp_lv02_bin00(44) <= '0';
      end if;
      if (zgrp_lv01_bin00(180) = '1') or (zgrp_lv01_bin00(181) = '1') or (zgrp_lv01_bin00(182) = '1') or (zgrp_lv01_bin00(183) = '1') then
        zgrp_lv02_bin00(45) <= '1';
      else
        zgrp_lv02_bin00(45) <= '0';
      end if;
      if (zgrp_lv01_bin00(184) = '1') or (zgrp_lv01_bin00(185) = '1') or (zgrp_lv01_bin00(186) = '1') or (zgrp_lv01_bin00(187) = '1') then
        zgrp_lv02_bin00(46) <= '1';
      else
        zgrp_lv02_bin00(46) <= '0';
      end if;
      if (zgrp_lv01_bin00(188) = '1') or (zgrp_lv01_bin00(189) = '1') or (zgrp_lv01_bin00(190) = '1') or (zgrp_lv01_bin00(191) = '1') then
        zgrp_lv02_bin00(47) <= '1';
      else
        zgrp_lv02_bin00(47) <= '0';
      end if;
      if (zgrp_lv01_bin00(192) = '1') or (zgrp_lv01_bin00(193) = '1') or (zgrp_lv01_bin00(194) = '1') or (zgrp_lv01_bin00(195) = '1') then
        zgrp_lv02_bin00(48) <= '1';
      else
        zgrp_lv02_bin00(48) <= '0';
      end if;
      if (zgrp_lv01_bin00(196) = '1') or (zgrp_lv01_bin00(197) = '1') or (zgrp_lv01_bin00(198) = '1') or (zgrp_lv01_bin00(199) = '1') then
        zgrp_lv02_bin00(49) <= '1';
      else
        zgrp_lv02_bin00(49) <= '0';
      end if;
      if (zgrp_lv01_bin00(200) = '1') or (zgrp_lv01_bin00(201) = '1') or (zgrp_lv01_bin00(202) = '1') or (zgrp_lv01_bin00(203) = '1') then
        zgrp_lv02_bin00(50) <= '1';
      else
        zgrp_lv02_bin00(50) <= '0';
      end if;
      if (zgrp_lv01_bin00(204) = '1') or (zgrp_lv01_bin00(205) = '1') or (zgrp_lv01_bin00(206) = '1') or (zgrp_lv01_bin00(207) = '1') then
        zgrp_lv02_bin00(51) <= '1';
      else
        zgrp_lv02_bin00(51) <= '0';
      end if;
      if (zgrp_lv01_bin00(208) = '1') or (zgrp_lv01_bin00(209) = '1') or (zgrp_lv01_bin00(210) = '1') or (zgrp_lv01_bin00(211) = '1') then
        zgrp_lv02_bin00(52) <= '1';
      else
        zgrp_lv02_bin00(52) <= '0';
      end if;
      if (zgrp_lv01_bin00(212) = '1') or (zgrp_lv01_bin00(213) = '1') or (zgrp_lv01_bin00(214) = '1') or (zgrp_lv01_bin00(215) = '1') then
        zgrp_lv02_bin00(53) <= '1';
      else
        zgrp_lv02_bin00(53) <= '0';
      end if;
      if (zgrp_lv01_bin00(216) = '1') or (zgrp_lv01_bin00(217) = '1') or (zgrp_lv01_bin00(218) = '1') or (zgrp_lv01_bin00(219) = '1') then
        zgrp_lv02_bin00(54) <= '1';
      else
        zgrp_lv02_bin00(54) <= '0';
      end if;
      if (zgrp_lv01_bin00(220) = '1') or (zgrp_lv01_bin00(221) = '1') or (zgrp_lv01_bin00(222) = '1') or (zgrp_lv01_bin00(223) = '1') then
        zgrp_lv02_bin00(55) <= '1';
      else
        zgrp_lv02_bin00(55) <= '0';
      end if;
      if (zgrp_lv01_bin00(224) = '1') or (zgrp_lv01_bin00(225) = '1') or (zgrp_lv01_bin00(226) = '1') or (zgrp_lv01_bin00(227) = '1') then
        zgrp_lv02_bin00(56) <= '1';
      else
        zgrp_lv02_bin00(56) <= '0';
      end if;
      if (zgrp_lv01_bin00(228) = '1') or (zgrp_lv01_bin00(229) = '1') or (zgrp_lv01_bin00(230) = '1') or (zgrp_lv01_bin00(231) = '1') then
        zgrp_lv02_bin00(57) <= '1';
      else
        zgrp_lv02_bin00(57) <= '0';
      end if;
      if (zgrp_lv01_bin00(232) = '1') or (zgrp_lv01_bin00(233) = '1') or (zgrp_lv01_bin00(234) = '1') or (zgrp_lv01_bin00(235) = '1') then
        zgrp_lv02_bin00(58) <= '1';
      else
        zgrp_lv02_bin00(58) <= '0';
      end if;
      if (zgrp_lv01_bin00(236) = '1') or (zgrp_lv01_bin00(237) = '1') or (zgrp_lv01_bin00(238) = '1') or (zgrp_lv01_bin00(239) = '1') then
        zgrp_lv02_bin00(59) <= '1';
      else
        zgrp_lv02_bin00(59) <= '0';
      end if;
      if (zgrp_lv01_bin00(240) = '1') or (zgrp_lv01_bin00(241) = '1') or (zgrp_lv01_bin00(242) = '1') or (zgrp_lv01_bin00(243) = '1') then
        zgrp_lv02_bin00(60) <= '1';
      else
        zgrp_lv02_bin00(60) <= '0';
      end if;
      if (zgrp_lv01_bin00(244) = '1') or (zgrp_lv01_bin00(245) = '1') or (zgrp_lv01_bin00(246) = '1') or (zgrp_lv01_bin00(247) = '1') then
        zgrp_lv02_bin00(61) <= '1';
      else
        zgrp_lv02_bin00(61) <= '0';
      end if;
      if (zgrp_lv01_bin00(248) = '1') or (zgrp_lv01_bin00(249) = '1') or (zgrp_lv01_bin00(250) = '1') or (zgrp_lv01_bin00(251) = '1') then
        zgrp_lv02_bin00(62) <= '1';
      else
        zgrp_lv02_bin00(62) <= '0';
      end if;
      if (zgrp_lv01_bin00(252) = '1') or (zgrp_lv01_bin00(253) = '1') or (zgrp_lv01_bin00(254) = '1') or (zgrp_lv01_bin00(255) = '1') then
        zgrp_lv02_bin00(63) <= '1';
      else
        zgrp_lv02_bin00(63) <= '0';
      end if;
      if (zgrp_lv01_bin00(256) = '1') or (zgrp_lv01_bin00(257) = '1') or (zgrp_lv01_bin00(258) = '1') or (zgrp_lv01_bin00(259) = '1') then
        zgrp_lv02_bin00(64) <= '1';
      else
        zgrp_lv02_bin00(64) <= '0';
      end if;
      if (zgrp_lv01_bin00(260) = '1') or (zgrp_lv01_bin00(261) = '1') or (zgrp_lv01_bin00(262) = '1') or (zgrp_lv01_bin00(263) = '1') then
        zgrp_lv02_bin00(65) <= '1';
      else
        zgrp_lv02_bin00(65) <= '0';
      end if;
      if (zgrp_lv01_bin00(264) = '1') or (zgrp_lv01_bin00(265) = '1') or (zgrp_lv01_bin00(266) = '1') or (zgrp_lv01_bin00(267) = '1') then
        zgrp_lv02_bin00(66) <= '1';
      else
        zgrp_lv02_bin00(66) <= '0';
      end if;
      if (zgrp_lv01_bin00(268) = '1') or (zgrp_lv01_bin00(269) = '1') or (zgrp_lv01_bin00(270) = '1') or (zgrp_lv01_bin00(271) = '1') then
        zgrp_lv02_bin00(67) <= '1';
      else
        zgrp_lv02_bin00(67) <= '0';
      end if;
      if (zgrp_lv01_bin00(272) = '1') or (zgrp_lv01_bin00(273) = '1') or (zgrp_lv01_bin00(274) = '1') or (zgrp_lv01_bin00(275) = '1') then
        zgrp_lv02_bin00(68) <= '1';
      else
        zgrp_lv02_bin00(68) <= '0';
      end if;
      if (zgrp_lv01_bin00(276) = '1') or (zgrp_lv01_bin00(277) = '1') or (zgrp_lv01_bin00(278) = '1') or (zgrp_lv01_bin00(279) = '1') then
        zgrp_lv02_bin00(69) <= '1';
      else
        zgrp_lv02_bin00(69) <= '0';
      end if;
      if (zgrp_lv01_bin00(280) = '1') or (zgrp_lv01_bin00(281) = '1') or (zgrp_lv01_bin00(282) = '1') or (zgrp_lv01_bin00(283) = '1') then
        zgrp_lv02_bin00(70) <= '1';
      else
        zgrp_lv02_bin00(70) <= '0';
      end if;
      if (zgrp_lv01_bin00(284) = '1') or (zgrp_lv01_bin00(285) = '1') or (zgrp_lv01_bin00(286) = '1') or (zgrp_lv01_bin00(287) = '1') then
        zgrp_lv02_bin00(71) <= '1';
      else
        zgrp_lv02_bin00(71) <= '0';
      end if;
      if (zgrp_lv01_bin00(288) = '1') or (zgrp_lv01_bin00(289) = '1') or (zgrp_lv01_bin00(290) = '1') or (zgrp_lv01_bin00(291) = '1') then
        zgrp_lv02_bin00(72) <= '1';
      else
        zgrp_lv02_bin00(72) <= '0';
      end if;
      if (zgrp_lv01_bin00(292) = '1') or (zgrp_lv01_bin00(293) = '1') or (zgrp_lv01_bin00(294) = '1') or (zgrp_lv01_bin00(295) = '1') then
        zgrp_lv02_bin00(73) <= '1';
      else
        zgrp_lv02_bin00(73) <= '0';
      end if;
      if (zgrp_lv01_bin00(296) = '1') or (zgrp_lv01_bin00(297) = '1') or (zgrp_lv01_bin00(298) = '1') or (zgrp_lv01_bin00(299) = '1') then
        zgrp_lv02_bin00(74) <= '1';
      else
        zgrp_lv02_bin00(74) <= '0';
      end if;
      if (zgrp_lv01_bin00(300) = '1') or (zgrp_lv01_bin00(301) = '1') or (zgrp_lv01_bin00(302) = '1') or (zgrp_lv01_bin00(303) = '1') then
        zgrp_lv02_bin00(75) <= '1';
      else
        zgrp_lv02_bin00(75) <= '0';
      end if;
      if (zgrp_lv01_bin00(304) = '1') or (zgrp_lv01_bin00(305) = '1') or (zgrp_lv01_bin00(306) = '1') or (zgrp_lv01_bin00(307) = '1') then
        zgrp_lv02_bin00(76) <= '1';
      else
        zgrp_lv02_bin00(76) <= '0';
      end if;
      if (zgrp_lv01_bin00(308) = '1') or (zgrp_lv01_bin00(309) = '1') or (zgrp_lv01_bin00(310) = '1') or (zgrp_lv01_bin00(311) = '1') then
        zgrp_lv02_bin00(77) <= '1';
      else
        zgrp_lv02_bin00(77) <= '0';
      end if;
      if (zgrp_lv01_bin00(312) = '1') or (zgrp_lv01_bin00(313) = '1') or (zgrp_lv01_bin00(314) = '1') or (zgrp_lv01_bin00(315) = '1') then
        zgrp_lv02_bin00(78) <= '1';
      else
        zgrp_lv02_bin00(78) <= '0';
      end if;
      if (zgrp_lv01_bin00(316) = '1') or (zgrp_lv01_bin00(317) = '1') or (zgrp_lv01_bin00(318) = '1') or (zgrp_lv01_bin00(319) = '1') then
        zgrp_lv02_bin00(79) <= '1';
      else
        zgrp_lv02_bin00(79) <= '0';
      end if;
      if (zgrp_lv01_bin00(320) = '1') or (zgrp_lv01_bin00(321) = '1') or (zgrp_lv01_bin00(322) = '1') or (zgrp_lv01_bin00(323) = '1') then
        zgrp_lv02_bin00(80) <= '1';
      else
        zgrp_lv02_bin00(80) <= '0';
      end if;
      if (zgrp_lv01_bin00(324) = '1') or (zgrp_lv01_bin00(325) = '1') or (zgrp_lv01_bin00(326) = '1') or (zgrp_lv01_bin00(327) = '1') then
        zgrp_lv02_bin00(81) <= '1';
      else
        zgrp_lv02_bin00(81) <= '0';
      end if;
      if (zgrp_lv01_bin00(328) = '1') or (zgrp_lv01_bin00(329) = '1') or (zgrp_lv01_bin00(330) = '1') or (zgrp_lv01_bin00(331) = '1') then
        zgrp_lv02_bin00(82) <= '1';
      else
        zgrp_lv02_bin00(82) <= '0';
      end if;
      if (zgrp_lv01_bin00(332) = '1') or (zgrp_lv01_bin00(333) = '1') or (zgrp_lv01_bin00(334) = '1') or (zgrp_lv01_bin00(335) = '1') then
        zgrp_lv02_bin00(83) <= '1';
      else
        zgrp_lv02_bin00(83) <= '0';
      end if;
      if (zgrp_lv01_bin00(336) = '1') or (zgrp_lv01_bin00(337) = '1') or (zgrp_lv01_bin00(338) = '1') or (zgrp_lv01_bin00(339) = '1') then
        zgrp_lv02_bin00(84) <= '1';
      else
        zgrp_lv02_bin00(84) <= '0';
      end if;
      if (zgrp_lv01_bin00(340) = '1') or (zgrp_lv01_bin00(341) = '1') or (zgrp_lv01_bin00(342) = '1') or (zgrp_lv01_bin00(343) = '1') then
        zgrp_lv02_bin00(85) <= '1';
      else
        zgrp_lv02_bin00(85) <= '0';
      end if;
      if (zgrp_lv01_bin00(344) = '1') or (zgrp_lv01_bin00(345) = '1') or (zgrp_lv01_bin00(346) = '1') or (zgrp_lv01_bin00(347) = '1') then
        zgrp_lv02_bin00(86) <= '1';
      else
        zgrp_lv02_bin00(86) <= '0';
      end if;
      if (zgrp_lv01_bin00(348) = '1') or (zgrp_lv01_bin00(349) = '1') or (zgrp_lv01_bin00(350) = '1') or (zgrp_lv01_bin00(351) = '1') then
        zgrp_lv02_bin00(87) <= '1';
      else
        zgrp_lv02_bin00(87) <= '0';
      end if;
      if (zgrp_lv01_bin00(352) = '1') or (zgrp_lv01_bin00(353) = '1') or (zgrp_lv01_bin00(354) = '1') or (zgrp_lv01_bin00(355) = '1') then
        zgrp_lv02_bin00(88) <= '1';
      else
        zgrp_lv02_bin00(88) <= '0';
      end if;
      if (zgrp_lv01_bin00(356) = '1') or (zgrp_lv01_bin00(357) = '1') or (zgrp_lv01_bin00(358) = '1') or (zgrp_lv01_bin00(359) = '1') then
        zgrp_lv02_bin00(89) <= '1';
      else
        zgrp_lv02_bin00(89) <= '0';
      end if;
      if (zgrp_lv01_bin00(360) = '1') or (zgrp_lv01_bin00(361) = '1') or (zgrp_lv01_bin00(362) = '1') or (zgrp_lv01_bin00(363) = '1') then
        zgrp_lv02_bin00(90) <= '1';
      else
        zgrp_lv02_bin00(90) <= '0';
      end if;
      if (zgrp_lv01_bin00(364) = '1') or (zgrp_lv01_bin00(365) = '1') or (zgrp_lv01_bin00(366) = '1') or (zgrp_lv01_bin00(367) = '1') then
        zgrp_lv02_bin00(91) <= '1';
      else
        zgrp_lv02_bin00(91) <= '0';
      end if;
      if (zgrp_lv01_bin00(368) = '1') or (zgrp_lv01_bin00(369) = '1') or (zgrp_lv01_bin00(370) = '1') or (zgrp_lv01_bin00(371) = '1') then
        zgrp_lv02_bin00(92) <= '1';
      else
        zgrp_lv02_bin00(92) <= '0';
      end if;
      if (zgrp_lv01_bin00(372) = '1') or (zgrp_lv01_bin00(373) = '1') or (zgrp_lv01_bin00(374) = '1') or (zgrp_lv01_bin00(375) = '1') then
        zgrp_lv02_bin00(93) <= '1';
      else
        zgrp_lv02_bin00(93) <= '0';
      end if;
      if (zgrp_lv01_bin00(376) = '1') or (zgrp_lv01_bin00(377) = '1') or (zgrp_lv01_bin00(378) = '1') or (zgrp_lv01_bin00(379) = '1') then
        zgrp_lv02_bin00(94) <= '1';
      else
        zgrp_lv02_bin00(94) <= '0';
      end if;
      if (zgrp_lv01_bin00(380) = '1') or (zgrp_lv01_bin00(381) = '1') or (zgrp_lv01_bin00(382) = '1') or (zgrp_lv01_bin00(383) = '1') then
        zgrp_lv02_bin00(95) <= '1';
      else
        zgrp_lv02_bin00(95) <= '0';
      end if;
      if (zgrp_lv01_bin00(384) = '1') or (zgrp_lv01_bin00(385) = '1') or (zgrp_lv01_bin00(386) = '1') or (zgrp_lv01_bin00(387) = '1') then
        zgrp_lv02_bin00(96) <= '1';
      else
        zgrp_lv02_bin00(96) <= '0';
      end if;
      if (zgrp_lv01_bin00(388) = '1') or (zgrp_lv01_bin00(389) = '1') or (zgrp_lv01_bin00(390) = '1') or (zgrp_lv01_bin00(391) = '1') then
        zgrp_lv02_bin00(97) <= '1';
      else
        zgrp_lv02_bin00(97) <= '0';
      end if;
      if (zgrp_lv01_bin00(392) = '1') or (zgrp_lv01_bin00(393) = '1') or (zgrp_lv01_bin00(394) = '1') or (zgrp_lv01_bin00(395) = '1') then
        zgrp_lv02_bin00(98) <= '1';
      else
        zgrp_lv02_bin00(98) <= '0';
      end if;
      if (zgrp_lv01_bin00(396) = '1') or (zgrp_lv01_bin00(397) = '1') or (zgrp_lv01_bin00(398) = '1') or (zgrp_lv01_bin00(399) = '1') then
        zgrp_lv02_bin00(99) <= '1';
      else
        zgrp_lv02_bin00(99) <= '0';
      end if;
      if (zgrp_lv01_bin00(400) = '1') or (zgrp_lv01_bin00(401) = '1') or (zgrp_lv01_bin00(402) = '1') or (zgrp_lv01_bin00(403) = '1') then
        zgrp_lv02_bin00(100) <= '1';
      else
        zgrp_lv02_bin00(100) <= '0';
      end if;
      if (zgrp_lv01_bin00(404) = '1') or (zgrp_lv01_bin00(405) = '1') or (zgrp_lv01_bin00(406) = '1') or (zgrp_lv01_bin00(407) = '1') then
        zgrp_lv02_bin00(101) <= '1';
      else
        zgrp_lv02_bin00(101) <= '0';
      end if;
      if (zgrp_lv01_bin00(408) = '1') or (zgrp_lv01_bin00(409) = '1') or (zgrp_lv01_bin00(410) = '1') or (zgrp_lv01_bin00(411) = '1') then
        zgrp_lv02_bin00(102) <= '1';
      else
        zgrp_lv02_bin00(102) <= '0';
      end if;
      if (zgrp_lv01_bin00(412) = '1') or (zgrp_lv01_bin00(413) = '1') or (zgrp_lv01_bin00(414) = '1') or (zgrp_lv01_bin00(415) = '1') then
        zgrp_lv02_bin00(103) <= '1';
      else
        zgrp_lv02_bin00(103) <= '0';
      end if;
      if (zgrp_lv01_bin00(416) = '1') or (zgrp_lv01_bin00(417) = '1') or (zgrp_lv01_bin00(418) = '1') or (zgrp_lv01_bin00(419) = '1') then
        zgrp_lv02_bin00(104) <= '1';
      else
        zgrp_lv02_bin00(104) <= '0';
      end if;
      if (zgrp_lv01_bin00(420) = '1') or (zgrp_lv01_bin00(421) = '1') or (zgrp_lv01_bin00(422) = '1') or (zgrp_lv01_bin00(423) = '1') then
        zgrp_lv02_bin00(105) <= '1';
      else
        zgrp_lv02_bin00(105) <= '0';
      end if;
      if (zgrp_lv01_bin00(424) = '1') or (zgrp_lv01_bin00(425) = '1') or (zgrp_lv01_bin00(426) = '1') or (zgrp_lv01_bin00(427) = '1') then
        zgrp_lv02_bin00(106) <= '1';
      else
        zgrp_lv02_bin00(106) <= '0';
      end if;
      if (zgrp_lv01_bin00(428) = '1') or (zgrp_lv01_bin00(429) = '1') or (zgrp_lv01_bin00(430) = '1') or (zgrp_lv01_bin00(431) = '1') then
        zgrp_lv02_bin00(107) <= '1';
      else
        zgrp_lv02_bin00(107) <= '0';
      end if;
      if (zgrp_lv01_bin00(432) = '1') or (zgrp_lv01_bin00(433) = '1') or (zgrp_lv01_bin00(434) = '1') or (zgrp_lv01_bin00(435) = '1') then
        zgrp_lv02_bin00(108) <= '1';
      else
        zgrp_lv02_bin00(108) <= '0';
      end if;
      if (zgrp_lv01_bin00(436) = '1') or (zgrp_lv01_bin00(437) = '1') or (zgrp_lv01_bin00(438) = '1') or (zgrp_lv01_bin00(439) = '1') then
        zgrp_lv02_bin00(109) <= '1';
      else
        zgrp_lv02_bin00(109) <= '0';
      end if;
      if (zgrp_lv01_bin00(440) = '1') or (zgrp_lv01_bin00(441) = '1') or (zgrp_lv01_bin00(442) = '1') or (zgrp_lv01_bin00(443) = '1') then
        zgrp_lv02_bin00(110) <= '1';
      else
        zgrp_lv02_bin00(110) <= '0';
      end if;
      if (zgrp_lv01_bin00(444) = '1') or (zgrp_lv01_bin00(445) = '1') or (zgrp_lv01_bin00(446) = '1') or (zgrp_lv01_bin00(447) = '1') then
        zgrp_lv02_bin00(111) <= '1';
      else
        zgrp_lv02_bin00(111) <= '0';
      end if;
      if (zgrp_lv01_bin00(448) = '1') or (zgrp_lv01_bin00(449) = '1') or (zgrp_lv01_bin00(450) = '1') or (zgrp_lv01_bin00(451) = '1') then
        zgrp_lv02_bin00(112) <= '1';
      else
        zgrp_lv02_bin00(112) <= '0';
      end if;
      if (zgrp_lv01_bin00(452) = '1') or (zgrp_lv01_bin00(453) = '1') or (zgrp_lv01_bin00(454) = '1') or (zgrp_lv01_bin00(455) = '1') then
        zgrp_lv02_bin00(113) <= '1';
      else
        zgrp_lv02_bin00(113) <= '0';
      end if;
      if (zgrp_lv01_bin00(456) = '1') or (zgrp_lv01_bin00(457) = '1') or (zgrp_lv01_bin00(458) = '1') or (zgrp_lv01_bin00(459) = '1') then
        zgrp_lv02_bin00(114) <= '1';
      else
        zgrp_lv02_bin00(114) <= '0';
      end if;
      if (zgrp_lv01_bin00(460) = '1') or (zgrp_lv01_bin00(461) = '1') or (zgrp_lv01_bin00(462) = '1') or (zgrp_lv01_bin00(463) = '1') then
        zgrp_lv02_bin00(115) <= '1';
      else
        zgrp_lv02_bin00(115) <= '0';
      end if;
      if (zgrp_lv01_bin00(464) = '1') or (zgrp_lv01_bin00(465) = '1') or (zgrp_lv01_bin00(466) = '1') or (zgrp_lv01_bin00(467) = '1') then
        zgrp_lv02_bin00(116) <= '1';
      else
        zgrp_lv02_bin00(116) <= '0';
      end if;
      if (zgrp_lv01_bin00(468) = '1') or (zgrp_lv01_bin00(469) = '1') or (zgrp_lv01_bin00(470) = '1') or (zgrp_lv01_bin00(471) = '1') then
        zgrp_lv02_bin00(117) <= '1';
      else
        zgrp_lv02_bin00(117) <= '0';
      end if;
      if (zgrp_lv01_bin00(472) = '1') or (zgrp_lv01_bin00(473) = '1') or (zgrp_lv01_bin00(474) = '1') or (zgrp_lv01_bin00(475) = '1') then
        zgrp_lv02_bin00(118) <= '1';
      else
        zgrp_lv02_bin00(118) <= '0';
      end if;
      if (zgrp_lv01_bin00(476) = '1') or (zgrp_lv01_bin00(477) = '1') or (zgrp_lv01_bin00(478) = '1') or (zgrp_lv01_bin00(479) = '1') then
        zgrp_lv02_bin00(119) <= '1';
      else
        zgrp_lv02_bin00(119) <= '0';
      end if;
      if (zgrp_lv01_bin00(480) = '1') or (zgrp_lv01_bin00(481) = '1') or (zgrp_lv01_bin00(482) = '1') or (zgrp_lv01_bin00(483) = '1') then
        zgrp_lv02_bin00(120) <= '1';
      else
        zgrp_lv02_bin00(120) <= '0';
      end if;
      if (zgrp_lv01_bin00(484) = '1') or (zgrp_lv01_bin00(485) = '1') or (zgrp_lv01_bin00(486) = '1') or (zgrp_lv01_bin00(487) = '1') then
        zgrp_lv02_bin00(121) <= '1';
      else
        zgrp_lv02_bin00(121) <= '0';
      end if;
      if (zgrp_lv01_bin00(488) = '1') or (zgrp_lv01_bin00(489) = '1') or (zgrp_lv01_bin00(490) = '1') or (zgrp_lv01_bin00(491) = '1') then
        zgrp_lv02_bin00(122) <= '1';
      else
        zgrp_lv02_bin00(122) <= '0';
      end if;
      if (zgrp_lv01_bin00(492) = '1') or (zgrp_lv01_bin00(493) = '1') or (zgrp_lv01_bin00(494) = '1') or (zgrp_lv01_bin00(495) = '1') then
        zgrp_lv02_bin00(123) <= '1';
      else
        zgrp_lv02_bin00(123) <= '0';
      end if;
      if (zgrp_lv01_bin00(496) = '1') or (zgrp_lv01_bin00(497) = '1') or (zgrp_lv01_bin00(498) = '1') or (zgrp_lv01_bin00(499) = '1') then
        zgrp_lv02_bin00(124) <= '1';
      else
        zgrp_lv02_bin00(124) <= '0';
      end if;
      if (zgrp_lv01_bin00(500) = '1') or (zgrp_lv01_bin00(501) = '1') or (zgrp_lv01_bin00(502) = '1') or (zgrp_lv01_bin00(503) = '1') then
        zgrp_lv02_bin00(125) <= '1';
      else
        zgrp_lv02_bin00(125) <= '0';
      end if;
      if (zgrp_lv01_bin00(504) = '1') or (zgrp_lv01_bin00(505) = '1') or (zgrp_lv01_bin00(506) = '1') or (zgrp_lv01_bin00(507) = '1') then
        zgrp_lv02_bin00(126) <= '1';
      else
        zgrp_lv02_bin00(126) <= '0';
      end if;
      if (zgrp_lv01_bin00(508) = '1') or (zgrp_lv01_bin00(509) = '1') or (zgrp_lv01_bin00(510) = '1') or (zgrp_lv01_bin00(511) = '1') then
        zgrp_lv02_bin00(127) <= '1';
      else
        zgrp_lv02_bin00(127) <= '0';
      end if;
      if (zgrp_lv01_bin00(512) = '1') or (zgrp_lv01_bin00(513) = '1') or (zgrp_lv01_bin00(514) = '1') or (zgrp_lv01_bin00(515) = '1') then
        zgrp_lv02_bin00(128) <= '1';
      else
        zgrp_lv02_bin00(128) <= '0';
      end if;
      if (zgrp_lv01_bin00(516) = '1') or (zgrp_lv01_bin00(517) = '1') or (zgrp_lv01_bin00(518) = '1') or (zgrp_lv01_bin00(519) = '1') then
        zgrp_lv02_bin00(129) <= '1';
      else
        zgrp_lv02_bin00(129) <= '0';
      end if;
      if (zgrp_lv01_bin00(520) = '1') or (zgrp_lv01_bin00(521) = '1') or (zgrp_lv01_bin00(522) = '1') or (zgrp_lv01_bin00(523) = '1') then
        zgrp_lv02_bin00(130) <= '1';
      else
        zgrp_lv02_bin00(130) <= '0';
      end if;
      if (zgrp_lv01_bin00(524) = '1') or (zgrp_lv01_bin00(525) = '1') or (zgrp_lv01_bin00(526) = '1') or (zgrp_lv01_bin00(527) = '1') then
        zgrp_lv02_bin00(131) <= '1';
      else
        zgrp_lv02_bin00(131) <= '0';
      end if;
      if (zgrp_lv01_bin00(528) = '1') or (zgrp_lv01_bin00(529) = '1') or (zgrp_lv01_bin00(530) = '1') or (zgrp_lv01_bin00(531) = '1') then
        zgrp_lv02_bin00(132) <= '1';
      else
        zgrp_lv02_bin00(132) <= '0';
      end if;
      if (zgrp_lv01_bin00(532) = '1') or (zgrp_lv01_bin00(533) = '1') or (zgrp_lv01_bin00(534) = '1') or (zgrp_lv01_bin00(535) = '1') then
        zgrp_lv02_bin00(133) <= '1';
      else
        zgrp_lv02_bin00(133) <= '0';
      end if;
      if (zgrp_lv01_bin00(536) = '1') or (zgrp_lv01_bin00(537) = '1') or (zgrp_lv01_bin00(538) = '1') or (zgrp_lv01_bin00(539) = '1') then
        zgrp_lv02_bin00(134) <= '1';
      else
        zgrp_lv02_bin00(134) <= '0';
      end if;
      if (zgrp_lv01_bin00(540) = '1') or (zgrp_lv01_bin00(541) = '1') or (zgrp_lv01_bin00(542) = '1') or (zgrp_lv01_bin00(543) = '1') then
        zgrp_lv02_bin00(135) <= '1';
      else
        zgrp_lv02_bin00(135) <= '0';
      end if;
      if (zgrp_lv01_bin00(544) = '1') or (zgrp_lv01_bin00(545) = '1') or (zgrp_lv01_bin00(546) = '1') or (zgrp_lv01_bin00(547) = '1') then
        zgrp_lv02_bin00(136) <= '1';
      else
        zgrp_lv02_bin00(136) <= '0';
      end if;
      if (zgrp_lv01_bin00(548) = '1') or (zgrp_lv01_bin00(549) = '1') or (zgrp_lv01_bin00(550) = '1') or (zgrp_lv01_bin00(551) = '1') then
        zgrp_lv02_bin00(137) <= '1';
      else
        zgrp_lv02_bin00(137) <= '0';
      end if;
      if (zgrp_lv01_bin00(552) = '1') or (zgrp_lv01_bin00(553) = '1') or (zgrp_lv01_bin00(554) = '1') or (zgrp_lv01_bin00(555) = '1') then
        zgrp_lv02_bin00(138) <= '1';
      else
        zgrp_lv02_bin00(138) <= '0';
      end if;
      if (zgrp_lv01_bin00(556) = '1') or (zgrp_lv01_bin00(557) = '1') or (zgrp_lv01_bin00(558) = '1') or (zgrp_lv01_bin00(559) = '1') then
        zgrp_lv02_bin00(139) <= '1';
      else
        zgrp_lv02_bin00(139) <= '0';
      end if;
      if (zgrp_lv01_bin00(560) = '1') or (zgrp_lv01_bin00(561) = '1') or (zgrp_lv01_bin00(562) = '1') or (zgrp_lv01_bin00(563) = '1') then
        zgrp_lv02_bin00(140) <= '1';
      else
        zgrp_lv02_bin00(140) <= '0';
      end if;
      if (zgrp_lv01_bin00(564) = '1') or (zgrp_lv01_bin00(565) = '1') or (zgrp_lv01_bin00(566) = '1') or (zgrp_lv01_bin00(567) = '1') then
        zgrp_lv02_bin00(141) <= '1';
      else
        zgrp_lv02_bin00(141) <= '0';
      end if;
      if (zgrp_lv01_bin00(568) = '1') or (zgrp_lv01_bin00(569) = '1') or (zgrp_lv01_bin00(570) = '1') or (zgrp_lv01_bin00(571) = '1') then
        zgrp_lv02_bin00(142) <= '1';
      else
        zgrp_lv02_bin00(142) <= '0';
      end if;
      if (zgrp_lv01_bin00(572) = '1') or (zgrp_lv01_bin00(573) = '1') or (zgrp_lv01_bin00(574) = '1') or (zgrp_lv01_bin00(575) = '1') then
        zgrp_lv02_bin00(143) <= '1';
      else
        zgrp_lv02_bin00(143) <= '0';
      end if;
      if (zgrp_lv01_bin00(576) = '1') or (zgrp_lv01_bin00(577) = '1') or (zgrp_lv01_bin00(578) = '1') or (zgrp_lv01_bin00(579) = '1') then
        zgrp_lv02_bin00(144) <= '1';
      else
        zgrp_lv02_bin00(144) <= '0';
      end if;
      if (zgrp_lv01_bin00(580) = '1') or (zgrp_lv01_bin00(581) = '1') or (zgrp_lv01_bin00(582) = '1') or (zgrp_lv01_bin00(583) = '1') then
        zgrp_lv02_bin00(145) <= '1';
      else
        zgrp_lv02_bin00(145) <= '0';
      end if;
      if (zgrp_lv01_bin00(584) = '1') or (zgrp_lv01_bin00(585) = '1') or (zgrp_lv01_bin00(586) = '1') or (zgrp_lv01_bin00(587) = '1') then
        zgrp_lv02_bin00(146) <= '1';
      else
        zgrp_lv02_bin00(146) <= '0';
      end if;
      if (zgrp_lv01_bin00(588) = '1') or (zgrp_lv01_bin00(589) = '1') or (zgrp_lv01_bin00(590) = '1') or (zgrp_lv01_bin00(591) = '1') then
        zgrp_lv02_bin00(147) <= '1';
      else
        zgrp_lv02_bin00(147) <= '0';
      end if;
      if (zgrp_lv01_bin00(592) = '1') or (zgrp_lv01_bin00(593) = '1') or (zgrp_lv01_bin00(594) = '1') or (zgrp_lv01_bin00(595) = '1') then
        zgrp_lv02_bin00(148) <= '1';
      else
        zgrp_lv02_bin00(148) <= '0';
      end if;
      if (zgrp_lv01_bin00(596) = '1') or (zgrp_lv01_bin00(597) = '1') or (zgrp_lv01_bin00(598) = '1') or (zgrp_lv01_bin00(599) = '1') then
        zgrp_lv02_bin00(149) <= '1';
      else
        zgrp_lv02_bin00(149) <= '0';
      end if;
      if (zgrp_lv01_bin00(600) = '1') or (zgrp_lv01_bin00(601) = '1') or (zgrp_lv01_bin00(602) = '1') or (zgrp_lv01_bin00(603) = '1') then
        zgrp_lv02_bin00(150) <= '1';
      else
        zgrp_lv02_bin00(150) <= '0';
      end if;
      if (zgrp_lv01_bin00(604) = '1') or (zgrp_lv01_bin00(605) = '1') or (zgrp_lv01_bin00(606) = '1') or (zgrp_lv01_bin00(607) = '1') then
        zgrp_lv02_bin00(151) <= '1';
      else
        zgrp_lv02_bin00(151) <= '0';
      end if;
      if (zgrp_lv01_bin00(608) = '1') or (zgrp_lv01_bin00(609) = '1') or (zgrp_lv01_bin00(610) = '1') or (zgrp_lv01_bin00(611) = '1') then
        zgrp_lv02_bin00(152) <= '1';
      else
        zgrp_lv02_bin00(152) <= '0';
      end if;
      if (zgrp_lv01_bin00(612) = '1') or (zgrp_lv01_bin00(613) = '1') or (zgrp_lv01_bin00(614) = '1') or (zgrp_lv01_bin00(615) = '1') then
        zgrp_lv02_bin00(153) <= '1';
      else
        zgrp_lv02_bin00(153) <= '0';
      end if;
      if (zgrp_lv01_bin00(616) = '1') or (zgrp_lv01_bin00(617) = '1') or (zgrp_lv01_bin00(618) = '1') or (zgrp_lv01_bin00(619) = '1') then
        zgrp_lv02_bin00(154) <= '1';
      else
        zgrp_lv02_bin00(154) <= '0';
      end if;
      if (zgrp_lv01_bin00(620) = '1') or (zgrp_lv01_bin00(621) = '1') or (zgrp_lv01_bin00(622) = '1') or (zgrp_lv01_bin00(623) = '1') then
        zgrp_lv02_bin00(155) <= '1';
      else
        zgrp_lv02_bin00(155) <= '0';
      end if;
      if (zgrp_lv01_bin00(624) = '1') or (zgrp_lv01_bin00(625) = '1') or (zgrp_lv01_bin00(626) = '1') or (zgrp_lv01_bin00(627) = '1') then
        zgrp_lv02_bin00(156) <= '1';
      else
        zgrp_lv02_bin00(156) <= '0';
      end if;
      if (zgrp_lv01_bin00(628) = '1') or (zgrp_lv01_bin00(629) = '1') or (zgrp_lv01_bin00(630) = '1') or (zgrp_lv01_bin00(631) = '1') then
        zgrp_lv02_bin00(157) <= '1';
      else
        zgrp_lv02_bin00(157) <= '0';
      end if;
      if (zgrp_lv01_bin00(632) = '1') or (zgrp_lv01_bin00(633) = '1') or (zgrp_lv01_bin00(634) = '1') or (zgrp_lv01_bin00(635) = '1') then
        zgrp_lv02_bin00(158) <= '1';
      else
        zgrp_lv02_bin00(158) <= '0';
      end if;
      if (zgrp_lv01_bin00(636) = '1') or (zgrp_lv01_bin00(637) = '1') or (zgrp_lv01_bin00(638) = '1') or (zgrp_lv01_bin00(639) = '1') then
        zgrp_lv02_bin00(159) <= '1';
      else
        zgrp_lv02_bin00(159) <= '0';
      end if;
      if (zgrp_lv01_bin00(640) = '1') or (zgrp_lv01_bin00(641) = '1') or (zgrp_lv01_bin00(642) = '1') or (zgrp_lv01_bin00(643) = '1') then
        zgrp_lv02_bin00(160) <= '1';
      else
        zgrp_lv02_bin00(160) <= '0';
      end if;
      if (zgrp_lv01_bin00(644) = '1') or (zgrp_lv01_bin00(645) = '1') or (zgrp_lv01_bin00(646) = '1') or (zgrp_lv01_bin00(647) = '1') then
        zgrp_lv02_bin00(161) <= '1';
      else
        zgrp_lv02_bin00(161) <= '0';
      end if;
      if (zgrp_lv01_bin00(648) = '1') or (zgrp_lv01_bin00(649) = '1') or (zgrp_lv01_bin00(650) = '1') or (zgrp_lv01_bin00(651) = '1') then
        zgrp_lv02_bin00(162) <= '1';
      else
        zgrp_lv02_bin00(162) <= '0';
      end if;
      if (zgrp_lv01_bin00(652) = '1') or (zgrp_lv01_bin00(653) = '1') or (zgrp_lv01_bin00(654) = '1') or (zgrp_lv01_bin00(655) = '1') then
        zgrp_lv02_bin00(163) <= '1';
      else
        zgrp_lv02_bin00(163) <= '0';
      end if;
      if (zgrp_lv01_bin00(656) = '1') or (zgrp_lv01_bin00(657) = '1') or (zgrp_lv01_bin00(658) = '1') or (zgrp_lv01_bin00(659) = '1') then
        zgrp_lv02_bin00(164) <= '1';
      else
        zgrp_lv02_bin00(164) <= '0';
      end if;
      if (zgrp_lv01_bin00(660) = '1') or (zgrp_lv01_bin00(661) = '1') or (zgrp_lv01_bin00(662) = '1') or (zgrp_lv01_bin00(663) = '1') then
        zgrp_lv02_bin00(165) <= '1';
      else
        zgrp_lv02_bin00(165) <= '0';
      end if;
      if (zgrp_lv01_bin00(664) = '1') or (zgrp_lv01_bin00(665) = '1') or (zgrp_lv01_bin00(666) = '1') or (zgrp_lv01_bin00(667) = '1') then
        zgrp_lv02_bin00(166) <= '1';
      else
        zgrp_lv02_bin00(166) <= '0';
      end if;
      if (zgrp_lv01_bin00(668) = '1') or (zgrp_lv01_bin00(669) = '1') or (zgrp_lv01_bin00(670) = '1') or (zgrp_lv01_bin00(671) = '1') then
        zgrp_lv02_bin00(167) <= '1';
      else
        zgrp_lv02_bin00(167) <= '0';
      end if;
      if (zgrp_lv01_bin00(672) = '1') or (zgrp_lv01_bin00(673) = '1') or (zgrp_lv01_bin00(674) = '1') or (zgrp_lv01_bin00(675) = '1') then
        zgrp_lv02_bin00(168) <= '1';
      else
        zgrp_lv02_bin00(168) <= '0';
      end if;
      if (zgrp_lv01_bin00(676) = '1') or (zgrp_lv01_bin00(677) = '1') or (zgrp_lv01_bin00(678) = '1') or (zgrp_lv01_bin00(679) = '1') then
        zgrp_lv02_bin00(169) <= '1';
      else
        zgrp_lv02_bin00(169) <= '0';
      end if;
      if (zgrp_lv01_bin00(680) = '1') or (zgrp_lv01_bin00(681) = '1') or (zgrp_lv01_bin00(682) = '1') or (zgrp_lv01_bin00(683) = '1') then
        zgrp_lv02_bin00(170) <= '1';
      else
        zgrp_lv02_bin00(170) <= '0';
      end if;
      if (zgrp_lv01_bin00(684) = '1') or (zgrp_lv01_bin00(685) = '1') or (zgrp_lv01_bin00(686) = '1') or (zgrp_lv01_bin00(687) = '1') then
        zgrp_lv02_bin00(171) <= '1';
      else
        zgrp_lv02_bin00(171) <= '0';
      end if;
      if (zgrp_lv01_bin00(688) = '1') or (zgrp_lv01_bin00(689) = '1') or (zgrp_lv01_bin00(690) = '1') or (zgrp_lv01_bin00(691) = '1') then
        zgrp_lv02_bin00(172) <= '1';
      else
        zgrp_lv02_bin00(172) <= '0';
      end if;
      if (zgrp_lv01_bin00(692) = '1') or (zgrp_lv01_bin00(693) = '1') or (zgrp_lv01_bin00(694) = '1') or (zgrp_lv01_bin00(695) = '1') then
        zgrp_lv02_bin00(173) <= '1';
      else
        zgrp_lv02_bin00(173) <= '0';
      end if;
      if (zgrp_lv01_bin00(696) = '1') or (zgrp_lv01_bin00(697) = '1') or (zgrp_lv01_bin00(698) = '1') or (zgrp_lv01_bin00(699) = '1') then
        zgrp_lv02_bin00(174) <= '1';
      else
        zgrp_lv02_bin00(174) <= '0';
      end if;
      if (zgrp_lv01_bin00(700) = '1') or (zgrp_lv01_bin00(701) = '1') or (zgrp_lv01_bin00(702) = '1') or (zgrp_lv01_bin00(703) = '1') then
        zgrp_lv02_bin00(175) <= '1';
      else
        zgrp_lv02_bin00(175) <= '0';
      end if;
      if (zgrp_lv01_bin00(704) = '1') or (zgrp_lv01_bin00(705) = '1') or (zgrp_lv01_bin00(706) = '1') or (zgrp_lv01_bin00(707) = '1') then
        zgrp_lv02_bin00(176) <= '1';
      else
        zgrp_lv02_bin00(176) <= '0';
      end if;
      if (zgrp_lv01_bin00(708) = '1') or (zgrp_lv01_bin00(709) = '1') or (zgrp_lv01_bin00(710) = '1') or (zgrp_lv01_bin00(711) = '1') then
        zgrp_lv02_bin00(177) <= '1';
      else
        zgrp_lv02_bin00(177) <= '0';
      end if;
      if (zgrp_lv01_bin00(712) = '1') then
        zgrp_lv02_bin00(178) <= '1';
      else
        zgrp_lv02_bin00(178) <= '0';
      end if;
    end if;
  end process;

  lut_lv03 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv02_bin00(0) = '1') or (zgrp_lv02_bin00(1) = '1') or (zgrp_lv02_bin00(2) = '1') or (zgrp_lv02_bin00(3) = '1') then
        zgrp_lv03_bin00(0) <= '1';
      else
        zgrp_lv03_bin00(0) <= '0';
      end if;
      if (zgrp_lv02_bin00(4) = '1') or (zgrp_lv02_bin00(5) = '1') or (zgrp_lv02_bin00(6) = '1') or (zgrp_lv02_bin00(7) = '1') then
        zgrp_lv03_bin00(1) <= '1';
      else
        zgrp_lv03_bin00(1) <= '0';
      end if;
      if (zgrp_lv02_bin00(8) = '1') or (zgrp_lv02_bin00(9) = '1') or (zgrp_lv02_bin00(10) = '1') or (zgrp_lv02_bin00(11) = '1') then
        zgrp_lv03_bin00(2) <= '1';
      else
        zgrp_lv03_bin00(2) <= '0';
      end if;
      if (zgrp_lv02_bin00(12) = '1') or (zgrp_lv02_bin00(13) = '1') or (zgrp_lv02_bin00(14) = '1') or (zgrp_lv02_bin00(15) = '1') then
        zgrp_lv03_bin00(3) <= '1';
      else
        zgrp_lv03_bin00(3) <= '0';
      end if;
      if (zgrp_lv02_bin00(16) = '1') or (zgrp_lv02_bin00(17) = '1') or (zgrp_lv02_bin00(18) = '1') or (zgrp_lv02_bin00(19) = '1') then
        zgrp_lv03_bin00(4) <= '1';
      else
        zgrp_lv03_bin00(4) <= '0';
      end if;
      if (zgrp_lv02_bin00(20) = '1') or (zgrp_lv02_bin00(21) = '1') or (zgrp_lv02_bin00(22) = '1') or (zgrp_lv02_bin00(23) = '1') then
        zgrp_lv03_bin00(5) <= '1';
      else
        zgrp_lv03_bin00(5) <= '0';
      end if;
      if (zgrp_lv02_bin00(24) = '1') or (zgrp_lv02_bin00(25) = '1') or (zgrp_lv02_bin00(26) = '1') or (zgrp_lv02_bin00(27) = '1') then
        zgrp_lv03_bin00(6) <= '1';
      else
        zgrp_lv03_bin00(6) <= '0';
      end if;
      if (zgrp_lv02_bin00(28) = '1') or (zgrp_lv02_bin00(29) = '1') or (zgrp_lv02_bin00(30) = '1') or (zgrp_lv02_bin00(31) = '1') then
        zgrp_lv03_bin00(7) <= '1';
      else
        zgrp_lv03_bin00(7) <= '0';
      end if;
      if (zgrp_lv02_bin00(32) = '1') or (zgrp_lv02_bin00(33) = '1') or (zgrp_lv02_bin00(34) = '1') or (zgrp_lv02_bin00(35) = '1') then
        zgrp_lv03_bin00(8) <= '1';
      else
        zgrp_lv03_bin00(8) <= '0';
      end if;
      if (zgrp_lv02_bin00(36) = '1') or (zgrp_lv02_bin00(37) = '1') or (zgrp_lv02_bin00(38) = '1') or (zgrp_lv02_bin00(39) = '1') then
        zgrp_lv03_bin00(9) <= '1';
      else
        zgrp_lv03_bin00(9) <= '0';
      end if;
      if (zgrp_lv02_bin00(40) = '1') or (zgrp_lv02_bin00(41) = '1') or (zgrp_lv02_bin00(42) = '1') or (zgrp_lv02_bin00(43) = '1') then
        zgrp_lv03_bin00(10) <= '1';
      else
        zgrp_lv03_bin00(10) <= '0';
      end if;
      if (zgrp_lv02_bin00(44) = '1') or (zgrp_lv02_bin00(45) = '1') or (zgrp_lv02_bin00(46) = '1') or (zgrp_lv02_bin00(47) = '1') then
        zgrp_lv03_bin00(11) <= '1';
      else
        zgrp_lv03_bin00(11) <= '0';
      end if;
      if (zgrp_lv02_bin00(48) = '1') or (zgrp_lv02_bin00(49) = '1') or (zgrp_lv02_bin00(50) = '1') or (zgrp_lv02_bin00(51) = '1') then
        zgrp_lv03_bin00(12) <= '1';
      else
        zgrp_lv03_bin00(12) <= '0';
      end if;
      if (zgrp_lv02_bin00(52) = '1') or (zgrp_lv02_bin00(53) = '1') or (zgrp_lv02_bin00(54) = '1') or (zgrp_lv02_bin00(55) = '1') then
        zgrp_lv03_bin00(13) <= '1';
      else
        zgrp_lv03_bin00(13) <= '0';
      end if;
      if (zgrp_lv02_bin00(56) = '1') or (zgrp_lv02_bin00(57) = '1') or (zgrp_lv02_bin00(58) = '1') or (zgrp_lv02_bin00(59) = '1') then
        zgrp_lv03_bin00(14) <= '1';
      else
        zgrp_lv03_bin00(14) <= '0';
      end if;
      if (zgrp_lv02_bin00(60) = '1') or (zgrp_lv02_bin00(61) = '1') or (zgrp_lv02_bin00(62) = '1') or (zgrp_lv02_bin00(63) = '1') then
        zgrp_lv03_bin00(15) <= '1';
      else
        zgrp_lv03_bin00(15) <= '0';
      end if;
      if (zgrp_lv02_bin00(64) = '1') or (zgrp_lv02_bin00(65) = '1') or (zgrp_lv02_bin00(66) = '1') or (zgrp_lv02_bin00(67) = '1') then
        zgrp_lv03_bin00(16) <= '1';
      else
        zgrp_lv03_bin00(16) <= '0';
      end if;
      if (zgrp_lv02_bin00(68) = '1') or (zgrp_lv02_bin00(69) = '1') or (zgrp_lv02_bin00(70) = '1') or (zgrp_lv02_bin00(71) = '1') then
        zgrp_lv03_bin00(17) <= '1';
      else
        zgrp_lv03_bin00(17) <= '0';
      end if;
      if (zgrp_lv02_bin00(72) = '1') or (zgrp_lv02_bin00(73) = '1') or (zgrp_lv02_bin00(74) = '1') or (zgrp_lv02_bin00(75) = '1') then
        zgrp_lv03_bin00(18) <= '1';
      else
        zgrp_lv03_bin00(18) <= '0';
      end if;
      if (zgrp_lv02_bin00(76) = '1') or (zgrp_lv02_bin00(77) = '1') or (zgrp_lv02_bin00(78) = '1') or (zgrp_lv02_bin00(79) = '1') then
        zgrp_lv03_bin00(19) <= '1';
      else
        zgrp_lv03_bin00(19) <= '0';
      end if;
      if (zgrp_lv02_bin00(80) = '1') or (zgrp_lv02_bin00(81) = '1') or (zgrp_lv02_bin00(82) = '1') or (zgrp_lv02_bin00(83) = '1') then
        zgrp_lv03_bin00(20) <= '1';
      else
        zgrp_lv03_bin00(20) <= '0';
      end if;
      if (zgrp_lv02_bin00(84) = '1') or (zgrp_lv02_bin00(85) = '1') or (zgrp_lv02_bin00(86) = '1') or (zgrp_lv02_bin00(87) = '1') then
        zgrp_lv03_bin00(21) <= '1';
      else
        zgrp_lv03_bin00(21) <= '0';
      end if;
      if (zgrp_lv02_bin00(88) = '1') or (zgrp_lv02_bin00(89) = '1') or (zgrp_lv02_bin00(90) = '1') or (zgrp_lv02_bin00(91) = '1') then
        zgrp_lv03_bin00(22) <= '1';
      else
        zgrp_lv03_bin00(22) <= '0';
      end if;
      if (zgrp_lv02_bin00(92) = '1') or (zgrp_lv02_bin00(93) = '1') or (zgrp_lv02_bin00(94) = '1') or (zgrp_lv02_bin00(95) = '1') then
        zgrp_lv03_bin00(23) <= '1';
      else
        zgrp_lv03_bin00(23) <= '0';
      end if;
      if (zgrp_lv02_bin00(96) = '1') or (zgrp_lv02_bin00(97) = '1') or (zgrp_lv02_bin00(98) = '1') or (zgrp_lv02_bin00(99) = '1') then
        zgrp_lv03_bin00(24) <= '1';
      else
        zgrp_lv03_bin00(24) <= '0';
      end if;
      if (zgrp_lv02_bin00(100) = '1') or (zgrp_lv02_bin00(101) = '1') or (zgrp_lv02_bin00(102) = '1') or (zgrp_lv02_bin00(103) = '1') then
        zgrp_lv03_bin00(25) <= '1';
      else
        zgrp_lv03_bin00(25) <= '0';
      end if;
      if (zgrp_lv02_bin00(104) = '1') or (zgrp_lv02_bin00(105) = '1') or (zgrp_lv02_bin00(106) = '1') or (zgrp_lv02_bin00(107) = '1') then
        zgrp_lv03_bin00(26) <= '1';
      else
        zgrp_lv03_bin00(26) <= '0';
      end if;
      if (zgrp_lv02_bin00(108) = '1') or (zgrp_lv02_bin00(109) = '1') or (zgrp_lv02_bin00(110) = '1') or (zgrp_lv02_bin00(111) = '1') then
        zgrp_lv03_bin00(27) <= '1';
      else
        zgrp_lv03_bin00(27) <= '0';
      end if;
      if (zgrp_lv02_bin00(112) = '1') or (zgrp_lv02_bin00(113) = '1') or (zgrp_lv02_bin00(114) = '1') or (zgrp_lv02_bin00(115) = '1') then
        zgrp_lv03_bin00(28) <= '1';
      else
        zgrp_lv03_bin00(28) <= '0';
      end if;
      if (zgrp_lv02_bin00(116) = '1') or (zgrp_lv02_bin00(117) = '1') or (zgrp_lv02_bin00(118) = '1') or (zgrp_lv02_bin00(119) = '1') then
        zgrp_lv03_bin00(29) <= '1';
      else
        zgrp_lv03_bin00(29) <= '0';
      end if;
      if (zgrp_lv02_bin00(120) = '1') or (zgrp_lv02_bin00(121) = '1') or (zgrp_lv02_bin00(122) = '1') or (zgrp_lv02_bin00(123) = '1') then
        zgrp_lv03_bin00(30) <= '1';
      else
        zgrp_lv03_bin00(30) <= '0';
      end if;
      if (zgrp_lv02_bin00(124) = '1') or (zgrp_lv02_bin00(125) = '1') or (zgrp_lv02_bin00(126) = '1') or (zgrp_lv02_bin00(127) = '1') then
        zgrp_lv03_bin00(31) <= '1';
      else
        zgrp_lv03_bin00(31) <= '0';
      end if;
      if (zgrp_lv02_bin00(128) = '1') or (zgrp_lv02_bin00(129) = '1') or (zgrp_lv02_bin00(130) = '1') or (zgrp_lv02_bin00(131) = '1') then
        zgrp_lv03_bin00(32) <= '1';
      else
        zgrp_lv03_bin00(32) <= '0';
      end if;
      if (zgrp_lv02_bin00(132) = '1') or (zgrp_lv02_bin00(133) = '1') or (zgrp_lv02_bin00(134) = '1') or (zgrp_lv02_bin00(135) = '1') then
        zgrp_lv03_bin00(33) <= '1';
      else
        zgrp_lv03_bin00(33) <= '0';
      end if;
      if (zgrp_lv02_bin00(136) = '1') or (zgrp_lv02_bin00(137) = '1') or (zgrp_lv02_bin00(138) = '1') or (zgrp_lv02_bin00(139) = '1') then
        zgrp_lv03_bin00(34) <= '1';
      else
        zgrp_lv03_bin00(34) <= '0';
      end if;
      if (zgrp_lv02_bin00(140) = '1') or (zgrp_lv02_bin00(141) = '1') or (zgrp_lv02_bin00(142) = '1') or (zgrp_lv02_bin00(143) = '1') then
        zgrp_lv03_bin00(35) <= '1';
      else
        zgrp_lv03_bin00(35) <= '0';
      end if;
      if (zgrp_lv02_bin00(144) = '1') or (zgrp_lv02_bin00(145) = '1') or (zgrp_lv02_bin00(146) = '1') or (zgrp_lv02_bin00(147) = '1') then
        zgrp_lv03_bin00(36) <= '1';
      else
        zgrp_lv03_bin00(36) <= '0';
      end if;
      if (zgrp_lv02_bin00(148) = '1') or (zgrp_lv02_bin00(149) = '1') or (zgrp_lv02_bin00(150) = '1') or (zgrp_lv02_bin00(151) = '1') then
        zgrp_lv03_bin00(37) <= '1';
      else
        zgrp_lv03_bin00(37) <= '0';
      end if;
      if (zgrp_lv02_bin00(152) = '1') or (zgrp_lv02_bin00(153) = '1') or (zgrp_lv02_bin00(154) = '1') or (zgrp_lv02_bin00(155) = '1') then
        zgrp_lv03_bin00(38) <= '1';
      else
        zgrp_lv03_bin00(38) <= '0';
      end if;
      if (zgrp_lv02_bin00(156) = '1') or (zgrp_lv02_bin00(157) = '1') or (zgrp_lv02_bin00(158) = '1') or (zgrp_lv02_bin00(159) = '1') then
        zgrp_lv03_bin00(39) <= '1';
      else
        zgrp_lv03_bin00(39) <= '0';
      end if;
      if (zgrp_lv02_bin00(160) = '1') or (zgrp_lv02_bin00(161) = '1') or (zgrp_lv02_bin00(162) = '1') or (zgrp_lv02_bin00(163) = '1') then
        zgrp_lv03_bin00(40) <= '1';
      else
        zgrp_lv03_bin00(40) <= '0';
      end if;
      if (zgrp_lv02_bin00(164) = '1') or (zgrp_lv02_bin00(165) = '1') or (zgrp_lv02_bin00(166) = '1') or (zgrp_lv02_bin00(167) = '1') then
        zgrp_lv03_bin00(41) <= '1';
      else
        zgrp_lv03_bin00(41) <= '0';
      end if;
      if (zgrp_lv02_bin00(168) = '1') or (zgrp_lv02_bin00(169) = '1') or (zgrp_lv02_bin00(170) = '1') or (zgrp_lv02_bin00(171) = '1') then
        zgrp_lv03_bin00(42) <= '1';
      else
        zgrp_lv03_bin00(42) <= '0';
      end if;
      if (zgrp_lv02_bin00(172) = '1') or (zgrp_lv02_bin00(173) = '1') or (zgrp_lv02_bin00(174) = '1') or (zgrp_lv02_bin00(175) = '1') then
        zgrp_lv03_bin00(43) <= '1';
      else
        zgrp_lv03_bin00(43) <= '0';
      end if;
      if (zgrp_lv02_bin00(176) = '1') or (zgrp_lv02_bin00(177) = '1') or (zgrp_lv02_bin00(178) = '1') then
        zgrp_lv03_bin00(44) <= '1';
      else
        zgrp_lv03_bin00(44) <= '0';
      end if;
    end if;
  end process;

  lut_lv04 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv03_bin00(0) = '1') or (zgrp_lv03_bin00(1) = '1') or (zgrp_lv03_bin00(2) = '1') or (zgrp_lv03_bin00(3) = '1') then
        zgrp_lv04_bin00(0) <= '1';
      else
        zgrp_lv04_bin00(0) <= '0';
      end if;
      if (zgrp_lv03_bin00(4) = '1') or (zgrp_lv03_bin00(5) = '1') or (zgrp_lv03_bin00(6) = '1') or (zgrp_lv03_bin00(7) = '1') then
        zgrp_lv04_bin00(1) <= '1';
      else
        zgrp_lv04_bin00(1) <= '0';
      end if;
      if (zgrp_lv03_bin00(8) = '1') or (zgrp_lv03_bin00(9) = '1') or (zgrp_lv03_bin00(10) = '1') or (zgrp_lv03_bin00(11) = '1') then
        zgrp_lv04_bin00(2) <= '1';
      else
        zgrp_lv04_bin00(2) <= '0';
      end if;
      if (zgrp_lv03_bin00(12) = '1') or (zgrp_lv03_bin00(13) = '1') or (zgrp_lv03_bin00(14) = '1') or (zgrp_lv03_bin00(15) = '1') then
        zgrp_lv04_bin00(3) <= '1';
      else
        zgrp_lv04_bin00(3) <= '0';
      end if;
      if (zgrp_lv03_bin00(16) = '1') or (zgrp_lv03_bin00(17) = '1') or (zgrp_lv03_bin00(18) = '1') or (zgrp_lv03_bin00(19) = '1') then
        zgrp_lv04_bin00(4) <= '1';
      else
        zgrp_lv04_bin00(4) <= '0';
      end if;
      if (zgrp_lv03_bin00(20) = '1') or (zgrp_lv03_bin00(21) = '1') or (zgrp_lv03_bin00(22) = '1') or (zgrp_lv03_bin00(23) = '1') then
        zgrp_lv04_bin00(5) <= '1';
      else
        zgrp_lv04_bin00(5) <= '0';
      end if;
      if (zgrp_lv03_bin00(24) = '1') or (zgrp_lv03_bin00(25) = '1') or (zgrp_lv03_bin00(26) = '1') or (zgrp_lv03_bin00(27) = '1') then
        zgrp_lv04_bin00(6) <= '1';
      else
        zgrp_lv04_bin00(6) <= '0';
      end if;
      if (zgrp_lv03_bin00(28) = '1') or (zgrp_lv03_bin00(29) = '1') or (zgrp_lv03_bin00(30) = '1') or (zgrp_lv03_bin00(31) = '1') then
        zgrp_lv04_bin00(7) <= '1';
      else
        zgrp_lv04_bin00(7) <= '0';
      end if;
      if (zgrp_lv03_bin00(32) = '1') or (zgrp_lv03_bin00(33) = '1') or (zgrp_lv03_bin00(34) = '1') or (zgrp_lv03_bin00(35) = '1') then
        zgrp_lv04_bin00(8) <= '1';
      else
        zgrp_lv04_bin00(8) <= '0';
      end if;
      if (zgrp_lv03_bin00(36) = '1') or (zgrp_lv03_bin00(37) = '1') or (zgrp_lv03_bin00(38) = '1') or (zgrp_lv03_bin00(39) = '1') then
        zgrp_lv04_bin00(9) <= '1';
      else
        zgrp_lv04_bin00(9) <= '0';
      end if;
      if (zgrp_lv03_bin00(40) = '1') or (zgrp_lv03_bin00(41) = '1') or (zgrp_lv03_bin00(42) = '1') or (zgrp_lv03_bin00(43) = '1') then
        zgrp_lv04_bin00(10) <= '1';
      else
        zgrp_lv04_bin00(10) <= '0';
      end if;
      if (zgrp_lv03_bin00(44) = '1') then
        zgrp_lv04_bin00(11) <= '1';
      else
        zgrp_lv04_bin00(11) <= '0';
      end if;
    end if;
  end process;

  lut_lv05 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv04_bin00(0) = '1') or (zgrp_lv04_bin00(1) = '1') or (zgrp_lv04_bin00(2) = '1') or (zgrp_lv04_bin00(3) = '1') then
        zgrp_lv05_bin00(0) <= '1';
      else
        zgrp_lv05_bin00(0) <= '0';
      end if;
      if (zgrp_lv04_bin00(4) = '1') or (zgrp_lv04_bin00(5) = '1') or (zgrp_lv04_bin00(6) = '1') or (zgrp_lv04_bin00(7) = '1') then
        zgrp_lv05_bin00(1) <= '1';
      else
        zgrp_lv05_bin00(1) <= '0';
      end if;
      if (zgrp_lv04_bin00(8) = '1') or (zgrp_lv04_bin00(9) = '1') or (zgrp_lv04_bin00(10) = '1') or (zgrp_lv04_bin00(11) = '1') then
        zgrp_lv05_bin00(2) <= '1';
      else
        zgrp_lv05_bin00(2) <= '0';
      end if;
    end if;
  end process;

  lut_lv06 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv05_bin00(0) = '1') or (zgrp_lv05_bin00(1) = '1') or (zgrp_lv05_bin00(2) = '1') or (zgrp_lv05_bin00(3) = '1') then
        zgrp_lv06_bin00(0) <= '1';
      else
        zgrp_lv06_bin00(0) <= '0';
      end if;
    end if;
  end process;

  lut_lv07 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv06_bin00(0) = '1') or (zgrp_lv06_bin00(1) = '1') then
        zgrp_lv07_bin00(0) <= '1';
      else
        zgrp_lv07_bin00(0) <= '0';
      end if;
    end if;
  end process;

  lut_lv08 : process(c1)
  begin
    if rising_edge(c1) then
      if zgrp_lv07_bin00(0) = '1' then
        zgrp_lv08(0) <= '1';
      else
        zgrp_lv08(0) <= '0';
      end if;
    end if;
  end process;

end rtl;
