library ieee;
use ieee.std_logic_1164.all;

entity address_decoder is
 port (
  address_bus : in std_logic_vector(15 downto 0);
  xc000 : out std_logic;
  xc001 : out std_logic
 );
end address_decoder;

architecture Behavioral of address_decoder is

  signal common_15_msb : std_logic;

begin

  common_15_msb <= address_bus(15) AND address_bus(14) AND
                   (NOT address_bus(13)) AND (NOT address_bus(12)) AND
                   (NOT address_bus(11)) AND (NOT address_bus(10)) AND
                   (NOT address_bus(9)) AND (NOT address_bus(8)) AND
                   (NOT address_bus(7)) AND (NOT address_bus(6)) AND
                   (NOT address_bus(5)) AND (NOT address_bus(4)) AND
                   (NOT address_bus(3)) AND (NOT address_bus(2)) AND
                   (NOT address_bus(1));

  xc000 <= common_15_msb AND (NOT address_bus(0));

  xc001 <= common_15_msb AND address_bus(0);

end architecture;
