LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY example_gate IS
    PORT (
        button_a : IN STD_LOGIC;
        button_b : IN STD_LOGIC;
        led : OUT STD_LOGIC
    );
END example_gate;

ARCHITECTURE rtl OF example_gate IS
    SIGNAL gate_result : STD_LOGIC;
BEGIN
    gate_result <= (NOT button_a) XNOR (NOT button_b);
    led <= NOT gate_result;
END rtl;