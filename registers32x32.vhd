library work;
use work.registers.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers32x32 is
		Port ( in_data : in  STD_LOGIC_VECTOR (31 downto 0);
			    write_ena : in  STD_LOGIC_VECTOR (31 downto 0);
				 clk : in STD_LOGIC;
			    out_data : out reg_type_32bit);
end registers32x32;

architecture Behavioral of registers32x32 is

begin

	gen: for i in 0 to 31 generate
		regis: reg port map ( 
			in_data => in_data ,
			write_ena=> write_ena(i),
			clk => clk ,
			out_data => out_data(i));
	end generate;

end Behavioral;

