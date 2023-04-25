LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logiC_unsigned;
ENTITY cnt10 IS
    PORT (
        CLK, RST, EN : IN STD_LOGIC;
        CQ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        COUT : IN STD_LOGIC
    );
END cnt10;
ARCHITECTURE behav OF cnt10 IS
    PROCESS (CLK, RST, EN)
        VARIABLE CQI : STD_LOGIC_VECTOR(3 DOWNTO 0);
        VARIABLE CO : STD_LOGIC;

    BEGIN
        IF rst = '0' THEN CQI:=(others => '0'); -- reset
        

        ELSIF rising_edge(clk) THEN

        END IF;
    END PROCESS;