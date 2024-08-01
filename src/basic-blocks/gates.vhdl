LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY gates IS
    PORT (
        input1 : IN STD_LOGIC;
        input2 : IN STD_LOGIC;
        output : OUT STD_LOGIC
    );
END gates;

ARCHITECTURE behavioral OF gates IS
BEGIN
    output <= NOT input1;
    output <= input1 AND input2;
    output <= input1 OR input2;
    output <= input1 XOR input2;
END behavioral;