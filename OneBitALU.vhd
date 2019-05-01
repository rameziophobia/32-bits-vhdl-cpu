library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity OneBitALU is
    Port ( 	a 			: in  	STD_LOGIC;
				b 			: in  	STD_LOGIC;
				cin 		: in  	STD_LOGIC;
				sel		: in		std_logic_vector (3 downto 0);
				
				cout 		: out  	STD_LOGIC;
				output	: out 	STD_LOGIC);
end OneBitALU;

architecture Behavioral of OneBitALU is

	signal tempB: STD_LOGIC;
	signal sum: STD_LOGIC;
	
begin

	i_Mux2x1: entity work.OneBitMux2x1 port map(
		i0 		=> b,
		i1 		=> (not b),
		sel 		=> sel(2),
		output 	=> tempB
	);

	i_FAdder: entity work.Full_Adder port map(
		a 		=> a,
		b 		=> tempB,
		c 		=> cin,
		carry => cout,
		sum 	=> sum
	);

	i_Mux4x1: entity work.OneBitMux4x1 port map(
		i0 		=> (a and b),
		i1 		=> (a or b),
		i2 		=> sum,
		i3 		=> sum,
		sel 		=> (sel(1) & sel(0)),
		output 	=> output
	);

end Behavioral;
