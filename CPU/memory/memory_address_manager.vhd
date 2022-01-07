library ieee;
use ieee.std_logic_1164.all;

entity memory_address_manager is
  port (
    memory_address_selector : in std_logic;
    alu_output : in std_logic_vector(31 downto 0);
    temporary_register_output : in std_logic_vector(31 downto 0);
    memory_address : out std_logic_vector(31 downto 0)
  );
end memory_address_manager;

architecture Behavioral of memory_address_manager is

begin

  with memory_address_selector select memory_address <=
    alu_output when '0',
    temporary_register_output when '1',
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;

end architecture;
