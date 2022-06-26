----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2022 09:11:10 PM
-- Design Name: 
-- Module Name: DFF - Behavioral
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

entity DFF is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           preset : in STD_LOGIC;
           q : out STD_LOGIC);
end DFF;

-------------------------------------------- Synchronous Logic  -------------------------------------------------------
-------------------------------------------- Positve edge triggered DFF  -------------------------------------------------------
--architecture Behavioral of DFF is
--begin
--    process(clk) 
--        begin
--        if(rising_edge(clk)) then
--        q <= d;
--        end if;
--    end process;
--end Behavioral;

-------------------------------------------- Positve edge triggered DFF with low asynchronous reset  -------------------------------------------------------
--architecture Behavioral of DFF is
--begin
--    process(clk, rst) 
--        begin
--        if(rst = '0') then
--        q <= '0';
--            elsif(rising_edge(clk)) then
--            q <= d;
--        end if;
--     end process;
--end Behavioral;

-------------------------------------------- Positve edge triggered DFF with high asynchronous preset  -------------------------------------------------------
--architecture Behavioral of DFF is
--begin
--    process(clk, preset)
--        begin
--        if(preset = '1') then
--        q <= '1';
--        elsif(clk' event and clk = '1') then
--        q <= d;
--        end if;
--    end process;
--end Behavioral;

-------------------------------------------- Positve edge triggered DFF with low synchronous reset  -------------------------------------------------------
--architecture Behavioral of DFF is
--begin
--    process(clk, rst)
--        begin
--        if(rising_edge(clk)) then
--            if(rst = '0') then
--            q <= '0';
--                else
--                q <= d;
--            end if;
--          end if;
--      end process;
--end Behavioral;

-------------------------------------------- Positve edge triggered DFF with low asynchronous reset & high asynchronous preset  -------------------------------------------------------
--architecture Behavioral of DFF is 
--begin  
--    process(clk, rst, preset)
--        begin
--        if(rst = '0') then
--        q <= '0';
--            elsif(preset = '1') then
--            q <= '1';
--                elsif(rising_edge(clk)) then
--                q <= d;
--        end if;
--    end process;
--end Behavioral;    

-------------------------------------------- Positve edge triggered DFF with low asynchronous reset & high synchronous preset  -------------------------------------------------------
architecture Behavioral of DFF is 
begin  
    process(clk, rst, preset)
        begin
        if(rst = '0') then
        q <= '0';
            elsif(rising_edge(clk)) then
                if(preset = '1') then
                q <= '1';
                else
                q <= d;
                end if;
        end if;
    end process;
end Behavioral; 
            
            