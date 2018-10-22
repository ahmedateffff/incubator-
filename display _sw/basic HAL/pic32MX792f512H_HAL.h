//// Hardware Application Layer
/******  BASIC   ********/
#ifndef pic32MX792f512H_HAL
#define pic32MX792f512H_HAL

#define Highest(param) ((char *)&param)[3] 
// MMC module connections
sbit Mmc_Chip_Select           at LATD9_bit;  // for writing to output pin always use latch
sbit Mmc_Chip_Select_Direction at TRISD9_bit;
// eof MMC module connections



// External Interrupt intialization

/******  INT1  ****///RD11 pin as input  ( switch button)
void Intialize_INT1(void){
   // intialize interrupt             // Set  RD11 pin as input  ( switch button)
   INT1IP0_bit = 0;                   // Set INT1 interrupt periority
   INT1IP1_bit = 0;                   //
   INT1IP2_bit = 1;                   // Set inrrupt priority to 4
   INT1IE_bit  = 1;                   // Enable the interrput
   INT1EP_bit=0;                      //falling edge
}
/******  INT4  ****///RD8 pin as input  ( Increment B pin)

  
void Intialize_INT4(void){
   // intialize interrupt             // Set  RD8 pin as input  ( Increment B pin)
   INT4IP0_bit = 0;                   // Set INT4 interrupt periority
   INT4IP1_bit = 0;                   //
   INT4IP2_bit = 1;                   // Set inrrupt priority to 4
   INT4IE_bit  = 1;                   // Enable the interrput
   INT4EP_bit=0;                      // falling edge
}


void Intialize_MCU(void){
  /*****  Intialize ADC pins  *****/
  AD1PCFG = 0xFFFF;      // Configure AN pins as digital I/O
  JTAGEN_bit= 0;        // Disable JTAG

  /******  Intialize TFT  ********/   //used with 7 inch LCD
  TRISB = 0X00;    //  16bit TFT_DataPort set as o/p port
  TRISF0_bit=0;    //  TFT_RST pin
  TRISE2_bit=0;    //  TFT_CS pin
  TRISC13_bit=0;   //  TFT_RS pin OR == D/C
  TRISE1_bit=0;    //  TFT_RD pin
  TRISC14_bit=0;   //  TFT_WR pin

  /******  Rotary Encoder  ********/   //using module(KY-040)
  TRISD11_bit = 1 ;   // Switch pin
  TRISD10_bit = 1 ;   // INCA pin
  TRISD8_bit  = 1 ;   // INCB pin
  /******  switches  ********/
  TRISE0_bit = 1 ;   // BUTTON B1
  TRISE1_bit = 1 ;   // BUTTON B2
  TRISE2_bit = 1 ;   // BUTTON B3
  TRISE3_bit = 1 ;   // BUTTON B4
  TRISE4_bit = 1 ;   // BUTTON B5
  TRISE5_bit = 1 ;   // BUTTON B6
  TRISE6_bit = 1 ;   // BUTTON B7
  TRISE7_bit = 1 ;   // BUTTON B8
  TRISD4_bit = 1 ;   // BUTTON B9
  TRISD5_bit = 1 ;   // BUTTON B10
  TRISD6_bit = 1 ;   // BUTTON B11
  /******  LEDS ********/ //When use move JAMPER release comment
  TRISF3_bit=0;   // LED1
  TRISF6_bit=0;   // LED2 NOTE:CHANGE PIN HARDWARE
  /*TRISD11_bit = 1 ;   // LED3
  TRISD10_bit = 1 ;   // LED5
  TRISD8_bit  = 1 ;   // LED4*/
/******  spi2 init   using pins  *******/

  TRISG6_bit = 0 ;  //sck2
  TRISG7_bit = 1 ;  //SDI2
  TRISG8_bit = 0 ;  //SD02
  TRISG9_bit = 1 ;  //SS2

}

  

  
  
#endif