LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY led_blink IS
    PORT (
        i_clock : IN STD_LOGIC;
        i_increase_speed : IN STD_LOGIC;
        o_led : OUT STD_LOGIC
    );
END led_blink;

ARCHITECTURE rtl OF led_blink IS
    -- create needed frequencies, formula: (25 MHz / 10 Hz * 50% duty cycle) for the first constant
    CONSTANT c_CNT_10HZ : NATURAL := 1250000;
    CONSTANT c_CNT_1HZ : NATURAL := 12500000;

    -- create signals, the signals are now a couter based on the its frequency
    SIGNAL r_CNT_10HZ : NATURAL RANGE 0 TO c_CNT_10HZ;
    SIGNAL r_CNT_1HZ : NATURAL RANGE 0 TO c_CNT_1HZ;

    -- create signal which will be toggled each 1 Hz or 10Hz
    SIGNAL r_TOGGLE_10HZ : STD_LOGIC := '0';
    SIGNAL r_TOGGLE_1HZ : STD_LOGIC := '0';
BEGIN
    p_10_HZ : PROCESS (i_clock) IS
    BEGIN
        IF rising_edge(i_clock) THEN
            IF r_CNT_10HZ = c_CNT_10HZ - 1 THEN
                r_TOGGLE_10HZ <= NOT r_TOGGLE_10HZ;
                r_CNT_10HZ <= 0;
            ELSE
                r_CNT_10HZ <= r_CNT_10HZ + 1;
            END IF;
        END IF;
    END PROCESS p_10_HZ;

    p_1_HZ : PROCESS (i_clock) IS
    BEGIN
        IF rising_edge(i_clock) THEN
            IF r_CNT_1HZ = c_CNT_1HZ - 1 THEN
                r_TOGGLE_1HZ <= NOT r_TOGGLE_1HZ;
                r_CNT_1HZ <= 0;
            ELSE
                r_CNT_1HZ <= r_CNT_1HZ + 1;
            END IF;
        END IF;
    END PROCESS p_1_HZ;

    -- i_increase_speed = '0' activates 10Hz because pressed button gives logical 0, unpressed gives logical 1
    o_led <= r_TOGGLE_10HZ WHEN i_increase_speed = '0' ELSE
        r_TOGGLE_1HZ;
END rtl;