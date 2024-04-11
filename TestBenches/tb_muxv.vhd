
-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 13:14:12 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_mux is
end tb_mux;

architecture tb of tb_mux is
        
    component mux
        port (in_0   : in std_logic_vector (3 downto 0);
              in_1   : in std_logic_vector (3 downto 0);
              in_2   : in std_logic_vector (3 downto 0);
              in_3   : in std_logic_vector (3 downto 0);
              sel    : in std_logic_vector (1 downto 0);
              output : out std_logic_vector (3 downto 0));
    end component;

    signal in_0   : std_logic_vector (3 downto 0);
    signal in_1   : std_logic_vector (3 downto 0);
    signal in_2   : std_logic_vector (3 downto 0);
    signal in_3   : std_logic_vector (3 downto 0);
    signal sel    : std_logic_vector (1 downto 0);
    signal output : std_logic_vector (3 downto 0);

begin

    dut : mux
    port map (in_0   => in_0,
              in_1   => in_1,
              in_2   => in_2,
              in_3   => in_3,
              sel    => sel,
              output => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        in_0 <= "1111";
        in_1 <="1110" ;
        in_2 <= "1100";
        in_3 <= "1000";
        sel <= "00";
        wait for 50 ns;
        sel <= "00";
        wait for 50 ns;
        sel <= "01";
        wait for 50 ns;
        sel <= "10";
        wait for 50 ns;
        sel <= "11";
        

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux of tb_mux is
    for tb
    end for;
end cfg_tb_mux;