library ieee;
use ieee.std_logic_1164.all;

entity CPU is
  port (
    cpu_clk : in std_logic;
    uart_clk : in std_logic;
    reset_button : in std_logic;
    tx : out std_logic
  );
end entity;

architecture Behavioral of CPU is

  component ALU_package is
    port (
      alu_input_a_selector : in std_logic;
      alu_input_b_selector : in std_logic;
      immediate : in std_logic_vector(31 downto 0);
      port_a_output : in std_logic_vector(31 downto 0);
      port_b_output : in std_logic_vector(31 downto 0);
      current_PC : in std_logic_vector(31 downto 0);
      unit_selector : in std_logic_vector(1 downto 0);
      shift_unit_opcode : in std_logic_vector(1 downto 0);
      logic_unit_opcode : in std_logic_vector(1 downto 0);
      arithmetic_unit_opcode : in std_logic;
      comparator_unit_opcode : in std_logic_vector(2 downto 0);
      alu_output : out std_logic_vector(31 downto 0)
    );
  end component;

  component PC_unit is
    port
  	(
  		clk : in std_logic;
  		reset : in std_logic;
  		is_writeback_state : in std_logic;
  		external_value : in std_logic_vector(31 downto 0);
  		is_branch_instruction : in std_logic;
  		is_branch_taken : in std_logic;
  		is_jal_instruction : in std_logic;
  		is_jalr_instruction : in std_logic;
  		current_PC : out std_logic_vector(31 downto 0);
  		incremented_PC : out std_logic_vector(31 downto 0);
  		next_PC : out std_logic_vector(31 downto 0)
  	);
  end component;

  component register_file_unit is
    port (
      clk : in std_logic;
      register_wren_a : in std_logic;
      register_wren_b : in std_logic;
      register_address_a : in std_logic_vector(4 downto 0);
      register_address_b : in std_logic_vector(4 downto 0);
      is_load_instruction : in std_logic;
      is_sign_extended_load : in std_logic;
      is_half_load : in std_logic;
      is_byte_load : in std_logic;
      incremented_PC : in std_logic_vector(31 downto 0);
      memory_out_bus : in std_logic_vector(31 downto 0);
      alu_output : in std_logic_vector(31 downto 0);
      temporary_register_output : in std_logic_vector(31 downto 0);
      port_a_selector : in std_logic;
      port_a_output : out std_logic_vector(31 downto 0);
      port_b_output : out std_logic_vector(31 downto 0)
    );
  end component;

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

  component memory_address_manager is
    port (
      memory_address_selector : in std_logic;
      alu_output : in std_logic_vector(31 downto 0);
      temporary_register_output : in std_logic_vector(31 downto 0);
      memory_address : out std_logic_vector(31 downto 0)
    );
  end component;

  component memory_manager is
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
  end component;

  component IO_manager is
    port (
      memory_clk : in std_logic;
      uart_clk : in std_logic;
      reset : in std_logic;
      memory_wren : in std_logic;
      memory_address : in std_logic_vector(31 downto 0);
      memory_in_bus : in std_logic_vector(31 downto 0);
      IO_out_bus : out std_logic_vector(31 downto 0);
      tx : out std_logic
    );
  end component;

  component temporary_register is
    port (
      clk : in std_logic;
      alu_output : in std_logic_vector(31 downto 0);
      temporary_register_value : out std_logic_vector(31 downto 0)
    );
  end component;

  -- reset
  signal reset : std_logic;

  -- states
  signal is_fetch_state, is_execute_state, is_writeback_state : std_logic;

  -- bus
  signal instruction : std_logic_vector(31 downto 0);
  signal current_PC, incremented_PC, next_PC : std_logic_vector(31 downto 0);
  signal memory_out_bus, memory_address, IO_out_bus : std_logic_vector(31 downto 0);
  signal immediate, port_a_output, port_b_output, alu_output, temporary_register_output : std_logic_vector(31 downto 0);

  -- control signals from decoder
  signal is_load_instruction : std_logic;
  signal is_branch_instruction : std_logic;
  signal is_jalr_instruction : std_logic;
  signal is_jal_instruction : std_logic;
  signal unit_selector : std_logic_vector(1 downto 0);
  signal shift_unit_opcode : std_logic_vector(1 downto 0);
  signal logic_unit_opcode : std_logic_vector(1 downto 0);
  signal arithmetic_unit_opcode : std_logic;
  signal comparator_unit_opcode : std_logic_vector(2 downto 0);
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

  -- other control signals (not provided by decoder)
  signal is_branch_taken : std_logic;

