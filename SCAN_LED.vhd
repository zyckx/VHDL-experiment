LIBRARY  IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY SCAN_LED IS
    PORT (
        CLK : IN STD_LOGIC;
        SG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        BT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY SCAN_LED;
ARCHITECTURE ONE OF SCAN_LED IS
    SIGNAL CNT4 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    P1 : PROCESS (CNT4)
    BEGIN
        CASE CNT4 IS
            WHEN “00 => BT <= "1000";
                A <= "0001";
            WHEN “01 => BT <= "0100";
                A <= "0101";
            WHEN “10 => BT <= "0010";
                A <= "1001";
            WHEN “11 => BT <= "0001";
                A <= "1101";
            WHEN OTHERS => NULL
        END CASE;
    END PROCESS P1;
    P2 : PROCESS (CLK)
    BEGIN
        IF CLK'event AND CLK = '1' THEN
            CNT4 <= CNT4 + 1;
        END IF;
    END PROCESS P2;
    P3 : PROCESS (A)
    BEGIN
        CASE A IS
            WHEN "0000" => SG <= "00000011";--0
            WHEN "0001" => SG <= "10011111";--1
            WHEN "0010" => SG <= "00100101";--2
            WHEN "0011" => SG <= "00001101";--3
            WHEN "0100" => SG <= "10011001";--4
            WHEN "0101" => SG <= "01001001";--5
            WHEN "0110" => SG <= "01000001";--6
            WHEN "0111" => SG <= "00011111";--7
            WHEN "1000" => SG <= "00000001";--8
            WHEN "1001" => SG <= "00001001";--9
            WHEN "1010" => SG <= "00010001";--A
            WHEN "1011" => SG <= "11000001";--B
            WHEN "1100" => SG <= "01100011";--C
            WHEN "1101" => SG <= "10000101";--D
            WHEN "1110" => SG <= "01100001";--E
            WHEN "1111" => SG <= "01110001";--F
            WHEN OTHERS => NULL
        END CASE;
    END PROCESS P3; -- identifier

END ARCHITECTURE ONE;