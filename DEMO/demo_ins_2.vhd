----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2024 17:04:10
-- Design Name: 
-- Module Name: demo_ins_3 - Behavioral
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

entity demo_ins_2 is
    Port ( 
           step : in  STD_LOGIC_VECTOR (5 downto 0);
           freq : out STD_LOGIC_VECTOR (3 downto 0);
           vol  : out STD_LOGIC_VECTOR (3 downto 0)
           );
end demo_ins_2;

architecture Behavioral of demo_ins_2 is

begin
    melody_03 : process (step) is
  begin
    
    case step is
         when "000000" =>
            freq <= x"8";
            vol  <= x"F";
            
         when "000001" =>
            freq <= x"B";
            vol  <= x"F";
         
         when "000010" =>
            freq <= x"5";
            vol  <= x"F";
         
         when "000011" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "000100" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "000101" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "000110" =>
            freq <= x"7";
            vol  <= x"F";
         
         when "000111" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "001000" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "001001" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "001010" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "001011" =>
            freq <= x"9";
            vol  <= x"F";
         
         when "001100" =>
            freq <= x"0";
            vol  <= x"F";
        
         when "001101" =>
            freq <= x"1";
            vol  <= x"F";
         
         when "001110" =>
            freq <= x"1";
            vol  <= x"F";
            
         when "001111" =>
            freq <= x"1";
            vol  <= x"F";
         when "010000" =>
            freq <= x"8";
            vol  <= x"F";
            
         when "010001" =>
            freq <= x"B";
            vol  <= x"F";
         
         when "010010" =>
            freq <= x"5";
            vol  <= x"F";
         
         when "010011" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "010100" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "010101" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "010110" =>
            freq <= x"7";
            vol  <= x"F";
         
         when "010111" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "011000" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "011001" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "011010" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "011011" =>
            freq <= x"9";
            vol  <= x"F";
         
         when "011100" =>
            freq <= x"0";
            vol  <= x"F";
        
         when "011101" =>
            freq <= x"1";
            vol  <= x"F";
         
         when "011110" =>
            freq <= x"1";
            vol  <= x"F";
            
         when "011111" =>
            freq <= x"1";
            vol  <= x"F";
         
         when "100000" =>
            freq <= x"8";
            vol  <= x"F";
            
         when "100001" =>
            freq <= x"B";
            vol  <= x"F";
         
         when "100010" =>
            freq <= x"5";
            vol  <= x"F";
         
         when "100011" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "100100" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "100101" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "100110" =>
            freq <= x"7";
            vol  <= x"F";
         
         when "100111" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "101000" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "101001" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "101010" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "101011" =>
            freq <= x"9";
            vol  <= x"F";
         
         when "101100" =>
            freq <= x"0";
            vol  <= x"F";
        
         when "101101" =>
            freq <= x"1";
            vol  <= x"F";
         
         when "101110" =>
            freq <= x"1";
            vol  <= x"F";
            
         when "101111" =>
            freq <= x"1";
            vol  <= x"F";
            
         when "110000" =>
            freq <= x"8";
            vol  <= x"F";
            
         when "110001" =>
            freq <= x"B";
            vol  <= x"F";
         
         when "110010" =>
            freq <= x"5";
            vol  <= x"F";
         
         when "110011" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "110100" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "110101" =>
            freq <= x"8";
            vol  <= x"F";
         
         when "110110" =>
            freq <= x"7";
            vol  <= x"F";
         
         when "110111" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "111000" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "111001" =>
            freq <= x"4";
            vol  <= x"F";
         
         when "111010" =>
            freq <= x"0";
            vol  <= x"F";
         
         when "111011" =>
            freq <= x"9";
            vol  <= x"F";
         
         when "111100" =>
            freq <= x"0";
            vol  <= x"F";
        
         when "111101" =>
            freq <= x"1";
            vol  <= x"F";
         
         when "111110" =>
            freq <= x"1";
            vol  <= x"F";
            
         when others =>
            freq <= x"1";
            vol  <= x"F";
            
    end case;
 end process melody_03;

end Behavioral;
