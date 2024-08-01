LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY boolean_algebra IS
    PORT (
        input_a : IN STD_LOGIC;
        input_b : IN STD_LOGIC;
        output_q : OUT STD_LOGIC
    );
END boolean_algebra;

ARCHITECTURE rtl OF boolean_algebra IS
    SIGNAL a : STD_LOGIC;
    SIGNAL b : STD_LOGIC;
    SIGNAL q : STD_LOGIC;
BEGIN
    a <= NOT input_a;
    b <= NOT input_b;

    -- Q = A*B+A'
    q <= (a AND b) OR (NOT a);

    output_q <= NOT q;
END rtl;