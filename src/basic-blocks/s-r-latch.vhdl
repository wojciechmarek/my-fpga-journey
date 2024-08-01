LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY S_R_latch_top IS
    PORT (
        S : IN STD_LOGIC;
        R : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END S_R_latch_top;

ARCHITECTURE Behavioral OF S_R_latch_top IS
    SIGNAL notQ : STD_LOGIC;
BEGIN
    Q <= NOT R NOR notQ;
    notQ <= S NOR Q;
END Behavioral;