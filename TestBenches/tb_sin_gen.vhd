-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.3.2024 10:08:35 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_sin_gen is
end tb_sin_gen;

architecture tb of tb_sin_gen is

    component sin_gen
        generic (
              NBIT : integer;
              FSMP : integer
              );
        port (clk  : in std_logic;
              freq : in std_logic_vector (15 downto 0);
              vol  : in  STD_LOGIC_VECTOR (3  downto 0);
              rst  : in std_logic;
              smpl : out std_logic_vector (7 downto 0));
    end component;

    constant NBIT : integer := 8;
    constant FSMP : integer := 12_000;
    signal clk  : std_logic;
    signal freq : std_logic_vector (15 downto 0);
    signal rst  : std_logic;
    signal smpl : std_logic_vector (7 downto 0);
    signal vol  : std_logic_vector (3  downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : sin_gen
    generic map(
              FSMP  => FSMP,
              NBIT  => NBIT
                )
    port map (clk  => clk,
              freq => freq,
              rst  => rst,
              vol  => vol,
              smpl => smpl);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        freq <= x"1771";
        vol  <= x"A";
        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        wait for 10 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_sin_gen of tb_sin_gen is
    for tb
    end for;
end cfg_tb_sin_gen;