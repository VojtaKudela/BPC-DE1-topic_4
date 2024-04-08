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
           seg : out STD_LOGIC_VECTOR (6 downto 0));
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
    seg <= "1111111";  -- Clear the display
  else

    case bin is
      when x"0" =>     -- x"0" means "0000" in hexadec.
        seg <= "0000001";
      when x"1" =>
        seg <= "1001111";
      when x"2" =>
        seg <= "0010010";
      when x"3" =>
        seg <= "0000110";
      when x"4" =>
        seg <= "1001100";
      when x"5" =>
        seg <= "0100100";
      when x"6" =>
        seg <= "0100000";
      when x"7" =>
        seg <= "0001111";
      when x"8" =>
        seg <= "0000000";
      when x"9" =>
        seg <= "0000100";
      when x"A" =>
        seg <= "0001000";
       when x"b" =>
        seg <= "1100000";       
       when x"C" =>
        seg <= "0110001";  
       when x"d" =>
        seg <= "1000010";            
      when x"E" =>
        seg <= "0110000";
      when x"F" =>
        seg <= "0111000";
      when "10000" =>
        seg <= "1001000";
      when "10001" =>
        seg <= "1111001";
      when "10010" =>
        seg <= "1000011";
      when "10011" =>
        seg <= "1110001";
      when "10100" =>
        seg <= "1101000";
      when "10101" =>
        seg <= "1001010";
      when "10110" =>
        seg <= "1101010";
      when "10111" =>
        seg <= "0011000";
      when "11000" =>
        seg <= "1111010";
      when "11001" =>
        seg <= "0001111";
      when "11010" =>
        seg <= "41";
      when "11011" =>
        seg <= "1101100";
      when "11100" =>
        seg <= "1110111";
      when "11101" =>
        seg <= "1111000";
      when "11110" =>
        seg <= "1111111";
      when others =>
        seg <= "1111111";
      
    end case;

  end if;    
end process p_7seg_decoder;

end Behavioral;
