-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 14:09:04 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_boot_to_freq is
end tb_boot_to_freq;

architecture tb of tb_boot_to_freq is

    component boot_to_freq
        port (inpu   : in std_logic_vector (3 downto 0);
              output : out std_logic_vector (15 downto 0));
    end component;

    signal inpu   : std_logic_vector (3 downto 0);
    signal output : std_logic_vector (15 downto 0);

begin

    dut : boot_to_freq
    port map (inpu   => inpu,
              output => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        inpu <= "0000";
        wait for 50 ns;
        inpu <= "0001";
        wait for 50 ns;
        inpu <= "0010";
        wait for 50 ns;
        inpu <= "0011";
        wait for 50 ns;
        inpu <= "0100";
        wait for 50 ns;
        inpu <= "0101";
        wait for 50 ns;
        inpu <= "0110";
        wait for 50 ns;
        inpu <= "0111";
        wait for 50 ns;
        inpu <= "1000";
        wait for 50 ns;
        inpu <= "1001";
        wait for 50 ns;
        inpu <= "1010";
        wait for 50 ns;
        inpu <= "1011";
        wait for 50 ns;
        inpu <= "1100";
        wait for 50 ns;
        inpu <= "1101";
        wait for 50 ns;
        inpu <= "1110";
        wait for 50 ns;
        inpu <= "1111";
        wait for 50 ns;
       

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_boot_to_freq of tb_boot_to_freq is
    for tb
    end for;
end cfg_tb_boot_to_freq;