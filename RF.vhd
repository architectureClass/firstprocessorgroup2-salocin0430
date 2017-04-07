
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RF is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  Reset : in  STD_LOGIC;
           DwR : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is
	type ram is array (0 to 39) of std_logic_vector (31 downto 0);
	signal Registers : ram :=(others => x"00000000");
	
begin
	process(Rs1,Rs2,Rd,DwR,Registers)
	begin
	Registers (0) <= x"00000000";
	
	if (Reset = '1') then 
			Registers <=(others => x"00000000");
			Crs1 <= (others => '0');
			Crs2 <= (others => '0');

	else		
			Crs1 <= Registers(conv_integer(Rs1));
			Crs2 <= Registers(conv_integer(Rs2));
			if(Rd /= "00000")then
				Registers(conv_integer(Rd)) <= DwR;
			end if;
	end if;		
	end process;

end Behavioral;

