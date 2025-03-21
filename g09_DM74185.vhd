--
-- entity name: g09_DM74185
--
-- Version 1.0
-- Authors: Maxime Courchesne, Ian Moore
-- Date: March 21, 2025

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;

entity g09_DM74185 is
  port ( EDCBA : in std_logic_vector(4 downto 0);
			Y : out std_logic_vector(5 downto 0) );
end g09_DM74185;

architecture implementation of g09_DM74185 is
begin
	convert_BCD : process (EDCBA)
	begin
		case EDCBA is
			when "00000" =>
				Y <= "000000"; -- 0 1
			when "00001" =>
				Y <= "000001"; -- 2 3
			when "00010" =>
				Y <= "000010"; -- 4 5
			when "00011" =>
				Y <= "000011"; -- 6 7
			when "00100" =>
				Y <= "000100"; -- 8 9
			when "00101" =>
				Y <= "001000"; -- 10 11
			when "00110" =>
				Y <= "001001"; -- 12 13
			when "00111" =>
				Y <= "001010"; -- 14 15
			when "01000" =>
				Y <= "001011"; -- 16 17
			when "01001" =>
				Y <= "001100"; -- 18 19
			when "01010" =>
				Y <= "010000"; -- 20 21
			when "01011" =>
				Y <= "010001"; -- 22 23
			when "01100" =>
				Y <= "010010"; -- 24 25
			when "01101" =>
				Y <= "010011"; -- 26 27
			when "01110" =>
				Y <= "010100"; -- 28 29
			when "01111" =>
				Y <= "011000"; -- 30 31
			when "10000" =>
				Y <= "011001"; -- 32 33
			when "10001" =>
				Y <= "011010"; -- 34 35
			when "10010" =>
				Y <= "011011"; -- 36 37
			when "10011" =>
				Y <= "011100"; -- 38 39
			when "10100" =>
				Y <= "100000"; -- 40 41
			when "10101" =>
				Y <= "100001"; -- 42 43
			when "10110" =>
				Y <= "100010"; -- 44 45
			when "10111" =>
				Y <= "100011"; -- 46 47
			when "11000" =>
				Y <= "100100"; -- 48 49
			when "11001" =>
				Y <= "101000"; -- 50 51
			when "11010" =>
				Y <= "101001"; -- 52 53
			when "11011" =>
				Y <= "101010"; -- 54 55
			when "11100" =>
				Y <= "101011"; -- 56 57
			when "11101" =>
				Y <= "101100"; -- 58 59
			when "11110" =>
				Y <= "110000"; -- 60 61
			when "11111" =>
				Y <= "110001"; -- 62 63
		end case;
	end process;
end implementation;