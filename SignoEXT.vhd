library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SignoExt is
    Port ( In13 : in  STD_LOGIC_VECTOR (12 downto 0);
           Out32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SignoExt;

architecture Behavioral of SignoExt is

begin
	process(In13)
	begin
	if(In13(12) = '1')then
		Out32(12 downto 0) <= In13;
		Out32(31 downto 13) <= (others=>'1');
	else
		Out32(12 downto 0) <= In13;
		Out32(31 downto 13) <= (others=>'0');
	end if;
	end process;

end Behavioral;

