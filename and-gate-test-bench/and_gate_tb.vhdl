LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;

ENTITY and_gate_tb IS
END;

ARCHITECTURE bench OF and_gate_tb IS

    COMPONENT and_gate
        PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a : STD_LOGIC;
    SIGNAL b : STD_LOGIC;
    SIGNAL o : STD_LOGIC;

BEGIN

    uut : and_gate PORT MAP(
        a => a,
        b => b,
        o => o);

    stimulus : PROCESS
    BEGIN

        -- Put initialisation code here
        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '0';
        -- Put test bench stimulus code here

        WAIT;
    END PROCESS;
END;