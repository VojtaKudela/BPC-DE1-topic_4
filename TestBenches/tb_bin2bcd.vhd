-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 14:54:53 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_bin2bcd is
end tb_bin2bcd;

architecture tb of tb_bin2bcd is

    component bin2bcd
        port (bin    : in std_logic_vector (3 downto 0);
              bcd_00 : out std_logic_vector (4 downto 0);
              bcd_01 : out std_logic_vector (4 downto 0));
    end component;

    signal bin    : std_logic_vector (3 downto 0);
    signal bcd_00 : std_logic_vector (4 downto 0);
    signal bcd_01 : std_logic_vector (4 downto 0);

begin

    dut : bin2bcd
    port map (bin    => bin,
              bcd_00 => bcd_00,
              bcd_01 => bcd_01);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        bin <= x"0"; wait for 10ns;
        bin <= x"1"; wait for 10ns;
        bin <= x"2"; wait for 10ns;
        bin <= x"3"; wait for 10ns;
        bin <= x"4"; wait for 10ns;
        bin <= x"5"; wait for 10ns;
        bin <= x"6"; wait for 10ns;
        bin <= x"7"; wait for 10ns;
        bin <= x"8"; wait for 10ns;
        bin <= x"9"; wait for 10ns;
        bin <= x"a"; wait for 10ns;
        bin <= x"b"; wait for 10ns;
        bin <= x"c"; wait for 10ns;
        bin <= x"d"; wait for 10ns;
        bin <= x"e"; wait for 10ns;
        bin <= x"f"; wait for 10ns;
        
        
        
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_bin2bcd of tb_bin2bcd is
    for tb
    end for;
end cfg_tb_bin2bcd;