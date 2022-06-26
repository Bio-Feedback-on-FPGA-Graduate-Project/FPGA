----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2021 12:41:49 AM
-- Design Name: 
-- Module Name: uns_sig_mult - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uns_sig_mult is
    generic (
        width: integer := 4);
    Port ( a : in STD_LOGIC_VECTOR (width downto 0);
           b : in STD_LOGIC_VECTOR (width downto 0);
           prod_uns : out STD_LOGIC_VECTOR (2*width-1 downto 0);
           prod_sig : out STD_LOGIC_VECTOR (2*width-1 downto 0));
end uns_sig_mult;

architecture Behavioral of uns_sig_mult is

begin
    prod_uns <= std_logic_vector(unsigned(a) * unsigned(b));
    prod_sig <= std_logic_vector(signed(a) * signed(b));
end Behavioral;
