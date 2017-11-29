library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contadorRom is port (
	clock, reset, enable, ligacont: in std_logic;
	dez: out std_logic;
	cont: out std_logic_vector(3 downto 0));
end contadorRom;

architecture arqContadorRom of contadorRom is
signal contAux: std_logic_vector(3 downto 0);
begin
	process(reset, clock)
		begin
			if (reset = '0') then
				cont <= "0000";
				dez <= '0';
				contAux <= "0000";
			elsif (clock'event AND clock = '1') then
				if (enable = '0' AND ligaCont = '1') then
					contAux <= contAux + '1';
					cont <= contAux + 1;
					dez <= '0';
					if (contAux = "1010") then
						dez <= '1';
						contAux <= "0000";
						cont <= "0000";
					end if;
				end if;
			end if;
		end process;
end arqContadorRom;