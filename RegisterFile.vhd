library work;
use work.registers.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

	signal write_decoder_register: STD_LOGIC_VECTOR (31 downto 0);
	signal write_decoder_register2: STD_LOGIC_VECTOR (31 downto 0);
	signal write_ena_32: STD_LOGIC_VECTOR (31 downto 0);
	signal regs: reg_type_32bit;
begin

	read_mux1 : Mux32x1 port map (i => regs, sel => read_sel1 , o_out => data1);
	read_mux2 : Mux32x1 port map (i => regs, sel => read_sel2 , o_out => data2);

	write_en_dec : Decoder5x32 port map (
		i => write_sel, o => write_decoder_register);
		
	write_ena_32 <= (others => write_ena);
	write_decoder_register2 <= write_decoder_register and write_ena_32;

	file_memory: registers32x32 port map 
		(in_data => write_data,
	    write_ena => write_decoder_register2,
		 clk => clk,
		 out_data => regs);

end Behavioral;

