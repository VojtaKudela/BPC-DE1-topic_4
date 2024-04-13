----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 03:12:06 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
    Generic(
           PERIOD   : integer := 200_000
           );
    Port ( 
           clk      : in  STD_LOGIC;
           rst      : in  STD_LOGIC;
           bouncey  : in  STD_LOGIC;
           clean    : out STD_LOGIC;
           pos_edge : out STD_LOGIC;
           neg_edge : out STD_LOGIC
           );
end debounce;

architecture Behavioral of debounce is
    
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
    
    type state_type is (RELEASED, PRE_PRESSED, PRESSED, PRE_RELEASED);
    signal   sig_en_2ns  : std_logic;
    signal   state       : state_type;
    constant DEB_COUNT   : integer := 4;
    signal   sig_count   : integer range 0 to DEB_COUNT;
    signal   sig_clean   : std_logic;
    signal   sig_delayed : std_logic;
        
begin
    
    CL_EN  : clock_enable
        generic map (
            PERIOD => PERIOD
                    )
        port map (
            clk   => clk,
            rst   => rst,
            pulse => sig_en_2ns
                 );
    -- Process implementing a finite state machine (FSM) for
    -- button debouncing. Handles transitions between different
    -- states based on clock signal and bouncey button input.
    p_fsm : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then   -- Active-high reset
                state <= RELEASED;
            elsif (sig_en_2ns = '1') then -- Clock enable

                case state is     -- Define transitions between states

                    when RELEASED =>
                        -- If bouncey = 1 then clear counter and go to PRE_PRESSED;
                        if bouncey = '1' then
                            sig_count <= 0;
                            state <= PRE_PRESSED;
                        end if;
                    when PRE_PRESSED =>
                        -- If bouncey = 1 increment counter
                        if bouncey = '1' then
                            sig_count <= sig_count + 1;
                            -- if counter = DEB_COUNT-1 go to PRESSED
                            if (sig_count = DEB_COUNT-1) then
                                state <= PRESSED;
                            end if;
                        -- else go to RELEASED
                        else
                            state <= RELEASED;
                        end if;
                        
                    when PRESSED =>
                        -- If bouncey = 0 then clear counter and go to PRE_RELEASED;
                         if bouncey = '0' then
                            sig_count <= 0;
                            state <= PRE_RELEASED;
                        end if;
                    when PRE_RELEASED =>
                        -- If bouncey = 0 then increment counter
                        if bouncey = '0' then
                            sig_count <= sig_count + 1;
                            -- if counter = DEB_COUNT-1 go to RELEASED;
                            if (sig_count = DEB_COUNT-1) then
                                state <= RELEASED;
                            end if;
                        -- else clear counter and go to PRESSED;
                        else
                            state <= PRESSED;
                        end if;
                    -- Prevent unhandled cases
                    when others =>
                        null;
                end case;
            end if;
        end if;

    end process p_fsm;
    
    sig_clean <= '1' when (state = PRESSED) or (state = PRE_RELEASED) else '0';
    -- Set clean signal to 1 when states PRESSED or PRE_RELEASED
    clean <= sig_clean;
    
    -- Remember the previous value of a signal and generates single
    -- clock pulses for positive and negative edges of the debounced signal.
    p_edge_detector : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                sig_delayed <= '0';
            else
                sig_delayed <= sig_clean;
            end if;
        end if;
    end process p_edge_detector;

    -- Assign output signals for edge detector
    pos_edge <= sig_clean and not(sig_delayed);
    neg_edge <= not(sig_clean) and sig_delayed;
    
end Behavioral;
