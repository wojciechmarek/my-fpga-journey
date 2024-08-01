LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY example_and IS
  PORT (
    input_1 : IN STD_LOGIC;
    input_2 : IN STD_LOGIC;
    and_result : OUT STD_LOGIC
  );
END example_and;

ARCHITECTURE rtl OF example_and IS
  SIGNAL and_gate : STD_LOGIC;
BEGIN
  and_gate <= input_1 AND input_2;
  and_result <= and_gate;
END rtl;