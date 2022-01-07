library ieee;
use ieee.std_logic_1164.all;

entity load_manager is
  port (
    clk : in std_logic;
    memory_out_bus : in std_logic_vector(31 downto 0);
    memory_address : in std_logic_vector(15 downto 0);
    is_sign_extended : in std_logic;
    is_load_instruction : in std_logic;
    is_half_load : in std_logic;
    is_byte_load : in std_logic;
    converted_memory_out_bus : out std_logic_vector(31 downto 0)
  );
end load_manager;

architecture Behavioral of load_manager is

  signal shifted_memory_out_bus : std_logic_vector(31 downto 0);

  signal registered_memory_lsbs : std_logic_vector(1 downto 0);

begin

  process(clk)
  begin
    if rising_edge(clk) then
      registered_memory_lsbs <= memory_address(1 downto 0);
    end if;
  end process;

  process (registered_memory_lsbs, memory_out_bus)
  begin
    if registered_memory_lsbs(1)='1' then
      if registered_memory_lsbs(0)='1' then
        shifted_memory_out_bus(7 downto 0) <= memory_out_bus(31 downto 24);
        shifted_memory_out_bus(31 downto 8) <= (others => '0');
      else
        shifted_memory_out_bus(15 downto 0) <= memory_out_bus(31 downto 16);
        shifted_memory_out_bus(31 downto 16) <= (others => '0');
      end if;
    else
      if registered_memory_lsbs(0)='1' then
        shifted_memory_out_bus(23 downto 0) <= memory_out_bus(31 downto 8);
        shifted_memory_out_bus(31 downto 24) <= (others => '0');
      else
        shifted_memory_out_bus <= memory_out_bus;
      end if;
    end if;
  end process;

  process (is_load_instruction, is_half_load, is_byte_load, is_sign_extended, shifted_memory_out_bus, memory_out_bus)
  begin
    if is_load_instruction='1' then
      if is_half_load='1' then
        converted_memory_out_bus(15 downto 0) <= shifted_memory_out_bus(15 downto 0);
        if is_sign_extended='1' then
          converted_memory_out_bus(31 downto 16) <= (others => shifted_memory_out_bus(15));
        else
          converted_memory_out_bus(31 downto 16) <= (others => '0');
        end if;
      elsif is_byte_load='1' then
        converted_memory_out_bus(7 downto 0) <= shifted_memory_out_bus(7 downto 0);
        if is_sign_extended='1' then
          converted_memory_out_bus(31 downto 8) <= (others => shifted_memory_out_bus(7));
        else
          converted_memory_out_bus(31 downto 8) <= (others => '0');
        end if;
      else
        converted_memory_out_bus <= memory_out_bus;
      end if;
    else
      converted_memory_out_bus <= memory_out_bus;
    end if;
  end process;

end architecture;
