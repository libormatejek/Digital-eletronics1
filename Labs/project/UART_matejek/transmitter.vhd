----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:42:24 04/29/2020 
-- Design Name: 
-- Module Name:    transmitter - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transmitter is
	port	(
		i_clk : in  std_logic;		
		i_dataBits : in std_logic_vector(7 downto 0); -- data bits  	 		
		i_databitsCount : in std_logic; 					-- 0..7bits, 1..8bits
		i_baudRate : in std_logic; 						-- 0..4800, 1..9600	
		i_transmitData : in std_logic; 					-- data transmiting is on/off	
		o_serialLine : out std_logic 					   -- serial line	
	);
end transmitter;

architecture Behavioral of transmitter is
	signal state: integer := 0;  											-- 0 .. transmit mark, 1 .. transmit start bit, 2 .. transmit databit, parity bit, stop bit 
	signal dataBits: std_logic_vector(7 downto 0) := "00001111";-- data bits
	signal dataIndex: integer := 0; 									   -- index to data bits
	--signal clk: std_logic := '0';
	signal baudRate: std_logic := '0';
	signal databitsCount: integer := 8;
	signal period: integer := 1;			
begin
	
	process_transmit : process(i_clk,i_transmitData, i_dataBits, i_databitsCount, i_baudRate)
		variable parity : std_logic := '0';
	begin	
		if rising_edge(i_clk) then 
			period <= period + 1;	
			if (baudRate = '1') or (baudRate = '0' and (period mod 2) = 0) then 		
				if( state = 0 ) then							-- mark 
					if( i_transmitData = '1' ) then  state <= 1; end if;  
					o_serialLine <= '1'; 						
				
				elsif( state = 1 ) then					-- start bit	
					if( i_transmitData = '0') then state <= 0; end if; 		
					baudRate <= i_baudRate;	
					dataBits <= i_dataBits;	
					if(i_databitsCount = '0') then databitsCount <= 7; else databitsCount <= 8; end if; 	
					dataIndex <= 0;
					o_serialLine <= '0';
					state <= 2;				
				
				elsif( state = 2 ) then 				    -- data bits	
					if(dataIndex < databitsCount) then 
						o_serialLine <= dataBits(dataIndex); 
					elsif( dataIndex = databitsCount ) then   
						parity := '0';
						for i in 0 to 7 loop 
							if(i < databitsCount) then parity := parity xor dataBits(i); end if;
						end loop;		
						o_serialLine <= parity;				 -- even parity
					else
						o_serialLine <= '1';					 -- stop bit	
						state <= 1;
					end if;
					dataIndex <= dataIndex + 1;		
				end if;
			end if;
		end if;	
	end process process_transmit;	  

end Behavioral;

