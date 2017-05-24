library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_DataToWr is
    Port ( DataToMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Pc : in  STD_LOGIC_VECTOR (31 downto 0);
			  RfSource :in  STD_LOGIC_VECTOR (1 downto 0);
			  DataToReg : out STD_LOGIC_VECTOR (31 downto 0));
end Mux_DataToWr;

architecture Behavioral of Mux_DataToWr is

begin

process(DataToMem, AluResult, Pc,RfSource)
	begin
	
	case (RfSource) is 
      when "00" =>
         DataToReg <= DataToMem;
      when "01" =>
         DataToReg <=AluResult;
      when "10" =>
         DataToReg <=Pc;
      when others =>
         DataToReg <=AluResult;
   end case;
		
		
			
	end process;

end Behavioral;

