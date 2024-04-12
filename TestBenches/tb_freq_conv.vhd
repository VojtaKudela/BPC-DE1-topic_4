-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 12.4.2024 14:31:07 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_freq_conv is
end tb_freq_conv;

architecture tb of tb_freq_conv is

    component freq_conv
        port (bcd  : in std_logic_vector (3 downto 0);
              freq : out std_logic_vector (15 downto 0));
    end component;

    signal bcd  : std_logic_vector (3 downto 0);
    signal freq : std_logic_vector (15 downto 0);

begin

    dut : freq_conv
    port map (bcd  => bcd,
              freq => freq);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        bcd <= x"0"; wait for 10 ns;
        bcd <= x"1"; wait for 10 ns;
        bcd <= x"2"; wait for 10 ns;
        bcd <= x"3"; wait for 10 ns;
        bcd <= x"5"; wait for 10 ns;
        bcd <= x"6"; wait for 10 ns;
        bcd <= x"7"; wait for 10 ns;
        bcd <= x"8"; wait for 10 ns;
        bcd <= x"9"; wait for 10 ns;
        bcd <= x"A"; wait for 10 ns;
        bcd <= x"B"; wait for 10 ns;
        bcd <= x"C"; wait for 10 ns;
        bcd <= x"D"; wait for 10 ns;
        bcd <= x"E"; wait for 10 ns;
        bcd <= x"F"; wait for 10 ns;
        bcd <= x"0"; wait for 10 ns;
        
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_freq_conv of tb_freq_conv is
    for tb
    end for;
end cfg_tb_freq_conv;