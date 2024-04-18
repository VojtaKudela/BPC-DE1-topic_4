----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2024 17:04:10
-- Design Name: 
-- Module Name: demo_ins - Behavioral
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

entity demo_ins is
    Port ( 
           step : in  STD_LOGIC_VECTOR (5 downto 0);
           freq : out STD_LOGIC_VECTOR (3 downto 0);
           vol  : out STD_LOGIC_VECTOR (3 downto 0)
           );
end demo_ins;

architecture Behavioral of demo_ins is

begin
    melody_01 : process (step)is
  begin
    
    case step is
         when "000000" =>
            freq <= x"C";
            vol  <= x"0";
            
         when "000001" =>
            freq <= x"C";
            vol  <= x"7";
         
         when "000010" =>
            freq <= x"B";
            vol  <= x"8";
         
         when "000011" =>
            freq <= x"C";
            vol  <= x"9";
         
         when "000100" =>
            freq <= x"B";
            vol  <= x"A";
         
         when "000101" =>
            freq <= x"C";
            vol  <= x"B";
         
         when "000110" =>
            freq <= x"7";
            vol  <= x"B";
         
         when "000111" =>
            freq <= x"A";
            vol  <= x"B";
         
         when "001000" =>
            freq <= x"8";
            vol  <= x"B";
         
         when "001001" =>
            freq <= x"5";
            vol  <= x"B";
         
         when "001010" =>
            freq <= x"5";
            vol  <= x"7";
         
         when "001011" =>
            freq <= x"5";
            vol  <= x"5";
         
         when "001100" =>
            freq <= x"5";
            vol  <= x"2";
        
         when "001101" =>
            freq <= x"0";
            vol  <= x"C";
         
         when "001110" =>
            freq <= x"5";
            vol  <= x"C";
            
         when "001111" =>
            freq <= x"7";
            vol  <= x"C";
            
         when "010000" =>
            freq <= x"7";
            vol  <= x"9";
            
         when "010001" =>
            freq <= x"7";
            vol  <= x"6";
         
         when "010010" =>
            freq <= x"7";
            vol  <= x"3";
         
         when "010011" =>
            freq <= x"0";
            vol  <= x"D";
         
         when "010100" =>
            freq <= x"7";
            vol  <= x"D";
         
         when "010101" =>
            freq <= x"8";
            vol  <= x"D";
         
         when "010110" =>
            freq <= x"8";
            vol  <= x"B";
         
         when "010111" =>
            freq <= x"8";
            vol  <= x"9";
         
         when "011000" =>
            freq <= x"8";
            vol  <= x"7";
         
         when "011001" =>
            freq <= x"8";
            vol  <= x"5";
         
         when "011010" =>
            freq <= x"8";
            vol  <= x"3";
         
         when "011011" =>
            freq <= x"8";
            vol  <= x"1";
         
         when "011100" =>
            freq <= x"8";
            vol  <= x"0";
        
         when "011101" =>
            freq <= x"0";
            vol  <= x"4";
         
         when "011110" =>
            freq <= x"C";
            vol  <= x"5";
            
         when "011111" =>
            freq <= x"B";
            vol  <= x"6";
         
         when "100000" =>
            freq <= x"C";
            vol  <= x"7";
            
         when "100001" =>
            freq <= x"B";
            vol  <= x"8";
         
         when "100010" =>
            freq <= x"C";
            vol  <= x"9";
         
         when "100011" =>
            freq <= x"7";
            vol  <= x"9";
         
         when "100100" =>
            freq <= x"A";
            vol  <= x"9";
         
         when "100101" =>
            freq <= x"8";
            vol  <= x"9";
         
         when "100110" =>
            freq <= x"5";
            vol  <= x"9";
         
         when "100111" =>
            freq <= x"5";
            vol  <= x"6";
         
         when "101000" =>
            freq <= x"5";
            vol  <= x"3";
         
         when "101001" =>
            freq <= x"5";
            vol  <= x"0";
         
         when "101010" =>
            freq <= x"0";
            vol  <= x"8";
         
         when "101011" =>
            freq <= x"5";
            vol  <= x"8";
         
         when "101100" =>
            freq <= x"7";
            vol  <= x"8";
        
         when "101101" =>
            freq <= x"7";
            vol  <= x"4";
         
         when "101110" =>
            freq <= x"7";
            vol  <= x"0";
            
         when "101111" =>
            freq <= x"0";
            vol  <= x"8";
            
         when "110000" =>
            freq <= x"0";
            vol  <= x"7";
            
         when "110001" =>
            freq <= x"8";
            vol  <= x"7";
         
         when "110010" =>
            freq <= x"8";
            vol  <= x"6";
         
         when "110011" =>
            freq <= x"7";
            vol  <= x"6";
         
         when "110100" =>
            freq <= x"7";
            vol  <= x"5";
         
         when "110101" =>
            freq <= x"5";
            vol  <= x"5";
         
         when "110110" =>
            freq <= x"5";
            vol  <= x"4";
         
         when "110111" =>
            freq <= x"7";
            vol  <= x"6";
         
         when "111000" =>
            freq <= x"7";
            vol  <= x"5";
         
         when "111001" =>
            freq <= x"7";
            vol  <= x"4";
         
         when "111010" =>
            freq <= x"7";
            vol  <= x"3";
         
         when "111011" =>
            freq <= x"7";
            vol  <= x"2";
         
         when "111100" =>
            freq <= x"7";
            vol  <= x"1";
        
         when "111101" =>
            freq <= x"7";
            vol  <= x"0";
         
         when "111110" =>
            freq <= x"7";
            vol  <= x"0";
            
         when others =>
            freq <= x"7";
            vol  <= x"0";
            
    end case;
 end process melody_01;

end Behavioral;
