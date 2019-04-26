
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder5x32 is
    Port ( i : in  STD_LOGIC_VECTOR (4 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder5x32;

architecture Behavioral of Decoder5x32 is

	component Decoder3x8_en is
		 Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
				  enable : in  STD_LOGIC;
				  o : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component Decoder2x4 is
		 Port ( i : in  STD_LOGIC_VECTOR (1 downto 0);
				  o : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	signal decoder0_out: STD_LOGIC_VECTOR (3 downto 0);
begin
   
	decoder0: Decoder2x4 port map (i  <= i(4 downto 3),
                                  o <= decoder0_out);
											 
	decoder1: Decoder3x8_en port map (i  <= i(2 downto 0),
	                                  en <= decoder0_out(0),
                                     o  <= o(7 downto 0));
												 
	decoder2: Decoder3x8_en port map (i  <= i(2 downto 0),
	                                  en <= decoder0_out(1),
                                     o  <= o(15 downto 8));
												 
	decoder3: Decoder3x8_en port map (i  <= i(2 downto 0),
	                                  en <= decoder0_out(2),
                                     o  <= o(23 downto 16));
												 
	decoder4: Decoder3x8_en port map (i  <= i(2 downto 0),
	                                  en <= decoder0_out(3),
                                     o  <= o(31 downto 24));
	
end Behavioral;

