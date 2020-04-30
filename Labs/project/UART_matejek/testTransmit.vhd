--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:50:49 04/30/2020
-- Design Name:   
-- Module Name:   C:/Users/Libor/Desktop/project/uart/testTransmit.vhd
-- Project Name:  uart
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: transmitter
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
 
ENTITY testTransmit IS
END testTransmit;
 
ARCHITECTURE behavior OF testTransmit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT transmitter
    PORT(
         i_clk : IN  std_logic;
         i_dataBits : IN  std_logic_vector(7 downto 0);
         i_databitsCount : IN  std_logic;
         i_baudRate : IN  std_logic;
         i_transmitData : IN  std_logic;
         o_serialLine : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_dataBits : std_logic_vector(7 downto 0) := (others => '0');
   signal i_databitsCount : std_logic := '0';
   signal i_baudRate : std_logic := '0';
   signal i_transmitData : std_logic := '0';

 	--Outputs
   signal o_serialLine : std_logic;

   -- Clock period definitions
   constant i_clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: transmitter PORT MAP (
          i_clk => i_clk,
          i_dataBits => i_dataBits,
          i_databitsCount => i_databitsCount,
          i_baudRate => i_baudRate,
          i_transmitData => i_transmitData,
          o_serialLine => o_serialLine
        );

   -- Clock process definitions
   i_clk_process :process
   begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 10 ns;	

      --wait for i_clk_period*10;

      -- insert stimulus here
		i_dataBits <= "00011111";
      i_databitsCount <= '0';
      i_baudRate <= '1';
		
		i_transmitData <= '0';
		wait for 10 ns;
      i_transmitData <= '1';		
	
      wait;
   end process;

END;
