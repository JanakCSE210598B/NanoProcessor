----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 03:16:33 PM
-- Design Name: 
-- Module Name: MUX_8Way_4Bit_Sim - Behavioral
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

entity MUX_8Way_4Bit_Sim is
--  Port ( );
end MUX_8Way_4Bit_Sim;

architecture Behavioral of MUX_8Way_4Bit_Sim is

    -- Component declaration for the UUT (Unit Under Test)
    component MUX_8Way_4Bit is
        Port (
            I_0 : in STD_LOGIC_VECTOR (3 downto 0);
            I_1 : in STD_LOGIC_VECTOR (3 downto 0);
            I_2 : in STD_LOGIC_VECTOR (3 downto 0);
            I_3 : in STD_LOGIC_VECTOR (3 downto 0);
            I_4 : in STD_LOGIC_VECTOR (3 downto 0);
            I_5 : in STD_LOGIC_VECTOR (3 downto 0);
            I_6 : in STD_LOGIC_VECTOR (3 downto 0);
            I_7 : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signal declarations for testbench
    signal I_0_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_1_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_2_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_3_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_4_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_5_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_6_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_7_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal S_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Y_tb : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the UUT
    UUT : MUX_8Way_4Bit
        port map (
            I_0 => I_0_tb,
            I_1 => I_1_tb,
            I_2 => I_2_tb,
            I_3 => I_3_tb,
            I_4 => I_4_tb,
            I_5 => I_5_tb,
            I_6 => I_6_tb,
            I_7 => I_7_tb,
            S => S_tb,
            Y => Y_tb
        );

    -- Stimulus process to provide testbench inputs
    stimulus_process : process
    begin
        -- Test Case  - 0 0 1 1 0 0 1 1 0 1 1 0 1 0 1 0 0 1 1 0
        I_0_tb <= "0110";
        I_1_tb <= "1010";
        I_2_tb <= "0110";
        I_3_tb <= "0011";
        I_4_tb <= "0011";
        I_5_tb <= "0110";
        I_6_tb <= "1010";
        I_7_tb <= "0110";
        S_tb <= "000";
        
        -- Wait for simulation to finish
        wait;
    end process;

end Behavioral;
