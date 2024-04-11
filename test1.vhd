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
    clear : in STD_LOGIC;
    clk : in STD_LOGIC;
    button_00 : in STD_LOGIC;
    button_01 : in STD_LOGIC;
    button_02 : in STD_LOGIC;
    button_03 : in STD_LOGIC;
    disp : out STD_LOGIC_VECTOR (6 downto 0);
    mode : out STD_LOGIC_VECTOR (2 downto 0);
    anode : out STD_LOGIC_VECTOR (7 downto 0)
    );
end test411;


architecture Behavioral of test411 is

        signal sig_change_mode : std_logic;
        signal sig_change_vol : STD_LOGIC;
        signal sig_vol : STD_LOGIC_VECTOR (3 downto 0);
        signal sig_clear : std_logic;
        signal sig_mux_let : STD_LOGIC_VECTOR (2 downto 0);
        signal sig_mode : STD_LOGIC_VECTOR (2 downto 0);

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
           vol_out     => open,
           rst_komp    => open,
           rst_play    => open,
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
           
disp : component disp_control

    port map (
           input_0  => "00101",
           input_1  => "10001",
           input_2  => "10110",
           input_3  => "11010",
           input_4  => "00101",
           input_5  => "11110",
           input_6  => "11110",
           input_7  => "11110",
           
           input_8  => "11001",
           input_9  => "11000",
           input_10 => "10001",
           input_11 => "01010",
           input_12 => "10110",
           input_13 => "01001",
           input_14 => "10011",
           input_15 => "11110",
           
           input_16 => "00101",
           input_17 => "01010",
           input_18 => "11010",
           input_19 => "11010",
           input_20 => "11110",
           input_21 => "11110",
           input_22 => "11110",
           input_23 => "11110",
           
           input_24 => "01101",
           input_25 => "01110",
           input_26 => "10100",
           input_27 => "10101",
           input_28 => "00000",
           input_29 => "11100",
           input_30 => "00001",
           input_31 => "11110",
           
           input_32 => "01101",
           input_33 => "01110",
           input_34 => "10100",
           input_35 => "10101",
           input_36 => "00000",
           input_37 => "11100",
           input_38 => "00010",
           input_39 => "11110",
           
           input_40 => "01101",
           input_41 => "01110",
           input_42 => "10100",
           input_43 => "10101",
           input_44 => "00000",
           input_45 => "11100",
           input_46 => "00011",
           input_47 => "11110",
           
           input_48 => "01101",
           input_49 => "01110",
           input_50 => "10100",
           input_51 => "10101",
           input_52 => "00000",
           input_53 => "11100",
           input_54 => "00100",
           input_55 => "11110",
           
           input_56 => "",
           input_57 => "",
           input_58 => "",
           input_59 => "",
           input_60 => "",
           input_61 => "",
           input_62 => "",
           input_63 => "",
           
           input_mux_sel => sig_mux_let,
           clk => clk,
           clear => sig_clear,
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
           
end Behavioral;
