-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 09:21:39 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_main_loop is
end tb_main_loop;

architecture tb of tb_main_loop is

    component main_loop
        port (mode        : in std_logic_vector (2 downto 0);
              change_mode : in std_logic;
              change_vol  : in std_logic;
              vol_in      : in std_logic_vector (3 downto 0);
              clk         : in std_logic;
              rst         : in std_logic;
              mux_let     : out std_logic_vector (2 downto 0);
              vol_out     : out std_logic_vector (3 downto 0);
              rst_komp    : out std_logic;
              rst_play    : out std_logic;
              clear       : out std_logic;
              mux_mode    : out std_logic_vector (2 downto 0));
    end component;

    signal mode        : std_logic_vector (2 downto 0);
    signal change_mode : std_logic;
    signal change_vol  : std_logic;
    signal vol_in      : std_logic_vector (3 downto 0);
    signal clk         : std_logic;
    signal rst         : std_logic;
    signal mux_let     : std_logic_vector (2 downto 0);
    signal vol_out     : std_logic_vector (3 downto 0);
    signal rst_komp    : std_logic;
    signal rst_play    : std_logic;
    signal clear       : std_logic;
    signal mux_mode    : std_logic_vector (2 downto 0);

    constant TbPeriod : time := 1 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : main_loop
    port map (mode        => mode,
              change_mode => change_mode,
              change_vol  => change_vol,
              vol_in      => vol_in,
              clk         => clk,
              rst         => rst,
              mux_let     => mux_let,
              vol_out     => vol_out,
              rst_komp    => rst_komp,
              rst_play    => rst_play,
              clear       => clear,
              mux_mode    => mux_mode);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        mode <= (others => '0');
        change_mode <= '0';
        change_vol <= '0';
        vol_in <= x"F";

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 5 ns;
        rst <= '0';
        wait for 5 ns;
        mode <= "001";change_mode <= '1';change_vol <= '0';vol_in <= x"F";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "001";change_mode <= '0';change_vol <= '1';vol_in <= x"E";wait for 1 ns;
        change_vol <= '0';wait for 4 ns;
        mode <= "010";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "011";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "100";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "101";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "110";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "101";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "101";change_mode <= '0';change_vol <= '1';vol_in <= x"D";wait for 1 ns;
        change_vol <= '0';wait for 4 ns;
        mode <= "101";change_mode <= '0';change_vol <= '1';vol_in <= x"C";wait for 1 ns;
        change_vol <= '0';wait for 19 ns;
        mode <= "100";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        mode <= "011";change_mode <= '1';change_vol <= '0';vol_in <= x"E";wait for 1 ns;
        change_mode <= '0';wait for 4 ns;
        -- EDIT Add stimuli here
        wait for 1000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_main_loop of tb_main_loop is
    for tb
    end for;
end cfg_tb_main_loop;