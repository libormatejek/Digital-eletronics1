--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:39:47 03/11/2020
-- Design Name:   
-- Module Name:   D:/ise/Labs/06-display_driver/display_driver/test.vhd
-- Project Name:  display_driver
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: driver_7seg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT driver_7seg
    PORT(
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         data0_i : IN  std_logic_vector(3 downto 0);
         data1_i : IN  std_logic_vector(3 downto 0);
         data2_i : IN  std_logic_vector(3 downto 0);
         data3_i : IN  std_logic_vector(3 downto 0);
         dp_i : IN  std_logic_vector(3 downto 0);
         dp_o : OUT  std_logic;
         seg_o : OUT  std_logic_vector(6 downto 0);
         dig_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal data0_i : std_logic_vector(3 downto 0) := (others => '0');
   signal data1_i : std_logic_vector(3 downto 0) := (others => '0');
   signal data2_i : std_logic_vector(3 downto 0) := (others => '0');
   signal data3_i : std_logic_vector(3 downto 0) := (others => '0');
   signal dp_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal dp_o : std_logic;
   signal seg_o : std_logic_vector(6 downto 0);
   signal dig_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: driver_7seg PORT MAP (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          data0_i => data0_i,
          data1_i => data1_i,
          data2_i => data2_i,
          data3_i => data3_i,
          dp_i => dp_i,
          dp_o => dp_o,
          seg_o => seg_o,
          dig_o => dig_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 
		srst_n_i <= '1';
		data0_i <= x"0";
      data1_i <= x"3";
      data2_i <= x"1";
      data3_i <= x"4";
		dp_i <= "0010";
      wait;
   end process;

END;
