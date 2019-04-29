
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux32x1_32bit is
    Port ( inp : in  STD_LOGIC_VECTOR (31 downto 0)(0 to 31); --(word_data)(num of reg in file)
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           o_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux32x1_32bit;

architecture Behavioral of Mux32x1_32bit is

	component Mux32x1 is
		Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
	  		    sel : in  STD_LOGIC_VECTOR (4 downto 0);
				 o : out  STD_LOGIC);
	end component;
	
--	type bus_array is array(natural range <>) of std_logic_vector;
begin
	
		gen: for i in 31 downto 0 generate
			Mux32x1: mux port map(
				i <= inp(i),
				sel <= sel,
				o => o_out(i));
			end generate;
	
end Behavioral;

