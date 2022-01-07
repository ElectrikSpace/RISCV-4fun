library ieee;
use ieee.std_logic_1164.all;

entity memory_operations_controler is
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
end memory_operations_controler;

architecture Behavioral of memory_operations_controler is

  begin

    -- enable write only during STORE instructions
    memory_wren <= is_writeback_state AND is_store_instruction;

    is_half_store <= is_store_instruction AND instruction(12);

    is_byte_store <= is_store_instruction AND (NOT instruction(13)) AND (NOT instruction(12));

    -- select alu_output for LOAD and temporary_register_output for STORE
    --   0 for alu_output
    --   1 for temporary_register_output
    memory_address_selector <= is_store_instruction;

end architecture;
