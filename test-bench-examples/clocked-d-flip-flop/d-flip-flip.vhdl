LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flip_flop IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        d : IN STD_LOGIC;
        q : OUT STD_LOGIC
    );
END d_flip_flop;

ARCHITECTURE behavioral OF d_flip_flop IS
BEGIN

    PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF (rst = '0') THEN
                q <= '1';
            ELSE
                q <= d;
            END IF;
        END IF;
    END PROCESS;

END behavioral;