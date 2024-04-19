----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 11.04.2024 23:28:03
-- Design Name: 
-- Module Name: display_and_gen - Behavioral
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

entity display_and_gen is
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
end display_and_gen;

architecture Behavioral of display_and_gen is

    component sound_generator
        Port ( 
           vol      : in  STD_LOGIC_VECTOR (3 downto 0);
           dem_01   : in  STD_LOGIC_VECTOR (7 downto 0);
           dem_02   : in  STD_LOGIC_VECTOR (7 downto 0);
           dem_03   : in  STD_LOGIC_VECTOR (7 downto 0);
           mode     : in  STD_LOGIC_VECTOR (2 downto 0);
           freq     : in  STD_LOGIC_VECTOR (3 downto 0);
           rst_komp : in  STD_LOGIC;
           rst      : in  STD_LOGIC;
           clk      : in  STD_LOGIC;
           pwm_out  : out STD_LOGIC
           );
    end component;
    
    component test411 -- servisce of display test1
        Port ( 
            clk : in STD_LOGIC;
            button_00 : in STD_LOGIC; -- mode up
            button_01 : in STD_LOGIC; -- mode down
            button_02 : in STD_LOGIC; -- volume up
            button_03 : in STD_LOGIC; -- volume down
            rst_play  : out STD_LOGIC;
            rst_komp  : out STD_LOGIC;
            disp      : out STD_LOGIC_VECTOR (6 downto 0);
            mode      : out STD_LOGIC_VECTOR (2 downto 0);
            anode     : out STD_LOGIC_VECTOR (7 downto 0);
            vol       : out STD_LOGIC_VECTOR (3 downto 0)
            );
    end component;
    
    component emer_freq_inrer
        Port ( 
           button : in  STD_LOGIC_VECTOR (15 downto 0);
           freq   : out STD_LOGIC_VECTOR (3 downto 0);
           any    : out STD_LOGIC
           );
    end component;
    
    signal sig_vol       : STD_LOGIC_VECTOR (3 downto 0);
    signal sig_mode      : STD_LOGIC_VECTOR (2 downto 0);
    signal sig_rst_komp  : STD_LOGIC;
    signal sig_freq      : STD_LOGIC_VECTOR (3 downto 0);
    signal sig_any       : STD_LOGIC;
    signal sig_rst_kompc : STD_LOGIC;
    
begin
    
    SOUND_GEN: sound_generator
        port map (
            vol       => sig_vol,
            dem_01    => dem_01,
            dem_02    => dem_02,
            dem_03    => dem_03,
            mode      => sig_mode,
            freq      => sig_freq,
            rst_komp  => sig_rst_komp,
            rst       => rst,
            clk       => clk,
            pwm_out   => pwm_out
            );
      
      DISP_CON : test411 --test1
        port map (
            vol       => sig_vol,
            button_00 => mode_up,
            button_01 => mode_down,
            button_02 => vol_up,
            button_03 => vol_down,
            mode      => sig_mode,
            rst_play  => rst_play,
            rst_komp  => sig_rst_kompc,
            disp      => disp,
            anode     => anodes,
            clk       => clk
            );
       
       ENER : emer_freq_inrer
         port map (
            button    => buttons,
            freq      => sig_freq,
            any       => sig_any
                );
            
     sig_rst_komp <= (not(sig_any) and not(sig_mode(2)) and 
                     ((not(sig_mode(1))) or (not(sig_mode(0))))) or sig_rst_kompc;

end Behavioral;
