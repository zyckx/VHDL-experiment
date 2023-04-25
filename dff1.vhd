LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dff1 IS
    PORT (
        CLK : IN STD_LOGIC;
        D : IN STD_LOGIC;
        Q : IN STD_LOGIC
    );
END dff1;
ARCHITECTURE bhv OF dff1 IS
    SIGNAL Q1 : STD_LOGIC;
BEGIN
    PROCESS (CLK, D)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            Q1 <= D;
        END IF;
    END PROCESS;
    Q <= Q1;
END bhv;