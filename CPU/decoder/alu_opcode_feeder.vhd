library ieee;
use ieee.std_logic_1164.all;

entity alu_opcode_feeder is
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
end alu_opcode_feeder;

architecture Behavioral of alu_opcode_feeder is

  signal is_shift_op : std_logic;
  signal is_arithmetic_op : std_logic;
  signal is_logic_op : std_logic;
  signal is_comp_op : std_logic;

  signal is_right_shift : std_logic;

  begin

    is_shift_op <= (is_op_instruction OR is_op_imm_instruction) AND ((NOT instruction(13) AND instruction(12)));

    is_logic_op <= (is_op_instruction OR is_op_imm_instruction) AND instruction(14) AND (((NOT instruction(13)) AND (NOT instruction(12))) OR instruction(13));

    is_comp_op <= (is_branch_instruction AND is_execute_state) OR ((is_op_instruction OR is_op_imm_instruction) AND (NOT instruction(14)) AND instruction(13));

    is_arithmetic_op <= NOT (is_shift_op OR is_comp_op or is_logic_op);

    arithmetic_unit_opcode <= instruction(30) AND is_op_instruction;

    is_right_shift <= instruction(14) AND (NOT instruction(13)) AND instruction(12);
    shift_unit_opcode(1) <= is_right_shift; -- right shift
    shift_unit_opcode(0) <= is_right_shift AND instruction(30); -- arithmetic shift

    comparator_unit_opcode(0) <= (instruction(14) AND instruction(12)) OR ((NOT instruction(14)) AND (NOT instruction(13)) AND (NOT instruction(12))); -- = or >=
    comparator_unit_opcode(1) <= ((NOT instruction(14)) AND (NOT instruction(13)) AND instruction(12)) OR (instruction(14) AND instruction(12)); -- != or >=
    comparator_unit_opcode(2) <= ((NOT instruction(12)) AND (is_op_instruction OR is_op_imm_instruction)) OR (is_branch_instruction AND (NOT instruction(13)));

    logic_unit_opcode(0) <= instruction(14) AND instruction(13) AND instruction(12); -- AND or ANDI
    logic_unit_opcode(1) <= instruction(14) AND (NOT instruction(13)) AND (NOT instruction(12)); -- XOR or XORI

    -- unit_selector(0) <= ( (is_I_type AND instruction(14) AND instruction(4)) OR (is_R_type AND instruction(14) AND (NOT ((NOT instruction(13) AND instruction(12))))) ) OR (is_B_type OR (NOT instruction(14) AND instruction(13) AND (is_I_type OR is_R_type))); -- logic or comparator
    -- unit_selector(1) <= (NOT (is_I_type AND instruction(14) AND instruction(4)) OR (is_R_type AND instruction(14) AND (NOT ((NOT instruction(13) AND instruction(12)))))) AND (NOT ((NOT instruction(13)) AND instruction(12) AND (is_I_type OR is_R_type))); -- not logic and not shift
    unit_selector(0) <= is_logic_op OR is_comp_op;
    unit_selector(1) <= is_arithmetic_op OR is_comp_op;

    -- put PC on alu input a only during writeback state of BRANCH, JAL, or execute state of AUIPC
    alu_input_a_selector <= (is_execute_state AND is_auipc_instruction) OR (is_writeback_state AND (is_branch_instruction OR is_jal_instruction));

    -- put immediate on alu input b only during execute cycle of every non OP instruction and non branch instruction, and during writeback state
    alu_input_b_selector <= (is_execute_state AND (NOT (is_op_instruction OR is_branch_instruction))) OR is_writeback_state;

end architecture;
