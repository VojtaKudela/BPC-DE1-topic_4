----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2024 16:05:15
-- Design Name: 
-- Module Name: freq_conv - Behavioral
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

entity freq_conv is
    Port ( 
           bcd : in STD_LOGIC_VECTOR (3 downto 0);
           freq : out STD_LOGIC_VECTOR (15 downto 0)
           );
end freq_conv;

architecture Behavioral of freq_conv is

begin
  seg_decoder:process (bcd)is
  begin
    
    case bcd is
         when "0000" => -- A 
            freq <= x"0898";
         
         when "0001" => -- A#
            freq <= x"091B";
         
         when "0010" =>  -- B
            freq <= x"09A5";
         
         when "0011" =>  -- C
            freq <= x"0A38";
         
         when "0100" =>  -- C#
            freq <= x"0AD4";
         
         when "0101" =>  -- D
            freq <= x"0B78";
         
         when "0110" =>  -- D#
            freq <= x"0C27";
         
         when "0111" =>  -- E
            freq <= x"0CE0";
         
         when "1000" =>  -- F
            freq <= x"0DA4";
         
         when "1001" =>  -- F#
            freq <= x"0E74";
         
         when "1010" =>  -- G
            freq <= x"0F50";
         
         when "1011" =>  -- G#
            freq <= x"1039";
         
         when "1100" =>  -- A
            freq <= x"1130";
         
         when "1101" =>  -- A#
            freq <= x"1235";
         
         when "1110" =>  -- B
            freq <= x"134B";
         
         when others =>  -- C
            freq <= x"1470";
    end case;
 end process seg_decoder;


end Behavioral;
