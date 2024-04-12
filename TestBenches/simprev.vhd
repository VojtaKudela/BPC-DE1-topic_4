
        
      
-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 4.4.2024 14:12:57 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_prev is
end tb_prev;

architecture tb of tb_prev is

    component prev
        port (clear : in std_logic;
              lcd   : in std_logic_vector (2 downto 0);
              ncode : out std_logic_vector (7 downto 0));
    end component;

    signal clear : std_logic;
    signal lcd   : std_logic_vector (2 downto 0);
    signal ncode : std_logic_vector (7 downto 0);

begin

    dut : prev
    port map (clear => clear,
              lcd   => lcd,
              ncode => ncode);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
    clear <= '0';      
    lcd <= "000"; wait for 10ns;
    lcd <= "001"; wait for 10ns;
    lcd <= "010"; wait for 10ns;
    lcd <= "011"; wait for 10ns;
    lcd <= "100"; wait for 10ns;
    lcd <= "101"; wait for 10ns;
    lcd <= "110"; wait for 10ns;
    lcd <= "111"; wait for 10ns;
    clear <= '1'; wait for 10ns;      
--        case ncode is 
--            when "000" =>
--                  assert ncode = x"7F";
            
--            when "001" =>
--                  assert ncode = x"BF";
            
--            when "010" =>
--                  assert ncode = x"DF";
            
--            when "011" =>
--                  assert ncode = x"EF";
            
--            when "100" =>
--                  assert ncode = x"F7";
            
--            when "101" =>
--                  assert ncode = x"FB";
            
--            when "110" =>
--                  assert ncode = x"FD";    
            
--            when "111" =>
--                  assert ncode = x"FE";  
            
           
            
        

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_prev of tb_prev is
    for tb
    end for;
end cfg_tb_prev;
