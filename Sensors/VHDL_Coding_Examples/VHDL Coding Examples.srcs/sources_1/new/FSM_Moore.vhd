----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2022 01:12:06 PM
-- Design Name: 
-- Module Name: FSM_Moore - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;

entity FSM_Moore is
--    generic (param1 : std_logic_vector(7 downto 0) := "11111111";
--             param2 : unsigned := "24";
--             param3 : integer := 3);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input_1 : in STD_LOGIC;
           input_2 : in STD_LOGIC;
           output_1 : out STD_LOGIC;
           output_2 : out STD_LOGIC);
end FSM_Moore;

architecture Behavioral of FSM_Moore is
--create state type
type stateType is (s0, s1, s2, s3);
--signals for state registers : current_state & next_state
signal current_state, next_state : stateType;

begin
    -- state register : current_state
    -- This process contains sequential part and all the D-FF are 
    -- included in this process. Hence, only 'clk' and 'reset' are 
    -- required for this process. 
    state_register : process(clk, rst)
        begin
        if(rst = '1') then
        current_state <= s1;
            elsif(rising_edge(clk)) then
            current_state <= next_state;
        end if;
     end process;
     
    -- next state logic : next_state
    -- This is combinational of the sequential design, 
    -- which contains the logic for next-state
    -- include all signals and input in sensitive-list except next_state
    next_state_logic : process(input_1, input_2, current_state) 
        begin
        next_state <= current_state; --default case
        case(current_state) is
            when s0 =>
                if(input_1 = '1') then
                next_state <= s1; --move onto next state
                    elsif(input_2 = '1') then
                    --next_state <= s2;
                        else
                        next_state <= s0; --remain in current state
                  end if;
             when s1 =>
                if(input_1 = '1') then
                next_state <= s1; --move onto next state
                    elsif(input_2 = '1') then
                    --next_state <= s2;
                        else
                        next_state <= s0; --remain in current state
                  end if;
              when s2 =>
                if(input_1 = '1') then
                next_state <= s1; --move onto next state
                    elsif(input_2 = '1') then
                    --next_state <= s2;
                        else
                        next_state <= s0; --remain in current state
                  end if;
             when s3 =>
                if(input_1 = '1') then
                next_state <= s1; --move onto next state
                    elsif(input_2 = '1') then
                    --next_state <= s2;
                        else
                        next_state <= s0; --remain in current state
                  end if;
        end case;
    end process;
    
    -- combination output logic
    -- This part contains the output of the design
    -- no if-else statement is used in this part
    -- include all signals and input in sensitive-list except state_next
    output_logic : process(input_1, input_2, current_state)
        begin
        --default outputs
        output_1 <= '1';
        output_2 <= '1';
        case(current_state) is
            when s0 =>
            output_1 <= '0';
            output_2 <= '0';
            when s1 =>
            output_1 <= '1';
            output_2 <= '0';
            when s2 =>
            output_1 <= '0';
            output_2 <= '1';
            when s3 =>
            output_1 <= '1';
            output_2 <= '1';
         end case;
      end process;
      
    -- optional D-FF to remove glitches
--    process(clk, rst)
--    begin 
--        if rst = '1' then 
--        new_output1 <= ... ;
--        new_output2 <= ... ;
--            elsif rising_edge(clk) then
--            new_output1 <= output1; 
--            new_output2 <= output2; 
--        end if;
--    end process; 
      
end Behavioral;
