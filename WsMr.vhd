----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:09 05/01/2017 
-- Design Name: 
-- Module Name:    WsMr - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WsMr is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           Cwp : in  STD_LOGIC;
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0);
           nCwp : out  STD_LOGIC:= '0');
end WsMr;

architecture Behavioral of WsMr is
	signal Rs1i,Rs2i,Rdi: integer range 0 to 39:=0;

begin	
	process(Op,Op3,Rs1,Rs2,Rd,Cwp)
	begin
			if(Op = "10" and Op3 = "111100")then--SAVE
				nCwp <= Cwp and '1';
			else
				if(Op = "10" and Op3 = "111101")then--RESTORE
					nCwp <= Cwp or '1';
				end if;
			end if;
		
		if(Rs1>="00000" and Rs1<="00111") then  --Globales 
			Rs1i <= conv_integer(Rs1);
		else
			if(Rs1>="11000" and Rs1<="11111") then  --Entrada -Salida 
				Rs1i <= conv_integer(Rs1)-(conv_integer(Cwp)*16);
			else
				if(Rs1>="10000" and Rs1<="10111") then
					Rs1i <= conv_integer(Rs1)+(conv_integer(Cwp)*16);
				else
						if(Rs1>="01000" and Rs1<="01111") then
							Rs1i <= conv_integer(Rs1)+ (conv_integer(Cwp)*16);
						end if;
				end if;
			end if;
		end if;
		
		
	
		if(Rs2>="00000" and Rs2<="00111") then
			Rs2i <= conv_integer(Rs2);
		else
			if(Rs2>="11000" and Rs2<="11111") then
				Rs2i <= conv_integer(Rs2) - (conv_integer(Cwp)*16);
				else
					if(Rs2>="10000" and Rs2<="10111") then
						Rs2i <= conv_integer(Rs2)+ (conv_integer(Cwp)*16);
					else
						if(Rs2>="01000" and Rs2<="01111") then
							Rs2i <= conv_integer(Rs2)+ (conv_integer(Cwp)*16);
						end if;
					end if;
				end if;
		end if;
		
		if(Rd>="00000" and Rd<="00111") then
			Rdi <= conv_integer(Rd);
		else
			if(Rd>="11000" and Rd<="11111") then
				Rdi <= conv_integer(Rd)  - (conv_integer(Cwp)*16);
			else
				if(Rd>="10000" and Rd<="10111") then
					Rdi <= conv_integer(Rd)+ (conv_integer(Cwp)*16);
				else
					if(Rd>="01000" and Rd<="01111") then
						Rdi <= conv_integer(Rd)+ (conv_integer(Cwp)*16);
					end if;
				end if;
			end if;
		end if;
	end process;
	nRs1 <= conv_std_logic_vector(Rs1i, 6);
	nRs2 <= conv_std_logic_vector(Rs2i, 6);
	nRd <= conv_std_logic_vector(Rdi, 6);
end Behavioral;

