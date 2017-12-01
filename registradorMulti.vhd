library IEEE;
use IEEE.Std_Logic_1164.all;
entity registradorMulti is
port (reset, enable, clock: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		S: out std_logic_vector(1 downto 0)
);
end registrador;

architecture circuitoRegistradorMulti of registradorMulti is
begin
	process(clock,reset)
		begin
			if (reset = '1') then
				S <= "00";
			elsif (clock'event AND clock = '1' ) then
				if( enable = '1') then
					S <= sel;
				end if;
			end if;
	end process;

end circuitoRegistradorMulti;