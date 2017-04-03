--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:15:22 04/02/2017
-- Design Name:   
-- Module Name:   C:/Users/Nicolas/Desktop/Arquitectura/Registefile/TbRF.vhd
-- Project Name:  Registefile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TbRF IS
END TbRF;
 
ARCHITECTURE behavior OF TbRF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         DwR : IN  std_logic_vector(31 downto 0);
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal DwR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Crs1 : std_logic_vector(31 downto 0);
   signal Crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          DwR => DwR,
          Crs1 => Crs1,
          Crs2 => Crs2
        );


   -- Stimulus process
   stim_proc: process
   begin		
		Rd <= "00011";
		DwR <= "11111111111111111111111111111111";		
      wait for 100 ns;	
		

		Rs2 <= "00011";
      wait for 100 ns;	
		

		Rs2 <= "00001";
      wait for 100 ns;	
				
		Rd <= "00001";
		DwR <= "11111111111111111111111111111111";
      wait for 100 ns;	
		

		Rs2 <= "00100"	;	     
		wait for 100 ns;	
		

		Rs2 <= "00001";
      -- insert stimulus here 
		wait;
 
   end process;

END;
