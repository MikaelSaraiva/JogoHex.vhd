library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
	enable,clock, reset, dez: in std_logic;
	ativa_reg1, ativa_reg2, ativa_reg3, ativa_Result, ativa_Cont, ativa_clock, ativa_s0, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45: out std_logic	
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
			when S0 =>	ativa_reg1		<= '0'; 
							ativa_reg2		<= '0'; 
							ativa_reg3 		<= '1'; 
							ativa_Result 	<= '0';
							ativa_Cont 		<= '0';
							ativa_clock 	<= '0';
							ativa_s0			<= '0';
							ativa_muxDec01	<= '1';
							ativa_muxDec23	<= '1';
							ativa_muxDec45	<= '1';
							
							if (enable = '0') then
								PEStado <= S1;	
							else
								PEstado <= S0;
							end if;
			when S1 => 	ativa_reg1		<= '1';
							ativa_reg2		<= '1';
							ativa_reg3 		<= '1';
							ativa_Result 	<= '0';
							ativa_Cont 		<= '0';
							ativa_clock		<= '0';
							ativa_s0			<= '0';
							ativa_muxDec01	<= '1';
							ativa_muxDec23	<= '1';
							ativa_muxDec45	<= '0';
							
							if (enable = '0') then
								PEStado <= S2;	
							else
								PEstado <= S1;
							end if;
						
			when S2 =>  ativa_reg1		<= '0';
							ativa_reg2		<= '0';
							ativa_reg3 		<= '1';
							ativa_Result 	<= '0';
							ativa_Cont 		<= '1';
							ativa_clock 	<= '1';
							ativa_s0			<= '0';
							ativa_muxDec01	<= '0';
							ativa_muxDec23	<= '1';
							ativa_muxDec45	<= '0';

							
							if (dez = '1') then
								PEstado <= S3;
							elsif (dez = '0') then
								PEstado <= S2;
							end if;	
			when S3 =>	ativa_reg1		<= '0';
							ativa_reg2		<= '0';
							ativa_reg3 		<= '0';
							ativa_Result 	<= '1';
							ativa_Cont 		<= '0';
							ativa_clock 	<= '0';
							ativa_s0	    	<= '0';
							ativa_muxDec01	<= '1';
							ativa_muxDec23	<= '0';
							ativa_muxDec45	<= '1';

							if (enable = '0') then
								PEStado <= S0;	
							else
								PEstado <= S3;
							end if;
		end case;
	end process;
end fsm1arq;