----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2022 09:12:51 AM
-- Design Name: 
-- Module Name: tb_comparator - Behavioral
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

--needed for signals to do arithmetic operations
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_comparator is
--  Port ( );
end tb_comparator;

architecture Behavioral of tb_comparator is

--instantiate component
component n_bit_comparator is
generic (N : integer :=4);
    Port ( a : in STD_LOGIC_VECTOR (N-1 downto 0);
           b : in STD_LOGIC_VECTOR (N-1 downto 0);
           equals : out STD_LOGIC);
end component;

--declare signals for component
signal a_sig, b_sig  : std_logic_vector(3 downto 0);
signal equals_sig : std_logic;


begin
--create instance for testing
DUT_comparator : n_bit_comparator
port map (a => a_sig, b => b_sig, equals => equals_sig);

--create stimul
Test_Comparator : process is
    begin
--    for i in 0 to 15 loop
--    a_sig <= a_sig + i;
--    wait for 50ns;
--    end loop;
    
--    for i in 0 to 3 loop
--    b_sig <= b_sig +i;
--    wait for 50ns;
--    end loop;
    
    
    
    a_sig <= "0000";
    b_sig <= "1111";
    wait for 100ns;
    a_sig <= "0001";
    b_sig <= "1111";
    wait for 100ns;
    a_sig <= "1010";
    b_sig <= "0101";
    wait for 100ns;
    a_sig <= "1111";
    b_sig <= "1111";
    wait;
 
end process;

end Behavioral;
