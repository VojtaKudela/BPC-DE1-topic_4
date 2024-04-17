----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 21:28:35
-- Design Name: 
-- Module Name: coder_1_from_16 - Behavioral
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

entity coder_1_from_16 is
    Port ( 
           bcd   : in  STD_LOGIC_VECTOR (3 downto 0);
           any   : in  STD_LOGIC;
           ncode : out STD_LOGIC_VECTOR (15 downto 0)
           );
end coder_1_from_16;

architecture Behavioral of coder_1_from_16 is

begin
    
    code : process(bcd)
    begin
        if (any = '1') then
            case (bcd) is
        
                when x"2" => 
                    ncode <= "1000000000000000";
                
                when x"7" => 
                    ncode <= "0100000000000000";
               
                when x"6" =>
                    ncode <= "0010000000000000";
                
                when x"E" =>
                    ncode <= "0001000000000000";
                
                when x"F" =>
                    ncode <= "0000100000000000";
                
                when x"A" =>
                    ncode <= "0000010000000000";
                
                when x"B" =>
                    ncode <= "0000001000000000";
                
                when x"9" =>
                    ncode <= "0000000100000000";
                
                when x"D" =>
                    ncode <= "0000000010000000";
                
                when x"3" =>
                    ncode <= "0000000001000000";
                                              
                when x"C" =>                               
                    ncode <= "0000000000100000";
                
                when x"5" =>
                    ncode <= "0000000000010000";
                
                when x"8" =>
                    ncode <= "0000000000001000";
                
                when x"1" =>
                    ncode <= "0000000000000100";
                
                when x"4" =>
                    ncode <= "0000000000000010";
                
                when others =>
                    ncode <= "0000000000000001";
                                
                end case;
            
        else
            ncode <= "0000000000000000";
        
        end if;    
        
    end process code;

end Behavioral;
