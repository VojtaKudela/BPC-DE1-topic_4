----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 03:36:22 PM
-- Design Name: 
-- Module Name: boot_to_freq - Behavioral
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

entity boot_to_freq is
    Port ( inpu : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end boot_to_freq;

architecture Behavioral of boot_to_freq is
begin
seg_decoder:process (inpu)is
begin
    
    case inpu is
        when "0000"=>
            output <= x"0898"; -- A
         
         when "0001" =>
            output <= x"09A5"; -- B
         
         when "0010"=>
            output <= x"0A38"; -- C_1
         
         when "0011"=>
            output <= x"0B78"; -- D_1
         
         when "0100"=>
            output <= x"0E74"; -- F#_1
         
         when "0101"=>
            output <= x"091B"; -- A#
         
         when "0110"=>
            output <= x"0AD4"; -- C#_1
         
         when "0111"=>
            output <= x"0C27"; -- D#_1
         
         when "1000"=>
            output <= x"1235"; -- A#_1
         
         when "1001"=>
            output <= x"1039"; -- G#_1
         
         when "1010"=>
            output <= x"0DA4"; -- F_1
         
         when "1011"=>
            output <= x"0CE0"; -- E_1
         
         when "1100"=>
            output <= x"1470"; -- C_2
         
         when "1101"=>
            output <= x"134B"; -- B_1
         
         when "1110"=>
            output <= x"0F50"; -- G_1
         
         when others=>
            output <= x"1130"; -- A_1
    
        end case;
    end process seg_decoder;
end Behavioral;
