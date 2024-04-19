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

entity top_level is
    Port ( 
           CLK100MHZ : in STD_LOGIC;
           BTNC      : in STD_LOGIC;
           BTNR      : in STD_LOGIC;
           BTNL      : in STD_LOGIC;
           BTNU      : in STD_LOGIC;
           BTND      : in STD_LOGIC;
           AN        : out STD_LOGIC_VECTOR (7 downto 0);
           DP        : out STD_LOGIC;
           AUD_PWM   : out STD_LOGIC;
--           SW        : in  STD_LOGIC_VECTOR (15 downto 0);
           CA        : out STD_LOGIC;
           CB        : out STD_LOGIC;
           CC        : out STD_LOGIC;
           CD        : out STD_LOGIC;
           CE        : out STD_LOGIC;
           CF        : out STD_LOGIC;
           CG        : out STD_LOGIC;
           LED       : out STD_LOGIC_VECTOR (15 downto 0);
           JB        : out STD_LOGIC;
           s0        : in STD_LOGIC;
           s1        : in STD_LOGIC;
           s2        : in STD_LOGIC;
           s3        : in STD_LOGIC;
           r0        : out STD_LOGIC;
           r1        : out STD_LOGIC;
           r2        : out STD_LOGIC;
           r3        : out STD_LOGIC
           );
end top_level;

architecture Behavioral of top_level is
    
    signal sig_pwm   : STD_LOGIC;
    
    component display_and_gen_and_demo
        Port ( 
           clk       : in  STD_LOGIC;
           rst       : in  STD_LOGIC;
           disp      : out STD_LOGIC_VECTOR (6 downto 0);
           anodes    : out STD_LOGIC_VECTOR (7 downto 0);
           mode_up   : in  STD_LOGIC;
           mode_down : in  STD_LOGIC;
           r         : out STD_LOGIC_VECTOR (3 downto 0);
           s         : in  STD_LOGIC_VECTOR (3 downto 0);
           led_out   : out STD_LOGIC_VECTOR (15 downto 0); 
           vol_up    : in  STD_LOGIC;
           vol_down  : in  STD_LOGIC;
           pwm_out   : out STD_LOGIC
           );
    end component;
    
begin
    
    DAG: display_and_gen_and_demo
        port map (
            clk         => CLK100MHZ,
            mode_up     => BTNR,
            mode_down   => BTNL,
            vol_down    => BTND,
            vol_up      => BTNU,
            rst         => BTNC,
            disp(6)     => CA,
            disp(5)     => CB,
            disp(4)     => CC,
            disp(3)     => CD,
            disp(2)     => CE,
            disp(1)     => CF,
            disp(0)     => CG,
            led_out     => LED, -- Comment row 100
            anodes      => AN,
            s(0)        => s0, -- JA[1]
            s(1)        => s1, -- JA[2]
            s(2)        => s2, -- JA[3]
            s(3)        => s3, -- JA[4]
            r(0)        => r0, -- JA[7]
            r(1)        => r1, -- JA[8]
            r(2)        => r2, -- JA[9]
            r(3)        => r3, -- JA[10]
            pwm_out     => sig_pwm
            );
            
--            LED     <= SW;
            DP      <= '1';
            AUD_PWM <= sig_pwm;
            JB      <= sig_pwm;
            

end Behavioral;