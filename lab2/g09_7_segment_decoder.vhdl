LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
entity g09_7_segment_decoder is
    port ( value : in std_logic_vector(3 downto 0);
        RB_In : in std_logic;
        RB_Out : out std_logic;
        segments : out std_logic_vector(6 downto 0)
    );
end g09_7_segment_decoder;

process (value, RB_In)
begin
    IF RB_In = '1' AND value = "0000" THEN
        segments <= "1111111";
        RB_Out <= '1';
    ELSE
        CASE value IS
            WHEN "0000" => -- 0
                segments <= "1000000";
            WHEN "0001" => -- 1
                segments <= "1111001";
            WHEN "0010" => -- 2
                segments <= "0100100";  
            WHEN "0011" => -- 3
                segments <= "0110000";
            WHEN "0100" => -- 4
                segments <= "0011001";
            WHEN "0101" => -- 5
                segments <= "0010010";
            WHEN "0110" => -- 6
                segments <= "0010010";
            WHEN "0111" => -- 7
                segments <= "0010010";
            WHEN "1000" => -- 8
                segments <= "0010010";
            WHEN "1001" => -- 9
                segments <= "0010010";
            WHEN others =>
                segments <= "1111111"; 
        END CASE;
        RB_Out <= '0';
    END IF;
end process;