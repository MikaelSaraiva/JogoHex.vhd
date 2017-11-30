library IEEE;
use IEEE.Std_Logic_1164.all;
entity registradorJogoDec is
port (reset, enable, clock, ativa_s0: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		inputScore: in std_logic_vector(7 downto 0);
		S: out std_logic_vector(3 downto 0);
		P: out std_logic_vector(3 downto 0);
		SP: out std_logic_vector(7 downto 0)
);
end registradorJogoDec;

architecture circuitoRegistradorJogoDec of registradorJogoDec is
begin
	process(clock,reset)
		begin
			if (reset = '0') then 
				S <= "0000";
				P <= "0000";
				SP <= "00000000";
			elsif (clock'event AND clock = '1') then				
				if (enable = '1') then
					S <= inputScore(3 downto 0);
					P <= inputScore(7 downto 4);
					SP <= inputScore(7 downto 0);

				end if;
			end if;
	end process;

end circuitoRegistradorJogoDec;