-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 4.4.2024 11:34:27 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_PWM_mod is
end tb_PWM_mod;

architecture tb of tb_PWM_mod is

    component PWM_mod
        Generic (
             NBIT     : integer;
             PERIOD   : integer
           );
        port (mod_in  : in std_logic_vector (nbit-1 downto 0);
              rst     : in std_logic;
              clk     : in std_logic;
              pwm_out : out std_logic);
    end component;
    
    constant nbit   : integer := 8;
    constant period : integer := 4;
    signal mod_in   : std_logic_vector (nbit-1 downto 0);
    signal rst      : std_logic;
    signal clk      : std_logic;
    signal pwm_out  : std_logic;

    constant TbPeriod : time := 100 ps; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : PWM_mod
    generic map (
              nbit    => nbit,
              period  => period)
    port map (mod_in  => mod_in,
              rst     => rst,
              clk     => clk,
              pwm_out => pwm_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        mod_in <= x"7F";

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        wait for 10 ns;
        -- EDIT Add stimuli here
        wait for 10000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_PWM_mod of tb_PWM_mod is
    for tb
    end for;
end cfg_tb_PWM_mod;