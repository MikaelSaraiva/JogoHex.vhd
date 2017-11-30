library IEEE;
use IEEE.Std_Logic_1164.all;

entity muxDecodG is
port (A: in std_logic_vector(6 downto 0);
		B: in std_logic_vector(6 downto 0);
		sel: in std_logic;
		S: out std_logic_vector(6 downto 0)
);
end muxDecodG;

architecture circuitoMuxDecodG of muxDecodG is

begin
	
	S <=  A when sel = '0' else
			B;
	
end circuitoMuxDecodG;