-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 10.4.2024 08:19:20 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_matrix_control is
end tb_matrix_control;

architecture tb of tb_matrix_control is

    component matrix_control
        Generic(
             PERIOD : integer
              );
        port (clk : in std_logic;
              rst : in std_logic;
              any : out std_logic;
              s   : in std_logic_vector (3 downto 0);
              r   : out std_logic_vector (3 downto 0);
              but : out std_logic_vector (3 downto 0));
    end component;

    signal clk : std_logic;
    signal rst : std_logic;
    signal any : std_logic;
    signal s   : std_logic_vector (3 downto 0);
    signal r   : std_logic_vector (3 downto 0);
    signal but : std_logic_vector (3 downto 0);
    
    constant PERIOD : integer := 100;
    constant TbPeriod : time := 100 ps; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : matrix_control
    generic map(
              PERIOD => PERIOD
            )
    port map (clk => clk,
              rst => rst,
              any => any,
              s   => s,
              r   => r,
              but => but);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s <= "1110";

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 1 ns;
        rst <= '0';
        wait for 150 ns;
        s <= "1101";
        wait for 290 ns;
        s <= "1111";
        wait for 150 ns;
        s <= "1011";
        wait for 150 ns;
        s <= "1011";

        -- EDIT Add stimuli here
        wait for 10000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_matrix_control of tb_matrix_control is
    for tb
    end for;
end cfg_tb_matrix_control;