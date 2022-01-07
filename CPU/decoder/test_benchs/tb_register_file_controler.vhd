library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_register_file_controler is
end tb_register_file_controler;

architecture test_bench of tb_register_file_controler is

  component registers_file_controler is
    port (
      is_fetch_state : in std_logic;
      is_execute_state : in std_logic;
      is_writeback_state : in std_logic;
      is_load_instruction : in std_logic;
      is_store_instruction : in std_logic;
      is_branch_instruction : in std_logic;
      is_jalr_instruction : in std_logic;
      is_jal_instruction : in std_logic;
      is_op_imm_instruction : in std_logic;
      is_op_instruction : in std_logic;
      is_auipc_instruction : in std_logic;
      is_lui_instruction : in std_logic;
      instruction : in std_logic_vector(31 downto 0);
      register_wren_a : out std_logic;
      register_wren_b : out std_logic;
      port_a_selector : out std_logic;
      register_address_a : out std_logic_vector(4 downto 0);
      register_address_b : out std_logic_vector(4 downto 0);
      is_sign_extended_load : out std_logic;
      is_half_load : out std_logic;
      is_byte_load : out std_logic
    );
  end component;

  signal is_fetch_state, is_execute_state, is_writeback_state : std_logic;
  signal is_load_instruction, is_store_instruction, is_branch_instruction, is_jalr_instruction, is_jal_instruction, is_op_imm_instruction, is_op_instruction, is_auipc_instruction, is_lui_instruction : std_logic;
  signal instruction : std_logic_vector(31 downto 0);
  signal register_wren_a, register_wren_b, port_a_selector, is_sign_extended_load, is_half_load, is_byte_load : std_logic;
  signal register_address_a, register_address_b : std_logic_vector(4 downto 0);

begin

  register_file_controler_instance : registers_file_controler port map(
    is_fetch_state => is_fetch_state,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state,
    is_load_instruction => is_load_instruction,
    is_store_instruction => is_store_instruction,
    is_branch_instruction => is_branch_instruction,
    is_jalr_instruction => is_jalr_instruction,
    is_jal_instruction => is_jal_instruction,
    is_op_imm_instruction => is_op_imm_instruction,
    is_op_instruction => is_op_instruction,
    is_auipc_instruction => is_auipc_instruction,
    is_lui_instruction => is_lui_instruction,
    instruction => instruction,
    register_wren_a => register_wren_a,
    register_wren_b => register_wren_b,
    port_a_selector => port_a_selector,
    register_address_a => register_address_a,
    register_address_b => register_address_b,
    is_sign_extended_load => is_sign_extended_load,
    is_half_load => is_half_load,
    is_byte_load => is_byte_load
  );

  instruction <= "10101010101011010101010001011110";


  process
  begin
    is_fetch_state <= '1';
    is_execute_state <= '0';
    is_writeback_state <= '0';
    wait for 10 ns;

    is_fetch_state <= '0';
    is_execute_state <= '1';
    wait for 10 ns;

    is_execute_state <= '0';
    is_writeback_state <= '1';
    wait for 10 ns;
  end process;

  process
  begin
    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '1';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '1';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '1';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '1';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '1';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '1';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '1';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '1';
    is_lui_instruction <= '0';
    wait for 30 ns;

    is_load_instruction <= '0';
    is_store_instruction <= '0';
    is_branch_instruction <= '0';
    is_jalr_instruction <= '0';
    is_jal_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_op_instruction <= '0';
    is_auipc_instruction <= '0';
    is_lui_instruction <= '1';
    wait for 30 ns;

    wait;
  end process;

end architecture;
