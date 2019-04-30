
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity reg is
    Port ( in_data : in  STD_LOGIC_VECTOR (31 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           out_data : out  STD_LOGIC_VECTOR (31 downto 0));
end reg;

architecture Behavioral of reg is

begin
	PROCESS (clk) 
	begin
		if (clk'EVENT and clk = '1') THEN 
			if (write_ena = '1') THEN 
				out_data <= in_data ;
			end if;
		end if; 
	end process;	
end Behavioral;

