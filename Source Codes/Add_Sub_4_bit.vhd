----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 01:35:03 AM
-- Design Name: 
-- Module Name: Add_Sub_4_bit - Behavioral
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
entity Add_Sub_4_bit is
    Port ( Mode : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC;
           Zero, Overflow : out STD_LOGIC);
           
end Add_Sub_4_bit;

architecture Behavioral of Add_Sub_4_bit is
    component FA is
        port (
            A: in std_logic;
            B: in std_logic;
            C_in: in std_logic;
            S: out std_logic;
            C_out: out std_logic);
    end component;

    signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, C_out : std_logic;
    signal O,B_in : std_logic_vector(3 downto 0);
    
begin
    B_in(0) <= B(0) xor Mode;
    B_in(1) <= B(1) xor Mode;
    B_in(2) <= B(2) xor Mode;
    B_in(3) <= B(3) xor Mode;

    FA_0 : FA
        port map (
            A => A(0),
            B => B_in(0),
            C_in => Mode,
            S => O(0),
            C_out => FA0_C);

    FA_1 : FA
        port map (
            A => A(1),
            B => B_in(1),
            C_in => FA0_C,
            S => O(1),
            C_out => FA1_C);

    FA_2 : FA
        port map (
            A => A(2),
            B => B_in(2),
            C_in => FA1_C,
            S => O(2),
            C_out => FA2_C);

    FA_3 : FA
        port map (
            A => A(3),
            B => B_in(3),
            C_in => FA2_C,
            S => O(3),
            C_out => C_out);

    Zero <= not (O(0) or O(1) or O(2) or O(3) or C_out);
    Overflow <= FA2_C nor c_out;
    
    S <= O  ;
    C <= C_out;
    
end Behavioral;
