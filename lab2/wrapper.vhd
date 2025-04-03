LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity wrapper is
    Port (  SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7 : in std_logic;
            CLK : in std_logic;
            segment0, segment1, segment2, segment3 : out std_logic_vector(6 downto 0)            
    );
end wrapper;

architecture implementation of wrapper is
    signal RB_Out0, RB_Out1, RB_Out2, RB_Out3 : std_logic;
    signal Xvec : std_logic_vector(7 downto 0);
    signal X : unsigned(7 downto 0);
    signal angle : unsigned(9 downto 0);
    signal d0, d1, d2, d3, d4 : std_logic_vector(3 downto 0);
begin
process (CLK)
begin
    Xvec <= SW7 & SW6 & SW5 & SW4 & SW3 & SW2 & SW1 & SW0;
    X <= unsigned(Xvec);

    acos : g09_ARCCOS port map (X => X, angle => angle);
    
    BCD : g09_Binary_BCD16 port map(std_logic_vector(angle) => bin, BCD1 => d0, BCD2 => d1, BCD3 => d2, BCD4 => d3, BCD5 => d4);
    
    -- d4 not used
    s3 : g09_7_segment_decoder port map(d3 => value, '1' => RB_In, segments => segment3, RB_Out => RB_Out3);
    s2 : g09_7_segment_decoder port map(d2 => value, RB_Out3 => RB_In, segments => segment2, RB_Out => RB_OUT2);
    s1 : g09_7_segment_decoder port map(d1 => value, RB_Out2 => RB_In, segments => segment1, RB_Out => RB_Out1);
    s0 : g09_7_segment_decoder port map(d0 => value, RB_Out1 => RB_In, segments => segment0, RB_Out => RB_Out0);
end process;
end implementation;