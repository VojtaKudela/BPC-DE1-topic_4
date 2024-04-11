----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala 
-- 
-- Create Date: 04/11/2024 04:40:51 PM
-- Design Name: 
-- Module Name: bin2bcd - Behavioral
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

entity bin2bcd is
    Port ( 
           bin    : in  STD_LOGIC_VECTOR (3 downto 0);
           bcd_00 : out STD_LOGIC_VECTOR (4 downto 0);
           bcd_01 : out STD_LOGIC_VECTOR (4 downto 0)
           );
    end bin2bcd;

architecture Behavioral of bin2bcd is

begin

    trans: process(bin)
    begin
        case bin is
        
            when "0000" =>
                bcd_00 <= "00000";
                bcd_01 <= "00000"; 
             when "0001" =>
                bcd_00 <= "00001";
                bcd_01 <= "00000"; 
             when "0010" =>
                bcd_00 <= "00010";
                bcd_01 <= "00000";
             when "0011" =>
                bcd_00 <= "00011";
                bcd_01 <= "00000";
            when "0100" =>
                bcd_00 <= "00100";
                bcd_01 <= "00000";
            when "0101" =>
                bcd_00 <= "00101";
                bcd_01 <= "00000";
             when "0110" =>
                bcd_00 <= "00110";
                bcd_01 <= "00000";
            when "0111" =>
                bcd_00 <= "00111";
                bcd_01 <= "00000";
            when "1000" =>
                bcd_00 <= "01000";
                bcd_01 <= "00000";
             when "1001" =>
                bcd_00 <= "01001";
                bcd_01 <= "00000";
            when "1010" =>
                bcd_00 <= "00000";
                bcd_01 <= "00001";
            when "1011" =>
                bcd_00 <= "00001";
                bcd_01 <= "00001";
            when "1100" =>
                bcd_00 <= "00010";
                bcd_01 <= "00001";
            when "1101" =>
                bcd_00 <= "00011";
                bcd_01 <= "00001";
            when "1110" =>
                bcd_00 <= "00100";
                bcd_01 <= "00001";
            when others =>
                bcd_00 <= "00101";
                bcd_01 <= "00001";
        end case;
    end process trans;

end Behavioral;
