----------------------------------------------------------------------------------
-- Company: 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PSR is
    Port ( Clk : in  STD_LOGIC;
           nCwp : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           Reset : in  STD_LOGIC;
           Cwp : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal PSR2: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others=>'0');

begin
	process(Clk)
	begin
		if(rising_edge(Clk))then
			if(Reset = '1') then
				Cwp <= '0';
				Carry <= '0';
			else
				PSR2(0) <= nCwp;
				PSR2(23 downto 20) <= nzvc;
				Carry <= PSR2(20);
				Cwp <= PSR2(0);
			end if;
		end if;
	end process;
end Behavioral;

