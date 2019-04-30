
-- VHDL Instantiation Created from source file RegisterFile.vhd -- 15:25:46 04/30/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RegisterFile
	PORT(
		read_sel1 : IN std_logic_vector(4 downto 0);
		read_sel2 : IN std_logic_vector(4 downto 0);
		write_sel : IN std_logic_vector(4 downto 0);
		write_ena : IN std_logic;
		clk : IN std_logic;
		write_data : IN std_logic_vector(31 downto 0);          
		data1 : OUT std_logic_vector(31 downto 0);
		data2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RegisterFile: RegisterFile PORT MAP(
		read_sel1 => ,
		read_sel2 => ,
		write_sel => ,
		write_ena => ,
		clk => ,
		write_data => ,
		data1 => ,
		data2 => 
	);


