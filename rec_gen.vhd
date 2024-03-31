----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 27.03.2024 22:51:28
-- Design Name:
-- Module Name: rec_gen - Behavioral
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

entity rec_gen is
    Generic (
           NBIT : integer := 8;
           FSMP : integer := 12_000
           );
    Port ( 
           clk  : in  STD_LOGIC;
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           vol  : in  STD_LOGIC_VECTOR (3 downto 0);
           rst  : in  STD_LOGIC;
           smpl : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
end rec_gen;

architecture Behavioral of rec_gen is

    component counter_nnum
        generic (
        FSMP  : integer;
        NBIT  : integer
        );
    port (
        rst   : in  STD_LOGIC;
        clk   : in  STD_LOGIC;
        freq  : in  STD_LOGIC_VECTOR (15 downto 0);
        phase : out STD_LOGIC_VECTOR ((integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1) downto 0)
        );
        
end component;

signal   sig_phase : std_logic_vector 
        ((integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1) downto 0);
signal   sig_value : integer;
constant con_ceil  : integer := ((10 * FSMP / 2)- 1);
constant con_centr : integer := (((2 ** NBIT)/2) - 1);
constant con_step  : integer := (2 ** ((NBIT / 2) - 1));

begin

CNT : counter_nnum
    generic map (
        FSMP => FSMP,
        NBIT => NBIT
        )
    port map (
        rst   => rst,
        clk   => clk,
        freq  => freq,
        phase => sig_phase
        );
	
get_rec_value : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_value <= con_centr;
            else
                if (to_integer(unsigned(sig_phase)) < con_ceil) then
                    sig_value <= (con_centr + (con_step * to_integer(unsigned(vol))));
                else
                    sig_value <= (con_centr - (con_step * to_integer(unsigned(vol))));
                end if;
            end if;
        end if;
    end process get_rec_value;

   smpl <= std_logic_vector( to_unsigned( sig_value, NBIT ));
   
end Behavioral;
