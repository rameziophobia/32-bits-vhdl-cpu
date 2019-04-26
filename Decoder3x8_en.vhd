
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder3x8_en is
    Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
           en : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end Decoder3x8_en;

architecture Behavioral of Decoder3x8_en is
    
	 component Decoder2x4_en is
		 Port ( i : in  STD_LOGIC_VECTOR (1 downto 0);
				  en: in  STD_LOGIC_VECTOR;
				  o : out STD_LOGIC_VECTOR (3 downto 0));
	 end component;

begin
   
	decoder1: Decoder2x4_en port map (i  <= i(1 downto 0),
	                                  en <= not(i(2)),
                                     o <= o(3 downto 0));
	
	decoder2: Decoder2x4_en port map (i  <= i(1 downto 0),
	                                  en <= i(2),
                                     o <= o(7 downto 4));
	
end Behavioral;

