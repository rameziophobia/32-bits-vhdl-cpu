Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OneBitMux2x1 is
    Port ( i0, i1	: in  	STD_LOGIC;
           sel 	: in  	STD_LOGIC;
			  
           output : out  	STD_LOGIC);
end OneBitMux2x1;

architecture Behavioral of OneBitMux2x1 is

begin

	output <= i0 when sel = '0' else
					i1;

end Behavioral;
