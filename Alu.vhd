
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity Alu is
    Port ( E1 : in  STD_LOGIC_VECTOR (31 downto 0);
           E2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin

process(Aluop ,E1,E2)

begin

case Aluop is

	when "000001" =>
	Result <= std_logic_vector(unsigned(E1) + unsigned(E2))  ;          --suma
	
	when "000010" =>
	Result <= E1 AND not(E2);		--ANDN
	
	when "000011" =>
	Result <= E1 AND E2;				--AND
	
	when "000100" =>
	Result <= E1 OR E2;				--OR
	
	when "000101" =>
	Result <= E1 NOR E2;  		--ORN
	
	when "000110" =>
	Result <= E1 XOR E2;				--XOR

	when "000111" =>
	Result <= E1 XNOR E2;		--XNOR
	
	when "001011" =>
	Result <= std_logic_vector(unsigned(E1) - unsigned(E2)) ;				--SUB	
	
	when others =>
	Result <="00000000000000000000000000000000";
	
	end case;

end process;	

end Behavioral;

