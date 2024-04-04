-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.3.2024 15:23:58 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_rec_gen is
end tb_rec_gen;

architecture tb of tb_rec_gen is

    component rec_gen
        generic (
              nbit : integer;
              fsmp : integer
                );
        port (clk  : in std_logic;
              freq : in std_logic_vector (15 downto 0);
              vol  : in std_logic_vector (3 downto 0);
              rst  : in std_logic;
              smpl : out std_logic_vector (nbit-1 downto 0));
    end component;

    constant fsmp : integer := 12_000;
    constant nbit : integer := 8;
    signal clk  : std_logic;
    signal freq : std_logic_vector (15 downto 0);
    signal vol  : std_logic_vector (3 downto 0);
    signal rst  : std_logic;
    signal smpl : std_logic_vector (nbit-1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : rec_gen
    generic map (
              fsmp => fsmp,
              nbit => nbit
                )
    port map (clk  => clk,
              freq => freq,
              vol  => vol,
              rst  => rst,
              smpl => smpl);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        freq <= x"1770";
        vol <= x"1";

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_rec_gen of tb_rec_gen is
    for tb
    end for;
end cfg_tb_rec_gen;
