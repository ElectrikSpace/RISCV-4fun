library ieee;
use ieee.std_logic_1164.all;

entity instruction_format_decoder is
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
end instruction_format_decoder;

architecture Behavioral of instruction_format_decoder is

  begin

    is_R_type <= is_op_instruction;

    is_I_type <= is_op_imm_instruction OR is_load_instruction OR is_jalr_instruction;

    is_U_type <= is_auipc_instruction OR is_lui_instruction;

    is_S_type <= is_store_instruction;

    is_B_type <= is_branch_instruction;

    is_J_type <= is_jal_instruction;

end architecture;
