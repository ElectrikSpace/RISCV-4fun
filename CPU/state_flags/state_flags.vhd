library ieee;
use ieee.std_logic_1164.all;

entity state_flags is
  port (
    reset : in std_logic;
    clk : in std_logic;
    is_reset_state : out std_logic;
    is_fetch_state : out std_logic;
    is_execute_state : out std_logic;
    is_writeback_state : out std_logic
  );
end state_flags;

architecture Behavioral of state_flags is

  signal current_state : std_logic_vector(1 downto 0) := "00"; -- initial state is reset state
  signal next_state : std_logic_vector(1 downto 0);

  begin

    next_state(0) <= current_state(1) OR (NOT current_state(0));
    next_state(1) <= current_state(1) XOR current_state(0);

    is_reset_state <= (NOT current_state(1)) AND (NOT current_state(0));
    is_fetch_state <= (NOT current_state(1)) AND current_state(0);
    is_execute_state <= current_state(1) AND (NOT current_state(0));
    is_writeback_state <= current_state(1) AND current_state(0);

    process(clk)
    begin
      if rising_edge(clk) then
        if reset='1' then
          current_state <= "00";
        else
          current_state <= next_state;
        end if;
      end if;
    end process;
end architecture;
