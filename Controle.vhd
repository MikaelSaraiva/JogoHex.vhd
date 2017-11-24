library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
	enable,clock, reset: in std_logic;
	SW: in std_logic_vector(9 downto 0);
	S: out std_logic	
	);
end Controle;

architecture fsm1arq of Controle is
type STATES is (S0, S1, S2, S3);
signal EAtual, PEstado: STATES;
begin

	process(clock,reset)
		begin
			if (reset = '0') then
		EAtual <= S0;
			elsif (clock'event AND clock = '1' AND enable = '0') then
		EAtual <= PEstado;
			end if;
		end process;
	process(EAtual)
	begin
		case EAtual is
			when S0 =>	S <= '0'
						PEStado <= S1;	
						
			when S1 =>  
						S <= 1;
						PEstado <= S2;
						
			when S2 => 	
						
			when S3 => PEStado <= S0;
		end case;
	end process;
end fsm1arq;