----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 21:58:21
-- Design Name: 
-- Module Name: tb_coder_1_from_16 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_coder_1_from_16 is
end tb_coder_1_from_16;

architecture tb of tb_coder_1_from_16 is

    component coder_1_from_16
        Port ( 
           bcd   : in  STD_LOGIC_VECTOR (3 downto 0);
           any   : in  STD_LOGIC;
           ncode : out STD_LOGIC_VECTOR (15 downto 0)
           );
    end component;
    
    signal sig_bcd   : STD_LOGIC_VECTOR (3 downto 0);
    signal sig_any   : STD_LOGIC;
    signal sig_ncode : STD_LOGIC_VECTOR (15 downto 0);
    
begin
    
    dut : coder_1_from_16
        port map (
            bcd   => sig_bcd,
            any   => sig_any,
            ncode => sig_ncode
            );

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sig_any <= '1';
        sig_bcd <= x"2"; wait for 10 ns;
        sig_bcd <= x"7"; wait for 10 ns;
        sig_bcd <= x"6"; wait for 10 ns;
        sig_bcd <= x"e"; wait for 10 ns;
        sig_bcd <= x"f"; wait for 10 ns;
        sig_bcd <= x"a"; wait for 10 ns;
        sig_bcd <= x"b"; wait for 10 ns;
        sig_bcd <= x"9"; wait for 10 ns;
        sig_bcd <= x"d"; wait for 10 ns;
        sig_bcd <= x"3"; wait for 10 ns;
        sig_bcd <= x"c"; wait for 10 ns;
        sig_bcd <= x"5"; wait for 10 ns;
        sig_bcd <= x"8"; wait for 10 ns;
        sig_bcd <= x"1"; wait for 10 ns;
        sig_bcd <= x"4"; wait for 10 ns;
        sig_bcd <= x"0"; wait for 10 ns;
        sig_any <= '0' ; wait for 10 ns;
        
        
        
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

configuration cfg_tb_coder_1_from_16 of tb_coder_1_from_16 is
    for tb
    end for;
end cfg_tb_coder_1_from_16;