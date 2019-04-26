
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder2x4 is
    Port ( i : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end Decoder2x4;

architecture Behavioral of Decoder2x4 is

begin
   
	o(0) <= not(i(1)) and not(i(0));
	o(1) <= not(i(1)) and (i(0));
	o(2) <= i(1) and not(i(0));
	o(3) <= i(1) and i(0);
	
end Behavioral;

