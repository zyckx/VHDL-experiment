LIBRARY ieee
USE ieee.std_logic_1164.ALL;
ENTITY mux4 IS
    PORT (
        A0, A1, A2, A3 : IN STD_LOGIC;
        s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        y : OUT STD_LOGIC);
END mux4;

ARCHITECTURE dataflow OF mux4 IS
BEGIN
    y <= A0 WHEN s = "00" ELSE
        A1 WHEN s = "01" ELSE
        A2 WHEN s = "10" ELSE
        A3;
end dataflow;