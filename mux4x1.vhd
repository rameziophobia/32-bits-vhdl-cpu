
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port ( i0, i1, i2, i3 : in  std_logic_vector (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           o_out : out  std_logic_vector (31 downto 0));
end mux4x1;

architecture Behavioral of mux4x1 is
	
	component mux2x1 is
		port(i0, i1: in std_logic_vector (31 downto 0);
			  sel : in std_logic;
			  o_out : out std_logic_vector (31 downto 0));
	end component;
	
	signal out_mux1_mux3: STD_LOGIC;
	signal out_mux2_mux3: STD_LOGIC;
begin
	
	mux1: mux2x1 port map (
		i0 => i0, 
		i1 => i1,
		sel => sel(0), 
		o_out => out_mux1_mux3);
		
	mux2: mux2x1 port map (
		i0 => i2, 
		i1 => i3,
		sel => sel(0),
		o_out => out_mux2_mux3);
	
	mux3: mux2x1 port map (
		i0 => out_mux1_mux3, 
		i1 => out_mux2_mux3, 
		sel => sel(1), 
		o_out => o_out);

end Behavioral;

