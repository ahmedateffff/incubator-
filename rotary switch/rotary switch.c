 void interrupt() iv IVT_EXTERNAL_4 ilevel 1 ics ICS_AUTO {
     if(INT4IF_bit){
        portf.f3=~portf.f3;                  // Invert LED's
        INT4IF_bit = 0;
       }                    // Reset INT2 flag
    }

 void main() {

   AD1PCFG = 0xFFFF;      // Configure AN pins as digital I/O
   JTAGEN_bit= 0;
   
   
   trisf.f3=0x00;
   LATf.f3 = 0;
   portf.f3 =0 ;
   TRISd.f11 = 1;                    // Set Rd11 pin as input
   INT4IP0_bit = 0;                   // Set INT2 interrupt
   INT4IP1_bit = 0;                   // Set interrupt priorities
   INT4IP2_bit = 1;                   // Set inrrupt priority to 4
   INT4IE_bit  = 1;                   // Set interrupt on INT2 (RE9) to be enabled
   EnableInterrupts();                // Enable interruts as previously set


   while(1){



//portB=~portb;







   //////////


        }
   }