----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 03:34:34 PM
-- Design Name: 
-- Module Name: sound_generator - Behavioral
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

entity sound_generator is
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
end sound_generator;

architecture Behavioral of sound_generator is

    component clock_enable
        generic (
           PERIOD : integer
            );
        port (
           clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           pulse : out STD_LOGIC
            );
    end component;
    
    component rec_gen
        Generic (
           NBIT : integer;
           FSMP : integer
           );
        Port ( 
           clk  : in  STD_LOGIC;
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           vol  : in  STD_LOGIC_VECTOR (3 downto 0);
           rst  : in  STD_LOGIC;
           smpl : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
    end component;
    
--    component sin_gen
--        Generic (
--           NBIT : integer;
--           FSMP : integer
--           );
--        Port ( 
--           clk  : in  STD_LOGIC;
--           freq : in  STD_LOGIC_VECTOR (15 downto 0);
--           vol  : in  STD_LOGIC_VECTOR (3  downto 0);
--           rst  : in  STD_LOGIC;
--           smpl : out STD_LOGIC_VECTOR (7  downto 0)
--           );
--    end component;
    
    component saw_gen
        Generic (
           NBIT : integer;
           FSMP : integer
           );
    Port ( 
           clk  : in  STD_LOGIC;
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           vol  : in  STD_LOGIC_VECTOR (3 downto 0);
           rst  : in  STD_LOGIC;
           smpl : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
    end component;
    
    component tri_gen
        Generic (
           NBIT : integer;
           FSMP : integer
           );
        Port ( 
           clk  : in  STD_LOGIC;
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           vol  : in  STD_LOGIC_VECTOR (3 downto 0);
           rst  : in  STD_LOGIC;
           smpl : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
    end component;
    
    component mux3bit
        generic (
            NBIT : integer --! Number of bits
         );
    
        Port (  
            in_0   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_1   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_2   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_3   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_4   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_5   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_6   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            in_7   : in  STD_LOGIC_VECTOR (NBIT - 1 downto 0);
            sel    : in  STD_LOGIC_VECTOR (2 downto 0);
            output : out STD_LOGIC_VECTOR (NBIT - 1 downto 0));
    end component;
    
    component PWM_mod
        Generic (
           NBIT     : integer;
           PERIOD   : integer
           );
        Port ( 
           mod_in   : in  STD_LOGIC_VECTOR (NBIT-1 downto 0);
           rst      : in  STD_LOGIC;
           clk      : in  STD_LOGIC;
           pwm_out  : out STD_LOGIC
           );
    end component;
    
    component boot_to_freq
         port ( 
             inpu   : in  STD_LOGIC_VECTOR (3 downto 0);
             output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    constant con_NBIT      : integer := 8;
    constant con_FSMP      : integer := 12_000;
    constant con_PERIOD    : integer := 4160; -- set suitable value
    constant con_PER_SAW   : integer := 4;    -- set suitable value
    signal   sig_gen_clock : std_logic;
--    signal   sig_sin       : std_logic_vector(7 downto 0);
    signal   sig_rec       : std_logic_vector(7 downto 0);
    signal   sig_tri       : std_logic_vector(7 downto 0);
    signal   sig_saw       : std_logic_vector(7 downto 0);
    signal   sig_mux_data  : std_logic_vector(7 downto 0);
    signal   sig_rst_pwm   : std_logic;
    signal   sig_freq      : std_logic_vector(15 downto 0);
    
begin
    
    CL_EN : clock_enable
        generic map (
            PERIOD => con_PERIOD
            )
        port map (
            clk   => clk,
            rst   => rst,
            pulse  => sig_gen_clock
            );
    
--    G_00 : sin_gen
--        generic map (
--            NBIT => con_NBIT,
--            FSMP => con_FSMP
--            )
--        port map (
--            clk   => sig_gen_clock,
--            vol   => vol,
--            rst   => rst,
--            freq  => sig_freq,
--            smpl  => sig_sin
--            );
            
     G_01 : rec_gen
        generic map (
            NBIT => con_NBIT,
            FSMP => con_FSMP
            )
        port map (
            clk   => sig_gen_clock,
            vol   => vol,
            rst   => rst,
            freq  => sig_freq,
            smpl  => sig_rec
            );
            
      G_02 : tri_gen
        generic map (
            NBIT => con_NBIT,
            FSMP => con_FSMP
            )
        port map (
            clk   => sig_gen_clock,
            vol   => vol,
            rst   => rst,
            freq  => sig_freq,
            smpl  => sig_tri
            );
            
      G_03 : saw_gen
        generic map (
            NBIT => con_NBIT,
            FSMP => con_FSMP
            )
        port map (
            clk   => sig_gen_clock,
            vol   => vol,
            rst   => rst,
            freq  => sig_freq,
            smpl  => sig_saw
            );
            
       MUX : mux3bit
        generic map (
            NBIT => con_NBIT
            )
        port map (
            in_0   => sig_rec, -- sig_sin
            in_1   => sig_tri, --sig_rec
            in_2   => sig_saw, --sig_tri
            in_3   => dem_01,  --sig_saw
            in_4   => dem_02,  --dem_01
            in_5   => dem_03,  --dem_02
            in_6   => x"7f",   --dem_03
            in_7   => x"7f",
            sel    => mode,
            output => sig_mux_data
            );
            
      PWM : PWM_mod
        generic map (
            NBIT   => con_NBIT,
            PERIOD => con_PER_SAW 
            )
        port map (
           mod_in  => sig_mux_data,
           rst     => sig_rst_pwm,
           clk     => clk,
           pwm_out => pwm_out
           );
           
      B2F : boot_to_freq
        port map (
           inpu       => freq,
           output     => sig_freq
           );
           
      sig_rst_pwm <= rst or rst_komp;
            
            
end Behavioral;