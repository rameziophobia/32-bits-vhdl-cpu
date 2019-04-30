
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 
entity Decoder5x32 is
    Port ( --clk : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (4 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder5x32;

architecture Behavioral of Decoder5x32 is
begin

	process(i) --add clock, remove i
	variable temp_out: STD_LOGIC_VECTOR (31 downto 0);
	begin
		temp_out := (others => '0');
		temp_out(to_integer(unsigned(i))) := '1';
		o <= temp_out;
	end process;
	
end Behavioral;

