----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2021 12:49:15 AM
-- Design Name: 
-- Module Name: tb_mult - Behavioral
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

entity tb_mult is
--  Port ( );
end tb_mult;

architecture Behavioral of tb_mult is

component uns_sig_mult is
    generic (
        width: integer := 4);
    Port ( a : in STD_LOGIC_VECTOR (width downto 0);
           b : in STD_LOGIC_VECTOR (width downto 0);
           prod_uns : out STD_LOGIC_VECTOR (2*width-1 downto 0);
           prod_sig : out STD_LOGIC_VECTOR (2*width-1 downto 0));
end component;

constant width : integer := 4;
signal a_sig, b_sig : STD_LOGIC_VECTOR (width downto 0);
signal prod_uns_sig, prod_sign_sig : STD_LOGIC_VECTOR (2*width-1 downto 0);

begin
DUT_mult : uns_sig_mult
port map(a => a_sig, b => b_sig, prod_uns => prod_uns_sig, prod_sig => prod_sign_sig);

Test_mult : process 
    begin 
    a_sig <= "00000";
    b_sig <= "11111";
    wait for 10ns;
    a_sig <= "00001";
    b_sig <= "11111";
    wait for 10ns;
    a_sig <= "11010";
    b_sig <= "00101";
    wait for 10ns;
    a_sig <= "11111";
    b_sig <= "11111";
    wait;
    
    end process;
end Behavioral;