begin

  reset <= NOT reset_button;

  is_branch_taken <= temporary_register_output(0);

  ALU_package_instance : ALU_package port map (
    alu_input_a_selector => alu_input_a_selector,
    alu_input_b_selector => alu_input_b_selector,
    immediate => immediate,
    port_a_output => port_a_output,
    port_b_output => port_b_output,
    current_PC => current_PC,
    unit_selector => unit_selector,
    shift_unit_opcode => shift_unit_opcode,
    logic_unit_opcode => logic_unit_opcode,
    arithmetic_unit_opcode => arithmetic_unit_opcode,
    comparator_unit_opcode => comparator_unit_opcode,
    alu_output => alu_output
  );

  PC_unit_instance : PC_unit port map (
    clk => cpu_clk,
    reset => reset,
    is_writeback_state => is_writeback_state,
    external_value => alu_output,
    is_branch_instruction => is_branch_instruction,
    is_branch_taken => is_branch_taken,
    is_jal_instruction => is_jal_instruction,
    is_jalr_instruction => is_jalr_instruction,
    current_PC => current_PC,
		incremented_PC => incremented_PC,
		next_PC => next_PC
  );

  register_file_unit_instance : register_file_unit port map (
    clk => cpu_clk,
    register_wren_a => register_wren_a,
    register_wren_b => register_wren_b,
    register_address_a => register_address_a,
    register_address_b => register_address_b,
    is_load_instruction => is_load_instruction,
    is_sign_extended_load => is_sign_extended_load,
    is_half_load => is_half_load,
    is_byte_load => is_byte_load,
    incremented_PC => incremented_PC,
    memory_out_bus => memory_out_bus,
    alu_output => alu_output,
    temporary_register_output => temporary_register_output,
    port_a_selector => port_a_selector,
    port_a_output => port_a_output,
    port_b_output => port_b_output
  );

  state_flags_instance : state_flags port map (
    reset => reset,
    clk => cpu_clk,
    is_reset_state => open,
    is_fetch_state => is_fetch_state,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state
  );

  decoder_instance : decoder port map (
    instruction => instruction,
    is_fetch_state => is_fetch_state,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state,
    is_R_type => open,
    is_I_type => open,
    is_S_type => open,
    is_B_type => open,
    is_U_type => open,
    is_J_type => open,
    is_load_instruction => is_load_instruction,
    is_store_instruction => open,
    is_branch_instruction => is_branch_instruction,
    is_jalr_instruction => is_jalr_instruction,
    is_jal_instruction => is_jal_instruction,
    is_op_imm_instruction => open,
    is_op_instruction => open,
    is_auipc_instruction => open,
    is_lui_instruction => open,
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

  memory_address_manager_instance : memory_address_manager port map (
    memory_address_selector => memory_address_selector,
    alu_output => alu_output,
    temporary_register_output => temporary_register_output,
    memory_address => memory_address
  );

  memory_manager_instance : memory_manager port map (
    clk => cpu_clk,
    is_writeback_state => is_writeback_state,
    memory_wren => memory_wren,
    is_half_store => is_half_store,
    is_byte_store => is_byte_store,
    memory_in_bus => port_a_output,
    next_PC_address => next_PC,
    memory_address => memory_address,
    IO_out_bus => IO_out_bus,
    current_instruction => instruction,
    memory_out_bus => memory_out_bus
  );

  IO_manager_instance : IO_manager port map (
    memory_clk => cpu_clk,
    uart_clk => uart_clk,
    reset => reset,
    memory_wren => memory_wren,
    memory_address => memory_address,
    memory_in_bus => port_a_output,
    IO_out_bus => IO_out_bus,
    tx => tx
  );

  temporary_register_instance : temporary_register port map (
    clk => cpu_clk,
    alu_output => alu_output,
    temporary_register_value => temporary_register_output
  );

end architecture;
