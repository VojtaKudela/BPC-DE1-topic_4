----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 11.04.2024 23:48:19
-- Design Name: 
-- Module Name: emer_freq_inrer - Behavioral
-- Project Name: PWM Tone Generator
-- Target Devices: nexys-a7-50t
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

entity emer_freq_inrer is
    Port ( 
           button : in  STD_LOGIC_VECTOR (15 downto 0);
           freq   : out STD_LOGIC_VECTOR (3 downto 0);
           any    : out STD_LOGIC
           );
end emer_freq_inrer;

architecture Behavioral of emer_freq_inrer is

begin
    
    switcher : process(button)
    begin
        case (button) is
        
            when "1000000000000000" =>
                freq <= x"2";
                any <= '1';
            when "0100000000000000" =>
                freq <= x"7";
                any <= '1';
            when "0010000000000000" =>
                freq <= x"6";
                any <= '1';
            when "0001000000000000" =>
                freq <= x"E";
                any <= '1';
            when "0000100000000000" =>
                freq <= x"F";
                any <= '1';
            when "0000010000000000" =>
                freq <= x"A";
                any <= '1';
            when "0000001000000000" =>
                freq <= x"B";
                any <= '1';
            when "0000000100000000" =>
                freq <= x"9";
                any <= '1';
            when "0000000010000000" =>
                freq <= x"D";
                any <= '1';
            when "0000000001000000" =>
                freq <= x"3";
                any <= '1';                              
            when "0000000000100000" =>                               
                freq <= x"C";
                any <= '1';
            when "0000000000010000" =>
                freq <= x"5";
                any <= '1';
            when "0000000000001000" =>
                freq <= x"8";
                any <= '1';
            when "0000000000000100" =>
                freq <= x"1";
                any <= '1';
            when "0000000000000010" =>
                freq <= x"4";
                any <= '1';
            when "0000000000000001" =>
                freq <= x"0";
                any <= '1';
            when others =>
                freq <= x"0";
                any <= '0';
            end case;
            
    end process switcher;

end Behavioral;
