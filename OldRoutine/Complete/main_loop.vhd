----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2024 19:46:45
-- Design Name: 
-- Module Name: main_loop - Behavioral
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

entity main_loop is
    
    Port ( 
           mode        : in  STD_LOGIC_VECTOR (2 downto 0);
           change_mode : in  STD_LOGIC;
           change_vol  : in  STD_LOGIC;
           vol_in      : in  STD_LOGIC_VECTOR (3 downto 0);
           clk         : in  STD_LOGIC;
           rst         : in  STD_LOGIC;
           mux_let     : out STD_LOGIC_VECTOR (2 downto 0);
           vol_out     : out STD_LOGIC_VECTOR (3 downto 0);
           rst_komp    : out STD_LOGIC;
           rst_play    : out STD_LOGIC;
           clear       : out STD_LOGIC;
           mux_mode    : out STD_LOGIC_VECTOR (2 downto 0)
           );
           
end main_loop;

architecture Behavioral of main_loop is

    type mode_type is (SAFE, SQUARE, TRIANGLE, SAW, DEMOA, DEMOB, DEMOC, VOLUME); --SINUS
    signal sig_start_del : std_logic;   -- active in low
    signal sig_del       : std_logic;
    signal state         : mode_type;
    
    component clock_enable
    
        Generic (
           PERIOD : integer
           );
        Port    ( 
           clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           pulse : out STD_LOGIC
           );
           
    end component;
      
begin

DELAY: clock_enable
    generic map (
            PERIOD => 200_000_000 -- set correct value 200_000_000, test value 10
                    )
        port map (
            clk   => clk,
            rst   => sig_start_del,
            pulse => sig_del
                 );

set_mode : process (clk) is --, change_mode, change_vol
    begin
        if rising_edge(clk) then
            if (rst = '1') then   -- Active-high reset
                state <= SAFE;
            else

                case state is     -- Define transitions between states

                    when SAFE =>
                        
                        sig_start_del <= '1';
                        
                        case mode is
                        
--                            when "000" =>
--                                state <= SINUS;
                            when "000" => -- 001
                                state <= SQUARE;
                            when "001" => -- 010
                                state <= TRIANGLE;
                            when "010" => -- 011
                                state <= SAW;
                            when "011" => -- 100
                                state <= DEMOA;
                            when "100" => -- 101
                                state <= DEMOB;
                            when "101" => -- 110
                                state <= DEMOC;
                            when others =>
                                state <= SAFE;
                        end case;
                        
--                    when SINUS =>
                        
--                        if change_vol = '1' then
--                            sig_start_del <= '0';
--                            state <= VOLUME;
--                        else
--                            if mode = "110" then
--                                state <= DEMOC;
--                            elsif mode = "001" then
--                                state <= SQUARE;
--                            elsif mode = "000" then
--                                state <= SINUS;
--                            else
--                                state <= SAFE;
--                            end if;
--                        end if;
                        
                    when SQUARE =>
     
                       if change_vol = '1' then
                            sig_start_del <= '0';
                            state <= VOLUME;
                        else
                            if mode = "101" then  --110
                                state <= DEMOC; -- SINUS
                            elsif mode = "001" then --010
                                state <= TRIANGLE;
                            elsif mode = "000" then --001
                                state <= SQUARE;
                            else
                                state <= SAFE;
                            end if;
                        end if;
                        
                    when TRIANGLE =>
     
                       if change_vol = '1' then
                            sig_start_del <= '0';
                            state <= VOLUME;
                        else
                            if mode = "000" then --000
                                state <= SQUARE;
                            elsif mode = "010" then --011
                                state <= SAW;
                            elsif mode = "001" then --010
                                state <= TRIANGLE;
                            else
                                state <= SAFE;
                            end if;
                        end if;
                        
                     when SAW =>
     
                       if change_vol = '1' then
                            sig_start_del <= '0';
                            state <= VOLUME;
                        else
                            if mode = "001" then --010
                                state <= TRIANGLE;
                            elsif mode = "011" then --100
                                state <= DEMOA;
                            elsif mode = "010" then --011
                                state <= SAW;
                            else
                                state <= SAFE;
                            end if;
                        end if;
                        
                     when DEMOA =>
     
                       if change_vol = '1' then
                            sig_start_del <= '0';
                            state <= VOLUME;
                        else
                            if mode = "010" then --011
                                state <= SAW;
                            elsif mode = "100" then --101
                                state <= DEMOB;
                            elsif mode = "011" then --100
                                state <= DEMOA;
                            else
                                state <= SAFE;
                            end if;
                        end if;
                        
                     when DEMOB =>
     
                       if change_vol = '1' then
                            sig_start_del <= '0';
                            state <= VOLUME;
                        else
                            if mode = "011" then --100
                                state <= DEMOA;
                            elsif mode = "101" then --110
                                state <= DEMOC;
                            elsif mode = "100" then --101
                                state <= DEMOB;
                            else
                                state <= SAFE;
                            end if;
                        end if;
                        
                     when DEMOC =>
     
                       if change_vol = '1' then
                            sig_start_del <= '0';
                            state <= VOLUME;
                        else
                            if mode = "100" then --101
                                state <= DEMOB;
                            elsif mode = "000" then
                                state <= SQUARE; --SINUS
                            elsif mode = "101" then --110
                                state <= DEMOC;
                            else
                                state <= SAFE;
                            end if;
                        end if;
                        
                     when VOLUME =>
                        
                        if change_mode = '1' then
                            state <= SAFE;
                        else
                            if sig_del = '1' then
                                state <= SAFE;
                            else
                                state <= VOLUME;
                            end if;
                        end if;
                        
                     when others =>
                        null;
                end case;
            end if;
        end if;

    end process set_mode;
   
    switcher: process(state) is
    begin 
    
        case state is
            when SAFE =>
                mux_let  <= "000";
                vol_out  <= x"0";
--            when SINUS =>
--                mux_let  <= "000";
--                vol_out  <= vol_in;
            when SQUARE =>
                mux_let  <= "001";
                vol_out  <= vol_in;
            when TRIANGLE =>
                mux_let  <= "010";
                vol_out  <= vol_in;
            when SAW =>
                mux_let  <= "011";
                vol_out  <= vol_in;
            when DEMOA =>
                mux_let  <= "100";
                vol_out  <= x"F";
            when DEMOB =>
                mux_let  <= "101";
                vol_out  <= x"F";
            when DEMOC =>
                mux_let  <= "110";
                vol_out  <= x"F";
            when VOLUME =>
                mux_let  <= "111";
                vol_out  <= x"0";
            
        end case;
        
    end process switcher;
    
    mux_mode <= mode;
    
    clear <= '1' when (state = SAFE) else '0';
    rst_komp <= '1' when (state = SAFE or state = VOLUME) else '0';
    rst_play <= '1' when (state = SAFE or state = SQUARE or state = TRIANGLE or state = SAW or state = VOLUME or change_mode = '1') else '0'; -- or state = SINUS 
end Behavioral;
