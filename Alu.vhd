
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Alu is
    Port ( E1 : in  STD_LOGIC_VECTOR (31 downto 0);
           E2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  C : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin

process(Aluop ,E1,E2)

begin

case Aluop is

	when "000001" =>
	Result <= E1 + E2  ;          --ADD
	
	when "001100" =>
	Result <= E1 + E2  ;          --ADDCC	

	when "001101" =>
	Result <= E1 + E2 + C ;          --ADDX	

	when "001110" =>
	Result <= E1 + E2 + C ;          --ADDXCC		
	
	when "000010" =>
	Result <= E1 AND not(E2);		--ANDN

	when "010100" =>
	Result <= E1 AND not(E2);		--ANDNCC	
	
	when "000011" =>
	Result <= E1 AND E2;				--AND
	
	when "010010" =>
	Result <= E1 AND E2;				--ANDCC
	
	when "000100" =>
	Result <= E1 OR E2;				--OR
	
	when "010011" =>
	Result <= E1 OR E2;				--ORCC	
	
	when "000101" =>
	Result <= E1 NOR E2;  		--ORN

	when "010101" =>
	Result <= E1 NOR E2;  		--ORNCC	
	
	when "000110" =>
	Result <= E1 XOR E2;				--XOR

	when "010111" =>
	Result <= E1 XOR E2;				--XORCC	

	when "000111" =>
	Result <= E1 XNOR E2;		--XNOR
	
	when "010110" =>
	Result <= E1 XNOR E2;		--XNORCC	
	
	when "001011" =>
	Result <= E1 - E2 ;				--SUB	

	when "001111" =>
	Result <= E1 - E2 ;				--SUBCC	

	when "010000" =>
	Result <= E1 - E2 - C ;				--SUBX	

	when "010001" =>
	Result <= E1 - E2 - C;				--SUBXCC	

	
	when others =>
	Result <="00000000000000000000000000000000";
	
	end case;

end process;	

end Behavioral;

