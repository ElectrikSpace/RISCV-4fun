library ieee;
use ieee.std_logic_1164.all;

entity memory_clk_state_machine is
  port (
    memory_clk : in std_logic;
    reset : in std_logic;
    new_request : in std_logic;
    uart_machine_running : in std_logic;
    busy_flag : out std_logic;
    reset_uart_machine : out std_logic;
    data_register_clk_enable : out std_logic
  );
end memory_clk_state_machine;

architecture Behavioral of memory_clk_state_machine is

  signal current_state : std_logic_vector(2 downto 0) := "001";
  signal next_state : std_logic_vector(2 downto 0);

  -- 001 for idle state, 010 for startup state, 100 for running state

begin

  busy_flag <= current_state(1) OR current_state(2);

  reset_uart_machine <= current_state(1);

  data_register_clk_enable <= current_state(0) AND new_request;

  next_state(0) <= (current_state(0) AND (NOT new_request)) OR (current_state(2) AND (NOT uart_machine_running));
  next_state(1) <= (current_state(0) AND new_request) OR (current_state(1) AND (NOT uart_machine_running));
  next_state(2) <= (current_state(1) OR current_state(2)) AND uart_machine_running;

  process(memory_clk)
  begin
    if rising_edge(memory_clk) then
      if reset='1' then
        current_state <= "001";
      else
        current_state <= next_state;
      end if;
    end if;
  end process;

end architecture;
