----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: David Matejcek
-- 
-- Create Date: 27.03.2024 22:51:28
-- Design Name:
-- Module Name: kompareNbit - Behavioral
-- Project Name: PWM Tone Generator
-- Target Devices: nexys-a7-50t
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

entity kompareNbit is
     generic (N:integer:=4);
    Port ( 
           a :         in  STD_LOGIC_VECTOR (N-1 downto 0);
           b :         in  STD_LOGIC_VECTOR (N-1 downto 0);
           en:         in  std_logic;
           b_greater : out STD_LOGIC;
           b_a_equal : out STD_LOGIC;
           a_greater : out STD_LOGIC;
           clk       : in std_logic
           );
           
end kompareNbit;

architecture Behavioral of kompareNbit is
 
begin

kompareNbit : process (clk) is
begin
                   
    if (rising_edge(clk))then
           
           if (en = '0') then
                b_greater <= '0';
                b_a_equal <= '0';
                a_greater <= '0';
           elsif (b > a) then  
                b_greater <= '1';
                b_a_equal <= '0';
                a_greater <= '0';
                     
           elsif (b = a) then
                b_greater <= '0';
                b_a_equal <= '1';
                a_greater <= '0';
                     
           else
                b_greater <= '0';
                b_a_equal <= '0';
                a_greater <= '1';
           end if;
    end if;

end process kompareNbit;

end Behavioral;
