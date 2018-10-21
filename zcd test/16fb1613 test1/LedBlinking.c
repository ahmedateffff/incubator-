







void main() {

  TRISA = 0;           // set direction to be output

  TRISC = 0;           // set direction to be output


  do {
    LATA = 0x00;       // Turn OFF LEDs on PORTA

    LATC = 0x00;       // Turn OFF LEDs on PORTC

    Delay_ms(500);    // 1 second delay

    LATA = 0xFF;       // Turn ON LEDs on PORTA

    LATC = 0xFF;       // Turn ON LEDs on PORTC

    Delay_ms(500);    // 1 second delay
  } while(1);          // Endless loop
}