LIBRARY  IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY DECL8S IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        seg_dig1 : OUT STD_LOGIC;
        LED8S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY DECL8S;
ARCHITECTURE ONE OF DECL8S IS --板子上的数码管为共阳极
    SEG_DIG1 <= '1';
    PROCESS (A)
    BEGIN
        CASE A IS

            WHEN "0000" => LED8S <= "00000011"; --0    
            WHEN "0001" => LED8S <= "10011111";--1
            WHEN "0010" => LED8S <= "00100101";--2
            WHEN "0011" => LED8S <= "00001101";--3
            WHEN "0100" => LED8S <= "10011001";--4
            WHEN "0101" => LED8S <= "01001001";--5
            WHEN "0110" => LED8S <= "01000001";--6
            WHEN "0111" => LED8S <= "00011111";--7
            WHEN "1000" => LED8S <= "00000001";--8
            WHEN "1001" => LED8S <= "00001001";--9
            WHEN "1010" => LED8S <= "00010001";--A
            WHEN "1011" => LED8S <= "11000001";--B
            WHEN "1100" => LED8S <= "01100011";--C
            WHEN "1101" => LED8S <= "10000101";--D
            WHEN "1110" => LED8S <= "01100001";--E
            WHEN "1111" => LED8S <= "01110001";--F
                -- WHEN OTHERS => LED8S <= "11111111";--其他情况全灭
            WHEN OTHERS => NULL;--其他情况全灭
        END CASE;

    END PROCESS; -- identifier

END ARCHITECTURE ONE;