library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder2x4_en is
    Port ( i : in  STD_LOGIC_VECTOR (1 downto 0);
	        en: in  STD_LOGIC_VECTOR;
           o : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder2x4_en;

architecture Behavioral of Decoder2x4_en is

	signal outSig: STD_LOGIC_VECTOR (3 downto 0);
begin
   
	outSig(0) <= not(i(1)) and not(i(0));
	outSig(1) <= not(i(1)) and (i(0));
	outSig(2) <= i(1) and not(i(0));
	outSig(3) <= i(1) and i(0);
	o <= outSig and (en & en & en & en);
	
end Behavioral;
