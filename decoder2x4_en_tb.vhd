

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder2x4_en_tb IS
END decoder2x4_en_tb;
 
ARCHITECTURE behavior OF decoder2x4_en_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder2x4_en
    PORT(
         i : IN  std_logic_vector(1 downto 0);
         en : IN  std_logic;
         o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(1 downto 0) := (others => '0');
   signal en : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder2x4_en PORT MAP (
          i => i,
          en => en,
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
		
		wait for 100 ns;	
		en <= '1';
		i <= "01";
		wait for 100 ns;	
		i <= "10";
		wait for 100 ns;	
		i <= "11";
		wait for 100 ns;	
		i <= "01";
      -- insert stimulus here 

      wait;
   end process;

END;
