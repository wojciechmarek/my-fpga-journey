# Logic gates

The most basic code examples of the Tang Nano 1K.

## Buttons

Button A and Button B are with external pull-up resistors to the locations:
- pin 13 - button A,
- pin 44 - button B.

Regarding the fact of build-in pull-up feature, the pins are receiving logical 1 when the buttons are unpressed, and logic 0 when the buttons are being pressed. Hence, the examples are negating the input values from the buttons to work with classic positive logic (button unpressed for local 0, button pressed for local 1).

## LED

Each color of the RGB LED is connected to the locations:
- pin 9 - red color,
- pin 10 - blue color,
- pin 11 - green color.

The RGB LED is a classical common-anode (common +) RGB LED. Regarding that, the positive terminals of each LED are connected all the time to the power level - VBank (logical 1). To light up the LED we have to provide a logical 0 to io t's second terminal. Because we operate with positive logic in the chip, we have to negate the output value to provide logical 0.

## Demo

### Sample OR Gate design

![or](./images/or-design.png)

### Pins configuration

![or](./images/io-configuration.png)