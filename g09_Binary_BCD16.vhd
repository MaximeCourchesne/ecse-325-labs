--
-- entity name: g09_Binary_BCD16
--
-- Version 1.0
-- Authors: Maxime Courchesne, Ian Moore
-- Date: March 21, 2025
library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
entity g09_Binary_BCD16 is
port ( bin : in std_logic_vector(15 downto 0);
BCD5 : out std_logic_vector(3 downto 0);
BCD4 : out std_logic_vector(3 downto 0);
BCD3 : out std_logic_vector(3 downto 0);
BCD2 : out std_logic_vector(3 downto 0);
 BCD1 : out std_logic_vector(3 downto 0) );
end g09_Binary_BCD16;

architecture implementation of g09_Binary_BCD16 is
    component g09_DM74185 is
        port ( EDCBA : in std_logic_vector(4 downto 0);
               Y : out std_logic_vector(5 downto 0) );
    end component;
    
    -- Internal signals for connecting the DM74185 modules together
    -- Stage 1 (1 component)
    signal y_stage1 : std_logic_vector(5 downto 0);
    
    -- Stage 2 (1 component)
    signal y_stage2 : std_logic_vector(5 downto 0);
    
    -- Stage 3 (2 components)
    signal y_stage3_1 : std_logic_vector(5 downto 0);
    signal y_stage3_2 : std_logic_vector(5 downto 0);
    
    -- Stage 4 (2 components)
    signal y_stage4_1 : std_logic_vector(5 downto 0);
    signal y_stage4_2 : std_logic_vector(5 downto 0);
    
    -- Stage 5 (3 components)
    signal y_stage5_1 : std_logic_vector(5 downto 0);
    signal y_stage5_2 : std_logic_vector(5 downto 0);
    signal y_stage5_3 : std_logic_vector(5 downto 0);
    
    -- Stage 6 (3 components)
    signal y_stage6_1 : std_logic_vector(5 downto 0);
    signal y_stage6_2 : std_logic_vector(5 downto 0);
    signal y_stage6_3 : std_logic_vector(5 downto 0);
    
    -- Stage 7 (3 components)
    signal y_stage7_1 : std_logic_vector(5 downto 0);
    signal y_stage7_2 : std_logic_vector(5 downto 0);
    signal y_stage7_3 : std_logic_vector(5 downto 0);
    
    -- Stage 8 (1 component)
    signal y_stage8 : std_logic_vector(5 downto 0);
    
