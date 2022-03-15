library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_arithmetic_unit is
end tb_arithmetic_unit;

architecture test_bench of tb_arithmetic_unit is
  component arithmetic_unit is
    port
  	(
  		a : in std_logic_vector(31 downto 0);
      b : in std_logic_vector(31 downto 0);
      is_sub : in std_logic;
      o : out std_logic_vector(31 downto 0)
      --c_out : out std_logic
  	);
  end component;

  signal a, b, o: std_logic_vector(31 downto 0);
  signal is_sub: std_logic;

  begin
    used_arithmetic_unit: arithmetic_unit port map (
      a => a,
      b => b,
      is_sub => is_sub,
      o => o
    );

    process
    begin
      a <= std_logic_vector(to_unsigned(0, a'length));
      b <= std_logic_vector(to_unsigned(0, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      a <= std_logic_vector(to_unsigned(151451, a'length));
      b <= std_logic_vector(to_unsigned(56456, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      a <= std_logic_vector(to_unsigned(46, a'length));
      b <= std_logic_vector(to_unsigned(1566, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      a <= std_logic_vector(to_signed(25, a'length));
      b <= std_logic_vector(to_signed(-64654, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      a <= std_logic_vector(to_signed(-64654, a'length));
      b <= std_logic_vector(to_signed(25, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      a <= std_logic_vector(to_signed(-4545564, a'length));
      b <= std_logic_vector(to_signed(-545, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      a <= std_logic_vector(to_signed(4654, a'length));
      b <= std_logic_vector(to_signed(54545, b'length));
      is_sub <= '0';
      wait for 5 ns;
      is_sub <= '1';
      wait for 5 ns;

      wait;
    end process;
end architecture;
