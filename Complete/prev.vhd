----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 03:04:01 PM
-- Design Name: 
-- Module Name: prev - Behavioral
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

entity prev is
    Port ( clear : in STD_LOGIC;
           lcd : in STD_LOGIC_VECTOR (2 downto 0);
           ncode : out STD_LOGIC_VECTOR (7 downto 0));
end prev;

architecture Behavioral of prev is
begin

    --! This combinational process decodes binary input
    --! `bin` into 7-segment display output `seg` for a
    --! Common Anode configuration. When either `bin` or
    --! `clear` changes, the process is triggered. Each
    --! bit in `seg` represents a segment from A to G.
    --! The display is cleared if `clear` is set to 1.
    p_8seg_decoder : process (lcd,clear) is
begin
         if (clear = '1') then
             ncode <=x"FF";
         else
         
            case lcd is

                when "000" =>  
                    ncode <= x"7F";

                when "001" => 
                    ncode <= x"BF";

                when "010" => 
                    ncode <= x"DF";

                when "011" =>
                    ncode <=x"EF" ;

                when "100" =>
                    ncode <= x"F7";

                when "101" =>
                    ncode <= x"FB";

                when "110" =>
                    ncode <= x"FD";
                    
                when "111" =>
                    ncode <= x"FE";
                    
                when others =>
                    ncode <= x"FF";

            end case;

        end if;

    end process p_8seg_decoder;

end Behavioral;
