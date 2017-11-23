library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux is
port (A, B, C, D: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	S: out std_logic
);
end mux;

architecture circuitoMuxVeloc of mux is

begin
	
	S <= A when sel = "00" else
			B when sel = "01" else
			C when sel = "10" else
			D;
	
end circuitoMuxVeloc;