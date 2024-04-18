----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2024 17:17:03
-- Design Name: 
-- Module Name: demo_main - Behavioral
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

entity demo_main is
    Port ( 
           rst_play : in  STD_LOGIC;
           rst      : in  STD_LOGIC;
           clk      : in  STD_LOGIC;
           demo_out : out STD_LOGIC_VECTOR (7 downto 0);
           mode     : in  STD_LOGIC_VECTOR (1 downto 0)  -- two bits only please
           );
end demo_main;

architecture Behavioral of demo_main is

    component simple_counter
        generic (
           N : integer
           );
        port ( 
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           en     : in  STD_LOGIC;
           count  : out STD_LOGIC_VECTOR (N-1 downto 0)
           );
    end component;
    
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
    
    component freq_conv
        Port ( 
           bcd  : in  STD_LOGIC_VECTOR (3 downto 0);
           freq : out STD_LOGIC_VECTOR (15 downto 0)
           );
    end component;
    
    component mux
        generic (
           NBIT : integer
           );
        Port ( 
           in_0   : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_1   : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_2   : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           in_3   : in STD_LOGIC_VECTOR (NBIT - 1 downto 0);
           sel    : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (NBIT - 1 downto 0));
    end component;
    
    component tri_gen
        Generic (
           NBIT : integer;
           FSMP : integer
           );
        Port ( 
           clk  : in  STD_LOGIC;
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           vol  : in  STD_LOGIC_VECTOR (3 downto 0);
           rst  : in  STD_LOGIC;
           smpl : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
     end component;
     
     component demo_ins
        Port ( 
           step : in  STD_LOGIC_VECTOR (5 downto 0);
           freq : out STD_LOGIC_VECTOR (3 downto 0);
           vol  : out STD_LOGIC_VECTOR (3 downto 0)
           );
     end component;
     
     component demo_ins_1
        Port ( 
           step : in  STD_LOGIC_VECTOR (5 downto 0);
           freq : out STD_LOGIC_VECTOR (3 downto 0);
           vol  : out STD_LOGIC_VECTOR (3 downto 0)
           );
     end component;
     
     component demo_ins_2
        Port ( 
           step : in  STD_LOGIC_VECTOR (5 downto 0);
           freq : out STD_LOGIC_VECTOR (3 downto 0);
           vol  : out STD_LOGIC_VECTOR (3 downto 0)
           );
     end component;
     
     constant con_PERIOD   : integer := 20_000_000;
     constant con_SMPL     : integer := 4160;
     constant con_N        : integer := 6;
     constant con_NBIT     : integer := 8;
     constant con_FSMP     : integer := 12_000;
     signal   sig_enable   : STD_LOGIC;
     signal   sig_point    : STD_LOGIC_VECTOR (5 downto 0);
     signal   sig_clk_tri  : STD_LOGIC;
     signal   sig_freq_1   : STD_LOGIC_VECTOR (3 downto 0);
     signal   sig_vol_1    : STD_LOGIC_VECTOR (3 downto 0);
     signal   sig_freq_2   : STD_LOGIC_VECTOR (3 downto 0);
     signal   sig_vol_2    : STD_LOGIC_VECTOR (3 downto 0);
     signal   sig_freq_3   : STD_LOGIC_VECTOR (3 downto 0);
     signal   sig_vol_3    : STD_LOGIC_VECTOR (3 downto 0);
     signal   sig_freq     : STD_LOGIC_VECTOR (3 downto 0); -- out mux
     signal   sig_vol      : STD_LOGIC_VECTOR (3 downto 0); -- out mux
     signal   sig_freq_tri : STD_LOGIC_VECTOR (15 downto 0);
     
begin
    
    NEXT_POINT : clock_enable
        generic map (
            PERIOD => con_PERIOD
            )
        port map (
            rst   => rst_play,
            clk   => clk,
            pulse => sig_enable
            );
            
      CNT_POINT : simple_counter
        generic map (
            N => con_N
            )
        port map (
            rst   => rst_play,
            clk   => clk,
            en    => sig_enable,
            count => sig_point
            );
            
       DEMO_INS_01 : demo_ins
        port map (
            step  => sig_point,
            freq  => sig_freq_1,
            vol   => sig_vol_1
            );
            
       DEMO_INS_02 : demo_ins_1
        port map (
            step  => sig_point,
            freq  => sig_freq_2,
            vol   => sig_vol_2
            );
            
        DEMO_INS_3 : demo_ins_2
         port map (
            step  => sig_point,
            freq  => sig_freq_3,
            vol   => sig_vol_3
            );
            
       MUX_FREQ   : mux
        generic map (
            NBIT   => 4
            )
        port map (
            sel    => mode,
            in_0   => sig_freq_2, -- demo_2 = state 100;
            in_1   => sig_freq_3, -- demo_3 = state 101;
            in_2   => x"0",
            in_3   => sig_freq_1, -- demo_1 = state 011;
            output => sig_freq
            );
                      
        MUX_VOL   : mux
         generic map (
            NBIT   => 4
            ) 
         port map (
            sel    => mode,
            in_0   => sig_vol_2, -- demo_2 = state 100
            in_1   => sig_vol_3, -- demo_3 = state 101;
            in_2   => x"0",
            in_3   => sig_vol_1, -- demo_1 = state 011;
            output => sig_vol
            );
            
        CL_TRI    : clock_enable
          generic map (
            PERIOD => con_SMPL
            )
          port map (
            rst   => rst,
            clk   => clk,
            pulse => sig_clk_tri
            );
            
        FREQ_CV    : freq_conv
          port map (
            bcd   => sig_freq,
            freq  => sig_freq_tri
            );
            
        GENERATOR  : tri_gen
          generic map (
            NBIT   => con_NBIT,
            FSMP   => con_FSMP
            ) 
          port map (
            clk    => sig_clk_tri,
            rst    => rst,
            freq   => sig_freq_tri,
            vol    => sig_vol,
            smpl   => demo_out
            );

end Behavioral;
