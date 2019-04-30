library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 
library work;
use work.registers.all;
 
ENTITY mux32_tb IS
END mux32_tb;
 
ARCHITECTURE behavior OF mux32_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux32x1
    PORT(
         i : IN  reg_type_32bit;
         sel : IN  std_logic_vector(4 downto 0);
         o_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : reg_type_32bit;
   signal sel : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal o_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux32x1 PORT MAP (
          i => i,
          sel => sel,
          o_out => o_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		for j in 0 to 15 loop
		i(j) <= "00000000000000000000000000000001";
		end loop;
		for j in 16 to 31 loop
		i(j) <= "00000000000000000000000000001111";
		end loop;
		
		sel <= "00001";
      wait for 100 ns;	
		i(31) <= "00000000000000000000000000000001";
		sel <= "11010";
		wait for 100 ns;	
		sel <= "11111";
      -- insert stimulus here 

      wait;
   end process;

END;
