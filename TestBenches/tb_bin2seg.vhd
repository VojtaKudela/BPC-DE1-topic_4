-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 8.4.2024 18:52:27 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_bin2seg is
end tb_bin2seg;

architecture tb of tb_bin2seg is

    component bin2seg
        port (clear : in std_logic;
              bin   : in std_logic_vector (4 downto 0);
              seg   : out std_logic_vector (6 downto 0));
    end component;

    signal clear : std_logic;
    signal bin   : std_logic_vector (4 downto 0);
    signal seg   : std_logic_vector (6 downto 0);

begin

    dut : bin2seg
    port map (clear => clear,
              bin   => bin,
              seg   => seg);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        clear <= '1'; wait for 10ns;
        clear <= '0'; wait for 10ns;
        bin <= "00000"; wait for 10ns;
        bin <= "00001"; wait for 10ns;
        bin <= "00010"; wait for 10ns;
        bin <= "00011"; wait for 10ns;
        bin <= "11110"; wait for 10ns;
        bin <= "01000"; wait for 10ns;
        bin <= "00100"; wait for 10ns;
        bin <= "00101"; wait for 10ns;
        bin <= "00110"; wait for 10ns;
        bin <= "00111"; wait for 10ns;
        bin <= "01001"; wait for 10ns;
        bin <= "01010"; wait for 10ns;
        bin <= "01011"; wait for 10ns;
        bin <= "01100"; wait for 10ns;
        bin <= "01101"; wait for 10ns;
        bin <= "01110"; wait for 10ns;
        bin <= "01111"; wait for 10ns;
        bin <= "10000"; wait for 10ns;
        bin <= "10001"; wait for 10ns;
        bin <= "10010"; wait for 10ns;
        bin <= "10011"; wait for 10ns;
        bin <= "10100"; wait for 10ns;
        bin <= "10101"; wait for 10ns;
        bin <= "10110"; wait for 10ns;
        bin <= "10111"; wait for 10ns;
        bin <= "11000"; wait for 10ns;
        bin <= "11001"; wait for 10ns;
        bin <= "11010"; wait for 10ns;
        bin <= "11011"; wait for 10ns;
        bin <= "11100"; wait for 10ns;
        bin <= "11101"; wait for 10ns;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_bin2seg of tb_bin2seg is
    for tb
    end for;
end cfg_tb_bin2seg;