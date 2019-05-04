library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 
library work;
use work.registers_package.all;

entity Mux32x1 is
    Port ( i : in  reg_type_32bit;
           sel : in  std_logic_vector (4 downto 0);
			  clk : in  std_logic;
           o_out : out  std_logic_vector (31 downto 0));
end Mux32x1;

architecture Behavioral of Mux32x1 is
	
begin
	
	process(clk)
	begin
	if(rising_edge(clk)) then
		o_out <= i(to_integer(unsigned(sel)));
	end if;
	end process;
end Behavioral;

