library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux32x1 is
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           o : out  STD_LOGIC);
end Mux32x1;

architecture Behavioral of Mux32x1 is
	
	component Mux8x1 is
    Port ( i : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC);
	end component;
	
	component mux2x1 is
		port(i0, i1, sel : in std_logic;
			  o : out std_logic);
	end component;	
	
	signal out_mux1_mux5: STD_LOGIC;
	signal out_mux2_mux5: STD_LOGIC;
	signal out_mux3_mux5: STD_LOGIC;
	signal out_mux4_mux5: STD_LOGIC;
begin
	
	mux1: mux8x1 port map (i <= i(7 downto 0) , 
								  sel => sel(2 downto 0), 
								  o => out_mux1_mux5);
								  
   mux2: mux8x1 port map (i <= i(15 downto 8) , 
								  sel => sel(2 downto 0), 
								  o => out_mux2_mux5);
								  
   mux3: mux8x1 port map (i <= i(23 downto 16) , 
								  sel => sel(2 downto 0), 
								  o => out_mux3_mux5);
								  
   mux4: mux8x1 port map (i <= i(31 downto 24) , 
								  sel => sel(2 downto 0), 
								  o => out_mux4_mux5);
   
	mux5: mux4x1 port map (i0 => out_mux1_mux5, 
	                       i1 => out_mux2_mux5, 
	                       i2 => out_mux3_mux5, 
								  i3 => out_mux4_mux5, 
								  sel => sel(4 downto 3), 
								  o => o);

end Behavioral;

