library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_address_decoder is
end tb_address_decoder;

architecture test_bench of tb_address_decoder is

  component address_decoder is
    port (
     address_bus : in std_logic_vector(15 downto 0);
     xc000 : out std_logic;
     xc001 : out std_logic
    );
  end component;

  signal address_bus : std_logic_vector(15 downto 0);
  signal xc000, xc001 : std_logic;

begin

  used_address_decoder : address_decoder port map(
    address_bus => address_bus,
    xc000 => xc000,
    xc001 => xc001
  );

  process
  begin
    address_bus <= "0000000000000000";

    for i in 0 to 65535 loop
       wait for 10 ns;
       address_bus <= std_logic_vector(unsigned(address_bus)+1);
    end loop;

    wait;
  end process;

end architecture;
