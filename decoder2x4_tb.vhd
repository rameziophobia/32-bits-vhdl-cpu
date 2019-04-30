

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decoder2x4_tb IS
END decoder2x4_tb;
 
ARCHITECTURE behavior OF decoder2x4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder2x4
    PORT(
         i : IN  std_logic_vector(1 downto 0);
         o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder2x4 PORT MAP (
          i => i,
          o => o
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i <= "01";
		wait for 100 ns;	
		i <= "10";
		wait for 100 ns;	
		i <= "11";
		wait for 100 ns;	
		i <= "01";
		
      wait;
   end process;

END;
