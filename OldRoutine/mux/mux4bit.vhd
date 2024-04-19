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

entity mux4bit is

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
           in_8 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_9 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_10 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_11 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_12 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_13 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_14 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_15 : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (NBIT - 1 downto 0));
end mux4bit;

architecture Behavioral of mux4bit is

begin              
                mux_4bit : process(sel) is
                begin
                case sel is 
                    when "0000" =>
                        output <= in_0;
                    when "0001" =>
                        output <= in_1;
                    when "0010" =>
                        output <= in_2;
                    when "0011" =>
                        output <= in_3;
                    when "0100" =>
                        output <= in_4;
                    when "0101" =>
                        output <= in_5;
                    when "0110" =>
                        output <= in_6;
                    when "0111" =>
                        output <= in_7;
                    when "1000" =>
                        output <= in_8;
                    when "1001" =>
                        output <= in_9;
                    when "1010" =>
                        output <= in_9;
                    when "1011" =>
                        output <= in_9;
                    when "1100" =>
                        output <= in_9;
                    when "1101" =>
                        output <= in_9;
                    when "1110" =>
                        output <= in_9;
                    when others =>
                        output <= in_9;
                 end case;
                 end process mux_4bit;

end Behavioral;
