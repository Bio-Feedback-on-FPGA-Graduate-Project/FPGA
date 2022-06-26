----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2022 09:25:27 PM
-- Design Name: 
-- Module Name: n_bit_register - Behavioral
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

entity n_bit_register is
    Port ( d : in std_logic_vector(7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           preset : in STD_LOGIC;
           q : out std_logic_vector(7 downto 0));
end n_bit_register;

-------------------------------------------- Positve edge triggered register  -------------------------------------------------------
--architecture Behavioral of n_bit_register is

--begin
--    process(clk)
--        begin 
--        if(rising_edge(clk)) then
--        q <= d;
--        end if;
--    end process;
--end Behavioral;

-------------------------------------------- Positve edge triggered register with low asynchronous reset and high synchronous preset -------------------------------------------------------
architecture Behavioral of n_bit_register is
begin
    process(clk, rst, preset)
        begin
        if(rst = '0') then
        --q <= (others => '0');
        q <= b"00000000";
            elsif(rising_edge(clk)) then
                if(preset = '1') then
                q <= b"11111111";
                    else
                    q <= d;
                 end if;
        end if;
     end process;
end Behavioral ;
        
        