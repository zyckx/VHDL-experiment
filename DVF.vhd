LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY DVF IS
    PORT (
        CLK : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        FOUT : OUT STD_LOGIC
    );
END ENTITY DVF;
ARCHITECTURE one OF DVF IS
    SIGNAL FULL : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    P_REG : PROCESS (CLK)
        VARIABLE CNT8 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            IF CNT8 = "11111111" THEN
                CNT8 := D;
                FULL <= '1';
            ELSE
                CNT8 := CNT8 + 1;
                FULL <= '0';
            END IF;
        END IF;
    END PROCESS P_REG;
    P_DIV : PROCESS (FULL)
        VARIABLE CNT2 : STD_LOGIC;
    BEGIN
        IF FULL'event AND FULL = '1' THEN
            CNT2 := NOT CNT2;
            IF CNT2 = '1' THEN
                FOUT <= '1';
            ELSE
                FOUT <= '0';
            END IF;
        END IF;
    END PROCESS P_DIV;
END ARCHITECTURE one;