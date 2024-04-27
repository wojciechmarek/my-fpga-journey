# My FPGA Journey

This repository is a loose set of all my tries to play with the main FPGA programming languages - VHDL and Verilog.

## Development board

Most of the code is developed to run on [Tang Nano 1K](https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-1K/Nano-1k.html).

### Hardware overview

- **FPGA Chip**: GW1NZ series (first generation of the LittleBee family)
- **LUT4**: 1152
- **Register**: 864
- **Block SRAM (bits)**: 72K
- **Shadow SRAM (bits)**: 4K
- **User Flash (bits)**: 64K
- **Buttons - 2 user programmable buttons**
- **LED Onboard - 1 programmable RGB LED**
- **Core Voltage (LV)**: 1.2V
- **BankVoltage**: The default 3.3 V
- **Write cycles**: 10000
- **IO ports amperage**: 4mA, 8mA, 16mA, 24mA
- **IO ports features**: Independent bus keeper, pull-up / pull-down resistor and open drain output
- **IO ports interfaces**: FPC - Flexible Printed Circuit


### Board and pinout

![TN1K](./images/Tang_Nano_1K.png)

## Development software

The Tang Nano 1K comes with free (education) version of it's native IDE - [GOWIN](https://www.gowinsemi.com/en/). It supports both Verilog and VHDL.

## Sources

- [In Polish: Wprowadzenie do opisu sprzętu w układach FPGA z wykorzystaniem języka VHDL](https://sii.pl/blog/wprowadzenie-do-opisu-sprzetu-w-ukladach-fpga-z-wykorzystaniem-jezyka-vhdl/)
- [Tutorial 9: S-R Latch in VHDL](https://startingelectronics.org/software/VHDL-CPLD-course/tut9-SR-latch/)
- [VHDL Tutorials and Examples](https://nandland.com/learn-vhdl/)