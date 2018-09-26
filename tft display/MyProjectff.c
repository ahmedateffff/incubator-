
// End of TFT display connections
 //////////////////////////////////////////////////////////////////////////////////////////
#include "page_Def.h"
  extern  unsigned char count_rotary;


void main() {
   inti_ports_pIC32_HAL();
   TFT_Intialize_16bit();
   InitializeObjects();
   Set_BackLight(0xFF);
   Back_Color=0xffff;
img_load_raw_image_mem(316,152 ,137 ,77 , gImage_MEGEG);
    delay_ms(1000);
   display_page(&Screen1);

  while(1){
       rotary_b_click(count_rotary);

        }
  
  
  
  
  
  }