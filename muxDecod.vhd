library IEEE;
use IEEE.Std_Logic_1164.all;

entity muxDecod is
port (A: in std_logic_vector(6 downto 0);
		B: in std_logic_vector(1 downto 0);
		sel: in std_logic;
		S: out std_logic_vector(6 downto 0)
);
end muxDecod;

architecture circuitoMuxDecod of muxDecod is

begin
	
	S <=  A when sel = '0' else
			"1000000" when B = "00" else
			"1111001" when B = "01" else
			"0100100" when B = "10" else
			"0110000";

	
end circuitoMuxDecod;