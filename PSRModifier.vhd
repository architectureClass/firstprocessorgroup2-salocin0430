----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:31:35 04/25/2017 
-- Design Name: 
-- Module Name:    PSRModifier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSRModifier is
    Port ( AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Op1 : in  STD_LOGIC;
           Op2 : in  STD_LOGIC;
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRModifier;

architecture Behavioral of PSRModifier is

begin
process(AluResult,Op1,Op2,Aluop)
begin
	if(Aluop = "001100" or Aluop = "001110")then--ADDCC Y ADDXCC
		nzvc(3) <= AluResult(31);	
		if(AluResult = X"00000000")then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= (Op1 and Op2 and (not AluResult(31))) or ((Op1) and (not Op2) and AluResult(31));
		nzvc(0) <= (Op1 and Op2) or ((not AluResult(31)) and (Op1 or Op2));
	else
		if(Aluop = "001111" or Aluop = "010001")then--SUBCC y SUBXCC
			nzvc(3) <= AluResult(31);
			if(AluResult = X"00000000")then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			nzvc(1) <= ((Op1 and (not Op2) and (not AluResult(31))) or ((not Op1) and Op2 and AluResult(31)));
			nzvc(0) <= ((not Op1) and Op2) or (AluResult(31) and ((not Op1) or Op2));
		else
			if(Aluop = "010010" or Aluop = "010011" or Aluop = "010100" or Aluop = "010101" or Aluop = "010110" or Aluop = "010111")then   --ANDCC OR CC ANDNCC ORNCC XNORCC XORCC
				nzvc(3) <= AluResult(31);
				if(AluResult = X"00000000")then
					nzvc(2) <= '1';
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= '0';
				nzvc(0) <= '0';
			end if;
		end if;
	end if;
end process;

end Behavioral;

