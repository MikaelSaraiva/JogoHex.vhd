library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity velocidade3 is
port (CLOCK_50: in std_logic;
	S: out std_logic);
end velocidade3;
	
architecture arqVelocidade of velocidade3 is
signal clk:std_logic;
signal cont: std_logic_vector(27 downto 0);  
begin
	process(CLOCK_50)
	begin
			if(rising_edge(CLOCK_50)) then
				cont <= cont + 1;
				if (cont= x"5F5E0FE") then
					cont<= x"0000000";
					clk<= '1';
				else
					clk <= '0';
				end if;
			end if;
	end process;
	
end arqVelocidade;