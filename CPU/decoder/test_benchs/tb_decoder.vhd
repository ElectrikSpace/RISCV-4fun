library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_decoder is
end tb_decoder;

architecture test_bench of tb_decoder is

  component decoder is
    port(
      instruction : in std_logic_vector(31 downto 0);
      is_fetch_state : in std_logic;
      is_execute_state : in std_logic;
      is_writeback_state : in std_logic;
      is_R_type : out std_logic;
      is_I_type : out std_logic;
      is_S_type : out std_logic;
      is_B_type : out std_logic;
      is_U_type : out std_logic;
      is_J_type : out std_logic;
      is_load_instruction : out std_logic;
      is_store_instruction : out std_logic;
      is_branch_instruction : out std_logic;
      is_jalr_instruction : out std_logic;
      is_jal_instruction : out std_logic;
      is_op_imm_instruction : out std_logic;
      is_op_instruction : out std_logic;
      is_auipc_instruction : out std_logic;
      is_lui_instruction : out std_logic;
      unit_selector : out std_logic_vector(1 downto 0);
      shift_unit_opcode : out std_logic_vector(1 downto 0);
      logic_unit_opcode : out std_logic_vector(1 downto 0);
      arithmetic_unit_opcode : out std_logic;
      comparator_unit_opcode : out std_logic_vector(2 downto 0);
      immediate : out std_logic_vector(31 downto 0);
      register_wren_a : out std_logic;
      register_wren_b : out std_logic;
      register_address_a : out std_logic_vector(4 downto 0);
      register_address_b : out std_logic_vector(4 downto 0);
      is_sign_extended_load : out std_logic;
      is_half_load : out std_logic;
      is_byte_load : out std_logic;
      memory_wren : out std_logic;
      is_half_store : out std_logic;
      is_byte_store : out std_logic;
      port_a_selector : out std_logic;
      alu_input_a_selector : out std_logic;
      alu_input_b_selector : out std_logic;
      memory_address_selector : out std_logic
    );
  end component;

  signal instruction : std_logic_vector(31 downto 0);
  signal is_fetch_state : std_logic;
  signal is_execute_state : std_logic;
  signal is_writeback_state : std_logic;
  signal is_R_type : std_logic;
  signal is_I_type : std_logic;
  signal is_S_type : std_logic;
  signal is_B_type : std_logic;
  signal is_U_type : std_logic;
  signal is_J_type : std_logic;
  signal is_load_instruction : std_logic;
  signal is_store_instruction : std_logic;
  signal is_branch_instruction : std_logic;
  signal is_jalr_instruction : std_logic;
  signal is_jal_instruction : std_logic;
  signal is_op_imm_instruction : std_logic;
  signal is_op_instruction : std_logic;
  signal is_auipc_instruction : std_logic;
  signal is_lui_instruction : std_logic;
  signal unit_selector : std_logic_vector(1 downto 0);
  signal shift_unit_opcode : std_logic_vector(1 downto 0);
  signal logic_unit_opcode : std_logic_vector(1 downto 0);
  signal arithmetic_unit_opcode : std_logic;
  signal comparator_unit_opcode : std_logic_vector(2 downto 0);
  signal immediate : std_logic_vector(31 downto 0);
  signal register_wren_a : std_logic;
  signal register_wren_b : std_logic;
  signal register_address_a : std_logic_vector(4 downto 0);
  signal register_address_b : std_logic_vector(4 downto 0);
  signal is_sign_extended_load : std_logic;
  signal is_half_load : std_logic;
  signal is_byte_load : std_logic;
  signal memory_wren : std_logic;
  signal is_half_store : std_logic;
  signal is_byte_store : std_logic;
  signal port_a_selector : std_logic;
  signal alu_input_a_selector : std_logic;
  signal alu_input_b_selector : std_logic;
  signal memory_address_selector : std_logic;

  signal main_opcode : std_logic_vector(4 downto 0);
  signal function_opcode : std_logic_vector(2 downto 0);
  signal opcode : std_logic_vector(7 downto 0);
  signal rs1, rs2, rd : std_logic_vector(4 downto 0);

begin

  decoder_instance : decoder port map (
    instruction => instruction,
    is_fetch_state => is_fetch_state,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state,
    is_R_type => is_R_type,
    is_I_type => is_I_type,
    is_S_type => is_S_type,
    is_B_type => is_B_type,
    is_U_type => is_U_type,
    is_J_type => is_J_type,
    is_load_instruction => is_load_instruction,
    is_store_instruction => is_store_instruction,
    is_branch_instruction => is_branch_instruction,
    is_jalr_instruction => is_jalr_instruction,
    is_jal_instruction => is_jal_instruction,
    is_op_imm_instruction => is_op_imm_instruction,
    is_op_instruction => is_op_instruction,
    is_auipc_instruction => is_auipc_instruction,
    is_lui_instruction => is_lui_instruction,
    unit_selector => unit_selector,
    shift_unit_opcode => shift_unit_opcode,
    logic_unit_opcode => logic_unit_opcode,
    arithmetic_unit_opcode => arithmetic_unit_opcode,
    comparator_unit_opcode => comparator_unit_opcode,
    immediate => immediate,
    register_wren_a => register_wren_a,
    register_wren_b => register_wren_b,
    register_address_a => register_address_a,
    register_address_b => register_address_b,
    is_sign_extended_load => is_sign_extended_load,
    is_half_load => is_half_load,
    is_byte_load => is_byte_load,
    memory_wren => memory_wren,
    is_half_store => is_half_store,
    is_byte_store => is_byte_store,
    port_a_selector => port_a_selector,
    alu_input_a_selector => alu_input_a_selector,
    alu_input_b_selector => alu_input_b_selector,
    memory_address_selector => memory_address_selector
  );

  rs1 <= "00001";
  rs2 <= "00011";
  rd <= "00111";

  function_opcode <= opcode(2 downto 0);
  main_opcode <= opcode(7 downto 3);

  instruction(31 downto 25) <= (others => '0');
  instruction(24 downto 20) <= rs2;
  instruction(19 downto 15) <= rs1;
  instruction(14 downto 12) <= function_opcode;
  instruction(11 downto 7) <= rd;
  instruction(6 downto 2) <= main_opcode;
  instruction(1 downto 0) <= (others => '1');

  process
  begin
    is_fetch_state <= '1';
    is_execute_state <= '0';
    is_writeback_state <= '0';
    opcode <= "00000000";

    for i in 0 to 127 loop
      wait for 10 ns;
      is_fetch_state <= '0';
      is_execute_state <= '1';
      wait for 10 ns;
      is_execute_state <= '0';
      is_writeback_state <= '1';
      wait for 10 ns;

      is_writeback_state <= '0';
      is_fetch_state <= '1';
      opcode <= std_logic_vector(unsigned(opcode)+1);
    end loop;

    wait;
  end process;

end architecture;
