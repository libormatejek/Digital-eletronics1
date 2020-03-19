----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:51 03/18/2020 
-- Design Name: 
-- Module Name:    clockwatch - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockwatch is
port (
	clk_i    	: in  std_logic;
	srst_n_i 	: in  std_logic;   -- Synchronous reset (active low)
	ce_100Hz_i  : in  std_logic;
	cnt_en_i 	: in  std_logic;	 -- stopwatch enable
	
	sec_h_o		: out std_logic_vector(3 downto 0); --(counter for tens of seconds)
	sec_l_o 		: out std_logic_vector(3 downto 0); --(counter for seconds)	
	hth_h_o		: out std_logic_vector(3 downto 0); --(counter for tenths of seconds)
	hth_l_o		: out std_logic_vector(3 downto 0) --(counter for hundredths of seconds)
);
end clockwatch;


architecture Behavioral of clockwatch is
begin
	p1 : process(clk_i, srst_n_i, ce_100Hz_i, cnt_en_i)
		variable s_d1 : std_logic_vector(3 downto 0) := x"0";
		variable s_d2 : std_logic_vector(3 downto 0) := x"0";
		variable s_d3 : std_logic_vector(3 downto 0) := x"0";
		variable s_d4 : std_logic_vector(3 downto 0) := x"0";	
	begin
		if(srst_n_i = '0') then
			s_d1 := x"0";
			s_d2 := x"0";
			s_d3 := x"0";
			s_d4 := x"0";
		elsif clk_i  = '1' and cnt_en_i = '1' and rising_edge(ce_100Hz_i) then	
			s_d1 := s_d1 + x"1";
			if s_d1 > 9 then s_d1 := x"0"; s_d2 := s_d2 + x"1"; end if; 
			if s_d2 > 9 then s_d2 := x"0"; s_d3 := s_d3 + x"1"; end if; 
			if s_d3 > 9 then s_d3 := x"0"; s_d4 := s_d4 + x"1"; end if; 
			if s_d4 > 5 then s_d4 := x"0";                   	 end if; 	
		end if;
		sec_h_o <= s_d4;
		sec_l_o <= s_d3;
		hth_h_o <= s_d2;
		hth_l_o <= s_d1;
	end process;
end Behavioral;

