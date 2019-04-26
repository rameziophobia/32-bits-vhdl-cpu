----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:05:18 04/26/2019 
-- Design Name: 
-- Module Name:    Mux8x1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux8x1 is
    Port ( i : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC);
end Mux8x1;

architecture Behavioral of Mux8x1 is
	
	component mux4x1 is
    Port ( i0, i1, i2, i3 : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC);
	end component;	
	
	component mux2x1 is
		port(i0, i1, sel : in std_logic;
			  o : out std_logic);
	end component;	
	
	signal out_mux1_mux3: STD_LOGIC;
	signal out_mux2_mux3: STD_LOGIC;
	
begin
	
	mux1: mux4x1 port map (i0 => i(0), i1 => i(1),
								  i2 => i(2), i3 => i(3), 
								  sel => sel(1 downto 0), 
								  o => out_mux1_mux3);
								  
	mux2: mux4x1 port map (i0 => i(4), i1 => i(5), 
	                       i2 => i(6), i3 => i(7), 
								  sel => sel(1 downto 0), 
								  o => out_mux2_mux3);
	
	mux3: mux2x1 port map (i0 => out_mux1_mux3, 
	                       i1 => out_mux2_mux3, 
								  sel => sel(2), o => o);
	
end Behavioral;

