-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 27.3.2024 22:08:27 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;

entity tb_counter_nnum is
end tb_counter_nnum;

architecture tb of tb_counter_nnum is

    component counter_nnum
        Generic (
           FSMP  : integer;
           NBIT  : integer
           );
        Port ( 
           rst   : in  STD_LOGIC;
           clk   : in  STD_LOGIC;
           freq  : in  STD_LOGIC_VECTOR (15 downto 0);
           phase : out STD_LOGIC_VECTOR ((integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1) downto 0)
           );
    end component;

    constant FSMP : integer := 12_000;
    constant NBIT : integer := 8;

    signal rst   : std_logic;
    signal clk   : std_logic;
    signal freq  : std_logic_vector (15 downto 0);
    signal phase : std_logic_vector ((integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1) downto 0);
    

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : counter_nnum
    generic map(
              FSMP  => FSMP,
              NBIT  => NBIT
                )
    port map (rst   => rst,
              clk   => clk,
              freq  => freq,
              phase => phase);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        freq <= x"1771";

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

configuration cfg_tb_counter_nnum of tb_counter_nnum is
    for tb
    end for;
end cfg_tb_counter_nnum;
