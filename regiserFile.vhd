
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

architecture Behavioral of RegiserFile is
	
	component Decoder5x32 is
		Port ( i : in   STD_LOGIC_VECTOR (4 downto 0);
             o : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component Mux32x1 is
		Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
	  		    sel : in  STD_LOGIC_VECTOR (4 downto 0);
				 o : out  STD_LOGIC);
	end component;
	
	component reg is
		Port ( in_data : in  STD_LOGIC_VECTOR (31 downto 0);
			    write_ena : in  STD_LOGIC;
				 clk : in STD_LOGIC;
			    out_data : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	
	signal write_decoder_register: STD_LOGIC_VECTOR (31 downto 0);
	
	--eh da ????? xD
	type reg_type is array (0 to 31) of std_logic_vector(31 downto 0);
	signal regs: reg_type;
begin
	
	--Mux32x1 : read_mux1 port map (i <= , o => );
	--Mux32x1 : read_mux2 port map (i <= , o => );
--	Decoder5x32 : read_dec1 port map (i <= read_sel1, o => );
--	Decoder5x32 : read_dec2 port map (i <= read_sel2, o => );
	
	Decoder5x32 : write_en_dec port map (
		i <= write_sel, o => write_decoder_register);
	
	gen: for i in 0 to 31 generate
		reg: regis port map ( 
			in_data <= write_data ,
			write_ena <= write_decoder_register(i) and  write_ena,
			clk <= clk ,
			out_data => null);
	end generate;
	
end Behavioral;

