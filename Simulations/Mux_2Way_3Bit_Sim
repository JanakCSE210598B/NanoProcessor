----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:29:29 PM
-- Design Name: 
-- Module Name: Mux_2x3_Sim - Behavioral
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

entity Mux_2x3_Sim is
--  Port ( );
end Mux_2x3_Sim;

architecture Behavioral of Mux_2x3_Sim is

    -- Component declaration for the DUT (Design Under Test)
component Mux_2x3
    Port (
        A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (2 downto 0);
        S : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

    -- Signals for testbench
    signal A_tb, B_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal S_tb : STD_LOGIC;
    signal Y_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the Mux_2x3 module
    UUT: Mux_2x3
        port map (
            A => A_tb,
            B => B_tb,
            S => S_tb,
            Y => Y_tb
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize inputs -> 0 0 1 1 0 0 1 1 0 1 1 0 1 0 1 0 0 1 1 0
        A_tb <= "110";
        B_tb <= "101";
        S_tb <= '0';

        -- Testcase 1: S = 0, A selected
        S_tb <= '0';
        A_tb <= "110";
        B_tb <= "100";
        wait for 100 ns;

        -- Testcase 2: S = 1, B selected
        S_tb <= '1';
        A_tb <= "010";
        B_tb <= "011";
        wait for 100 ns;

        -- Testcase 3: S = 0, A selected
        S_tb <= '0';
        A_tb <= "011";
        B_tb <= "110";
        wait for 100 ns;

        -- Testcase 4: S = 1, B selected
        S_tb <= '1';
        A_tb <= "100";
        B_tb <= "010";
        wait for 100 ns;

        -- Add more testcases as needed

        wait;
    end process;

end Behavioral;
