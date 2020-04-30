----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:22 04/30/2020 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
port (
    clk_i      : in  std_logic;     -- 10 kHz clock signal
    BTN0       : in  std_logic;     -- push to transmit

    SW0_CPLD	: in std_logic;		-- data 0		
	 SW1_CPLD	: in std_logic;		-- data 1
	 SW2_CPLD	: in std_logic;		-- data 2
	 SW3_CPLD	: in std_logic;		-- data 3
    SW4_CPLD	: in std_logic;		-- data 4
	 SW5_CPLD	: in std_logic;		-- data 5
	 SW6_CPLD	: in std_logic;		-- data 6
	 SW7_CPLD	: in std_logic;		-- data 7
	 
	 SW10_CPLD	: in std_logic;		-- data bits count
	 SW11_CPLD	: in std_logic;		-- baud rate
 
	 LD0   		: out std_logic		-- serial out 
);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is 
begin

    --------------------------------------------------------------------
    -- Sub-block of clock_enable entity
    --- WRITE YOUR CODE HERE
    transmitter1 : entity work.transmitter 
    port map (
        i_clk          => clk_i,    -- 10 kHz
        i_transmitData => BTN0,     -- push to transmit
        i_databitsCount=> SW10_CPLD, -- data bits count
		  i_baudRate	  => SW11_CPLD, -- baudrate
		  o_serialLine   => LD0,
		  i_dataBits(0)  => SW0_CPLD,
		  i_dataBits(1)  => SW1_CPLD,
		  i_dataBits(2)  => SW2_CPLD,
		  i_dataBits(3)  => SW3_CPLD,
		  i_dataBits(4)  => SW4_CPLD,
		  i_dataBits(5)  => SW5_CPLD,
		  i_dataBits(6)  => SW6_CPLD,		  
		  i_dataBits(7)  => SW7_CPLD		  
    );
 

end architecture Behavioral;