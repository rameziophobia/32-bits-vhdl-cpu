library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	PORT(
		data1 	: IN 	std_logic_vector(31 downto 0);
		data2 	: IN 	std_logic_vector(31 downto 0);
		aluop 	: IN 	std_logic_vector(3 downto 0);
		cin 		: IN 	std_logic;
		dataout 	: OUT std_logic_vector(31 downto 0);
		cflag 	: OUT std_logic;
		zflag 	: OUT std_logic;
		oflag 	: OUT std_logic
	);
end ALU;

architecture Behavioral of ALU is

	signal prevC		: std_logic_vector(0 to 30);
	signal carry		: std_logic;
	signal datatemp	: std_logic_vector(31 downto 0);
	
begin

	i_OneBitALU0: entity work.OneBitALU port map ( 
			a		=>	data1(0),
			b		=>	data2(0),
			cin	=>	cin,
			sel	=>	aluop,
			cout	=>	prevC(0),
			output=>	datatemp(0)
		);

	gen: for i in 1 to 30 generate
		i_OneBitALU: entity work.OneBitALU port map ( 
				a		=>	data1(i),
				b		=>	data2(i),
				cin	=>	prevC(i - 1),
				sel	=>	aluop,
				cout	=> prevC(i),
				output=>	datatemp(i)
			);	
	end generate;
	i_OneBitALU31: entity work.OneBitALU port map ( 
			a		=>	data1(31),
			b		=>	data2(31),
			cin	=>	prevC(30),
			sel	=>	aluop,
			cout	=>	carry,
			output=>	datatemp(31)
		);
	zflag	<= '1' when (datatemp = x"00000000") else '0';
	cflag <= carry;
	oflag <= prevC(30) xor carry;
	dataout <= datatemp;

end Behavioral;

