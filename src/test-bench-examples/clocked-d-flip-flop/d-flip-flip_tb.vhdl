LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;

ENTITY d_flip_flop_tb IS
END;

ARCHITECTURE bench OF d_flip_flop_tb IS

    COMPONENT d_flip_flop
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            d : IN STD_LOGIC;
            q : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL rst : STD_LOGIC;
    SIGNAL d : STD_LOGIC;
    SIGNAL q : STD_LOGIC;

    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN;

BEGIN

    uut : d_flip_flop PORT MAP(
        clk => clk,
        rst => rst,
        d => d,
        q => q);

    stimulus : PROCESS
    BEGIN

        -- Put initialisation code here
        -- Put test bench stimulus code here

        stop_the_clock <= true;
        WAIT;
    END PROCESS;

    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;

END;