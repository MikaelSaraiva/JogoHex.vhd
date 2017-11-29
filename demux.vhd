library IEEE;
use IEEE.Std_Logic_1164.all;

entity demux is
port (enable, clock, reset: std_logic;
		A: in std_logic_vector(7 downto 0);
		sel: in std_logic_vector(1 downto 0);
		S: out std_logic_vector(7 downto 0)
);
end demux;

architecture circuitoDemuxVeloc of demux is

begin
		process(reset, clock)
			begin
				if (reset = '0') then
					S <= "00000000";
				elsif (clock'event AND clock = '1') then
					if (enable = '0') then
						S <= A;
					else
						S <= "000000" & sel;
					end if;
				end if;
		end process;	
end circuitoDemuxVeloc;