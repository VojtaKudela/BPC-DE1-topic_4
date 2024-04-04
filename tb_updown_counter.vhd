-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 4.4.2024 13:26:51 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_updown_counter is
end tb_updown_counter;

architecture tb of tb_updown_counter is

    component updown_counter
        generic(
              n     : integer;
              short : integer
              );
        port (up    : in std_logic;
              down  : in std_logic;
              clk   : in std_logic;
              rst   : in std_logic;
              score : out std_logic_vector (n-1 downto 0));
    end component;

    constant n      : integer := 3;
    constant short  : integer := 1;
    signal up       : std_logic;
    signal down     : std_logic;
    signal clk      : std_logic;
    signal rst      : std_logic;
    signal score    : std_logic_vector (n-1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : updown_counter
    generic map (
              n => n,
              short => short
               )
    port map (up    => up,
              down  => down,
              clk   => clk,
              rst   => rst,
              score => score);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        up <= '0';
        down <= '0';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        wait for 10 ns;
        up <= '1';
        wait for 200 ns;
        down <= '1';
        up <= '0';
        wait for 200 ns;
        up <= '1';
        wait for 100 ns;
        up <= '0';
        down <= '0';
        wait for 100 ns;
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_updown_counter of tb_updown_counter is
    for tb
    end for;
end cfg_tb_updown_counter;