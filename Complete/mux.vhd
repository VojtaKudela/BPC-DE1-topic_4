----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 03:08:32 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is

    generic (
        NBIT : integer := 4 --! Number of bits
    );
    
    Port ( in_0 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_1 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_2 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_3 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (NBIT - 1 downto 0));
end mux;

architecture Behavioral of mux is

begin              
                mux_2bit : process(sel) is
                begin
                case sel is 
                    when "00" =>
                        output <= in_0;
                    when "01" =>
                        output <= in_1;
                    when "10" =>
                        output <= in_2;
                    when others =>
                        output <= in_3;
                 end case;
                 end process mux_2bit;

end Behavioral;
