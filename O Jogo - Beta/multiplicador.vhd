library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity multiplicador is
port (inputCont: in UNSIGNED(3 downto 0);
		inputDE: in UNSIGNED(7 downto 0);
		S: out UNSIGNED(11 downto 0)
);
end multiplicador;

architecture arqMultiplicador of multiplicador is
	begin
	
		S <= inputCont * inputDE;
		
end arqMultiplicador;