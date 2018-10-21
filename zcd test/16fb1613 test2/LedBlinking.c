 void zcd_initialize(){
 INTCON.GIE=1;
 INTCON.PEIE=1;
 ZCD1CON=0XC2;

 PIR3.ZCDIF=0;  //FLAG
 PIE3.ZCDIE=1;   //ENABLE ZCD INT


 }
 void interrupt(){     //ZCD_ISR

  if (PIR3.ZCDIF) {


PIR3.ZCDIF=0;  //CLEAR ZCD INTERRUPT FLAG
//RC1_bit = ~ RC1_bit ;


} }







void main() {

  TRISA = 0x04;           // set direction to be output
//  RA2_bit=1;
  TRISC = 0;           // set direction to be output
  ANSELA=0x00;
  ANSELC=0x00;
WPUC=0X00;
OPTION_REG.nWPUEN=0x01;
  zcd_initialize();
while(1){
    LATA = 0xFF;       // Turn OFF LEDs on PORTA

    LATC = 0x00;       // Turn OFF LEDs on PORTC

    Delay_ms(100);    // 1 second delay

    LATA = 0x00;       // Turn ON LEDs on PORTA

    LATC = 0xFF;       // Turn ON LEDs on PORTC

    Delay_ms(100);    // 1 second delay
  }          // Endless loop
}