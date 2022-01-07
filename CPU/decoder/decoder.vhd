library ieee;
use ieee.std_logic_1164.all;

entity decoder is
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
end decoder;

architecture Behavioral of decoder is

  component instruction_format_decoder is
    port (
      is_load_instruction : in std_logic;
      is_store_instruction : in std_logic;
      is_branch_instruction : in std_logic;
      is_jalr_instruction : in std_logic;
      is_jal_instruction : in std_logic;
      is_op_imm_instruction : in std_logic;
      is_op_instruction : in std_logic;
      is_auipc_instruction : in std_logic;
      is_lui_instruction : in std_logic;
      is_R_type : out std_logic;
      is_I_type : out std_logic;
      is_S_type : out std_logic;
      is_B_type : out std_logic;
      is_U_type : out std_logic;
      is_J_type : out std_logic
    );
  end component;

  component instruction_type_decoder is
    port (
      instruction : in std_logic_vector(31 downto 0);
      is_load_instruction : out std_logic;
      is_store_instruction : out std_logic;
      is_branch_instruction : out std_logic;
      is_jalr_instruction : out std_logic;
      is_jal_instruction : out std_logic;
      is_op_imm_instruction : out std_logic;
      is_op_instruction : out std_logic;
      is_auipc_instruction : out std_logic;
      is_lui_instruction : out std_logic
    );
  end component;

  component alu_opcode_feeder is
    port (
      instruction : in std_logic_vector(31 downto 0);
      -- is_R_type : in std_logic;
      -- is_I_type : in std_logic;
      -- is_B_type : in std_logic;
      is_branch_instruction : in std_logic;
      is_jal_instruction : in std_logic;
      is_op_instruction : in std_logic;
      is_op_imm_instruction : in std_logic;
      is_auipc_instruction : in std_logic;
      is_execute_state : in std_logic;
      is_writeback_state : in std_logic;
      unit_selector : out std_logic_vector(1 downto 0);
      shift_unit_opcode : out std_logic_vector(1 downto 0);
      logic_unit_opcode : out std_logic_vector(1 downto 0);
      arithmetic_unit_opcode : out std_logic;
      comparator_unit_opcode : out std_logic_vector(2 downto 0);
      alu_input_a_selector : out std_logic;
      alu_input_b_selector : out std_logic
    );
  end component;

  component immediate_generator is
    port (
      instruction : in std_logic_vector(31 downto 0);
      is_I_type : in std_logic;
      is_S_type : in std_logic;
      is_B_type : in std_logic;
      is_U_type : in std_logic;
      is_J_type : in std_logic;
      immediate : out std_logic_vector(31 downto 0)
    );
  end component;

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

  signal sis_R_type : std_logic;
  signal sis_I_type : std_logic;
  signal sis_S_type : std_logic;
  signal sis_B_type : std_logic;
  signal sis_U_type : std_logic;
  signal sis_J_type : std_logic;
  signal sis_load_instruction : std_logic;
  signal sis_store_instruction : std_logic;
  signal sis_branch_instruction : std_logic;
  signal sis_jalr_instruction : std_logic;
  signal sis_jal_instruction : std_logic;
  signal sis_op_imm_instruction : std_logic;
  signal sis_op_instruction : std_logic;
  signal sis_auipc_instruction : std_logic;
  signal sis_lui_instruction : std_logic;
  signal sunit_selector : std_logic_vector(1 downto 0);
  signal slogic_unit_opcode : std_logic_vector(1 downto 0);
  signal sshift_unit_opcode : std_logic_vector(1 downto 0);
  signal scomparator_unit_opcode : std_logic_vector(2 downto 0);
  signal sarithmetic_unit_opcode : std_logic;
  signal sregister_wren_a : std_logic;
  signal sregister_wren_b : std_logic;
  signal sregister_address_a : std_logic_vector(4 downto 0);
  signal sregister_address_b : std_logic_vector(4 downto 0);
  signal sis_sign_extended_load : std_logic;
  signal sis_half_load : std_logic;
  signal sis_byte_load : std_logic;
  signal smemory_wren : std_logic;
  signal sis_half_store : std_logic;
  signal sis_byte_store : std_logic;
  signal sport_a_selector : std_logic;
  signal salu_input_a_selector : std_logic;
  signal salu_input_b_selector : std_logic;
  signal smemory_address_selector : std_logic;

