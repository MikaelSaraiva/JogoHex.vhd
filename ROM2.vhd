library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end entity ROM2;

architecture arqROM2 of ROM2 is
  type mem is array (0 to 9) of std_logic_vector(7 downto 0);
  	constant my_Rom : mem := (
	0 => "01101001", -- 69
	1 => "11000100", -- C4	
   2 => "01001001", -- 49
	3 => "11001010", -- CA
	4 => "11111110", -- FE
	5 => "11000000", -- C0
	6 => "00111111", -- 3F
	7 => "10111010", -- BA
	8 => "10110100", -- B4
	9 => "11001010"); --CA
	
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
end architecture arqROM2;