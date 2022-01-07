library ieee;
use ieee.std_logic_1164.all;

entity temporary_register is
  port (
    clk : in std_logic;
    alu_output : in std_logic_vector(31 downto 0);
    temporary_register_value : out std_logic_vector(31 downto 0)
  );
end temporary_register;

architecture Behavioral of temporary_register is

  signal registered_values : std_logic_vector(31 downto 0);

begin

  temporary_register_value <= registered_values;

  process (clk)
  begin
    if rising_edge(clk) then
      registered_values <= alu_output;
    end if;
  end process;

end architecture;
