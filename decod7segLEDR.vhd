library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7segLEDR is

port (enable: in std_logic;
		C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(9 downto 0)
);
end decod7segLEDR;

architecture arqDecodLEDR of decod7segLEDR is
begin
	process(enable)
	begin
	if(enable = '0') then
		F <= "0000000000";
	else	
		 	 if (C = "0000") then
					F <="0000000000";
			 elsif(C = "0001") then
					F <= "0000000001";
			 elsif (C = "0010" ) then
					F <= "0000000011";
			 elsif (C = "0011" ) then
					F <= "0000000111";
			 elsif (C = "0100" ) then
					F <= "0000001111";
			 elsif (C = "0101") then 
					F <= "0000011111";
			 elsif (C = "0110") then 
					F <= "0000111111";
			 elsif (C = "0111") then
					F <= "0001111111";
			 elsif (C = "1000") then 
					F <= "0011111111";
			 elsif (C = "1001") then
					F <= "0111111111";
		    else 
					F <= "1111111111";
			end if;
	end if;
								
	end process;			
end arqDecodLEDR;