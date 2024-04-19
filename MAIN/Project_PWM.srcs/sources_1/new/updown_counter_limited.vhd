----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 04/04/2024 04:16:38 PM
-- Design Name: 
-- Module Name: updown_counter_limited - Behavioral
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

entity updown_counter_limited is
    Generic (
           N      : integer := 4 -- number of bits
            );
    Port (
           up     : in  STD_LOGIC;
           down   : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           score  : out STD_LOGIC_VECTOR (N-1 downto 0));
end updown_counter_limited;

architecture Behavioral of updown_counter_limited is

    signal sig_count : integer range 0 to (2 ** N);
    
begin
-- counter up and down (up has priority)
    count : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_count <= 8;
            else
                if (up = '1') then
                    if (sig_count < ((2 ** N)- 1)) then -- protect overflow
                        sig_count <= sig_count + 1;
                    end if;
                else
                    if (down = '1') then
                        if (sig_count > 0) then         -- protect underflow
                            sig_count <= sig_count - 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process count;

    score <= std_logic_vector(to_unsigned(sig_count, N));

end Behavioral;
