library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contador is port (
	clock, reset, enable: in std_logic;
	cont: out std_logic_vector(3 downto 0));
end contador;

architecture arqContador of contador is
signal contAux: std_logic_vector(3 downto 0);
begin
	process(clock,reset)
		begin
			if (reset = '0') then
				cont <= "0000";
			elsif (clock'event AND clock = '1') then
				if (enable = '0') then
						contAux <= contAux + '1';
						cont <= contAux;
				end if;
			end if;
		end process;
end arqContador;