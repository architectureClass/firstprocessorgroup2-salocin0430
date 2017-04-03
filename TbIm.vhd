
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TbIm IS
END TbIm;
 
ARCHITECTURE behavior OF TbIm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          Address => Address,
          rst => rst,
          Instruction => Instruction
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      Address <= "00000000000000000000000000000000";
		rst<='0';
      wait for 100 ns;
		Address <= "00000000000000000000000000000011";
	   wait for 100 ns;
      Address <= "00000000000000000000000000000101";	
      wait for 100 ns;		
		rst<='1';



      -- insert stimulus here 

      wait;
   end process;

END;
