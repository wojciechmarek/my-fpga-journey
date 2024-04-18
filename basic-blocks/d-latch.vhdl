LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY d_latch_top IS
    PORT (
        D : IN STD_LOGIC;
        EN : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END d_latch_top;

ARCHITECTURE Behavioral OF d_latch_top IS
    SIGNAL DATA : STD_LOGIC;
BEGIN

    DATA <= D WHEN (EN = '1') ELSE
        DATA;
    Q <= DATA;

END Behavioral;