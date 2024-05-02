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
       when "00000" => 
        seg <= "0000001";  -- 0
       when "00001" =>
        seg <= "1001111";  -- 1
       when "00010" =>
        seg <= "0010010";  -- 2
       when "00011" =>
        seg <= "0000110";  -- 3
       when "00100" =>
        seg <= "1001100";  -- 4
       when "00101" =>
        seg <= "0100100";  -- 5
       when "00110" =>
        seg <= "0100000";  -- 6
       when "00111" =>
        seg <= "0001111";  -- 7
       when "01000" =>
        seg <= "0000000";  -- 8
       when "01001" =>
        seg <= "0000100";  -- 9
       when "01010" =>
        seg <= "0001000";  -- A
       when "01011" =>
        seg <= "1100000";  -- B      
       when "01100" =>
        seg <= "0110001";  -- C 
       when "01101" =>
        seg <= "1000010";  -- D            
      when "01110" =>
        seg <= "0110000";  -- E
      when "01111" =>
        seg <= "0111000";  -- F
      when "10000" =>
        seg <= "1001000";  -- H
      when "10001" =>
        seg <= "1111001";  -- I
      when "10010" =>
        seg <= "1000011";  -- J
      when "10011" =>
        seg <= "1110001";  -- L
      when "10100" =>
        seg <= "1101000";  -- m1
      when "10101" =>
        seg <= "1001010";  -- m2
      when "10110" =>
        seg <= "1101010";  -- N
      when "10111" =>
        seg <= "0011000";  -- P
      when "11000" =>
        seg <= "1111010";  -- R
      when "11001" =>
        seg <= "0001111";  -- T
      when "11010" =>
        seg <= "1000001";  -- U
      when "11011" =>
        seg <= "1101100";  -- X
      when "11100" =>
        seg <= "1110111";  -- _
      when "11101" =>
        seg <= "1111000";  -- K
      when "11110" =>
        seg <= "1111111";  -- empty
      when others =>
        seg <= "1111111";  -- empty
      
    end case;

  end if;    
end process p_7seg_decoder;

end Behavioral;
