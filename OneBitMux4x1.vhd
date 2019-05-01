library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OneBitMux4x1 is
    Port ( i0, i1, i2, i3 	: in 	STD_LOGIC;
           sel 				: in  STD_LOGIC_VECTOR (1 downto 0);
           output 			: out STD_LOGIC);
end OneBitMux4x1;

architecture Behavioral of OneBitMux4x1 is

	signal out_mux1_mux3: STD_LOGIC;
	signal out_mux2_mux3: STD_LOGIC;
	
begin

	mux1: entity work.OneBitMux2x1 port map (
		i0 		=> i0, 
		i1 		=> i1,
		sel 		=> sel(0), 
		output 	=> out_mux1_mux3);
		
	mux2: entity work.OneBitMux2x1 port map (
		i0 		=> i2, 
		i1 		=> i3,
		sel 		=> sel(0),
		output 	=> out_mux2_mux3);
	
	mux3: entity work.OneBitMux2x1 port map (
		i0 		=> out_mux1_mux3, 
		i1		 	=> out_mux2_mux3, 
		sel 		=> sel(1), 
		output 	=> output);
		
end Behavioral;
