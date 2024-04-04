----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 04:53:21 PM
-- Design Name: 
-- Module Name: top_volume - Behavioral
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

entity top_volume is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end top_volume;

architecture Behavioral of top_volume is

 component volume_control
    Port ( but_00 : in STD_LOGIC;
           but_01 : in STD_LOGIC;
           rst    : in STD_LOGIC;
           clk    : in STD_LOGIC;
           vol    : out STD_LOGIC_VECTOR (3 downto 0));
end component;
  
begin
TOP : volume_control
port map (
   clk      => CLK100MHZ,
   rst      => BTNC,
   but_00   => BTNR,
   but_01   => BTNL,
   vol      => LED
   );


end Behavioral;
