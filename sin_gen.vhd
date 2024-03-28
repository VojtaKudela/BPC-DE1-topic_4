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

entity sin_gen is
    Generic (
           NBIT : integer := 8;
           FSMP : integer := 12_000
           );
    Port ( 
           clk  : in  STD_LOGIC;
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           rst  : in  STD_LOGIC;
           smpl : out STD_LOGIC_VECTOR (7 downto 0)
           );
end sin_gen;

architecture Behavioral of sin_gen is

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

constant con_limit : real := real (FSMP * 10);
signal   sig_phase : std_logic_vector 
        ((integer(ceil(log2(real( ( FSMP * 10 ) + ( 2 ** NBIT ) - 1 )))) - 1) downto 0);
signal   sig_value : integer;

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
	
get_sin_value : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_value <= 127;
            else
                --sig_value <= 128;
                --sig_value <= integer( ( real( ( 2 ** (NBIT - 1)) - 1) * ( sin( math_2_pi * real( to_integer( unsigned( sig_phase ))) / real( con_limit ) ) + 1.0)));
                -- sig_value <= integer( ( 2.0 ** real(NBIT - 1)) - 1.0);
                sig_value <= integer( ( ( 2.0 ** real(NBIT - 1) ) - 1.0) * ( real( to_integer( unsigned( sig_phase ))) / con_limit ));
            end if;
        end if;
    end process get_sin_value;

   smpl <= std_logic_vector( to_unsigned( sig_value, smpl'length ));
   
end Behavioral;
