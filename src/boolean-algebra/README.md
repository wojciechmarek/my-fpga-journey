# Boolean algebra

## Q = A*B+A'

The Truth Table and Schematic:

![image1](../../assets/boolean-algebra-images/circuit1.png)

VHDL Code:

```vhdl
q <= (a AND b) OR (NOT a);
```

Synthesis (extra NOT gates are due to the buttons' pull-up resistors and LED's connection to the chip):

![image1-syn](../../assets/boolean-algebra-images/circuit1-rtl.png)