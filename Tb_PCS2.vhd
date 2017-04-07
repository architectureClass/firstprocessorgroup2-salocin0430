
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Tb_PCS2 IS
END Tb_PCS2;
 
ARCHITECTURE behavior OF Tb_PCS2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCS2
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PCS2 PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Result => Result
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '1';
      wait for 40 ns;	
	    
		Reset <= '0';
			
      wait;
   end process;

END;
