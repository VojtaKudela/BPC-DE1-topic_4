----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 04:31:40 PM
-- Design Name: 
-- Module Name: volume_control - Behavioral
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

-- File does not have testbench. It was tested by implementation.
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

entity volume_control is
    Port ( but_00 : in STD_LOGIC;
           but_01 : in STD_LOGIC;
           rst    : in STD_LOGIC;
           clk    : in STD_LOGIC;
           vol    : out STD_LOGIC_VECTOR (3 downto 0));
end volume_control;

architecture Behavioral of volume_control is

component updown_counter_limited
    Generic (
           N      : integer
            );
    Port (
           up     : in  STD_LOGIC;
           down   : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           score  : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component debounce
    Generic(
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
   
COUNT : updown_counter_limited
generic map (
   N   => 4
            )
port map (
   clk      => clk,
   rst      => rst,
   up       => sig_but_00,
   down     => sig_but_01,
   score    => vol
   );
end Behavioral;
