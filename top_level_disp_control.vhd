----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 04:45:12 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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
    Port ( disp : out STD_LOGIC_VECTOR (2 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           input : in STD_LOGIC_VECTOR (2 downto 0));
end top_level;

architecture Behavioral of top_level is
    component bin2seg is
        port(
            clear : in std_logic;
            bin : in std_logic_vector(3 downto 0);
            seg : in std_logic_vector(7 downto 0)
            );
    end component;
    
    component clock_enable is
        port(
            clear : in std_logic;
            bin : in std_logic_vector(3 downto 0);
            seg : in std_logic_vector(7 downto 0)
            );
    end component;
    
    
    

begin


end Behavioral;
