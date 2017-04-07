----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:00 04/06/2017 
-- Design Name: 
-- Module Name:    PCS2 - Behavioral 
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

entity PCS2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end PCS2;

architecture Behavioral of PCS2 is


	COMPONENT Adder
	PORT(
		Op1 : IN std_logic_vector(31 downto 0);
		Op2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Alu
	PORT(
		E1 : IN std_logic_vector(31 downto 0);
		E2 : IN std_logic_vector(31 downto 0);
		Aluop : IN std_logic_vector(5 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ControlUnit
	PORT(
		Op3 : IN std_logic_vector(5 downto 0);
		Op : IN std_logic_vector(1 downto 0);          
		Aluop : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;	
	COMPONENT IM
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT Mux
	PORT(
		E1 : IN std_logic_vector(31 downto 0);
		E2 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT ProgramCounter
	PORT(
		DIn : IN std_logic_vector(31 downto 0);
		Rst : IN std_logic;
		Clk : IN std_logic;          
		DOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT RF
	PORT(
		Rs1 : IN std_logic_vector(4 downto 0);
		Rs2 : IN std_logic_vector(4 downto 0);
		Rd : IN std_logic_vector(4 downto 0);
		DwR : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	COMPONENT SignoExt
	PORT(
		In13 : IN std_logic_vector(12 downto 0);          
		Out32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
	signal ResultAddInNPC ,ResNPCInPC ,PC_IM,Div_Instruc  ,ResultAlu,CRS1_ALU,CRS2_MUX, Sig_Mux,MUX_ALU: std_logic_vector(31 downto 0);
	signal auxAluop : std_logic_vector(5 downto 0);
begin
	Inst_Next_ProgramCounter: ProgramCounter PORT MAP(
		DIn => ResultAddInNPC,
		Rst => Reset ,
		Clk => Clk ,
		DOut => ResNPCInPC
	);
	Inst_ProgramCounter: ProgramCounter PORT MAP(
		DIn => ResNPCInPC ,
		Rst =>Reset ,
		Clk =>  Clk ,
		DOut => PC_IM
	);

	Inst_Adder: Adder PORT MAP(
		Op1 => "00000000000000000000000000000001",
		Op2 => ResNPCInPC,
		Result => ResultAddInNPC
	);
	
	Inst_IM: IM PORT MAP(
		Address => PC_IM,
		rst => Reset,
		Instruction => Div_Instruc
	);

	
	Inst_ControlUnit: ControlUnit PORT MAP(
		Op3 => Div_Instruc( 24 downto 19),
		Op => Div_Instruc(31 downto 30),
		Aluop => auxAluop
	);
	Inst_RF: RF PORT MAP(
		Rs1 => Div_Instruc( 18 downto 14) ,
		Rs2 => Div_Instruc( 4 downto 0) ,
		Rd => Div_Instruc( 29 downto 25),
		DwR => ResultAlu,
		Crs1 => CRS1_ALU ,
		Crs2 => CRS2_MUX
	);	

	Inst_SignoExt: SignoExt PORT MAP(
		In13 => Div_Instruc( 12 downto 0) ,
		Out32 => Sig_Mux
	);

	
	Inst_Mux: Mux PORT MAP(
		E1 => CRS2_MUX,
		E2 => Sig_Mux,
		i => Div_Instruc(13),
		Result => MUX_ALU
	);



	Inst_Alu: Alu PORT MAP(
		E1 => CRS1_ALU,
		E2 => MUX_ALU ,
		Aluop => auxAluop ,
		Result => ResultAlu
	);
Result <= ResultAlu;

end Behavioral;

