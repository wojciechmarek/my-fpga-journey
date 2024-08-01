LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY led_blink IS
    PORT (
        i_clock : IN STD_LOGIC;
        i_enable : IN STD_LOGIC;
        o_led : OUT STD_LOGIC
    );
END led_blink;

ARCHITECTURE rtl OF led_blink IS
    -- create needed frequency called c_CNT_1HZ, formula: (25 MHz / 1 Hz * 50% duty cycle)
    CONSTANT c_CNT_1HZ : NATURAL := 12500000;

    -- create signal called r_CNT_1HZ, the signal is now a couter based on the c_CNT_1HZ frequency
    SIGNAL r_CNT_1HZ : NATURAL RANGE 0 TO c_CNT_1HZ;

    -- create signal which will be toggled each 1 Hz
    SIGNAL r_TOGGLE_1HZ : STD_LOGIC := '0';
BEGIN
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
    -- negate button's state due to the pull-up resistor
    -- negate led's output due to the logical 0 lights up the led
    o_led <= NOT(r_TOGGLE_1HZ AND (NOT i_enable));
END rtl;