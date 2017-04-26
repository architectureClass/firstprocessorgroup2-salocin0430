----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity ControlUnit is
    Port ( Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
begin

process(Op3,Op)
	begin
	if(Op ="10") then
			case Op3 is
			when "000000" => 				-- Suma
			Aluop <= "000001";     
			
			when "000101" => 				-- ANDN
			Aluop <= "000010"; 
			
			when "000001" => 				-- AND
			Aluop <= "000011"; 
			
			when "000010" => 				-- OR
			Aluop <= "000100";
			
			when "000110" => 				-- ORN
			Aluop <= "000101";
			
			when "000011" => 				-- XOR
			Aluop <= "000110"; 
			
			when "000111" => 				-- XNOR
			Aluop <= "000111";
			
			when "100101" => 				-- SLL
			Aluop <= "001000"; 
			
			when "100110" => 				-- SRL
			Aluop <= "001001"; 
			
			when "100111" => 				-- SRA
			Aluop <= "001010"; 
			
			when "000100" => 				-- SUB
			Aluop <= "001011"; 	
			
			when "010000" => 				-- ADDCC
			Aluop <= "001100"; 	

			when "001000" => 				-- ADDX
			Aluop <= "001101"; 	

			when "011000" => 				-- ADDXCC
			Aluop <= "001110"; 	

			when "010100" => 				-- SUBCC
			Aluop <= "001111"; 	

			when "001100" => 				-- SUBX
			Aluop <= "010000"; 	

			when "011100" => 				-- SUBXCC
			Aluop <= "010001"; 	

			when "010001" => 				-- ANDCC
			Aluop <= "010010"; 	

			when "010010" => 				-- ORCC
			Aluop <= "010011"; 	

			when "010101" => 				-- ANDNCC
			Aluop <= "010100"; 
			
			when "010110" => 				-- ORNCC
			Aluop <= "010101";
			
			when "010111" => 				-- XNORCC
			Aluop <= "010110"; 

			when "010011" => 				-- XORCC
			Aluop <= "010111"; 
			
			when others =>
			Aluop <= "000000";
			
			end case;
	end if;
end process;

end Behavioral;

