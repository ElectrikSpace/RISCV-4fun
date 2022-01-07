library ieee;
use ieee.std_logic_1164.all;

entity immediate_generator is
  port (
    instruction : in std_logic_vector(31 downto 0);
    is_I_type : in std_logic;
    is_S_type : in std_logic;
    is_B_type : in std_logic;
    is_U_type : in std_logic;
    is_J_type : in std_logic;
    immediate : out std_logic_vector(31 downto 0)
  );
end immediate_generator;

architecture Behavioral of immediate_generator is

  signal is_IS_type : std_logic;
  signal is_IJ_type : std_logic;
  signal is_SB_type : std_logic;
  signal is_ISB_type : std_logic;
  signal is_UJ_type : std_logic;
  signal is_ISBJ_type : std_logic;

  signal o : std_logic_vector(31 downto 0);

  begin
    -- inside flags
    is_IS_type <= is_I_type OR is_S_type;
    is_IJ_type <= is_I_type OR is_J_type;
    is_SB_type <= is_S_type OR is_B_type;
    is_ISB_type <= is_I_type OR is_S_type OR is_B_type;
    is_UJ_type <= is_U_type OR is_J_type;
    is_ISBJ_type <= is_I_type OR is_S_type OR is_B_type OR is_J_type;

    -- immediate creation
    o(31) <= instruction(31);
    o(30) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(30) AND is_U_type);
    o(29) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(29) AND is_U_type);
    o(28) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(28) AND is_U_type);
    o(27) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(27) AND is_U_type);
    o(26) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(26) AND is_U_type);
    o(25) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(25) AND is_U_type);
    o(24) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(24) AND is_U_type);
    o(23) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(23) AND is_U_type);
    o(22) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(22) AND is_U_type);
    o(21) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(21) AND is_U_type);
    o(20) <= (instruction(31) AND (NOT is_U_type)) OR (instruction(20) AND is_U_type);
    o(19) <= (instruction(31) AND is_ISB_type) OR (instruction(19) AND is_UJ_type);
    o(18) <= (instruction(31) AND is_ISB_type) OR (instruction(18) AND is_UJ_type);
    o(17) <= (instruction(31) AND is_ISB_type) OR (instruction(17) AND is_UJ_type);
    o(16) <= (instruction(31) AND is_ISB_type) OR (instruction(16) AND is_UJ_type);
    o(15) <= (instruction(31) AND is_ISB_type) OR (instruction(15) AND is_UJ_type);
    o(14) <= (instruction(31) AND is_ISB_type) OR (instruction(14) AND is_UJ_type);
    o(13) <= (instruction(31) AND is_ISB_type) OR (instruction(13) AND is_UJ_type);
    o(12) <= (instruction(31) AND is_ISB_type) OR (instruction(12) AND is_UJ_type);
    o(11) <= (instruction(31) AND is_IS_type) OR (instruction(7) AND is_B_type) OR (instruction(20) AND is_J_type);
    o(10) <= instruction(30) AND is_ISBJ_type;
    o(9) <= instruction(29) AND is_ISBJ_type;
    o(8) <= instruction(28) AND is_ISBJ_type;
    o(7) <= instruction(27) AND is_ISBJ_type;
    o(6) <= instruction(26) AND is_ISBJ_type;
    o(5) <= instruction(25) AND is_ISBJ_type;
    o(4) <= (instruction(24) AND is_IJ_type) OR (instruction(11) AND is_SB_type);
    o(3) <= (instruction(23) AND is_IJ_type) OR (instruction(10) AND is_SB_type);
    o(2) <= (instruction(22) AND is_IJ_type) OR (instruction(9) AND is_SB_type);
    o(1) <= (instruction(21) AND is_IJ_type) OR (instruction(8) AND is_SB_type);
    o(0) <= (instruction(20) AND is_I_type) OR (instruction(7) AND is_S_type);

    immediate <= o;

end architecture;
