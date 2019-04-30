
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
				  en: in  STD_LOGIC;
				  o : out STD_LOGIC_VECTOR (3 downto 0));
	 end component;

signal not_en: STD_LOGIC;
signal temp_dec_out: STD_LOGIC_VECTOR (7 downto 0);
begin

	not_en <= not(i(2));
	decoder1: Decoder2x4_en port map (i  => i(1 downto 0),
	                                  en => not_en,
                                     o => temp_dec_out(3 downto 0));
	
	decoder2: Decoder2x4_en port map (i  => i(1 downto 0),
	                                  en => i(2),
                                     o => temp_dec_out(7 downto 4));
												 
	o <= temp_dec_out and (en & en & en & en & en & en & en & en);
	--todo: ektb el line elli fo2 da 3edel?
	
--	process is
--		variable temp_out: STD_LOGIC_VECTOR (7 downto 0);
--	begin
--		for j in 0 to 7 loop
--			temp_out(j) := (temp_dec_out(j));
--		end loop;
--		o <= temp_out;
--		wait;
--	end process;
	
end Behavioral;

