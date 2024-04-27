LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_gate IS
    PORT (
        i_button_a, i_button_b : IN STD_LOGIC;
        o_led : OUT STD_LOGIC
    );
END and_gate;

ARCHITECTURE and_gate_architecture OF and_gate IS
    SIGNAL r_btn_a_neg, r_btn_b_neg, r_led_neg : STD_LOGIC;

    -- f_and_gate = f_ means it is a function
    FUNCTION f_and_gate (
        r_input1 : IN STD_LOGIC;
        r_input2 : IN STD_LOGIC
    ) RETURN STD_LOGIC IS
        VARIABLE v_temporary_value : STD_LOGIC;
    BEGIN
        v_temporary_value := r_input1 AND r_input2;
        RETURN STD_LOGIC(v_temporary_value);
    END;

BEGIN
    r_btn_a_neg <= NOT i_button_a;
    r_btn_b_neg <= NOT i_button_b;
    o_led <= NOT r_led_neg;

    r_led_neg <= f_and_gate(r_btn_a_neg, r_btn_b_neg);
END and_gate_architecture;