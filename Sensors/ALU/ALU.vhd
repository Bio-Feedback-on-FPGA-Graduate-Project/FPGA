----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/12/2022 08:21:28 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
--use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    generic (N : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           ALU_Sel : in STD_LOGIC_VECTOR (N-5 downto 0);
           ALU_Out : out STD_LOGIC_VECTOR (N-1 downto 0);
           --Zero_Flag : out STD_LOGIC;
           Carry_Flag : out STD_LOGIC);
           --Negative_Flag : out STD_LOGIC;
           --Overflow_Flag : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is


signal ALU_Result : std_logic_vector(N-1 downto 0);
signal tmp : std_logic_vector(N downto 0);

begin
    process(A,B, ALU_sel)
        begin
        case(ALU_Sel) is
            when "0000" => -- Addition
            ALU_Result <= A + B;
            when "0001" => -- Subtraction
            ALU_Result <= A - B;
            when "0010" => -- Multiplication
            ALU_Result <= A * B;
            --ALU_Result <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) * to_integer(unsigned(B)),8)) ;
            when "0011" => -- Division
            --ALU_Result <= A / B;
            ALU_Result <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8)) ;
            when "0100" => -- Logical shift left
            ALU_Result <= std_logic_vector(unsigned(A) sll 1);
            when "0101" => --Logical shift right
            ALU_Result <= std_logic_vector(unsigned(A) srl 1);
            --ALU_Result <= (A srl 1);
            when "0110" => -- Rotate Left
            ALU_Result <= std_logic_vector(unsigned(A) rol 1);
            --ALU_Result <= (A rol 1);
            when "0111" => -- Rotate Right
            ALU_Result <= std_logic_vector(unsigned(A) ror 1);
            when "1000" => -- Logical AND
            ALU_Result <= A and B;
            when "1001" => -- Logical OR
            ALU_Result <= A or B;
            when "1010" => -- Logical NAND
            ALU_Result <= A nand B;
            when "1011" => -- Logical NOR
            ALU_Result <= A nor B;
            when "1100" => -- Logical XOR
            ALU_Result <= A xor B;
            when "1101" => -- Logical XNOR
            ALU_Result <= A xnor B;
            when "1110" => -- Greater than comparison
            if(A > B) then
            ALU_Result <= x"01";
            --ALU_Result <= A;
                else
                ALU_Result <= x"00";
            end if;
            when "1111" => -- Equal Comparison
            if(A = B) then
            ALU_Result <= x"01";
                else
                ALU_Result <= x"00";
           end if;     
           --default case     
           when others => 
           ALU_Result <= A + B;     
        end case;
     end process;

--signal assignment
ALU_Out <= ALU_Result;
 tmp <= ('0' & A) + ('0' & B);
Carry_Flag <= tmp(8); --Carry out flag
end Behavioral;
