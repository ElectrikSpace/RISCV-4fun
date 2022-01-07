library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_alu_opcode_feeder is
end tb_alu_opcode_feeder;

architecture test_bench of tb_alu_opcode_feeder is

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

  signal instruction : std_logic_vector(31 downto 0);
  signal is_branch_instruction, is_jal_instruction, is_op_instruction, is_op_imm_instruction, is_auipc_instruction : std_logic;
  signal is_execute_state, is_writeback_state : std_logic;
  signal unit_selector : std_logic_vector(1 downto 0);
  signal shift_unit_opcode : std_logic_vector(1 downto 0);
  signal logic_unit_opcode : std_logic_vector(1 downto 0);
  signal arithmetic_unit_opcode : std_logic;
  signal comparator_unit_opcode : std_logic_vector(2 downto 0);
  signal alu_input_a_selector : std_logic;
  signal alu_input_b_selector : std_logic;

  signal temp1 : std_logic;
  signal temp2 : std_logic_vector(2 downto 0);

begin

  alu_opcode_feeder_instance : alu_opcode_feeder port map (
    instruction => instruction,
    is_branch_instruction => is_branch_instruction,
    is_jal_instruction => is_jal_instruction,
    is_op_instruction => is_op_instruction,
    is_op_imm_instruction => is_op_imm_instruction,
    is_auipc_instruction => is_auipc_instruction,
    is_execute_state => is_execute_state,
    is_writeback_state => is_writeback_state,
    unit_selector => unit_selector,
    shift_unit_opcode => shift_unit_opcode,
    logic_unit_opcode => logic_unit_opcode,
    arithmetic_unit_opcode => arithmetic_unit_opcode,
    comparator_unit_opcode => comparator_unit_opcode,
    alu_input_a_selector => alu_input_a_selector,
    alu_input_b_selector => alu_input_b_selector
  );

  instruction(31) <= '0';
  instruction(29 downto 15) <= (others => '0');
  instruction(11 downto 0) <= (others => '0');
  instruction(30) <= temp1;
  instruction(14 downto 12) <= temp2;

  process
  begin
    is_execute_state <= '0';
    is_writeback_state <= '0';
    wait for 10 ns;

    is_execute_state <= '1';
    wait for 10 ns;

    is_execute_state <= '0';
    is_writeback_state <= '1';
    wait for 10 ns;
  end process;

  process
  begin
    is_op_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_branch_instruction <= '0';
    is_jal_instruction <= '0';
    is_auipc_instruction <= '0';
    temp1 <= '0';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;
    temp1 <= '1';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;

    is_op_instruction <= '1';
    is_op_imm_instruction <= '0';
    is_branch_instruction <= '0';
    is_jal_instruction <= '0';
    is_auipc_instruction <= '0';
    temp1 <= '0';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;
    temp1 <= '1';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;

    is_op_instruction <= '0';
    is_op_imm_instruction <= '1';
    is_branch_instruction <= '0';
    is_jal_instruction <= '0';
    is_auipc_instruction <= '0';
    temp1 <= '0';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;
    temp1 <= '1';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;

    is_op_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_branch_instruction <= '1';
    is_jal_instruction <= '0';
    is_auipc_instruction <= '0';
    temp1 <= '0';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;
    temp1 <= '1';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;

    is_op_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_branch_instruction <= '0';
    is_jal_instruction <= '1';
    is_auipc_instruction <= '0';
    temp1 <= '0';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;
    temp1 <= '1';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;

    is_op_instruction <= '0';
    is_op_imm_instruction <= '0';
    is_branch_instruction <= '0';
    is_jal_instruction <= '0';
    is_auipc_instruction <= '1';
    temp1 <= '0';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;
    temp1 <= '1';
    temp2 <= "000";
    wait for 30 ns;
    temp2 <= "001";
    wait for 30 ns;
    temp2 <= "010";
    wait for 30 ns;
    temp2 <= "011";
    wait for 30 ns;
    temp2 <= "100";
    wait for 30 ns;
    temp2 <= "101";
    wait for 30 ns;
    temp2 <= "110";
    wait for 30 ns;
    temp2 <= "111";
    wait for 30 ns;

    wait;
  end process;

end architecture;
