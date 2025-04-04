--
-- entity name: tb_g09_ARCCOS
--
-- Version 1.0
-- Authors: (Maxime Courchesne, Ian Moore)
-- Date: April 4, 2025
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_g09_ARCCOS is
end tb_g09_ARCCOS;

architecture testbench of tb_g09_ARCCOS is

    signal X      : std_logic_vector(7 downto 0) := (others => '0');
    signal angle  : std_logic_vector(9 downto 0);
    signal clk    : std_logic := '0';

component g09_ARCCOS is
    port (
        clk     : in std_logic;
        X       : in std_logic_vector(7 downto 0);
        angle   : out std_logic_vector(9 downto 0)
    );
end component;

begin
    clk_process: process
    begin
        loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    stimulus_process: process
    begin
        wait for 20 ns;

        X <= "00000000";
        wait for 40 ns;

        X <= "01000000";
        wait for 40 ns;

        X <= "10000000";
        wait for 40 ns;

        X <= "11000000";
        wait for 40 ns;

        X <= "11111111";
        wait for 40 ns;

        wait;
    end process;

    UUT: entity work.g09_ARCCOS
        port map (
            clk   => clk,
            X     => X,
            angle => angle
        );

end testbench;
