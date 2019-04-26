
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regiserFile is
    Port ( readAddress1 : in  STD_LOGIC_VECTOR (4 downto 0);
           readAddress2 : in  STD_LOGIC_VECTOR (4 downto 0);
           writeAddress : in  STD_LOGIC_VECTOR (4 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           readData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           readData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end regiserFile;

architecture Behavioral of regiserFile is
	
	component Decoder5x32 is
		Port ( i : in   STD_LOGIC_VECTOR (4 downto 0);
             o : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component Mux32x1 is
		 Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
				  sel : in  STD_LOGIC_VECTOR (4 downto 0);
				  o : out  STD_LOGIC);
	end component;
	
	-- add register component
	
begin


end Behavioral;

