library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
	enable,clock, reset: in std_logic;
	SW: in std_logic_vector(9 downto 0);
	S: out std_logic_vector(9 downto 0)	
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
			when S0 =>  if (enable = '0') then
								PEstado <= S1;
							else
								PEstado <=S0;
							end if;
						
			when S1 =>  S(9 downto 8) <= SW(9 downto 8);
							S(1 downto 0) <= SW(1 downto 0);
							if (enable = '0') then
								PEstado <= S2;
							else
								PEstado <=S1;
							end if;
						
			when S2 => 	S(7 downto 0) <= SW(7 downto 0);
							PEstado <= S3;
						
			when S3 => if(enable = '0') then
								PEstado <= S0;
							else
								PEstado <= S3;
							end if;
		end case;
	end process;
end fsm1arq;