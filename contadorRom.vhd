library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contadorRom is port (
	clock, reset, ligacont: in std_logic;
	dez: out std_logic;
	cont: out std_logic_vector(3 downto 0));
end contadorRom;

architecture arqContadorRom of contadorRom is
signal contAux: std_logic_vector(3 downto 0);
begin
	process(reset, clock)
		begin
			if (reset = '1') then
				contAux <= "0000";
				dez <= '0';
			elsif (clock'event AND clock = '1') then
				if (ligaCont = '1') then
					contAux <= contAux + '1';
					if (contAux = "1001") then 
						dez <= '1';	
						contAux <= "0000";
					else 
						dez <= '0';	
					end if;
				end if;
			end if;
		end process;
		cont <= contAux;
end arqContadorRom;