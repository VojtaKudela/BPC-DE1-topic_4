----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 03:32:57 PM
-- Design Name: 
-- Module Name: test411 - Behavioral
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

entity test411 is
    Port ( 
    --clear : in STD_LOGIC;
    clk : in STD_LOGIC;
    button_00 : in STD_LOGIC; -- mode up
    button_01 : in STD_LOGIC; -- mode down
    button_02 : in STD_LOGIC; -- volume up
    button_03 : in STD_LOGIC; -- volume down
    rst_play  : out STD_LOGIC;
    rst_komp  : out STD_LOGIC;
    disp : out STD_LOGIC_VECTOR (6 downto 0);
    mode : out STD_LOGIC_VECTOR (2 downto 0);
    anode : out STD_LOGIC_VECTOR (7 downto 0);
    vol   : out STD_LOGIC_VECTOR (3 downto 0)
    );
end test411;


architecture Behavioral of test411 is

        signal sig_change_mode : std_logic;
        signal sig_change_vol : STD_LOGIC;
        signal sig_vol : STD_LOGIC_VECTOR (3 downto 0);
        signal sig_clear : std_logic;
        signal sig_mux_let : STD_LOGIC_VECTOR (2 downto 0);
        signal sig_mode : STD_LOGIC_VECTOR (2 downto 0);
        signal sig_bcd_00 : STD_LOGIC_VECTOR (4 downto 0);
        signal sig_bcd_01 : STD_LOGIC_VECTOR (4 downto 0);

component main_loop
    
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
           
    end component;
    
component mode_control
    
        Port ( 
           but_00 : in  STD_LOGIC;
           but_01 : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           change : out STD_LOGIC;
           mode   : out STD_LOGIC_VECTOR (2 downto 0));
           
    end component;
    
component disp_control
    
        Port ( 
           input_0  : in STD_LOGIC_VECTOR (4 downto 0);
           input_1  : in STD_LOGIC_VECTOR (4 downto 0);
           input_2  : in STD_LOGIC_VECTOR (4 downto 0);
           input_3  : in STD_LOGIC_VECTOR (4 downto 0);
           input_4  : in STD_LOGIC_VECTOR (4 downto 0);
           input_5  : in STD_LOGIC_VECTOR (4 downto 0);
           input_6  : in STD_LOGIC_VECTOR (4 downto 0);
           input_7  : in STD_LOGIC_VECTOR (4 downto 0);
           input_8  : in STD_LOGIC_VECTOR (4 downto 0);
           input_9  : in STD_LOGIC_VECTOR (4 downto 0);
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
           clear : in STD_LOGIC; 
           disp : out STD_LOGIC_VECTOR (6 downto 0);         
           anodes : out STD_LOGIC_VECTOR (7 downto 0)
           );
           
    end component;
    
    
 component bin2bcd is
    Port ( 
           bin    : in  STD_LOGIC_VECTOR (3 downto 0);
           bcd_00 : out STD_LOGIC_VECTOR (4 downto 0);
           bcd_01 : out STD_LOGIC_VECTOR (4 downto 0)
           );
    end component;
    
component volume_control
    
        Port ( 
           but_00 : in  STD_LOGIC;
           but_01 : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           clk    : in  STD_LOGIC;
           change : out STD_LOGIC;
           vol    : out STD_LOGIC_VECTOR (3 downto 0));
           
    end component;

begin

main : component main_loop

    port map (
           mode        => sig_mode,
           change_mode => sig_change_mode,
           change_vol  => sig_change_vol,
           vol_in      => sig_vol,
           clk         => clk,
           rst         => '0',
           mux_let     => sig_mux_let,
           vol_out     => vol,
           rst_komp    => rst_komp,
           rst_play    => rst_play,
           clear       => sig_clear,
           mux_mode    => mode
           );
           
mode_cnt : component mode_control

    port map (
           but_00 => button_00,
           but_01 => button_01,
           rst    => '0',
           clk    => clk,
           change => sig_change_mode,
           mode   => sig_mode
           );
           
disp_ctr : component disp_control

    port map (
           input_0  => "00101",  -- S
           input_1  => "11000",  -- R
           input_2  => "11001",  -- T
           input_3  => "00101",  -- S
           input_4  => "01101",  -- D
           input_5  => "01101",  -- D
           input_6  => "01101",  -- D
           input_7  => "11010",  -- V
           
           input_8  => "10001",  -- I
           input_9  => "01110",  -- E
           input_10 => "11000",  -- R
           input_11 => "01010",  -- A
           input_12 => "01110",  -- E
           input_13 => "01110",  -- E
           input_14 => "01110",  -- E
           input_15 => "00000",  -- 0
           
           input_16 => "10110",  -- N
           input_17 => "01100",  -- C
           input_18 => "10001",  -- I
           input_19 => "11010",  -- V
           input_20 => "10100",  -- m1
           input_21 => "10100",  -- m1
           input_22 => "10100",  -- m1
           input_23 => "10011",  -- L
           
           input_24 => "11010",  -- U
           input_25 => "11001",  -- T
           input_26 => "01010",  -- A
           input_27 => "11010",  -- V
           input_28 => "10101",  -- m2
           input_29 => "10101",  -- m2
           input_30 => "10101",  -- m2
           input_31 => "11100",  -- _
           
           input_32 => "00101",  -- S
           input_33 => "01010",  -- A
           input_34 => "10110",  -- N
           input_35 => "11110",  -- empty
           input_36 => "00000",  -- 0
           input_37 => "00000",  -- 0
           input_38 => "00000",  -- 0
           input_39 => sig_bcd_01,
           
           input_40 => "11110",  -- empty
           input_41 => "10110",  -- N
           input_42 => "01001",  -- G
           input_43 => "11110",  -- empty
           input_44 => "11100",  -- _
           input_45 => "11100",  -- _
           input_46 => "11100",  -- _
           input_47 => sig_bcd_00,
           
           input_48 => "11110",  -- empty
           input_49 => "11110",  -- empty
           input_50 => "10011",  -- L
           input_51 => "11110",  -- empty
           input_52 => "00001",  -- 1
           input_53 => "00010",  -- 2
           input_54 => "00011",  -- 3
           input_55 => "11110",
           
           input_56 => "11110",  -- empty
           input_57 => "11110",  -- empty
           input_58 => "11110",  -- empty
           input_59 => "11110",  -- empty
           input_60 => "11110",  -- empty
           input_61 => "11110",  -- empty
           input_62 => "11110",  -- empty
           input_63 => "11110",  -- empty
           
           input_mux_sel => sig_mux_let,
           clk => clk,
           clear => sig_clear, -- clear
           disp => disp,   
           anodes => anode
           );

volume_cnt : component volume_control

    port map (
           but_00 => button_02,
           but_01 => button_03,
           rst    => '0',
           clk    => clk,
           change => sig_change_vol,
           vol    => sig_vol
           );
           
b2b : component bin2bcd

    port map (
           bin    => sig_vol,
           bcd_00 => sig_bcd_00,
           bcd_01 => sig_bcd_01
           );

           
end Behavioral;
