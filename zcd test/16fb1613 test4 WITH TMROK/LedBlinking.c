#define Air_Heater_Driver_PWM LATC.F4


unsigned int CntTmr1ToFiring = 1 ;
unsigned char FiringAngleDelay=0;
int FiringFlag=0;
unsigned short tmrflag=0;




 /******inilization tmr******/
void InitTimer0(){
      OPTION_REG         = 0x88;
      TMR0                 = 156;
      INTCON         = 0xA0;
     }
 
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
        FiringAngleDelay = 66;
        TMR0IE_bit = 1;
  /*switch(FiringFlag){
                 case 0: TMR0IE_bit = 0;           // PWM OFF
                 break ;
                 case 1: TMR0IE_bit = 1;FiringAngleDelay = 35;
                 break ;
                 case 2: FiringAngleDelay = 45;                 // == 3.50 ms
                 TMR0IE_bit = 1;
                 break ;
                 case 3: FiringAngleDelay = 66;             // == 4.50 ms
                 TMR0IE_bit = 1;
                 break ;
                 case 4: FiringAngleDelay = 80;                // == 5.20 ms
                 TMR0IE_bit = 1;
                 break ;
                }*/

        }



     if (TMR0IF_bit){
         TMR0IF_bit         = 0;
         TMR0                 = 156;
         CntTmr1ToFiring++;


    if (CntTmr1ToFiring == FiringAngleDelay ){

             Air_Heater_Driver_PWM   = 0 ;
             tmrflag=1;
             
            }
         if((CntTmr1ToFiring == FiringAngleDelay+3) ){
             Air_Heater_Driver_PWM   = 1 ;
             CntTmr1ToFiring         = 0 ;
             tmrflag=1;
             TMR0IE_bit              = 0 ;

            }
        }






}







void main() {

  TRISA = 0x04;           // set direction to be output
//  RA2_bit=1;
  TRISC = 0;           // set direction to be output
  ANSELA=0x00;
  ANSELC=0x00;
WPUC=0X00;
OPTION_REG.nWPUEN=0x01;
  zcd_initialize();
  InitTimer0();
  Air_Heater_Driver_PWM=0;
while(1){

    LATA = 0xFF;       // Turn OFF LEDs on PORTA
  // Air_Heater_Driver_PWM=0 ;
   // LATC = 0x00;       // Turn OFF LEDs on PORTC

    Delay_ms(100);    // 1 second delay
    //Air_Heater_Driver_PWM=1;
    LATA = 0x00;       // Turn ON LEDs on PORTA

    //LATC = 0xFF;       // Turn ON LEDs on PORTC
    
    Delay_ms(100);    // 1 second delay
  }          // Endless loop
}