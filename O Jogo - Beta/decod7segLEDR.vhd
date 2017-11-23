library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7segLEDR is
port (C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(9 downto 0)
);
end decod7segLEDR;

architecture arqDecodLEDR of decod7segLEDR is
begin
	F <= 	"0000000000" when C = "0000" else
			"0000000001" when C = "0001" else
			"0000000011" when C = "0010" else
			"0000000111" when C = "0011" else
			"0000001111" when C = "0100" else
			"0000011111" when C = "0101" else
			"0000111111" when C = "0110" else
			"0001111111" when C = "0111" else
			"0011111111" when C = "1000" else
			"0111111111" when C = "1001" else
			"1111111111";

											
end arqDecodLEDR;