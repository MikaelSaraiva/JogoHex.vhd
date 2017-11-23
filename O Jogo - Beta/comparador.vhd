library ieee;
use ieee.std_logic_1164.all;

entity comparador is port (
	inputMux, inputUser: in std_logic_vector(7 downto 0);
	S: out std_logic);
end comparador;

architecture arqComparador of comparador is
begin
-- Comparador:
S <= '1' when (inputMux = inputUser) else
'0';
end arqComparador;