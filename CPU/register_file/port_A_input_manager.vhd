library ieee;
use ieee.std_logic_1164.all;

entity port_A_input_manager is
  port (
    clk : in std_logic;
    memory_address : in std_logic_vector(31 downto 0);
    memory_out_bus : in std_logic_vector(31 downto 0);
    incremented_PC : in std_logic_vector(31 downto 0);
    port_A_selector : in std_logic;
    port_A_input : out std_logic_vector(31 downto 0);
    is_load_instruction : in std_logic;
    is_sign_extended_load : in std_logic;
    is_half_load : in std_logic;
    is_byte_load : in std_logic
  );
end port_A_input_manager;

architecture Behavioral of port_A_input_manager is

  component load_manager is
    port (
      clk : in std_logic;
      memory_out_bus : in std_logic_vector(31 downto 0);
      memory_address : in std_logic_vector(15 downto 0);
      is_sign_extended : std_logic;
      is_load_instruction : in std_logic;
      is_half_load : in std_logic;
      is_byte_load : in std_logic;
      converted_memory_out_bus : out std_logic_vector(31 downto 0)
    );
  end component;

  signal converted_memory_out_bus : std_logic_vector(31 downto 0);

begin

  load_manager_instance : load_manager port map(
    clk => clk,
    memory_out_bus => memory_out_bus,
    memory_address => memory_address(15 downto 0),
    is_sign_extended => is_sign_extended_load,
    is_load_instruction => is_load_instruction,
    is_half_load => is_half_load,
    is_byte_load => is_byte_load,
    converted_memory_out_bus => converted_memory_out_bus
  );

  with port_A_selector select port_A_input <=
    incremented_PC when '0',
    converted_memory_out_bus when '1',
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;

end architecture;
