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

entity mux3bit is

    generic (
        NBIT : integer := 4 --! Number of bits
    );
    
    Port ( in_0 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_1 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_2 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_3 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_4 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_5 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_6 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_7 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (NBIT - 1 downto 0));
end mux3bit;

architecture Behavioral of mux3bit is

begin              
                mux_3bit : process(sel) is
                begin
                case sel is 
                    when "000" =>
                        output <= in_0;
                    when "001" =>
                        output <= in_1;
                    when "010" =>
                        output <= in_2;
                    when "011" =>
                        output <= in_3;
                    when "100" =>
                        output <= in_4;
                    when "101" =>
                        output <= in_5;
                    when "110" =>
                        output <= in_6;
                    when others =>
                        output <= in_7;
                 end case;
                 end process mux_3bit;

end Behavioral;
