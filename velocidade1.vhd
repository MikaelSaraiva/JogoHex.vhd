library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity velocidade1 is
port (CLOCK_50: in std_logic;
	S: out std_logic);
end velocidade1;
	
architecture arqVelocidade of velocidade1 is
signal clk:std_logic;
signal cont: std_logic_vector(3 downto 0);  
begin
	cont <= "0000";
	process(CLOCK_50)
	begin
			if(rising_edge(CLOCK_50)) then
				cont <= cont + 1;
				if (cont= "0010") then --BEBC1FC
					cont <= "0000";
					clk <= '1';
				else
					clk <= '0';
				end if;
			end if;
	end process;
	
end arqVelocidade;