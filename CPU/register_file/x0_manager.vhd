library ieee;
use ieee.std_logic_1164.all;

entity x0_manager is
  port(
    clk : in std_logic;
    register_address : in std_logic_vector(4 downto 0);
    internal_register_data_output : in std_logic_vector(31 downto 0);
    register_output_data : out std_logic_vector(31 downto 0)
  );
end x0_manager;

architecture Behavioral of x0_manager is

  signal next_is_x0 : std_logic;
  signal current_is_x0 : std_logic := '0';

begin

  next_is_x0 <= (NOT register_address(4)) AND (NOT register_address(3)) AND (NOT register_address(2)) AND (NOT register_address(1)) AND (NOT register_address(0));

  with current_is_x0 select register_output_data <=
    internal_register_data_output when '0',
    "00000000000000000000000000000000" when '1',
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;

  process(clk)
  begin
    if rising_edge(clk) then
      current_is_x0 <= next_is_x0;
    end if;
  end process;

end architecture;
