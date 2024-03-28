----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 27.03.2024 22:51:28
-- Design Name:
-- Module Name: counter_nnum - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_nnum is
    Generic (
           FSMP  : integer := 12_000;
           NBIT  : integer := 8
           );
    Port ( 
           rst   : in  STD_LOGIC;
           clk   : in  STD_LOGIC;
           freq  : in  STD_LOGIC_VECTOR (15 downto 0);
           phase : out STD_LOGIC_VECTOR ((integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1) downto 0)
           ); -- (integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1)
end counter_nnum;

architecture Behavioral of counter_nnum is

constant con_bit_need  : integer := integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 ))));
constant con_limit     : integer := ( FSMP * 10 ) - 1;
signal   sig_count     : integer range 0 to (con_limit + 2 ** NBIT);
signal   sig_temp      : integer range 0 to (con_limit + 2 ** NBIT);

-- 2 ** NBIT for certain, sig_count should not go over 10 * FSMP

begin

get_num : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_count <= 0;
            else
                sig_temp <= sig_count + to_integer(unsigned ( freq ));
                if (sig_temp < con_limit) then
                    sig_count <= sig_temp;
                else
                    sig_count <= sig_temp - con_limit - 1;
                end if;
            end if;
        end if;
    end process get_num;
    
    phase <= std_logic_vector(to_unsigned(sig_count, con_bit_need));

end Behavioral;
