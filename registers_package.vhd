library IEEE;
use IEEE.STD_LOGIC_1164.all;

package registers_package is
	type reg_type_32bit is array (0 to 31) of std_logic_vector(31 downto 0);

	component Decoder5x32 is
		Port ( i : in   STD_LOGIC_VECTOR (4 downto 0);
             o : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component Mux32x1 is
		Port ( i : in  reg_type_32bit;
				 sel : in  STD_LOGIC_VECTOR (4 downto 0);
				 clk : in  STD_LOGIC;
				 o_out : out  std_logic_vector (31 downto 0));
	end component;
	
	component reg is
		Port ( in_data : in  STD_LOGIC_VECTOR (31 downto 0);
			    write_ena : in  STD_LOGIC;
				 clk : in STD_LOGIC;
			    out_data : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

	component registers32x32 is
			Port ( in_data : in  STD_LOGIC_VECTOR (31 downto 0);
					 write_ena : in  STD_LOGIC_VECTOR (31 downto 0);
					 clk : in STD_LOGIC;
					 out_data : out  reg_type_32bit);
	end component;

end registers_package;

package body registers_package is


 
end registers_package;
