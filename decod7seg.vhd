library IEEE;
use IEEE.Std_Logic_1164.all;
entity decod7seg is
port (C: in std_logic_vector(1 downto 0);
		F: out std_logic_vector(6 downto 0)
);
end decod7seg;

architecture arqDecod of decod7seg is
begin
	F <= 	"1000000" when C = "00" else
			"1111001" when C = "01" else
			"0100100" when C = "10" else
			"0110000";
			
											
end arqDecod;