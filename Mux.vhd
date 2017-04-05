
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( E1 : in  STD_LOGIC_VECTOR (31 downto 0);
           E2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC ;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Behavioral of Mux is

begin

process(i,E1,E2)
	begin
	case  i is
 
		when '0' =>
		Result <= E1;
		
		when '1' =>
		Result <= E2;
		
		when others =>
		Result <= "00000000000000000000000000000000";
		
		end case;
	
	end process;	

end Behavioral;

