----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 06:14:39 PM
-- Design Name: 
-- Module Name: top_generator - Behavioral
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

entity top_generator is
    Port ( SW_F      : in STD_LOGIC_VECTOR (3 downto 0);
           SW_M      : in STD_LOGIC_VECTOR (2 downto 0);
           JB        : out STD_LOGIC;
           LED_F     : out STD_LOGIC_VECTOR (3 downto 0);
           LED_M     : out STD_LOGIC_VECTOR (2 downto 0);
           BTNC      : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC);
end top_generator;

architecture Behavioral of top_generator is
    
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
    
begin
    SOUND_GEN: sound_generator
        port map (
            vol    => x"F",
            dem_01 => x"7F",
            dem_02 => x"7F",
            dem_03 => x"7F",
            mode   => SW_M,
            freq  => SW_F,
            rst_komp  => BTNC,
            rst       => BTNC,
            clk       => CLK100MHZ,
            pwm_out   => JB
            );
            
      LED_M <= SW_M;
      LED_F <= SW_F;

end Behavioral;
