----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2022 05:00:13 PM
-- Design Name: 
-- Module Name: Memory_Controller - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--two process FSM

entity Memory_Controller is
    Port ( read_write : in STD_LOGIC;
           ready : in STD_LOGIC;
           clk : in STD_LOGIC;
           oe : out STD_LOGIC;
           we : out STD_LOGIC);
end Memory_Controller;

architecture Behavioral of Memory_Controller is

type stateType is (idle, decision, read, write);
signal present_state, next_state : stateType;
begin
--Moore machine because none of the outputs depend on inputs
state_comb : process(present_state, read_write, ready) 
    begin
    case(present_state) is
    when idle =>
        oe <= '0';
        we <= '0';
        if(ready = '1') then
        next_state <= decision;
            else
            next_state <= idle; --remain in current state
        end if;
     when decision =>
        oe <= '0';
        we <= '0';
        if(read_write = '1') then
        next_state <= read;
            else
            next_state <= write; --if not reading, then write
        end if;  
      when read =>
        oe <= '1';
        we <= '0';
        if(ready = '1') then
        next_state <= idle;
            else
            next_state <= read; --remain in current state
        end if;
      when write =>
        oe <= '0';
        we <= '1';
        if(ready = '1') then
        next_state <= idle;
            else
            next_state <= write; --remain in current state
        end if;
     end case;
end process;

state_register : process(clk)
    begin
        if(rising_edge(clk)) then
        present_state <= next_state;
        end if;
end process;

end Behavioral;
