library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_16_to_1 is
  port (
    i : in std_logic_vector(15 downto 0);
    selector : in std_logic_vector(3 downto 0);
    o : out std_logic
  );
end multiplexer_16_to_1;

architecture Behavioral of multiplexer_16_to_1 is

begin

  with selector select o <=
    i(0) when "0000",
    i(1) when "0001",
    i(2) when "0010",
    i(3) when "0011",
    i(4) when "0100",
    i(5) when "0101",
    i(6) when "0110",
    i(7) when "0111",
    i(8) when "1000",
    i(9) when "1001",
    i(10) when "1010",
    i(11) when "1011",
    i(12) when "1100",
    i(13) when "1101",
    i(14) when "1110",
    i(15) when "1111",
    'X' when others;

end architecture;
