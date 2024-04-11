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
         output <= x"1470";
         
         when "0001" =>
         output <= x"1235";
         
         when "0010"=>
         output <= x"0898";
         
         when "0011"=>
         output <= x"0E74";
         
         when "0100"=>
         output <= x"134B";
         
         when "0101"=>
         output <= x"0DD0";
         
         when "0110"=>
         output <= x"09A5";
         
         when "0111"=>
         output <= x"091B";
         
         when "1000"=>
         output <= x"1130";
         
         when "1001"=>
         output <= x"0CE0";
         
         when "1010"=>
         output <= x"0B78";
         
         when "1011"=>
         output <= x"0C27";
         
         when "1100"=>
         output <= x"0F50";
         
         when "1101"=>
         output <= x"0DA4";
         
         when "1110"=>
         output <= x"0A38";
         
         when others=>
         output <= x"0AD4";
    
    end case;
    end process seg_decoder;
end Behavioral;
