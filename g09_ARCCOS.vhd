--
-- entity name: g09_ARCCOS
--
-- Version 1.0
-- Authors: (Maxime Courchesne, Ian Moore)
-- Date: April 4, 2025
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g09_ARCCOS is
    port (
        X       : in std_logic_vector(7 downto 0);
        angle   : out std_logic_vector(9 downto 0);
        clk     : in std_logic
    );
end g09_ARCCOS;

architecture behavioral of g09_ARCCOS is
    -- Internal signals for intermediate calculation steps
	 signal XTEMP : std_logic_vector(7 downto 0);
    signal X_unsigned : unsigned(7 downto 0);
    signal X2    : unsigned(15 downto 0);  -- X^2
    signal P1    : unsigned(15 downto 0);  -- [86 * X2] / 2^16
    signal S1    : unsigned(15 downto 0);  -- 191 + P1
    signal P2    : unsigned(15 downto 0);  -- [S1 * X2] / 2^16
    signal S2    : unsigned(15 downto 0);  -- 1144 + P2
    signal P3    : unsigned(15 downto 0);  -- [S2 * X] / 2^9
    signal angle_temp : unsigned(15 downto 0);  -- 900 - P3
    signal angle_reg  : std_logic_vector(9 downto 0);  -- Registered output

begin
    X_unsigned <= unsigned(XTEMP);
    X2 <= X_unsigned * X_unsigned;
    P1 <= resize(shift_right(resize(to_unsigned(86, 8) * X2, 32), 16), 16);
    S1 <= to_unsigned(191, 16) + P1;
    P2 <= resize(shift_right(resize(S1 * X2, 32), 16), 16);
    S2 <= to_unsigned(1144, 16) + P2;
    P3 <= resize(shift_right(resize(S2 * X_unsigned, 24), 9), 16);
    angle_temp <= to_unsigned(900, 16) - P3;

    process(clk)
    begin
        if rising_edge(clk) then
				XTEMP <= X;
            angle_reg <= std_logic_vector(resize(angle_temp, 10));
        end if;
    end process;
    
    angle <= angle_reg;

end behavioral;
