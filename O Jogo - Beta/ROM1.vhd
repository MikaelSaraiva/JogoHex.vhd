library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end entity ROM1;

architecture arqROM1 of ROM1 is
  type mem is array (0 to 9) of std_logic_vector(7 downto 0);
	constant my_Rom : mem := (
	0 => "01001111", -- 4F
	1 => "11001101", -- CD
   2 => "10101110", -- AE
	3 => "00100000", -- 20
	4 => "01011010", -- 5A
	5 => "10111101", -- BD
	6 => "10010100", -- 94
	7 => "10000011", -- 83
	8 => "11110010", -- F2
	9 => "01100110"); --66
 
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(0);
       when "0001" => data <= my_rom(1);
       when "0010" => data <= my_rom(2);
       when "0011" => data <= my_rom(3);
       when "0100" => data <= my_rom(4);
       when "0101" => data <= my_rom(5);
       when "0110" => data <= my_rom(6);
       when "0111" => data <= my_rom(7);
       when "1000" => data <= my_rom(8);
       when "1001" => data <= my_rom(9);
       when others => data <= "00000000";
       end case;
  end process;
end architecture arqROM1;