library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_state_flags is
end tb_state_flags;

architecture test_bench of tb_state_flags is

  component state_flags is
    port (
      reset : in std_logic;
      clk : in std_logic;
      is_reset_state : out std_logic;
      is_fetch_state : out std_logic;
      is_execute_state : out std_logic;
      is_writeback_state : out std_logic
    );
  end component;

  signal reset, clk, is_reset_state, is_fetch_state, is_execute_state, is_writeback_state : std_logic;

begin

  used_state_flags : state_flags port map(
    reset => reset,
    clk => clk,
    is_reset_state => is_reset_state,
    is_fetch_state => is_fetch_state,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state
  );

  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  process
  begin
    reset <= '0';
    wait for 100 ns;

    reset <= '1';
    wait for 100 ns;

    reset <= '0';
    wait for 100 ns;

    wait;
  end process;

end architecture;
