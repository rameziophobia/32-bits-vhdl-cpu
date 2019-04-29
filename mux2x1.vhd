library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
    Port ( i0 : in  std_logic_vector (31 downto 0);
           i1 : in  std_logic_vector (31 downto 0);
           sel : in  STD_LOGIC;
           o_out : out  std_logic_vector (31 downto 0));
end mux2x1;

architecture Behavioral of mux2x1 is

begin

	o_out <= (i0 and not(sel)) or (i1 and sel);

end Behavioral;

