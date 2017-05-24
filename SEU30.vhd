
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU30 is
    Port ( imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           SEU30_out : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU30;

architecture Behavioral of SEU30 is

begin
	process(imm30)
	begin
		
		SEU30_out(29 downto 0) <= imm30;
		if(imm30(29) = '0')then
			SEU30_out(31 downto 30) <= (others=>'0');
		else
			SEU30_out(31 downto 30) <= (others=>'1');
		end if;			
	
	end process;

end Behavioral;

