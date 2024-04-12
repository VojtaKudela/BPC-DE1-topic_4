----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2024 08:27:25
-- Design Name: 
-- Module Name: top_d_g - Behavioral
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

entity top_d_g is
    Port ( 
           CLK100MHZ : in STD_LOGIC;
           BTNC      : in STD_LOGIC;
           BTNR      : in STD_LOGIC;
           BTNL      : in STD_LOGIC;
           BTNU      : in STD_LOGIC;
           BTND      : in STD_LOGIC;
           AN        : out STD_LOGIC_VECTOR (7 downto 0);
           DP        : out STD_LOGIC;
           LED16_B   : out STD_LOGIC;
           PWM       : out STD_LOGIC;
           SW        : in  STD_LOGIC_VECTOR (15 downto 0);
           CA        : out STD_LOGIC;
           CB        : out STD_LOGIC;
           CC        : out STD_LOGIC;
           CD        : out STD_LOGIC;
           CE        : out STD_LOGIC;
           CF        : out STD_LOGIC;
           CG        : out STD_LOGIC;
           LED       : out STD_LOGIC_VECTOR (15 downto 0))
           ;
end top_d_g;

architecture Behavioral of top_d_g is

    component display_and_gen
        Port ( 
           clk       : in  STD_LOGIC;
           mode_up   : in  STD_LOGIC;
           mode_down : in  STD_LOGIC;
           vol_up    : in  STD_LOGIC;
           vol_down  : in  STD_LOGIC;
           rst_play  : out STD_LOGIC;
           disp      : out STD_LOGIC_VECTOR (6 downto 0);
           anodes    : out STD_LOGIC_VECTOR (7 downto 0);
           rst       : in  STD_LOGIC;
           buttons   : in  STD_LOGIC_VECTOR (15 downto 0);
           dem_01    : in  STD_LOGIC_VECTOR (7 downto 0);
           dem_02    : in  STD_LOGIC_VECTOR (7 downto 0);
           dem_03    : in  STD_LOGIC_VECTOR (7 downto 0);
           pwm_out   : out STD_LOGIC
           );
    end component;
    
begin
    
    DAG: display_and_gen
        port map (
            clk         => CLK100MHZ,
            mode_up     => BTNR,
            mode_down   => BTNL,
            vol_down    => BTND,
            vol_up      => BTNU,
            rst         => BTNC,
            rst_play    => LED16_B,
            disp(6)     => CA,
            disp(5)     => CB,
            disp(4)     => CC,
            disp(3)     => CD,
            disp(2)     => CE,
            disp(1)     => CF,
            disp(0)     => CG,
            anodes      => AN,
            buttons     => SW,
            dem_01      => x"7F",  --nothing
            dem_02      => x"7F",
            dem_03      => x"7F",
            pwm_out     => PWM
            );
            
            LED <= SW;
            DP  <= '0';

end Behavioral;
