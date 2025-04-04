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
    signal X : std_logic_vector(7 downto 0);
    signal angle : std_logic_vector(9 downto 0);
	 signal angle16 : std_logic_vector(15 downto 0);
    signal d0, d1, d2, d3, d4 : std_logic_vector(3 downto 0);
	 
component g09_ARCCOS is
	port (
        X       : in std_logic_vector(7 downto 0);
        angle   : out std_logic_vector(9 downto 0);
        clk     : in std_logic
    );
end component;

component g09_7_segment_decoder is
    port ( value1 : in std_logic_vector(3 downto 0);
        RB_In : in std_logic;
        RB_Out : out std_logic;
        segments : out std_logic_vector(6 downto 0)
    );
end component;

component g09_Binary_BCD16 is
port ( bin : in std_logic_vector(15 downto 0);
BCD5 : out std_logic_vector(3 downto 0);
BCD4 : out std_logic_vector(3 downto 0);
BCD3 : out std_logic_vector(3 downto 0);
BCD2 : out std_logic_vector(3 downto 0);
 BCD1 : out std_logic_vector(3 downto 0) );
end component;

begin
    X <= SW7 & SW6 & SW5 & SW4 & SW3 & SW2 & SW1 & SW0;
	 angle16 <= "000000" & angle;

    acos : g09_ARCCOS port map (X => X, angle => angle, CLK => clk);
    
    BCD : g09_Binary_BCD16 port map(bin => angle16, BCD1 => d0, BCD2 => d1, BCD3 => d2, BCD4 => d3, BCD5 => d4);
    
    -- d4 not useds
    s3 : g09_7_segment_decoder port map(value1 => d3, RB_In => '1', segments => segment3, RB_Out => RB_Out3);
    s2 : g09_7_segment_decoder port map(value1 => d2, RB_In => RB_Out3, segments => segment2, RB_Out => RB_OUT2);
    s1 : g09_7_segment_decoder port map(value1 => d1, RB_In => RB_Out2, segments => segment1, RB_Out => RB_Out1);
    s0 : g09_7_segment_decoder port map(value1 => d0, RB_In => RB_Out1, segments => segment0, RB_Out => RB_Out0);
end implementation;