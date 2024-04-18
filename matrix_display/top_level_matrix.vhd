----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 20:39:35
-- Design Name: Vojtìch Kudela
-- Module Name: top_level_matrix - Behavioral
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

entity top_level_matrix is
    Port ( CLK_100MHZ : in STD_LOGIC;
           LED16_B : out STD_LOGIC;
           BTNC    : in STD_LOGIC;
           s0      : in STD_LOGIC;
           s1      : in STD_LOGIC;
           s2      : in STD_LOGIC;
           s3      : in STD_LOGIC;
           r0      : out STD_LOGIC;
           r1      : out STD_LOGIC;
           r2      : out STD_LOGIC;
           r3      : out STD_LOGIC;
           LED0    : out STD_LOGIC;
           LED1    : out STD_LOGIC;
           LED2    : out STD_LOGIC;
           LED3    : out STD_LOGIC);
end top_level_matrix;

architecture Behavioral of top_level_matrix is

component matrix_control is
    Generic(
            PERIOD : integer
            );
    Port ( clk     : in STD_LOGIC;
           rst     : in STD_LOGIC;
           any     : out STD_LOGIC;
           s       : in STD_LOGIC_VECTOR (3 downto 0);
           r       : out STD_LOGIC_VECTOR (3 downto 0);
           but     : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--    component clock_enable
--        generic (
--            PERIOD : integer
--            );
--        port(
--            clk    : in STD_LOGIC;
--            rst    : in STD_LOGIC;
--            pulse  : out STD_LOGIC
--            );
--    end component;

--    signal sig_en_1ms : std_logic;

begin

--    Clock : component clock_enable
--        generic map(
--            PERIOD => 100
--            )
--        port map(
--            clk => CLK_100MHZ,
--            rst => BTNC,
--            pulse => sig_en_1ms
--            );

    mat_disp : component matrix_control
        generic map(
            PERIOD => 100
            )
        port map(
            any => LED16_B,
            clk => CLK_100MHZ, -- sig_en_1ms
            rst => BTNC,
            but(0) => LED0,
            but(1) => LED1,
            but(2) => LED2,
            but(3) => LED3,
            s(0) => s0, -- JA[1]
            s(1) => s1, -- JA[2]
            s(2) => s2, -- JA[3]
            s(3) => s3, -- JA[4]
            r(0) => r0, -- JA[7]
            r(1) => r1, -- JA[8]
            r(2) => r2, -- JA[9]
            r(3) => r3 -- JA[10]
            );


end Behavioral;
