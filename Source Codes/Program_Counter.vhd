----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 01:49:37 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is
    component D_FF is
        Port (
            D : in STD_LOGIC;
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    signal D0, D1, D2 : STD_LOGIC; -- Internal signals
    signal Q0, Q1, Q2 : STD_LOGIC; -- Internal signals

begin
    D0 <= ((not Q2) and (not Reset)) or (Q1 and Reset);
    D1 <= ((not Reset) and Q0) or (Reset and Q2);
    D2 <= ((not Reset) and Q1) or (Reset and (not Q0));

    D_FF0 : D_FF
    port map (
        D => D0,
        Res => Reset,
        Clk => Clk,
        Q => Q0,
        Qbar => open
    );

    D_FF1 : D_FF
    port map (
        D => D1,
        Res => Reset,
        Clk => Clk,
        Q => Q1,
        Qbar => open
    );

    D_FF2 : D_FF
    port map (
        D => D2,
        Res => Reset,
        Clk => Clk,
        Q => Q2,
        Qbar => open
    );

    Q <= Q2 & Q1 & Q0; -- Concatenate Q2, Q1, and Q0 to form a 3-bit vector

end Behavioral;
