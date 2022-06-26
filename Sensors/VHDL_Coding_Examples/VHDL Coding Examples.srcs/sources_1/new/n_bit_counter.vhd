----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2022 01:06:07 PM
-- Design Name: 
-- Module Name: n_bit_counter - Behavioral
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

entity n_bit_counter is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           rst : in STD_LOGIC;
           preset : in STD_LOGIC;
           load : out STD_LOGIC;
           data : in STD_LOGIC_VECTOR(7 downto 0);
           count : out STD_LOGIC_VECTOR (7 downto 0));
end n_bit_counter;

-------------------------------------------- Positve edge triggered counter -------------------------------------------------------
--architecture Behavioral of n_bit_counter is
--begin
--    process(clk)
--        begin
--        if(rising_edge(clk)) then
--        count <= count + '1';
--        end if;
--    end process;
--end Behavioral;   

-------------------------------------------- Positve edge triggered counter with high synchronous enable -------------------------------------------------------
--architecture Behavioral of n_bit_counter is 
--begin
--    process(clk)
--        begin
--        if(rising_edge(clk)) then
--            if(enable = '1') then -- counter will increment when clk = 1 & enable = 1
--            count <= count + '1';
--            end if;
--        end if;
--    end process;
--end Behavioral;         

-------------------------------------------- Positve edge triggered counter with low asynchronous reset & high synchronous load, enable -------------------------------------------------------
--architecture Behavioral of n_bit_counter is 
--begin
--    process(clk, rst)
--        begin
--        if(rst = '0') then
--        count <= b"00000000";
--            elsif(rising_edge(clk)) then
--                if(load = '1') then --load has priority over enable
--                 count <= data;
--                    elsif(enable = '1') then
--                    count <= count + '1';
--                end if;
--          end if;
--    end process;
--end Behavioral;             

-------------------------------------------- Positve edge triggered counter with low asynchronous reset, high asynchronous preset  & high synchronous load, enable -------------------------------------------------------
architecture Behavioral of n_bit_counter is 
begin
    process(clk, rst, preset)
        begin
        if(rst = '0') then --reset has priority over preset
        count <= (others => '0');
            elsif(preset = '1') then
            count <= b"11111111";
                elsif(rising_edge(clk)) then -- executed when rst = 1 & preset = 0
                    if(load = '1') then --load has priority over enable
                    count <= data;
                        elsif(enable = '1') then
                        count <= count + '1';
                    end if;
          end if;
    end process;
end Behavioral; 