begin

    -- Stage 2 (1 DM74185)
   stage1: g09_DM74185 port map (
        EDCBA(4) => bin(15),
        EDCBA(3) => bin(14),
        EDCBA(2) => bin(13),
        EDCBA(1) => bin(12),
        EDCBA(0) => bin(11),
        Y => y_stage1
    );
    
    -- Stage 2 (1 DM74185)
    stage2: g09_DM74185 port map (
        EDCBA(4) => y_stage1(2),
        EDCBA(3) => y_stage1(1),
        EDCBA(2) => y_stage1(0),
        EDCBA(1) => bin(10),
        EDCBA(0) => bin(9),
        Y => y_stage2
    );
    
    -- Stage 3 (2 DM74185)
    stage3_1: g09_DM74185 port map (
        EDCBA(4) => y_stage1(5),
        EDCBA(3) => y_stage1(4),
        EDCBA(2) => y_stage1(3),
        EDCBA(1) => y_stage2(4),
        EDCBA(0) => y_stage2(3),
        Y => y_stage3_1
    );
    
    stage3_2: g09_DM74185 port map (
        EDCBA(4) => y_stage2(2),
        EDCBA(3) => y_stage2(1),
        EDCBA(2) => y_stage2(0),
        EDCBA(1) => bin(8),
        EDCBA(0) => bin(7),
        Y => y_stage3_2
    );
    
    -- Stage 4 (2 DM74185)
    stage4_1: g09_DM74185 port map (
        EDCBA(4) => y_stage3_1(2),
        EDCBA(3) => y_stage3_1(1),
        EDCBA(2) => y_stage3_1(0),
        EDCBA(1) => y_stage3_2(4),
        EDCBA(0) => y_stage3_2(3),
        Y => y_stage4_1
    );
    
    stage4_2: g09_DM74185 port map (
        EDCBA(4) => y_stage3_2(2),
        EDCBA(3) => y_stage3_2(1),
        EDCBA(2) => y_stage3_2(0),
        EDCBA(1) => bin(6),
        EDCBA(0) => bin(5),
        Y => y_stage4_2
    );
    
    -- Stage 5 (3 DM74185)
    stage5_1: g09_DM74185 port map (
        EDCBA(4) => y_stage3_1(5),
        EDCBA(3) => y_stage3_1(4),
        EDCBA(2) => y_stage3_1(3),
        EDCBA(1) => y_stage4_1(4),
        EDCBA(0) => y_stage4_1(3),
        Y => y_stage5_1
    );
    
    stage5_2: g09_DM74185 port map (
        EDCBA(4) => y_stage4_1(2),
        EDCBA(3) => y_stage4_1(1),
        EDCBA(2) => y_stage4_1(0),
        EDCBA(1) => y_stage4_2(4),
        EDCBA(0) => y_stage4_2(3),
        Y => y_stage5_2
    );
    
    stage5_3: g09_DM74185 port map (
        EDCBA(4) => y_stage4_2(2),
        EDCBA(3) => y_stage4_2(1),
        EDCBA(2) => y_stage4_2(0),
        EDCBA(1) => bin(4),
        EDCBA(0) => bin(3),
        Y => y_stage5_3
    );
    
    -- Stage 6 (3 DM74185)
    stage6_1: g09_DM74185 port map (
        EDCBA(4) => y_stage5_1(2),
        EDCBA(3) => y_stage5_1(1),
        EDCBA(2) => y_stage5_1(0),
        EDCBA(1) => y_stage5_2(4),
        EDCBA(0) => y_stage5_2(3),
        Y => y_stage6_1
    );
    
    stage6_2: g09_DM74185 port map (
        EDCBA(4) => y_stage5_2(2),
        EDCBA(3) => y_stage5_2(1),
        EDCBA(2) => y_stage5_2(0),
        EDCBA(1) => y_stage5_3(4),
        EDCBA(0) => y_stage5_3(3),
        Y => y_stage6_2
    );
    
    stage6_3: g09_DM74185 port map (
        EDCBA(4) => y_stage5_3(2),
        EDCBA(3) => y_stage5_3(1),
        EDCBA(2) => y_stage5_3(0),
        EDCBA(1) => bin(2),
        EDCBA(0) => bin(1),
        Y => y_stage6_3
    );
    
    -- Stage 7 (3 DM74185)
    stage7_1: g09_DM74185 port map (
        EDCBA(4) => y_stage5_1(5),
        EDCBA(3) => y_stage5_1(4),
        EDCBA(2) => y_stage5_1(3),
        EDCBA(1) => y_stage6_1(4),
        EDCBA(0) => y_stage6_1(3),
        Y => y_stage7_1
    );
    
    stage7_2: g09_DM74185 port map (
        EDCBA(4) => y_stage6_1(2),
        EDCBA(3) => y_stage6_1(1),
        EDCBA(2) => y_stage6_1(0),
        EDCBA(1) => y_stage6_2(4),
        EDCBA(0) => y_stage6_2(3),
        Y => y_stage7_2
    );
    
    stage7_3: g09_DM74185 port map (
        EDCBA(4) => '0',
        EDCBA(3) => y_stage6_2(2),
        EDCBA(2) => y_stage6_2(1),
        EDCBA(1) => y_stage6_2(0),
        EDCBA(0) => y_stage6_3(4),
		  Y => y_stage7_3
    );
    
    -- Stage 8 (1 DM74185)
    stage8: g09_DM74185 port map (
        EDCBA(4) => '0',
        EDCBA(3) => y_stage7_1(2),
        EDCBA(2) => y_stage7_1(1),
        EDCBA(1) => y_stage7_1(0),
        EDCBA(0) => y_stage7_2(4),
		  Y => y_stage8
    );
    
    -- Connect output signals of the DM74185 to the BCDs
    -- Digits from left to right
    BCD5 <= y_stage7_1(5 downto 3) & y_stage8(3);
    BCD4 <= y_stage8(2 downto 0) & y_stage7_2(3);
    BCD3 <= y_stage7_2(2 downto 0) & y_stage7_3(3);
    BCD2 <= y_stage7_3(2 downto 0) & y_stage6_3(3);
    BCD1 <= y_stage6_3(2 downto 0) & bin(0);
    
end implementation;