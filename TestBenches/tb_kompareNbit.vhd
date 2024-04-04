-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 30.3.2024 16:13:29 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_kompareNbit is
end tb_kompareNbit;

architecture tb of tb_kompareNbit is

    component kompareNbit
        generic (
              N : integer
                );
        port (a         : in std_logic_vector (N-1 downto 0);
              b         : in std_logic_vector (N-1 downto 0);
              en        : in std_logic;
              b_greater : out std_logic;
              b_a_equal : out std_logic;
              a_greater : out std_logic;
              clk       : in std_logic);
    end component;
    
    constant n : integer := 4;
    signal a         : std_logic_vector (n-1 downto 0);
    signal b         : std_logic_vector (n-1 downto 0);
    signal en        : std_logic;
    signal b_greater : std_logic;
    signal b_a_equal : std_logic;
    signal a_greater : std_logic;
    signal clk       : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : kompareNbit
    generic map(
              N => n
              )
    port map (a         => a,
              b         => b,
              en        => en,
              b_greater => b_greater,
              b_a_equal => b_a_equal,
              a_greater => a_greater,
              clk       => clk);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= (others => '0');
        b <= (others => '0');
        en <= '0';
        wait for 20ns;
        en <= '1';
        wait for 20ns;
        b <= x"F"; a <= x"E"; wait for 20ns;
        b <= x"B"; a <= x"E"; wait for 20ns;
        b <= x"B"; a <= x"1"; wait for 20ns;
        b <= x"0"; a <= x"1"; wait for 20ns;
        b <= x"0"; a <= x"1"; wait for 20ns;
        b <= x"4"; a <= x"1"; wait for 20ns;
        b <= x"4"; a <= x"4"; wait for 20ns;
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_kompareNbit of tb_kompareNbit is
    for tb
    end for;
end cfg_tb_kompareNbit;
