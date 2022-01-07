library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_memory_operations_controler is
end tb_memory_operations_controler;

architecture test_bench of tb_memory_operations_controler is

  component memory_operations_controler is
    port (
      is_writeback_state : in std_logic;
      is_load_instruction : in std_logic;
      is_store_instruction : in std_logic;
      instruction : in std_logic_vector(31 downto 0);
      memory_wren : out std_logic;
      is_half_store : out std_logic;
      is_byte_store : out std_logic;
      memory_address_selector : out std_logic
    );
  end component;

  signal is_execute_state, is_writeback_state, is_load_instruction, is_store_instruction : std_logic;
  signal instruction : std_logic_vector(31 downto 0);
  signal memory_wren, is_half_store, is_byte_store, memory_address_selector : std_logic;

  signal temp : std_logic_vector(4 downto 0);

begin

    memory_operations_controler_instance : memory_operations_controler port map (
      is_writeback_state => is_writeback_state,
      is_load_instruction => is_load_instruction,
      is_store_instruction => is_store_instruction,
      instruction => instruction,
      memory_wren => memory_wren,
      is_half_store => is_half_store,
      is_byte_store => is_byte_store,
      memory_address_selector => memory_address_selector
    );

    instruction(31 downto 14) <= (others => '0');
    instruction(11 downto 0) <= (others => '0');
    instruction(13 downto 12) <= temp(1 downto 0);

    is_writeback_state <= temp(4);
    is_load_instruction <= temp(3);
    is_store_instruction <= temp(2);

    process
    begin
      temp <= "00000";

      for i in 0 to 31 loop
        wait for 10 ns;
        temp <= std_logic_vector(unsigned(temp)+1);
      end loop;

      wait;
    end process;

end architecture;
