LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_gate IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END and_gate;

ARCHITECTURE Behavioral OF and_gate IS

BEGIN
    o <= a AND b;
END Behavioral;