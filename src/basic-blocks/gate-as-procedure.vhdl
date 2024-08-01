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

    -- p_and_gate = p_ means it is a procedure
    PROCEDURE p_and_gate(
        SIGNAL r_input1 : IN STD_LOGIC;
        SIGNAL r_input2 : IN STD_LOGIC;
        SIGNAL r_output : OUT STD_LOGIC
    ) IS
    BEGIN
        r_output <= (r_input1 AND r_input2);
    END p_and_gate;

BEGIN
    r_btn_a_neg <= NOT i_button_a;
    r_btn_b_neg <= NOT i_button_b;
    o_led <= NOT r_led_neg;

    p_and_gate(r_btn_a_neg, r_btn_b_neg, r_led_neg);
END and_gate_architecture;