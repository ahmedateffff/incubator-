/*
 * Project name:
     LED_Blinking (Simple 'Hello World' project)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110929:
       - initial release (FJ);
 * Description:
     This is a simple 'Hello World' project. It turns on/off LEDs connected to
     PORTA, PORTB, PORTC, PORTD and PORTE. 
 * Test configuration:
     MCU:             PIC18F45K22
                      http://ww1.microchip.com/downloads/en/DeviceDoc/41412D.pdf
     Dev.Board:       EasyPIC7 - ac:LEDs
                      http://www.mikroe.com/easypic/
     Oscillator:      HS-PLL 32.0000 MHz, 8.0000 MHz Crystal
     Ext. Modules:    None.
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/mikroc/pic/
 * NOTES:
     - Turn ON the PORT LEDs at SW3.
 */

void main() {

  TRISA = 0;           // set direction to be output

  TRISC = 0;           // set direction to be output


  do {
    LATA = 0x00;       // Turn OFF LEDs on PORTA

    LATC = 0x00;       // Turn OFF LEDs on PORTC

    Delay_ms(500);    // 1 second delay

    LATA = 0xFF;       // Turn ON LEDs on PORTA

    LATC = 0xFF;       // Turn ON LEDs on PORTC

    Delay_ms(1000);    // 1 second delay
  } while(1);          // Endless loop
}