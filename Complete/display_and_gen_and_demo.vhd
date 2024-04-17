----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 12:00:37
-- Design Name: 
-- Module Name: display_and_gen_and_demo - Behavioral
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

entity display_and_gen_and_demo is

    Port ( 
           clk       : in  STD_LOGIC;
           rst       : in  STD_LOGIC;
           disp      : out STD_LOGIC_VECTOR (6 downto 0);
           anodes    : out STD_LOGIC_VECTOR (7 downto 0);
           mode_up   : in  STD_LOGIC;
           mode_down : in  STD_LOGIC;
--         It is prepared for matrix display.
--           led_out   : out STD_LOGIC_VECTOR (3 downto 0); 
           vol_up    : in  STD_LOGIC;
           vol_down  : in  STD_LOGIC;
           buttons   : in  STD_LOGIC_VECTOR (15 downto 0); -- (3 downto 0)
           pwm_out   : out STD_LOGIC
           );
           
end display_and_gen_and_demo;

architecture Behavioral of display_and_gen_and_demo is

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
           freq      : in  STD_LOGIC_VECTOR (3 downto 0);
           any       : in  STD_LOGIC;
           dem_01    : in  STD_LOGIC_VECTOR (7 downto 0);
           dem_02    : in  STD_LOGIC_VECTOR (7 downto 0);
           dem_03    : in  STD_LOGIC_VECTOR (7 downto 0);
           mode_dem  : out STD_LOGIC_VECTOR (1 downto 0);
           pwm_out   : out STD_LOGIC
           );
    end component;
    
    component demo_main
        Port ( 
           rst_play : in  STD_LOGIC;
           rst      : in  STD_LOGIC;
           clk      : in  STD_LOGIC;
           demo_out : out STD_LOGIC_VECTOR (7 downto 0);
           mode     : in  STD_LOGIC_VECTOR (1 downto 0)
           );
    end component;
    
    component emer_freq_inrer
        Port ( 
           button : in  STD_LOGIC_VECTOR (15 downto 0);
           freq   : out STD_LOGIC_VECTOR (3 downto 0);
           any    : out STD_LOGIC
           );
    end component;
    
--    component coder_1_from_16
--        Port ( 
--           bcd   : in  STD_LOGIC_VECTOR (3 downto 0);
--           any   : in  STD_LOGIC;
--           ncode : out STD_LOGIC_VECTOR (15 downto 0)
--           );
--    end component;
    
    signal sig_freq     : STD_LOGIC_VECTOR (3 downto 0);
    signal sig_any      : STD_LOGIC;
    signal sig_rst_play : STD_LOGIC;
    signal sig_demo_out : STD_LOGIC_VECTOR (7 downto 0);
    signal sig_mode_dem : STD_LOGIC_VECTOR (1 downto 0);
    
begin
    
    ENER  : emer_freq_inrer
         port map (
            button    => buttons,
            freq      => sig_freq,
            any       => sig_any
                );
                
--    CODER_LED : coder_1_from_16
--        port map (
--            bcd      => buttons,
--            any      => any,
--            ncode    => led_out
--                );
                
    D_A_G : display_and_gen
        port map (
            clk       => clk,
            rst       => rst,
            mode_up   => mode_up,
            mode_down => mode_down,
            vol_up    => vol_up,
            vol_down  => vol_down,
            disp      => disp,
            anodes    => anodes,
            rst_play  => sig_rst_play,
            freq      => sig_freq,
            any       => sig_any,
            pwm_out   => pwm_out,
            dem_01    => sig_demo_out,
            dem_02    => sig_demo_out,
            dem_03    => sig_demo_out,
            mode_dem  => sig_mode_dem
                );
                
     DEMO_M : demo_main
        port map (
            clk       => clk,
            rst       => rst,
            rst_play  => sig_rst_play,
            demo_out  => sig_demo_out,
            mode      => sig_mode_dem
                );

end Behavioral;
