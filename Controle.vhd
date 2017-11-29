library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
	enable,clock, reset, dez: in std_logic;
	ativaRegRegDecodCont, mostreResult, ativaDeMux, ativaCont, cont_clock, reset2, ativa_clock: out std_logic	
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
			elsif (clock'event AND clock = '1') then
		EAtual <= PEstado;
			end if;
		end process;
	process(EAtual)
	begin
		case EAtual is
			when S0 =>	ativaRegRegDecodCont <= '1';
							mostreResult <= '1';
							cont_clock <= '1';
							ativaCont <= '0';
							ativa_clock <= '0';
							if (enable = '0') then
								PEStado <= S1;	
							else
								PEstado <= S0;
							end if;
			when S1 => 	ativaRegRegDecodCont <= '0';
							ativaCont <= '0';
							mostreResult <= '1';
							cont_clock <= '1';
							ativa_clock <= '0';
							ativaDeMux <= '1';
							if (enable = '0') then
								PEStado <= S2;	
							else
								PEstado <= S1;
							end if;
						
			when S2 => ativaRegRegDecodCont <= '1';
							ativaCont <= '1';
							mostreResult <= '0';
							ativaDeMux <= '0';
							ativa_clock <= '1';
							cont_clock <= '0';					
							if (dez = '1') then
								PEstado <= S3;
							elsif (dez = '0') then
								PEstado <= S2;
							end if;	
			when S3 =>	ativaRegRegDecodCont <= '1';
							mostreResult <= '0';
							cont_clock <= '1';
							if (enable = '0') then
								PEStado <= S1;	
							else
								PEstado <= S3;
							end if;
		end case;
	end process;
end fsm1arq;