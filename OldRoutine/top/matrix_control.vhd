----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2024 18:59:06
-- Design Name: Vojtìch Kudela
-- Module Name: debouncey - Behavioral
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

entity matrix_control is
    Generic(
            PERIOD : integer := 100
            );
    Port ( clk     : in STD_LOGIC;
           rst     : in STD_LOGIC;
           any     : out STD_LOGIC;
           s       : in STD_LOGIC_VECTOR (3 downto 0);
           -- button  : in STD_LOGIC_VECTOR (15 downto 0);
           r       : out STD_LOGIC_VECTOR (3 downto 0);
           but     : out STD_LOGIC_VECTOR (3 downto 0));
end matrix_control;

architecture Behavioral of matrix_control is
    
    component clock_enable
        generic (
            PERIOD : integer
            );
        port(
            clk    : in STD_LOGIC;
            rst    : in STD_LOGIC;
            pulse  : out STD_LOGIC
            );
        end component;
                
    type state_type is (r0, r1, r2, r3, IDLE, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15);
    signal sig_en_1ms : std_logic;
    signal sig_start_delay : std_logic; -- active in low level
    signal sig_delay    : std_logic;
    signal state      : state_type;

    
begin

    CL_EN  : clock_enable
        generic map (
            PERIOD => PERIOD
                    )
        port map (
            clk   => clk,
            rst   => rst,
            pulse => sig_en_1ms
                 );
                 
    DELAY  : clock_enable
        generic map (
            PERIOD => 1_000 -- 100_000
                    )
        port map (
            clk   => clk,
            rst   => sig_start_delay,
            pulse => sig_delay
                 );
    
    matrix_display : process (clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                state <= IDLE;
            else
                case state is
                    when IDLE =>
                        sig_start_delay <= '1';
                        but <= "0000";
                        any <= '0';
                        state <= r0;
                     
                    -- row r0                       
                    when r0 =>
                        but <= "0000";
                        any <= '0';
                        r <= "0111";
                        
                        if sig_en_1ms = '1' then
                            if s(0) = '0' then
                                state <= s0;
                                sig_start_delay <= '0';
                            else
                                if s(1) = '0' then
                                    state <= s1;
                                    sig_start_delay <= '0';
                                else
                                    if s(2) = '0' then
                                        state <= s2;
                                        sig_start_delay <= '0';
                                    else
                                        if s(3) = '0' then
                                            state <= s3;
                                            sig_start_delay <= '0';
                                        else
                                            state <= r1;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        else
                            state <= r0;
                        end if;
                    
                    -- colums for r0    
                    when s0 =>
                        but <= "0000";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s0;
                        end if;
                        
                    when s1 =>
                        but <= "0001";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s1;
                        end if;
                        
                    when s2 =>
                        but <= "0010";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s2;
                        end if;
                        
                     when s3 =>
                        but <= "0011";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s3;
                        end if;
                     
                    -- row r1                       
                    when r1 =>
                        but <= "0000";
                        any <= '0';
                        r <= "1011"; -- nejsem si jistý
                       
                        if sig_en_1ms = '1' then
                            if s(0) = '0' then
                                state <= s4;
                                sig_start_delay <= '0';
                            else
                                if s(1) = '0' then
                                    state <= s5;
                                    sig_start_delay <= '0';
                                else
                                    if s(2) = '0' then
                                        state <= s6;
                                        sig_start_delay <= '0';
                                    else
                                        if s(3) = '0' then
                                            state <= s7;
                                            sig_start_delay <= '0';
                                        else
                                            state <= r2; -- zde si nejsem jistý, ale mìlo by tak být
                                        end if;
                                    end if;
                                end if;
                            end if;
                        else
                            state <= r1; -- zde si nejsem jistý
                        end if;
                   
                    -- colums for r1    
                    when s4 =>
                        but <= "0100";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s4;
                        end if;
                        
                    when s5 =>
                        but <= "0101";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s5;
                        end if;
                        
                    when s6 =>
                        but <= "0110";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s6;
                        end if;
                       
                     when s7 =>
                        but <= "0111";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s7;
                        end if;
                    
                    -- row r2                       
                    when r2 =>
                        but <= "0000";
                        any <= '0';
                        r <= "1101"; -- nejsem si jistý
                       
                        if sig_en_1ms = '1' then
                            if s(0) = '0' then
                                state <= s8;
                                sig_start_delay <= '0';
                            else
                                if s(1) = '0' then
                                    state <= s9;
                                    sig_start_delay <= '0';
                                else
                                    if s(2) = '0' then
                                        state <= s10;
                                        sig_start_delay <= '0';
                                    else
                                        if s(3) = '0' then
                                            state <= s11;
                                            sig_start_delay <= '0';
                                        else
                                            state <= r3; -- zde si nejsem jistý
                                        end if;
                                    end if;
                                end if;
                            end if;
                        else
                            state <= r2; -- zde si nejsem jistý
                        end if;
                  
                    -- colums for r2    
                    when s8 =>
                        but <= "1000";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s8;
                        end if;
                        
                    when s9 =>
                        but <= "1001";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s9;
                        end if;
                       
                    when s10 =>
                        but <= "1010";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s10;
                        end if;
                       
                    when s11 =>
                        but <= "1011";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s11;
                        end if;
                    
                    -- row r3                       
                    when r3 =>
                        but <= "0000";
                        any <= '0';
                        r <= "1110"; -- nejsem si jistý
                       
                        if sig_en_1ms = '1' then
                            if s(0) = '0' then
                                state <= s12;
                                sig_start_delay <= '0';
                            else
                                if s(1) = '0' then
                                    state <= s13;
                                    sig_start_delay <= '0';
                                else
                                    if s(2) = '0' then
                                        state <= s14;
                                        sig_start_delay <= '0';
                                    else
                                        if s(3) = '0' then
                                            state <= s15;
                                            sig_start_delay <= '0';
                                        else
                                            state <= r0; -- zde si nejsem jistý
                                        end if;
                                    end if;
                                end if;
                            end if;
                        else
                            state <= r3; -- zde si nejsem jistý
                        end if;
                  
                    -- colums for r3    
                    when s12 =>
                        but <= "1100";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s12;
                        end if;
                        
                    when s13 =>
                        but <= "1101";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s13;
                        end if;
                       
                    when s14 =>
                        but <= "1110";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s14;
                        end if;
                       
                    when s15 =>
                        but <= "1111";
                        any <= '1';
                        if sig_delay = '1' then
                            state <= IDLE;
                        else
                            state <= s15;
                        end if;
                   
                     -- zde se doptat, zda se nemá zmìnit r1 na nìco jiného (natavené pro tb, kdy byl jen jeden øádek)                                           
                    --when r0 => -- pravdìpodobná chyba, proè nefunguje
                        --state <= IDLE; -- po tuto èást
                    --when others =>
                        --null;
                end case;
            end if;
        end if;
    end process matrix_display;

end Behavioral;
