----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 08.04.2024 19:18:15
-- Design Name: 
-- Module Name: mode_control - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mode_control is
    Port ( 
           but_00 : in  STD_LOGIC;
           but_01 : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           change : out STD_LOGIC;
           mode   : out STD_LOGIC_VECTOR (2 downto 0));
end mode_control;

architecture Behavioral of mode_control is

component updown_counter
    Generic (
           N      : integer;
           short  : integer
            );
    Port (
           up     : in  STD_LOGIC;
           down   : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           score  : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component debounce
    Generic (
           PERIOD   : integer
           );
    Port ( 
           clk      : in  STD_LOGIC;
           rst      : in  STD_LOGIC;
           bouncey  : in  STD_LOGIC;
           clean    : out STD_LOGIC;
           pos_edge : out STD_LOGIC;
           neg_edge : out STD_LOGIC
           );
end component;

signal sig_but_00 : std_logic;
signal sig_but_01 : std_logic;

begin
DEB00 : debounce
generic map (
   PERIOD   => 200_000
            )
port map (
   clk      => clk,
   rst      => rst,
   bouncey  => but_00,
   clean    => open,
   pos_edge => open,
   neg_edge => sig_but_00  
   );

DEB01 : debounce
generic map (
   PERIOD   => 200_000
            )
port map (
   clk      => clk,
   rst      => rst,
   bouncey  => but_01,
   clean    => open,
   pos_edge => open,
   neg_edge => sig_but_01  
   );
   
COUNT : updown_counter
generic map (
   N     => 3,
   short => 2 -- it was 1
            )
port map (
   clk      => clk,
   rst      => rst,
   up       => sig_but_00,
   down     => sig_but_01,
   score    => mode
   );
   
change <= (sig_but_00 or sig_but_01);

end Behavioral;
