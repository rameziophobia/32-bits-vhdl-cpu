LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY OneBitALU_TB IS
END OneBitALU_TB;
 
ARCHITECTURE behavior OF OneBitALU_TB IS 

    COMPONENT OneBitALU
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         sel : IN  std_logic_vector(3 downto 0);
         cout : OUT  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal cout : std_logic;
   signal output : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OneBitALU PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sel => sel,
          cout => cout,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '0';
		cin 	<= '0';
		sel 	<= "0000";
		
		wait for 100 ns;
		
		a 		<= '1';
		b 		<= '0';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '1';
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '1';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '0';
		sel 	<= "0001";
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '0';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '1';
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '1';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '0';
		cin 	<= '0';
		sel 	<= "0010";
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '0';
		cin 	<= '0';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '1';
		cin 	<= '0';
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '1';
		cin 	<= '0';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '0';
		cin 	<= '1';
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '0';
		cin 	<= '1';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '1';
		cin 	<= '1';
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '1';
		cin 	<= '1';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '0';
		cin 	<= '1';
		sel 	<= "0110";
		
		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '0';
		cin 	<= '1';
		
		wait for 100 ns;	
		
		a 		<= '0';
		b 		<= '1';
		cin 	<= '1';


		wait for 100 ns;	
		
		a 		<= '1';
		b 		<= '1';
		cin 	<= '1';
		
      wait;
   end process;

END;
