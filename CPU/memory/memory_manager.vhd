library ieee;
use ieee.std_logic_1164.all;

entity memory_manager is
  port (
    clk : in std_logic;
    is_writeback_state : in std_logic;
    memory_wren : in std_logic;
    is_half_store : in std_logic;
    is_byte_store : in std_logic;
    memory_in_bus : in std_logic_vector(31 downto 0);
    next_PC_address : in std_logic_vector(31 downto 0);
    memory_address : in std_logic_vector(31 downto 0);
    IO_out_bus : in std_logic_vector(31 downto 0);
    current_instruction : out std_logic_vector(31 downto 0);
    memory_out_bus : out std_logic_vector(31 downto 0)
  );
end memory_manager;

architecture Behavioral of memory_manager is

  component ROM_unit is
    port(
      clk : in std_logic;
      ROM_out_bus : out std_logic_vector(31 downto 0);
      memory_address : in std_logic_vector(31 downto 0);
      is_writeback_state : in std_logic;
      next_PC_address : in std_logic_vector(31 downto 0);
      current_instruction : out std_logic_vector(31 downto 0)
    );
  end component;

  component RAM_unit is
    port (
      clk : in std_logic;
      memory_in_bus : in std_logic_vector(31 downto 0);
      RAM_out_bus : out std_logic_vector(31 downto 0);
      memory_address : in std_logic_vector(31 downto 0);
      memory_wren : in std_logic;
      is_half_store : in std_logic;
      is_byte_store : in std_logic
    );
  end component;

  signal ROM_out_bus, RAM_out_bus : std_logic_vector(31 downto 0);

  signal mux_inputs : std_logic_vector(95 downto 0);

  signal next_mux_selector : std_logic_vector(1 downto 0);
  signal current_mux_selector : std_logic_vector(1 downto 0);

begin

  ROM_unit_instance : ROM_unit port map (
    clk => clk,
    ROM_out_bus => ROM_out_bus,
    memory_address => memory_address,
    is_writeback_state => is_writeback_state,
    next_PC_address => next_PC_address,
    current_instruction => current_instruction
  );

  RAM_unit_instance : RAM_unit port map (
    clk => clk,
    memory_in_bus => memory_in_bus,
    RAM_out_bus => RAM_out_bus,
    memory_address => memory_address,
    memory_wren => memory_wren,
    is_half_store => is_half_store,
    is_byte_store => is_byte_store
  );

  -- final mux

  mux_inputs(31 downto 0) <= ROM_out_bus;
  mux_inputs(63 downto 32) <= RAM_out_bus;
  mux_inputs(95 downto 64) <= IO_out_bus;

  next_mux_selector <= memory_address(15 downto 14);

  with current_mux_selector select memory_out_bus <=
    mux_inputs(31 downto 0) when "00",
    mux_inputs(31 downto 0) when "01",
    mux_inputs(63 downto 32) when "10",
    mux_inputs(95 downto 64) when "11",
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;

  process(clk)
  begin
    if rising_edge(clk) then
      current_mux_selector <= next_mux_selector;
    end if;
  end process;

end architecture;
