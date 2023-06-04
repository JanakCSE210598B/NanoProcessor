----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 06:04:38 PM
-- Design Name: 
-- Module Name: Mux_2x4_Sim - Behavioral
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

entity Mux_2x4_Sim is
--  Port ( );
end Mux_2x4_Sim;

architecture Behavioral of Mux_2x4_Sim is

    -- Component declaration for the DUT (Design Under Test)
    component Mux_2x4
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Testbench signals
    signal A_tb, B_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal S_tb : STD_LOGIC;
    signal Y_tb : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instantiate the DUT
    uut: Mux_2x4
        port map (
            A => A_tb,
            B => B_tb,
            S => S_tb,
            Y => Y_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs -210598 -> 0 0 1 1 0 0 1 1 0 1 1 0 1 0 1 0 0 1 1 0

        A_tb <= "0110";
        B_tb <= "1010";
        S_tb <= '0';

        -- Testcase 1: S = 0
        S_tb <= '0';
        A_tb <= "0110";
        B_tb <= "0011";
        wait for 100 ns;

        -- Testcase 2: S = 1
        S_tb <= '1';
        A_tb <= "0011";
        B_tb <= "0110";
        wait for 100 ns;

        -- Testcase 3: S = 0
        S_tb <= '0';
        A_tb <= "1010";
        B_tb <= "0110";
        wait for 100 ns;

        -- Testcase 4: S = 1
        S_tb <= '1';
        A_tb <= "0011";
        B_tb <= "0011";
        wait for 100 ns;

        -- End the simulation
        wait;
    end process;

end Behavioral;
