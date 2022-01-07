library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_immediate_generator is
end tb_immediate_generator;

architecture test_bench of tb_immediate_generator is

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

  signal instruction : std_logic_vector(31 downto 0);
  signal is_I_type, is_S_type, is_B_type, is_U_type, is_J_type : std_logic;
  signal immediate : std_logic_vector(31 downto 0);

begin

  used_immediate_generator : immediate_generator port map(
    instruction => instruction,
    is_I_type => is_I_type,
    is_S_type => is_S_type,
    is_B_type => is_B_type,
    is_U_type => is_U_type,
    is_J_type => is_J_type,
    immediate => immediate
  );

  process
  begin
    instruction <= "00000000000000000000000000000000";
    is_I_type <= '0';
    is_S_type <= '0';
    is_B_type <= '0';
    is_U_type <= '0';
    is_J_type <= '0';
    wait for 10 ns;

    is_I_type <= '1';
    instruction <= "00000000000000000000000000000000";
    wait for 10 ns;
    instruction(0) <= '1';
    wait for 10 ns;
    for i in 0 to 30 loop
      instruction(i) <= '0';
      instruction(i+1) <= '1';
      wait for 10 ns;
    end loop;

    is_I_type <= '0';
    is_S_type <= '1';
    instruction <= "00000000000000000000000000000000";
    wait for 10 ns;
    instruction(0) <= '1';
    wait for 10 ns;
    for i in 0 to 30 loop
      instruction(i) <= '0';
      instruction(i+1) <= '1';
      wait for 10 ns;
    end loop;

    is_S_type <= '0';
    is_B_type <= '1';
    instruction <= "00000000000000000000000000000000";
    wait for 10 ns;
    instruction(0) <= '1';
    wait for 10 ns;
    for i in 0 to 30 loop
      instruction(i) <= '0';
      instruction(i+1) <= '1';
      wait for 10 ns;
    end loop;

    is_B_type <= '0';
    is_U_type <= '1';
    instruction <= "00000000000000000000000000000000";
    wait for 10 ns;
    instruction(0) <= '1';
    wait for 10 ns;
    for i in 0 to 30 loop
      instruction(i) <= '0';
      instruction(i+1) <= '1';
      wait for 10 ns;
    end loop;

    is_U_type <= '0';
    is_J_type <= '1';
    instruction <= "00000000000000000000000000000000";
    wait for 10 ns;
    instruction(0) <= '1';
    wait for 10 ns;
    for i in 0 to 30 loop
      instruction(i) <= '0';
      instruction(i+1) <= '1';
      wait for 10 ns;
    end loop;

    wait;
  end process;

end architecture;
