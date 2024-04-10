----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 20:48:49
-- Design Name: 
-- Module Name: disp_control - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity disp_control is
    Port ( input_0 : in STD_LOGIC_VECTOR (4 downto 0);
           input_1 : in STD_LOGIC_VECTOR (4 downto 0);
           input_2 : in STD_LOGIC_VECTOR (4 downto 0);
           input_3 : in STD_LOGIC_VECTOR (4 downto 0);
           input_4 : in STD_LOGIC_VECTOR (4 downto 0);
           input_5 : in STD_LOGIC_VECTOR (4 downto 0);
           input_6 : in STD_LOGIC_VECTOR (4 downto 0);
           input_7 : in STD_LOGIC_VECTOR (4 downto 0);
           input_8 : in STD_LOGIC_VECTOR (4 downto 0);
           input_9 : in STD_LOGIC_VECTOR (4 downto 0);
           input_10 : in STD_LOGIC_VECTOR (4 downto 0);
           input_11 : in STD_LOGIC_VECTOR (4 downto 0);
           input_12 : in STD_LOGIC_VECTOR (4 downto 0);
           input_13 : in STD_LOGIC_VECTOR (4 downto 0);
           input_14 : in STD_LOGIC_VECTOR (4 downto 0);
           input_15 : in STD_LOGIC_VECTOR (4 downto 0);
           input_16 : in STD_LOGIC_VECTOR (4 downto 0);
           input_17 : in STD_LOGIC_VECTOR (4 downto 0);
           input_18 : in STD_LOGIC_VECTOR (4 downto 0);
           input_19 : in STD_LOGIC_VECTOR (4 downto 0);
           input_20 : in STD_LOGIC_VECTOR (4 downto 0);
           input_21 : in STD_LOGIC_VECTOR (4 downto 0);
           input_22 : in STD_LOGIC_VECTOR (4 downto 0);
           input_23 : in STD_LOGIC_VECTOR (4 downto 0);
           input_24 : in STD_LOGIC_VECTOR (4 downto 0);
           input_25 : in STD_LOGIC_VECTOR (4 downto 0);
           input_26 : in STD_LOGIC_VECTOR (4 downto 0);
           input_27 : in STD_LOGIC_VECTOR (4 downto 0);
           input_28 : in STD_LOGIC_VECTOR (4 downto 0);
           input_29 : in STD_LOGIC_VECTOR (4 downto 0);
           input_30 : in STD_LOGIC_VECTOR (4 downto 0);
           input_31 : in STD_LOGIC_VECTOR (4 downto 0);
           input_32 : in STD_LOGIC_VECTOR (4 downto 0);
           input_33 : in STD_LOGIC_VECTOR (4 downto 0);
           input_34 : in STD_LOGIC_VECTOR (4 downto 0);
           input_35 : in STD_LOGIC_VECTOR (4 downto 0);
           input_36 : in STD_LOGIC_VECTOR (4 downto 0);
           input_37 : in STD_LOGIC_VECTOR (4 downto 0);
           input_38 : in STD_LOGIC_VECTOR (4 downto 0);
           input_39 : in STD_LOGIC_VECTOR (4 downto 0);
           input_40 : in STD_LOGIC_VECTOR (4 downto 0);
           input_41 : in STD_LOGIC_VECTOR (4 downto 0);
           input_42 : in STD_LOGIC_VECTOR (4 downto 0);
           input_43 : in STD_LOGIC_VECTOR (4 downto 0);
           input_44 : in STD_LOGIC_VECTOR (4 downto 0);
           input_45 : in STD_LOGIC_VECTOR (4 downto 0);
           input_46 : in STD_LOGIC_VECTOR (4 downto 0);
           input_47 : in STD_LOGIC_VECTOR (4 downto 0);
           input_48 : in STD_LOGIC_VECTOR (4 downto 0);
           input_49 : in STD_LOGIC_VECTOR (4 downto 0);
           input_50 : in STD_LOGIC_VECTOR (4 downto 0);
           input_51 : in STD_LOGIC_VECTOR (4 downto 0);
           input_52 : in STD_LOGIC_VECTOR (4 downto 0);
           input_53 : in STD_LOGIC_VECTOR (4 downto 0);
           input_54 : in STD_LOGIC_VECTOR (4 downto 0);
           input_55 : in STD_LOGIC_VECTOR (4 downto 0);
           input_56 : in STD_LOGIC_VECTOR (4 downto 0);
           input_57 : in STD_LOGIC_VECTOR (4 downto 0);
           input_58 : in STD_LOGIC_VECTOR (4 downto 0);
           input_59 : in STD_LOGIC_VECTOR (4 downto 0);
           input_60 : in STD_LOGIC_VECTOR (4 downto 0);
           input_61 : in STD_LOGIC_VECTOR (4 downto 0);
           input_62 : in STD_LOGIC_VECTOR (4 downto 0);
           input_63 : in STD_LOGIC_VECTOR (4 downto 0);
           
           input_mux_sel : in STD_LOGIC_VECTOR (2 downto 0); --selection ports for input multiplexers
           clk : in STD_LOGIC;
           disp : out STD_LOGIC_VECTOR (6 downto 0);         
           anodes : out STD_LOGIC_VECTOR (7 downto 0)
           );
end disp_control;

