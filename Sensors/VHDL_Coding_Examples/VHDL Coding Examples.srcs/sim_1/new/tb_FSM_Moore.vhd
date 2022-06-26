----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2022 04:07:04 PM
-- Design Name: 
-- Module Name: tb_FSM_Moore - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_FSM_Moore is
--  Port ( );
end tb_FSM_Moore;

architecture Behavioral of tb_FSM_Moore is

--component instantiation
component FSM_Moore is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input_1 : in STD_LOGIC;
           input_2 : in STD_LOGIC;
           output_1 : out STD_LOGIC;
           output_2 : out STD_LOGIC);
end component;

--signal declaration
signal clk, rst, input_1, input_2 : std_logic;
signal output_1, output_2 : std_logic;

begin
--port mapping
DUT : FSM_Moore PORT MAP (clk => clk, rst => rst, input_1 => input_1, input_2 => input_2, output_1 => output_1, output_2 => output_2);

--clock generation
clock_gen : process is
    begin
    clk <= '1';
    wait for 50ns;
    clk <= '0';
    wait for 50ns;
    
    --clk <= not clk after 50 ns;
end process;

--create stimul
Test_FSM : process is
    begin
    rst <= '1'; input_1 <= '1'; input_2 <= '1';
    rst <= '0'; input_1 <= '1'; input_2 <= '1'; wait for 100ns;
    input_1 <= '1'; input_2 <= '0'; wait for 100ns;
    input_1 <= '0'; input_2 <= '0'; wait for 100ns;
    input_1 <= '0'; input_2 <= '1'; wait for 100ns;
    
end process;

end Behavioral;
