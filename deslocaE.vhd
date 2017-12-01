library IEEE;
use IEEE.Std_Logic_1164.all;

entity deslocaE is
port (sel: in std_logic_vector(1 downto 0);
	 S: out std_logic_vector(7 downto 0)
	 );
end deslocaE;
architecture circuitoDeslocaE of deslocaE is
begin
	S <=  ("00000001") when sel <= "00" else
			("00000010") when sel <= "01" else
			("00000100") when sel <= "10" else				
			("00001000");
				
end circuitoDeslocaE;