

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY decoder3x8_en_tb IS
END decoder3x8_en_tb;
 
ARCHITECTURE behavior OF decoder3x8_en_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder3x8_en
    PORT(
         i : IN  std_logic_vector(2 downto 0);
         en : IN  std_logic;
         o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(2 downto 0) := (others => '0');
   signal en : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder3x8_en PORT MAP (
          i => i,
          en => en,
          o => o
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i <= "001";
		wait for 100 ns;	
		i <= "010";
		wait for 100 ns;	
		i <= "011";
		wait for 100 ns;	
		i <= "100";
		wait for 100 ns;
		i <= "101";
		wait for 100 ns;	
		i <= "110";
		wait for 100 ns;	
		i <= "111";
		
		wait for 100 ns;
		en <= '1';
		i <= "001";
		wait for 100 ns;	
		i <= "010";
		wait for 100 ns;	
		i <= "011";
		wait for 100 ns;	
		i <= "100";
		wait for 100 ns;
		i <= "101";
		wait for 100 ns;	
		i <= "110";
		wait for 100 ns;	
		i <= "111";

      -- insert stimulus here 

      wait;
   end process;

END;
