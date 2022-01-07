library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_temporary_register is
end tb_temporary_register;

architecture test_bench of tb_temporary_register is

  component temporary_register is
    port (
      clk : in std_logic;
      alu_output : in std_logic_vector(31 downto 0);
      temporary_register_value : out std_logic_vector(31 downto 0)
    );
  end component;

  signal clk : std_logic;
  signal alu_output, temporary_register_value : std_logic_vector(31 downto 0);

begin

  temporary_register_instance : temporary_register port map (
    clk => clk,
    alu_output => alu_output,
    temporary_register_value => temporary_register_value
  );

  process
  begin
    clk <= '0';
    wait for 5 ns;
    alu_output <= "10101010100010101010101010101010";
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    alu_output <= "00000000000000000000000000000000";
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    alu_output <= "11111111111111111111111111111111";
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    alu_output <= "10101010100010101010101010101010";
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;

    clk <= '1';
    wait for 5 ns;
    alu_output <= "10101010100010101010101010101010";
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    alu_output <= "00000000000000000000000000000000";
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    alu_output <= "11111111111111111111111111111111";
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    alu_output <= "10101010100010101010101010101010";
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;

    wait;
  end process;

end architecture;
