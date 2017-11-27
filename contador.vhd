library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contador is port (
	reset, enable: in std_logic;
	cont: out std_logic_vector(3 downto 0));
end contador;

architecture arqContador of contador is
signal contAux: std_logic_vector(3 downto 0);
begin
	process(reset, enable)
		begin
			if (reset = '0') then
				cont <= "0000";
			elsif (enable = '0') then
				contAux <= contAux + '1';
				cont <= contAux;
				
			end if;
		end process;
end arqContador;