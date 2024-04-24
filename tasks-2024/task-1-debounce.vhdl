LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY debouncer IS
    PORT (
        i_clk : IN STD_LOGIC;
        i_rst : IN STD_LOGIC; -- useless
        i_data : IN STD_LOGIC;
        o_data : OUT STD_LOGIC
    );
END debouncer;

ARCHITECTURE rtl OF debouncer IS
    CONSTANT c_HIGH_PATTERN : STD_LOGIC_VECTOR(19 DOWNTO 0) := "01111111111111111111";
    CONSTANT c_LOW_PATTERN : STD_LOGIC_VECTOR(19 DOWNTO 0) := "10000000000000000000";

    SIGNAL r_IS_HIGH_STABLE : STD_LOGIC := '0';
    SIGNAL r_IS_LOW_STABLE : STD_LOGIC := '0';
    SIGNAL r_DELAY_SHIFT_HIGH : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL r_DELAY_SHIFT_LOW : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL r_debounced_data : STD_LOGIC := '0';
BEGIN
    p_rising : PROCESS (i_clk) IS
    BEGIN
        IF rising_edge(i_clk) THEN
            r_DELAY_SHIFT_HIGH(19 DOWNTO 1) <= r_DELAY_SHIFT_HIGH(18 DOWNTO 0);
            r_DELAY_SHIFT_HIGH(0) <= i_data;
            IF (r_DELAY_SHIFT_HIGH = c_HIGH_PATTERN) THEN
                r_IS_HIGH_STABLE <= '1';
            END IF;

            IF r_debounced_data = '1' THEN
                r_IS_HIGH_STABLE <= '0';
            END IF;
        END IF;
    END PROCESS p_rising;

    p_falling : PROCESS (i_clk) IS
    BEGIN
        IF falling_edge(i_clk) THEN
            r_DELAY_SHIFT_LOW(19 DOWNTO 1) <= r_DELAY_SHIFT_LOW(18 DOWNTO 0);
            r_DELAY_SHIFT_LOW(0) <= i_data;

            IF (i_data = '0') THEN
                IF (r_DELAY_SHIFT_LOW = c_LOW_PATTERN) THEN
                    r_IS_LOW_STABLE <= r_IS_HIGH_STABLE;
                END IF;
            END IF;

            IF r_debounced_data = '1' THEN
                r_IS_LOW_STABLE <= '0';
            END IF;

        END IF;

    END PROCESS p_falling;

    p_debounce : PROCESS (i_clk) IS
    BEGIN
        IF rising_edge(i_clk) THEN
            IF r_IS_LOW_STABLE = '1' THEN
                r_debounced_data <= '1';
            ELSE
                r_debounced_data <= '0';
            END IF;
        END IF;
    END PROCESS p_debounce;

    o_data <= r_debounced_data;
END rtl;