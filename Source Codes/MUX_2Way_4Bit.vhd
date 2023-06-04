----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:56:57 PM
-- Design Name: 
-- Module Name: Mux_2x4 - Behavioral
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

entity Mux_2x4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2x4;

architecture Behavioral of Mux_2x4 is

    component Decoder_2_to_4
        port (
            I : in  STD_LOGIC_VECTOR (1 downto 0);
            EN : in  STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal S_not : STD_LOGIC;
    signal S_inv : STD_LOGIC_VECTOR (1 downto 0);
    signal Y0, Y1 : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Inverting the select signal
    S_not <= NOT S;
    S_inv <= S_not & S;

    -- Decoder 2-to-4 for S = 0
    Decoder_2_to_4_0 : Decoder_2_to_4
        port map (
            I => S_inv,
            EN => S_not,
            Y => Y0
        );

    -- Decoder 2-to-4 for S = 1
    Decoder_2_to_4_1 : Decoder_2_to_4
        port map (
            I => S_inv,
            EN => S,
            Y => Y1
        );

    -- Output assignment based on the select signal
    Y <= (Y0 AND A) OR (Y1 AND B);

end Behavioral;
