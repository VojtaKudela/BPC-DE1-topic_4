----------------------------------------------------------------------------------
-- Company: BUT FEEC
-- Engineer: Antonin Putala
-- 
-- Create Date: 04/04/2024 03:12:04 PM
-- Design Name: 
-- Module Name: updown_counter - Behavioral
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

entity updown_counter is
    Generic (
           N      : integer := 4; -- number of bits
           short  : integer := 0  -- short cycle of counting
            );
    Port (
           up     : in  STD_LOGIC;
           down   : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           score  : out STD_LOGIC_VECTOR (N-1 downto 0));
end updown_counter;

architecture Behavioral of updown_counter is

    signal sig_count : integer range 0 to (2 ** N);
    
begin

-- counter up and down (up has priority)
    count : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_count <= 0;
            else
                if (up = '1') then
                    if (sig_count < ((2 ** N) - 1 - short)) then -- solution to shorter cycle
                        sig_count <= (sig_count + 1);
                    else
                        sig_count <= 0;
                    end if;
                else
                    if (down = '1') then
                        if (sig_count > 0) then
                            sig_count <= (sig_count - 1);
                        else
                            sig_count <= ((2 ** N) - 1 - short);
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process count;

    score <= std_logic_vector(to_unsigned(sig_count, N));

end Behavioral;
