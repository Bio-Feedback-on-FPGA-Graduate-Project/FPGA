----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2022 09:01:47 AM
-- Design Name: 
-- Module Name: n_bit_comparator - Behavioral
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

entity n_bit_comparator is
generic (N : integer := 4);
    Port ( a : in STD_LOGIC_VECTOR (N-1 downto 0);
           b : in STD_LOGIC_VECTOR (N-1 downto 0);
           equals : out STD_LOGIC);
end n_bit_comparator;

--parameterize code
--parameter width 

-------------------------------------------- Data Flow Method 1-------------------------------------------------------

--architecture dataflow of n_bit_comparator is
--begin
--equals <= '1' when (a=b) else '0';
--end dataflow;

-------------------------------------------- Data Flow Method 2-------------------------------------------------------

--architecture dataflow of n_bit_comparator is
--begin
--equals <= not(a(0) xor b(0)) and (not(a(1) xor b(1))) and (not(a(2) xor b(2))) and (not(a(3) xor b(3)));
--end dataflow;

-------------------------------------------- Behavioral Method 1-------------------------------------------------------

--architecture Behavioral of n_bit_comparator is
--begin
--comp : process(a, b) --sensitivity list must include I/O we are monitoring 
--    begin
--    if(a = b ) then
--    equals <= '1';
--        else
--        equals <= '0';
--    end if;
--end process;
--end Behavioral;

-------------------------------------------- Structural Method 1 -------------------------------------------------------

architecture Structural of n_bit_comparator is
signal output : std_logic_vector(3 downto 0);
--for unary operator function
signal temp: std_logic_vector(3 downto 0);

begin
gate_1 : output(0) <= a(0) xnor b(0);
gate_2 : output(1) <= a(1) xnor b(1);
gate_3 : output(2) <= a(2) xnor b(2);
gate_4 : output(3) <= a(3) xnor b(3);
--gate_5 : equals <=  (output(0) and output(1) and output(2) and output(3));

--gate_5 : equals <= and output; --not yet supported by compiler
-- function for unary operator
    temp(0) <= output(0);
    gen: for i in 1 to N-1 generate
        temp(i) <= temp(i-1) and output(i);
    end generate; 
gate_5 : equals <= temp(N-1);
end Structural;