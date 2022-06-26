----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2022 01:12:06 PM
-- Design Name: 
-- Module Name: FSM_Mealy - Behavioral
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

entity FSM_Mealy is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input_1 : in STD_LOGIC;
           input_2 : in STD_LOGIC;
           output_1 : out STD_LOGIC;
           output_2 : out STD_LOGIC);
end FSM_Mealy;

architecture Behavioral of FSM_Mealy is

begin


end Behavioral;
