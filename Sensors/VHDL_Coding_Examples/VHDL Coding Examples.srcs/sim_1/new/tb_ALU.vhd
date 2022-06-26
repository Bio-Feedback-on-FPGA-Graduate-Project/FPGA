----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/12/2022 09:05:34 PM
-- Design Name: 
-- Module Name: tb_ALU - Behavioral
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

entity tb_ALU is
generic (width : integer := 8);
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is

--component declaration
component ALU is
    generic (N : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           ALU_Sel : in STD_LOGIC_VECTOR (N-5 downto 0);
           ALU_Out : out STD_LOGIC_VECTOR (N-1 downto 0);
           --Zero_Flag : out STD_LOGIC;
           Carry_Flag : out STD_LOGIC);
           --Negative_Flag : out STD_LOGIC;
           --Overflow_Flag : out STD_LOGIC);
end component ;
--Inputs
signal A : std_logic_vector(width-1 downto 0) := (others => '0');
signal B : std_logic_vector(width-1 downto 0) := (others => '0');
signal ALU_Sel : std_logic_vector(width-5 downto 0) := (others => '0');

--Outputs
signal ALU_Out : std_logic_vector(width-1 downto 0);
signal Carryout : std_logic;
signal Zero_Flag : STD_LOGIC;
signal Carry_Flag : STD_LOGIC;
signal Negative_Flag : STD_LOGIC;
signal Overflow_Flag : STD_LOGIC;
signal i : integer;

begin

-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carry_Flag => Carry_Flag
        );
        
        stim_proc : process
            begin
            -- hold reset state for 100 ns.
            A <= "00001111";
            B <= "00000001";
            ALU_Sel <= "0000";
            wait for 100ns;
            
--            for i in 0 to 15 loop
--            ALU_Sel <= ALU_Sel + x"1";
--            wait for 100ns;
--            end loop;
            
            ALU_Sel <= "0001";
            wait for 100ns;
            ALU_Sel <= "0010";
            wait for 100ns;
--            ALU_Sel <= "0011";
--            wait for 100ns;
            ALU_Sel <= "0111";
            wait for 100ns;
            
            A <= "00001010";
            B <= "00000000";
            wait;
        end process;
end Behavioral;
