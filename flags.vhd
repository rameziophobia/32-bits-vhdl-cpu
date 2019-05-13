library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flags is
	PORT(
		data 		: IN 	std_logic_vector(31 downto 0);
		cin 		: IN 	std_logic;
		cout		: IN std_logic;
		cflag 	: OUT std_logic;
		zflag 	: OUT std_logic;
		oflag 	: OUT std_logic
		);
end flags;

architecture Behavioral of flags is

begin
		zflag	<= '1' when (data = x"00000000") else '0';
		cflag <= cout;
		oflag <= (cout xor cin);
		
end Behavioral;

