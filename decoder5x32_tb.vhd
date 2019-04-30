

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decoder5x32_tb IS
END decoder5x32_tb;
 
ARCHITECTURE behavior OF decoder5x32_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder5x32
    PORT(
         i : IN  std_logic_vector(4 downto 0);
         o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder5x32 PORT MAP (
          i => i,
          o => o
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i <= "00001";
		wait for 100 ns;	
		i <= "00010";
		wait for 100 ns;	
		i <= "00101";
		wait for 100 ns;	
		i <= "00110";
		wait for 100 ns;	
		i <= "11111";
		wait for 100 ns;	
		i <= "11110";
		wait for 100 ns;	
		i <= "11100";
		wait for 100 ns;	
		i <= "00001";
		wait for 100 ns;	
		i <= "00001";
		wait for 100 ns;	
		i <= "00001";
		wait for 100 ns;	
		i <= "00001";
		wait for 100 ns;	
		i <= "00001";
		
      -- insert stimulus here 

      wait;
   end process;

END;