architecture Behavioral of disp_control is
    component bin2seg is
        port (
            clear : in std_logic;
            bin : in std_logic_vector(4 downto 0);
            seg : out std_logic_vector(6 downto 0)
            );
    end component;
    
     component clock_enable is
        generic (
            N_PERIODS : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;
    
    component simple_counter is
        generic (
           C_NBIT : integer
           );
        Port ( 
           clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           en     : in  STD_LOGIC;
           count  : out STD_LOGIC_VECTOR (C_NBIT-1 downto 0)
           );
    end component;
    
    component prev is
        Port ( clear : in STD_LOGIC;
           lcd : in STD_LOGIC_VECTOR (2 downto 0);
           ncode : out STD_LOGIC_VECTOR (7 downto 0)
           );
    end component;
    
    component mux3bit is
        generic (
        MUX_NBIT : integer
         );
        Port ( 
           in_0 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_1 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_2 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_3 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_4 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_5 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_6 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           in_7 : in STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (MUX_NBIT - 1 downto 0)
           );
    end component;
    
    signal sig_en_2ms : std_logic;
    signal sig_clk_en_2_counter : std_logic;
    signal sig_mux_2_dis : std_logic_vector(4 downto 0);
    signal sig_counter_output : std_logic_vector(2 downto 0);
    
    -- input multiplexers outputs
    signal mux0_output : std_logic_vector(4 downto 0);
    signal mux1_output : std_logic_vector(4 downto 0);
    signal mux2_output : std_logic_vector(4 downto 0);
    signal mux3_output : std_logic_vector(4 downto 0);
    signal mux4_output : std_logic_vector(4 downto 0);
    signal mux5_output : std_logic_vector(4 downto 0);
    signal mux6_output : std_logic_vector(4 downto 0);
    signal mux7_output : std_logic_vector(4 downto 0);
    
begin

     display : component bin2seg
        port map (
            clear  => '0',
            bin    => sig_mux_2_dis,
            seg    => disp 
        );

    clk_en : component clock_enable
        generic map (
            N_PERIODS => 200_000 -- 2ms
        )
        
        port map (
            clk   => clk,
            rst   => '0',
            pulse => sig_en_2ms
        );
        
    simp_c : component simple_counter
        generic map (
            C_NBIT => 3
        )
        
        port map (
           clk   => sig_en_2ms,
           rst   => '0',
           en    => '1',
           count => sig_counter_output
           );
           
    one_to_eight : component prev
        port map (
           clear => '0',
           lcd   => sig_counter_output,
           ncode => anodes
           );
           
    main_mux : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => mux0_output,
           in_1   => mux1_output,
           in_2   => mux2_output,
           in_3   => mux3_output,
           in_4   => mux4_output,
           in_5   => mux5_output,
           in_6   => mux6_output,
           in_7   => mux7_output,
           sel    => sig_counter_output,
           output => sig_mux_2_dis
           );
           
    mux0 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_0,
           in_1   => input_1,
           in_2   => input_2,
           in_3   => input_3,
           in_4   => input_4,
           in_5   => input_5,
           in_6   => input_6,
           in_7   => input_7,
           sel    => input_mux_sel,
           output => mux0_output
           );
           
    mux1 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_8,
           in_1   => input_9,
           in_2   => input_10,
           in_3   => input_11,
           in_4   => input_12,
           in_5   => input_13,
           in_6   => input_14,
           in_7   => input_15,
           sel    => input_mux_sel,
           output => mux1_output
           );
          
    mux2 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_16,
           in_1   => input_17,
           in_2   => input_18,
           in_3   => input_19,
           in_4   => input_20,
           in_5   => input_21,
           in_6   => input_22,
           in_7   => input_23,
           sel    => input_mux_sel,
           output => mux2_output
           );
           
    mux3 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_24,
           in_1   => input_25,
           in_2   => input_26,
           in_3   => input_27,
           in_4   => input_28,
           in_5   => input_29,
           in_6   => input_30,
           in_7   => input_31,
           sel    => input_mux_sel,
           output => mux3_output
           );
           
    mux4 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_32,
           in_1   => input_33,
           in_2   => input_34,
           in_3   => input_35,
           in_4   => input_36,
           in_5   => input_37,
           in_6   => input_38,
           in_7   => input_39,
           sel    => input_mux_sel,
           output => mux4_output
           );
           
    mux5 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_40,
           in_1   => input_41,
           in_2   => input_42,
           in_3   => input_43,
           in_4   => input_44,
           in_5   => input_45,
           in_6   => input_46,
           in_7   => input_47,
           sel    => input_mux_sel,
           output => mux5_output
           );
           
    mux6 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_48,
           in_1   => input_49,
           in_2   => input_50,
           in_3   => input_51,
           in_4   => input_52,
           in_5   => input_53,
           in_6   => input_54,
           in_7   => input_55,
           sel    => input_mux_sel,
           output => mux6_output
           );
           
    mux7 : component mux3bit
        generic map (
            MUX_NBIT => 5
        )
        
        port map (
           in_0   => input_56,
           in_1   => input_57,
           in_2   => input_58,
           in_3   => input_59,
           in_4   => input_60,
           in_5   => input_61,
           in_6   => input_62,
           in_7   => input_63,
           sel    => input_mux_sel,
           output => mux7_output
           );

end Behavioral;
