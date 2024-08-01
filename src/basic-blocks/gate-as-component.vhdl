----- and gate component -----
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_gate_component IS
    PORT (
        i1, i2 : IN STD_LOGIC;
        o : OUT STD_LOGIC);
END and_gate_component;

ARCHITECTURE and_gate_component_arch OF and_gate_component IS
BEGIN
    PROCESS (i1, i2)
    BEGIN
        o <= i1 AND i2;
    END PROCESS;
END and_gate_component_arch;

----- main code -----
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

    COMPONENT and_gate_component IS
        PORT (
            i1, i2 : IN STD_LOGIC;
            o : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    r_btn_a_neg <= NOT i_button_a;
    r_btn_b_neg <= NOT i_button_b;
    o_led <= NOT r_led_neg;

    AND_GATE1 : and_gate_component PORT MAP(i1 => r_btn_a_neg, i2 => r_btn_b_neg, o => r_led_neg);
END and_gate_architecture;