begin

  is_R_type <= sis_R_type;
  is_I_type <= sis_I_type;
  is_S_type <= sis_S_type;
  is_B_type <= sis_B_type;
  is_U_type <= sis_U_type;
  is_J_type <= sis_J_type;
  is_load_instruction <= sis_load_instruction;
  is_store_instruction <= sis_store_instruction;
  is_branch_instruction <= sis_branch_instruction;
  is_jalr_instruction <= sis_jalr_instruction;
  is_jal_instruction <= sis_jal_instruction;
  is_op_imm_instruction <= sis_op_imm_instruction;
  is_op_instruction <= sis_op_instruction;
  is_auipc_instruction <= sis_auipc_instruction;
  is_lui_instruction <= sis_lui_instruction;
  unit_selector <= sunit_selector;-- arrr
  shift_unit_opcode <= sshift_unit_opcode;
  logic_unit_opcode <= slogic_unit_opcode;
  arithmetic_unit_opcode <= sarithmetic_unit_opcode;
  comparator_unit_opcode <= scomparator_unit_opcode;
  register_wren_a <= sregister_wren_a;
  register_wren_b <= sregister_wren_b;
  register_address_a <= sregister_address_a;
  register_address_b <= sregister_address_b;
  is_sign_extended_load <= sis_sign_extended_load;
  is_half_load <= sis_half_load;
  is_byte_load <= sis_byte_load;
  memory_wren <= smemory_wren;
  is_half_store <= sis_half_store;
  is_byte_store <= sis_byte_store;
  port_a_selector <= sport_a_selector;
  alu_input_a_selector <= salu_input_a_selector;
  alu_input_b_selector <= salu_input_b_selector;
  memory_address_selector <= smemory_address_selector;

  instruction_format_decoder_instance : instruction_format_decoder port map (
    is_load_instruction => sis_load_instruction,
    is_store_instruction => sis_store_instruction,
    is_branch_instruction => sis_branch_instruction,
    is_jalr_instruction => sis_jalr_instruction,
    is_jal_instruction => sis_jal_instruction,
    is_op_imm_instruction => sis_op_imm_instruction,
    is_op_instruction => sis_op_instruction,
    is_auipc_instruction => sis_auipc_instruction,
    is_lui_instruction => sis_lui_instruction,
    is_R_type => sis_R_type,
    is_I_type => sis_I_type,
    is_S_type => sis_S_type,
    is_B_type => sis_B_type,
    is_U_type => sis_U_type,
    is_J_type => sis_J_type
  );

  instruction_type_decoder_instance : instruction_type_decoder port map (
    instruction => instruction,
    is_load_instruction => sis_load_instruction,
    is_store_instruction => sis_store_instruction,
    is_branch_instruction => sis_branch_instruction,
    is_jalr_instruction => sis_jalr_instruction,
    is_jal_instruction => sis_jal_instruction,
    is_op_imm_instruction => sis_op_imm_instruction,
    is_op_instruction => sis_op_instruction,
    is_auipc_instruction => sis_auipc_instruction,
    is_lui_instruction => sis_lui_instruction
  );

  alu_opcode_feeder_instance : alu_opcode_feeder port map (
    instruction => instruction,
    -- is_R_type => sis_R_type,
    -- is_I_type => sis_I_type,
    -- is_B_type => sis_B_type,
    is_branch_instruction => sis_branch_instruction,
    is_jal_instruction => sis_jal_instruction,
    is_op_instruction => sis_op_instruction,
    is_op_imm_instruction => sis_op_imm_instruction,
    is_auipc_instruction => sis_auipc_instruction,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state,
    unit_selector => sunit_selector,
    shift_unit_opcode => sshift_unit_opcode,
    logic_unit_opcode => slogic_unit_opcode,
    arithmetic_unit_opcode => sarithmetic_unit_opcode,
    comparator_unit_opcode => scomparator_unit_opcode,
    alu_input_a_selector => salu_input_a_selector,
    alu_input_b_selector => salu_input_b_selector
  );

  immediate_generator_instance : immediate_generator port map (
    instruction => instruction,
    is_I_type => sis_I_type,
    is_S_type => sis_S_type,
    is_B_type => sis_B_type,
    is_U_type => sis_U_type,
    is_J_type => sis_J_type,
    immediate => immediate
  );

  registers_file_controler_instance : registers_file_controler port map (
    is_fetch_state => is_fetch_state,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state,
    is_load_instruction => sis_load_instruction,
    is_store_instruction => sis_store_instruction,
    is_branch_instruction => sis_branch_instruction,
    is_jalr_instruction => sis_jalr_instruction,
    is_jal_instruction => sis_jal_instruction,
    is_op_imm_instruction => sis_op_imm_instruction,
    is_op_instruction => sis_op_instruction,
    is_auipc_instruction => sis_auipc_instruction,
    is_lui_instruction => sis_lui_instruction,
    instruction => instruction,
    register_wren_a => sregister_wren_a,
    register_wren_b => sregister_wren_b,
    port_a_selector => sport_a_selector,
    register_address_a => sregister_address_a,
    register_address_b => sregister_address_b,
    is_sign_extended_load => sis_sign_extended_load,
    is_half_load => sis_half_load,
    is_byte_load => sis_byte_load
  );

  memory_operations_controler_instance : memory_operations_controler port map (
    is_writeback_state => is_writeback_state,
    is_load_instruction => sis_load_instruction,
    is_store_instruction => sis_store_instruction,
    instruction => instruction,
    memory_wren => smemory_wren,
    is_half_store => sis_half_store,
    is_byte_store => sis_byte_store,
    memory_address_selector => smemory_address_selector
  );

end architecture;
