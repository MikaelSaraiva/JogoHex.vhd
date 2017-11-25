library IEEE;
use IEEE.Std_Logic_1164.all;

entity muxRom is
port (A, B, C, D: in std_logic_vector(7 downto 0);
	sel: in std_logic_vector(1 downto 0);
	S: out std_logic_vector(7 downto 0)
);
end muxRom;

architecture circuitoMuxRom of muxRom is

begin
		S <= A when sel = "00" else
				B when sel = "01" else
				C when sel = "10" else
				D;
end circuitoMuxRom;