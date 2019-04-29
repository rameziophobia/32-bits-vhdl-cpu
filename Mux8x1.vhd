
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package bus_multiplexer_pkg8 is
        type mux8x1_32bit is array (7 downto 0) of std_logic_vector(31 downto 0);
end package;


entity Mux8x1 is --IDK KDA ARRAY SA7 WALLA LA
    Port ( i : in  mux8x1_32bit;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           o_out : out  STD_LOGIC);
end Mux8x1;

architecture Behavioral of Mux8x1 is
	
	component mux4x1 is
    Port ( i0, i1, i2, i3 : in  std_logic_vector (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           o_out : out  std_logic_vector (31 downto 0));
	end component;	
	
	component mux2x1 is
		port(i0, i1: in std_logic_vector (31 downto 0);
			  sel : in std_logic;
			  o_out : out std_logic_vector (31 downto 0));
	end component;	
	
	signal out_mux1_mux3: std_logic_vector (31 downto 0);
	signal out_mux2_mux3: std_logic_vector (31 downto 0);
	
begin
	
	mux1: mux4x1 port map (i0 => i(0), i1 => i(1),
								  i2 => i(2), i3 => i(3), 
								  sel => sel(1 downto 0), 
								  o_out => out_mux1_mux3);
								  
	mux2: mux4x1 port map (i0 => i(4), i1 => i(5), 
	                       i2 => i(6), i3 => i(7), 
								  sel => sel(1 downto 0), 
								  o_out => out_mux2_mux3);
	
	mux3: mux2x1 port map (i0 => out_mux1_mux3, 
	                       i1 => out_mux2_mux3, 
								  sel => sel(2), o_out => o_out);
	
end Behavioral;

