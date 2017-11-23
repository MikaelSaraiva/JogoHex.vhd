library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end entity ROM3;

architecture arqROM3 of ROM3 is
  type mem is array (0 to 9) of std_logic_vector(7 downto 0);
  	constant my_Rom : mem := (
	0 => "10010010", -- 92
	1 => "10100111", -- A7
   2 => "01000010", -- 42
	3 => "00001011", -- 0B
	4 => "00111010", -- 3A
	5 => "11010010", -- D2
	6 => "11001010", -- CA
	7 => "11110111", -- F7
	8 => "11101111", -- EF
	9 => "00010010"); --12

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
end architecture arqROM3;