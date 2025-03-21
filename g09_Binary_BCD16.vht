LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_textio.all; -- Add this line
USE std.textio.all; -- Add this line

ENTITY g09_Binary_BCD16_vhd_tst IS
END g09_Binary_BCD16_vhd_tst;

ARCHITECTURE g09_Binary_BCD16_arch OF g09_Binary_BCD16_vhd_tst IS
    SIGNAL BCD1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL BCD2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL BCD3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL BCD4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL BCD5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL bin : STD_LOGIC_VECTOR(15 DOWNTO 0);

    COMPONENT g09_Binary_BCD16
        PORT (
            BCD1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            BCD2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            BCD3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            BCD4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            BCD5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            bin : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
    i1 : g09_Binary_BCD16
    PORT MAP (
        BCD1 => BCD1,
        BCD2 => BCD2,
        BCD3 => BCD3,
        BCD4 => BCD4,
        BCD5 => BCD5,
        bin => bin
    );

    always : PROCESS
        VARIABLE l : line; -- Variable for writing to the simulation log
    BEGIN
        bin <= (others => '0');
        WAIT FOR 5 ns;

        FOR i IN 0 TO 31 LOOP
            bin <= std_logic_vector(to_unsigned(i * 2048, 16));
            WAIT FOR 5 ns;

            -- Print the values of BCD signals
            write(l, string'("BCD1 = "));
            hwrite(l, BCD1);
            writeline(output, l);

            write(l, string'("BCD2 = "));
            hwrite(l, BCD2);
            writeline(output, l);

            write(l, string'("BCD3 = "));
            hwrite(l, BCD3);
            writeline(output, l);

            write(l, string'("BCD4 = "));
            hwrite(l, BCD4);
            writeline(output, l);

            write(l, string'("BCD5 = "));
            hwrite(l, BCD5);
            writeline(output, l);
        END LOOP;

        WAIT;
    END PROCESS always;
END g09_Binary_BCD16_arch;
