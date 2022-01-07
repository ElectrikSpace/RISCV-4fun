library ieee;
use ieee.std_logic_1164.all;

entity instruction_type_decoder is
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
end instruction_type_decoder;

architecture Behavioral of instruction_type_decoder is

  -- cf riscv spec instruction map
  signal map_line_00, map_line_01, map_line_11 : std_logic;
  signal map_colonn_000, map_colonn_001, map_colonn_011, map_colonn_100, map_colonn_101 : std_logic;

begin

  map_line_00 <= (NOT instruction(6)) AND (NOT instruction(5));

  map_line_01 <= (NOT instruction(6)) AND instruction(5);

  map_line_11 <= instruction(6) AND instruction(5);

  map_colonn_000 <= (NOT instruction(4)) AND (NOT instruction(3)) AND (NOT instruction(2));

  map_colonn_001 <= (NOT instruction(4)) AND (NOT instruction(3)) AND instruction(2);

  map_colonn_011 <= (NOT instruction(4)) AND instruction(3) AND instruction(2);

  map_colonn_100 <= instruction(4) AND (NOT instruction(3)) AND (NOT instruction(2));

  map_colonn_101 <= instruction(4) AND (NOT instruction(3)) AND instruction(2);


  is_load_instruction <= map_line_00 AND map_colonn_000;

  is_store_instruction <= map_line_01 AND map_colonn_000;

  is_branch_instruction <= map_line_11 AND map_colonn_000;

  is_jalr_instruction <= map_line_11 AND map_colonn_001;

  is_jal_instruction <= map_line_11 AND map_colonn_011;

  is_op_imm_instruction <= map_line_00 AND map_colonn_100;

  is_op_instruction <= map_line_01 AND map_colonn_100;

  is_auipc_instruction <= map_line_00 AND map_colonn_101;

  is_lui_instruction <= map_line_01 AND map_colonn_101;

end architecture;
