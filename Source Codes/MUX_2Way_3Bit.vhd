----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 03:46:21 PM
-- Design Name: 
-- Module Name: Mux_2x3 - Behavioral
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

entity Mux_2x3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0); -- Input signal A(3-bit)
           B : in STD_LOGIC_VECTOR (2 downto 0); -- Input signal B(3-bit)
           S : in STD_LOGIC;                     -- Select signal
           Y : out STD_LOGIC_VECTOR (2 downto 0));   -- Output signal Y(3-bit)
end Mux_2x3;

architecture Behavioral of Mux_2x3 is

begin
    process (A, B, S)
    begin
        if S = '0' then -- If S is 0, selecet input A
            Y <= A;     
        else            -- If S is 1, select input B
            Y <= B;
        end if;
    end process;
end Behavioral;
