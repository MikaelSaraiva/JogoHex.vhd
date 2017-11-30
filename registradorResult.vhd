library IEEE;
use IEEE.Std_Logic_1164.all;
entity registradorResult is
port (reset, enable, clock: in std_logic;
		inputScore: in std_logic_vector(11 downto 0);
		S: out std_logic_vector(11 downto 0)
);
end registradorResult;

architecture circuitoRegistradorResult of registradorResult is
begin
	process(clock,reset)
		begin
			if (reset = '0') then -- teste revertido sinal
				S <= "000000000000";
			elsif (clock'event AND clock = '1') then
				if (enable = '1') then
					S <= inputScore(11 downto 0);
				end if;
			end if;
	end process;

end circuitoRegistradorResult;