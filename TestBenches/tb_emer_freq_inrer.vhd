-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 12.4.2024 14:31:07 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_emer_freq_inrer is
end tb_emer_freq_inrer;

architecture tb of tb_emer_freq_inrer is

    component emer_freq_inrer
        port (button  : in   std_logic_vector (15 downto 0);
              freq    : out  std_logic_vector (3 downto 0);
              any     : out  std_logic
              );
    end component;

    signal button  : std_logic_vector (15 downto 0);
    signal freq    : std_logic_vector (3 downto 0);
    signal any     : std_logic;

begin

    dut : emer_freq_inrer
    port map (button  => button,
              freq    => freq,
              any     => any);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        button <= x"8000"; wait for 10 ns;
        button <= x"4000"; wait for 10 ns;
        button <= x"2000"; wait for 10 ns;
        button <= x"1000"; wait for 10 ns;
        button <= x"0800"; wait for 10 ns;
        button <= x"0400"; wait for 10 ns;
        button <= x"0200"; wait for 10 ns;
        button <= x"0100"; wait for 10 ns;
        button <= x"0080"; wait for 10 ns;
        button <= x"0040"; wait for 10 ns;
        button <= x"0020"; wait for 10 ns;
        button <= x"0010"; wait for 10 ns;
        button <= x"0008"; wait for 10 ns;
        button <= x"0004"; wait for 10 ns;
        button <= x"0002"; wait for 10 ns;
        button <= x"0001"; wait for 10 ns;
        button <= x"000A"; wait for 10 ns;
        button <= x"0000"; wait for 10 ns;
        
        
        
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_emer_freq_inrer of tb_emer_freq_inrer is
    for tb
    end for;
end cfg_tb_emer_freq_inrer;