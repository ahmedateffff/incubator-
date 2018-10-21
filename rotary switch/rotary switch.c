  #define CHECK_BIT(var,pos) ((var) & (1<<(pos)))
  unsigned char count_rotary=0;
  unsigned char pinALast=0;
  unsigned char pinBLast=0;
  unsigned char pinA=0;
  unsigned char pinB=0;
  unsigned char Aval=0;

/*void INT1_interrupt() iv IVT_EXTERNAL_1 ilevel 3 ics ICS_AUTO {   //INC_B  ratory
     if(INT1IF_bit){
                         // Invert LED's

        pinB=INT1IF_bit;
       count_rotary=count_rotary-1;



       INT1IF_bit = 0;
        // portf.f3=1;
        //  portf.f6=~portf.f6;

       }                    // Reset INT2 flag
    }*/
      void INT3_interrupt() iv IVT_EXTERNAL_3 ilevel 2 ics ICS_AUTO {  //INC_A  ratory
     if(INT3IF_bit){
                          // Invert LED's

       AVal = Button(&PORTD, 10, 0, 0);
   if (AVal != pinALast){ // Means the knob is rotating
     // if the knob is rotating, we need to determine direction
     // We do that by reading pin B.
     if (Button(&PORTD, 8, 0, 0) != AVal) {  // Means pin A Changed first - We're Rotating Clockwise
        portf.f3=0;
     } else {// Otherwise B changed first and we're moving CCW
       portf.f3=1;
     }

        pinALast=AVal;
        INT3IF_bit = 0;
       }                    // Reset INT2 flag
     }  }
       void INT4_interrupt() iv IVT_EXTERNAL_4 ilevel 1 ics ICS_AUTO {   //sw ratory
     if(INT4IF_bit){
       // portf.f3=~portf.f3;                  // Invert LED's

        portf.f3=~portf.f3;
        INT4IF_bit = 0;
       }                    // Reset INT2 flag
    }

  /******  Intialize controller  ********/
 void inti_ports_pIC32_HAL(){
   /*****  Intialize ADC pins  *****/
 AD1PCFG = 0xFFFF;      // Configure AN pins as digital I/O
 JTAGEN_bit= 0;

 TRISB = 0X00;
 TRISF0_bit=0;    //
 TRISE2_bit=0;    //
 TRISC13_bit=0;    //  == D/C
 TRISE1_bit=0;    //
 TRISC14_bit=0;
 ////////
   trisf.f3=0;
   trisf.f6=0;
   LATf.f3 = 0;
   portf.f3 =0 ;
    LATf.f6 = 0;
   portf.f6 =0 ;



/*TRISd.f11 = 1;
   TRISd.f10 = 1;
   LATD.f10=1;
   LATD.f8=1;
   TRISd.f8 = 1;*/
   
   TRISD11_bit = 1;             // Set PORTA.15 pin as input
    TRISD10_bit = 1;
     TRISD8_bit = 1;
// Set Rd11 pin as input
   INT4IP0_bit = 0;                   // Set INT2 interrupt
   INT4IP1_bit = 0;                   // Set interrupt priorities
   INT4IP2_bit = 1;                   // Set inrrupt priority to 4
   INT4IE_bit  = 1;                   // Set interrupt on INT2 (RE9) to be enabled
                          // Set Rd11 pin as input
/*INT1IP0_bit = 0;                   // Set INT2 interrupt
   INT1IP1_bit = 0;                   // Set interrupt priorities
   INT1IP2_bit = 1;                   // Set inrrupt priority to 4
   INT1IE_bit  = 1;*/
                        // Set Rd11 pin as input
INT3IP0_bit = 0;                   // Set INT2 interrupt
   INT3IP1_bit = 0;                   // Set interrupt priorities
   INT3IP2_bit = 1;                   // Set inrrupt priority to 4
   INT3IE_bit  = 1;
   EnableInterrupts();                // Enable interruts as previously set

}
unsigned int oldstate;
 void main() {

inti_ports_pIC32_HAL();
 pinALast=Button(&PORTD, 10, 0, 0);
  portf.f3=1;
   while(1){
/*AVal = Button(&PORTD, 10, 0, 0);
   if (AVal != pinALast){ // Means the knob is rotating
     // if the knob is rotating, we need to determine direction
     // We do that by reading pin B.
     if (Button(&PORTD, 8, 0, 0) != AVal) {  // Means pin A Changed first - We're Rotating Clockwise
        portf.f3=0;
     } else {// Otherwise B changed first and we're moving CCW
       portf.f3=1;
     }






        }
        if (CHECK_BIT(PORTD,11)==1){portf.f3=~portf.f3;}
        pinALast=AVal;

            if (Button(&PORTD, 11, 1, 1))                   // detect logical one on RA15 pin
      oldstate = 1;
    if (oldstate && Button(&PORTD, 11, 1, 0)) {     // detect one-to-zero transition on RA15 pin
      portf.f3=~portf.f3;                              // invert PORTB value
      oldstate = 0;
    }*/
      } 
      }