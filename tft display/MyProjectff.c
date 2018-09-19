
// End of TFT display connections
 //////////////////////////////////////////////////////////////////////////////////////////
// TFT variables
  
unsigned long Font_Color = 0 ;
unsigned long Back_Color ;
const unsigned short *Font_Pointer;
unsigned short Tempo ;
const unsigned int *Font_Description_Pointer ;
 
//unsigned int ii, jj ;
   #include "page_Def.h"
char nu[]= "    " ;

//#include "ssd1963_8bit_library.h"
 int kk;
  //#include "ssd1963_8bit_library.h"


void main() {

  /*****  Intialize ADC pins  *****/
AD1PCFG = 0xFFFF;      // Configure AN pins as digital I/O

 JTAGEN_bit= 0;

  /******  Intialize TFT  ********/
TRISB = 0X00;
  TRISF0_bit=0;    //
 TRISE2_bit=0;    //
 TRISC13_bit=0;    //  == D/C
 TRISE1_bit=0;    //
TRISC14_bit=0;

   TFT_Intialize_16bit();
   InitializeObjects();
  //InitializeObjects();
  Set_BackLight(0xFF);

  Back_Color=0xffff;
   img_load_raw_image_mem(316,152 ,137 ,77 , gImage_MEGEG);
   Delay_ms(2000);
  display_page(&Screen1);
  

  while(1){}
  
  
  
  
  
  
  }