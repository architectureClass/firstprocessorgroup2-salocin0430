
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxRFDest is
    Port ( nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           registroO7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDestSel : in  STD_LOGIC;
           RFDest : out  STD_LOGIC_VECTOR (5 downto 0));
end muxRFDest;

architecture arqMuxRFDest of muxRFDest is
signal auxi : integer:=0 ;
begin
	process(nrd,registroO7,RFDestSel)
	begin
		if(RFDestSel = '0')then
			RFDest <= nrd;
		else
			if(RFDestSel = '1')then
			   --auxi <= conv_integer(registroO7) - auxi;
				--RFDest <= conv_std_logic_vector(auxi, 6);
				--auxi<=auxi+1;
				if(auxi=0)then
					RFDest <= "001111";
					auxi<=0;
				else
					if(auxi=1)then
						RFDest <= "001110";
						auxi<=0;
					end if;				
				end if;				
			end if;
		end if;
	end process;
end arqMuxRFDest;