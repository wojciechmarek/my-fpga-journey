LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY led_blink IS
    -- define input and output
    PORT (
        i_clock : IN STD_LOGIC;
        o_led : OUT STD_LOGIC
    );
END led_blink;

ARCHITECTURE rtl OF led_blink IS
    -- create needed frequency called c_CNT_1HZ, formula: (25 MHz / 1 Hz * 50% duty cycle)
    CONSTANT c_CNT_1HZ : NATURAL := 12500000;

    -- create signal called r_CNT_1HZ, the signal is now a couter based on the c_CNT_1HZ frequency
    SIGNAL r_CNT_1HZ : NATURAL RANGE 0 TO c_CNT_1HZ;

    -- create signal which will be toggled each 1 Hz, initial value is 0
    SIGNAL r_TOGGLE_1HZ : STD_LOGIC := '0';
BEGIN

    -- create a process called p_1_HZ
    p_1_HZ : PROCESS (i_clock) IS
    BEGIN

        -- block toggles r_TOGGLE_1HZ based on counter and buil-in clock
        IF rising_edge(i_clock) THEN
            IF r_CNT_1HZ = c_CNT_1HZ - 1 THEN
                r_TOGGLE_1HZ <= NOT r_TOGGLE_1HZ;
                r_CNT_1HZ <= 0;
            ELSE
                r_CNT_1HZ <= r_CNT_1HZ + 1;
            END IF;
        END IF;
    END PROCESS p_1_HZ;

    -- assign signal toggled every 1Hz to the output
    o_led <= r_TOGGLE_1HZ;
END rtl;