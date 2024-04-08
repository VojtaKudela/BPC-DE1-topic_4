----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 03:17:42 PM
-- Design Name: 
-- Module Name: bin2seg - Behavioral
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

entity bin2seg is
    Port ( clear : in STD_LOGIC;
           bin : in STD_LOGIC_VECTOR (4 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end bin2seg;

architecture Behavioral of bin2seg is

begin
-- This combinational process decodes binary
-- input (`bin`) into 7-segment display output
-- (`seg`) for a Common Anode configuration.
-- When either `bin` or `clear` changes, the
-- process is triggered. Each bit in `seg`
-- represents a segment from A to G. The display
-- is cleared if input `clear` is set to 1.
p_7seg_decoder : process (bin, clear) is
begin

  if (clear = '1') then
    seg <= "01111111";  -- Clear the display
  else

    case bin is
      when x"0" =>     -- x"0" means "0000" in hexadec.
        seg <= "00000001";
      when x"1" =>
        seg <= "01001111";
      when x"2" =>
        seg <= "00010010";
      when x"3" =>
        seg <= "00000110";
      when x"4" =>
        seg <= "01001100";
      when x"5" =>
        seg <= "00100100";
      when x"6" =>
        seg <= "00100000";
      when x"7" =>
        seg <= "00001111";
      when x"8" =>
        seg <= "00000000";
      when x"9" =>
        seg <= "00000100";
      when x"A" =>
        seg <= "00001000";
       when x"b" =>
        seg <= "01100000";       
       when x"C" =>
        seg <= "00110001";  
       when x"d" =>
        seg <= "01000010";            
      when x"E" =>
        seg <= "00110000";
      when x"F" =>
        seg <= "00111000";
      when "10000" =>
        seg <= "1001000";
      when "10001" =>
        seg <= x"79";
      when "10010" =>
        seg <= x"43";
      when "10011" =>
        seg <= x"71";
      when "10100" =>
        seg <= x"68";
      when "10101" =>
        seg <= x"4A";
      when "10110" =>
        seg <= x"6A";
      when "10111" =>
        seg <= x"18";
      when "11000" =>
        seg <= x"7A";
      when "11001" =>
        seg <= x"0F";
      when "11010" =>
        seg <= x"41";
      when "11011" =>
        seg <= x"6C";
      when "11100" =>
        seg <= x"77";
      when others =>
        seg <= x"78";
      
    end case;

  end if;    
end process p_7seg_decoder;

end Behavioral;
