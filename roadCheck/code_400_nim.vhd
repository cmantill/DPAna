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
  signal zgrp_lv01_bin00 : std_logic_vector(17 downto 0);

  -- grouping of the outputs lv-02
  signal zgrp_lv02_bin00 : std_logic_vector(3 downto 0);

  -- grouping of the outputs lv-03
  signal zgrp_lv03_bin00 : std_logic_vector(2 downto 0);

  -- grouping of the outputs lv-04
  signal zgrp_lv04_bin00 : std_logic_vector(2 downto 0);

  -- grouping of the outputs lv-05
  signal zgrp_lv05_bin00 : std_logic_vector(2 downto 0);

  -- grouping of the outputs lv-06
  signal zgrp_lv06_bin00 : std_logic_vector(2 downto 0);

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
  f_dout_l(13) <= '0' when Y2(49 downto 0) = (50 => '0') else '1';
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
  f_dout_l(28) <= when Y1(29 downto 0) = (30 => '0') else '1';
  f_dout_l(29) <= when Y4(7 downto 0)  = (8 => '0')  else '1';
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
      if Y1(5 downto 0) = (6 => '0') then
        zgrp_lv01_bin00(0) <= '0';
      else
        zgrp_lv01_bin00(0) <= '1';
      end if;
      if Y1(11 downto 6) = (6 => '0') then
        zgrp_lv01_bin00(1) <= '0';
      else
        zgrp_lv01_bin00(1) <= '1';
      end if;
      if Y1(17 downto 12) = (6 => '0') then
        zgrp_lv01_bin00(2) <= '0';
      else
        zgrp_lv01_bin00(2) <= '1';
      end if;
      if Y1(23 downto 18) = (6 => '0') then
        zgrp_lv01_bin00(3) <= '0';
      else
        zgrp_lv01_bin00(3) <= '1';
      end if;
      if Y1(29 downto 24) = (6 => '0') then
        zgrp_lv01_bin00(4) <= '0';
      else
        zgrp_lv01_bin00(4) <= '1';
      end if;
      if Y2(4 downto 0) = (5 => '0') then
        zgrp_lv01_bin00(5) <= '0';
      else
        zgrp_lv01_bin00(5) <= '1';
      end if;
      if Y2(9 downto 5) = (5 => '0') then
        zgrp_lv01_bin00(6) <= '0';
      else
        zgrp_lv01_bin00(6) <= '1';
      end if;
      if Y2(14 downto 10) = (5 => '0') then
        zgrp_lv01_bin00(7) <= '0';
      else
        zgrp_lv01_bin00(7) <= '1';
      end if;
      if Y2(19 downto 15) = (5 => '0') then
        zgrp_lv01_bin00(8) <= '0';
      else
        zgrp_lv01_bin00(8) <= '1';
      end if;
      if Y2(24 downto 20) = (5 => '0') then
        zgrp_lv01_bin00(9) <= '0';
      else
        zgrp_lv01_bin00(9) <= '1';
      end if;
      if Y2(29 downto 25) = (5 => '0') then
        zgrp_lv01_bin00(10) <= '0';
      else
        zgrp_lv01_bin00(10) <= '1';
      end if;
      if Y2(34 downto 30) = (5 => '0') then
        zgrp_lv01_bin00(11) <= '0';
      else
        zgrp_lv01_bin00(11) <= '1';
      end if;
      if Y2(39 downto 35) = (5 => '0') then
        zgrp_lv01_bin00(12) <= '0';
      else
        zgrp_lv01_bin00(12) <= '1';
      end if;
      if Y2(44 downto 40) = (5 => '0') then
        zgrp_lv01_bin00(13) <= '0';
      else
        zgrp_lv01_bin00(13) <= '1';
      end if;
      if Y2(49 downto 45) = (5 => '0') then
        zgrp_lv01_bin00(14) <= '0';
      else
        zgrp_lv01_bin00(14) <= '1';
      end if;
      if Y4(3 downto 0) = (4 => '0') then
        zgrp_lv01_bin00(15) <= '0';
      else
        zgrp_lv01_bin00(15) <= '1';
      end if;
      if Y4(7 downto 4) = (4 => '0') then
        zgrp_lv01_bin00(16) <= '0';
      else
        zgrp_lv01_bin00(16) <= '1';
      end if;
    end if;
  end process;

  lut_lv02 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv01_bin00(0) = '1') or (zgrp_lv01_bin00(1) = '1') or (zgrp_lv01_bin00(2) = '1') or (zgrp_lv01_bin00(3) = '1') or (zgrp_lv01_bin00(4) = '1') then
        zgrp_lv02_bin00(0) <= '1';
      else
        zgrp_lv02_bin00(0) <= '0';
      end if;
      if (zgrp_lv01_bin00(5) = '1') or (zgrp_lv01_bin00(6) = '1') or (zgrp_lv01_bin00(7) = '1') or (zgrp_lv01_bin00(8) = '1') or (zgrp_lv01_bin00(9) = '1') then
        zgrp_lv02_bin00(1) <= '1';
      else
        zgrp_lv02_bin00(1) <= '0';
      end if;
      if (zgrp_lv01_bin00(10) = '1') or (zgrp_lv01_bin00(11) = '1') or (zgrp_lv01_bin00(12) = '1') or (zgrp_lv01_bin00(13) = '1') or (zgrp_lv01_bin00(14) = '1') then
        zgrp_lv02_bin00(2) <= '1';
      else
        zgrp_lv02_bin00(2) <= '0';
      end if;
      if (zgrp_lv01_bin00(15) = '1') or (zgrp_lv01_bin00(16) = '1') then
        zgrp_lv02_bin00(3) <= '1';
      else
        zgrp_lv02_bin00(3) <= '0';
      end if;
    end if;
  end process;

  lut_lv03 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv02_bin00(0) = '1') then
        zgrp_lv03_bin00(0) <= '1';
      else
        zgrp_lv03_bin00(0) <= '0';
      end if;
      if (zgrp_lv02_bin00(1) = '1') or (zgrp_lv02_bin00(2) = '1') then
        zgrp_lv03_bin00(1) <= '1';
      else
        zgrp_lv03_bin00(1) <= '0';
      end if;
      if (zgrp_lv02_bin00(3) = '1') then
        zgrp_lv03_bin00(2) <= '1';
      else
        zgrp_lv03_bin00(2) <= '0';
      end if;
    end if;
  end process;

  lut_lv04 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv03_bin00(0) = '1') then
        zgrp_lv04_bin00(0) <= '1';
      else
        zgrp_lv04_bin00(0) <= '0';
      end if;
      if (zgrp_lv03_bin00(1) = '1') then
        zgrp_lv04_bin00(1) <= '1';
      else
        zgrp_lv04_bin00(1) <= '0';
      end if;
      if (zgrp_lv03_bin00(2) = '1') then
        zgrp_lv04_bin00(2) <= '1';
      else
        zgrp_lv04_bin00(2) <= '0';
      end if;
    end if;
  end process;

  lut_lv05 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv04_bin00(0) = '1') then
        zgrp_lv05_bin00(0) <= '1';
      else
        zgrp_lv05_bin00(0) <= '0';
      end if;
      if (zgrp_lv04_bin00(1) = '1') then
        zgrp_lv05_bin00(1) <= '1';
      else
        zgrp_lv05_bin00(1) <= '0';
      end if;
      if (zgrp_lv04_bin00(2) = '1') then
        zgrp_lv05_bin00(2) <= '1';
      else
        zgrp_lv05_bin00(2) <= '0';
      end if;
    end if;
  end process;

  lut_lv06 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv05_bin00(0) = '1') then
        zgrp_lv06_bin00(0) <= '1';
      else
        zgrp_lv06_bin00(0) <= '0';
      end if;
      if (zgrp_lv05_bin00(1) = '1') then
        zgrp_lv06_bin00(1) <= '1';
      else
        zgrp_lv06_bin00(1) <= '0';
      end if;
      if (zgrp_lv05_bin00(2) = '1') then
        zgrp_lv06_bin00(2) <= '1';
      else
        zgrp_lv06_bin00(2) <= '0';
      end if;
    end if;
  end process;

  lut_lv07 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv06_bin00(0) = '1') then
        zgrp_lv07_bin00(0) <= '1';
      else
        zgrp_lv07_bin00(0) <= '0';
      end if;
      if (zgrp_lv06_bin00(1) = '1') then
        zgrp_lv07_bin00(1) <= '1';
      else
        zgrp_lv07_bin00(1) <= '0';
      end if;
      if (zgrp_lv06_bin00(2) = '1') then
        zgrp_lv07_bin00(2) <= '1';
      else
        zgrp_lv07_bin00(2) <= '0';
      end if;
    end if;
  end process;

  lut_lv08 : process(c1)
  begin
    if rising_edge(c1) then
      if (zgrp_lv07_bin00(0) = '1') and (zgrp_lv07_bin00(1) = '1') and (zgrp_lv07_bin00(2) = '1') then
        zgrp_lv08(0) <= '1';
      else
        zgrp_lv08(0) <= '0';
      end if;
    end if;
  end process;

end rtl;
