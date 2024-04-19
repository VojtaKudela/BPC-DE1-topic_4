----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2024 13:08:50
-- Design Name: 
-- Module Name: PWM_mod - Behavioral
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

entity PWM_mod is
    Generic (
           NBIT     : integer := 8;
           PERIOD   : integer := 4
           );
    Port ( 
           mod_in   : in  STD_LOGIC_VECTOR (NBIT-1 downto 0);
           rst      : in  STD_LOGIC;
           clk      : in  STD_LOGIC;
           pwm_out  : out STD_LOGIC
           
           );
end PWM_mod;

architecture Behavioral of PWM_mod is
    
    component clock_enable
        Generic (
           PERIOD : integer
           );
        Port    ( 
           clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           pulse : out STD_LOGIC
           );
    end component;

    component simple_counter
        Generic (
           N : integer
           );
        Port ( 
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           en     : in  STD_LOGIC;
           count  : out STD_LOGIC_VECTOR (N-1 downto 0)
           );
	end component;	
	
	component kompareNbit
        Generic (
           N : integer)
           ;
        Port ( 
           a :         in  STD_LOGIC_VECTOR (N-1 downto 0);
           b :         in  STD_LOGIC_VECTOR (N-1 downto 0);
           en:         in  std_logic;
           b_greater : out STD_LOGIC;
           b_a_equal : out STD_LOGIC;
           a_greater : out STD_LOGIC;
           clk       : in std_logic
           );
	end component;
	
	signal sig_en  : std_logic;
	signal sig_saw : std_logic_vector (NBIT-1 downto 0);
	signal sig_kom : std_logic;

begin
    CLK_EN : clock_enable
        generic map (
            PERIOD => PERIOD
            )
        port map (
            clk   => clk,
            rst   => rst,
            pulse => sig_en
            );
            
     CNT  : simple_counter
        generic map (
            N => NBIT
            )
        port map (
            clk   => clk,
            rst   => rst,
            en    => sig_en,
            count => sig_saw
            );
            
      KOM  : kompareNbit
        generic map (
            N => NBIT
            )
        port map (
            clk       => clk,
            en        => sig_kom,
            b         => mod_in,
            a         => sig_saw,
            b_greater => pwm_out,
            a_greater => open,
            b_a_equal => open
            );
		
		sig_kom <= not(rst);

end Behavioral;
