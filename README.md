# My FPGA Journey

This repository is a loose set of all my tries to play with the main FPGA programming languages - VHDL and Verilog.

## Development board

Most of the code is developed to run on [Tang Nano 1K](https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-1K/Nano-1k.html).

### Hardware overview

- **LUT4**: 1152
- **Register**: 864
- **Block SRAM (bits)**: 72K
- **User Flash (bits)**: 64K
- **Button 2 user programmable buttons**
- **LED Onboard 1 programmable RGB LED**
- **Core Voltage (LV)**: 1.2V
- **BankVoltage**: The default 3.3 V


### Board and pinout

![TN1K](./Tang%20Nano%201K.png)

## Development software

The Tang Nano 1K comes with free (education) version of it's native IDE - [GOWIN](https://www.gowinsemi.com/en/). It supports both Verilog and VHDL.