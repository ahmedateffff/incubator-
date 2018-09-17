
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

 /*TRISC= 0 ;
  PORTC = 255;*/

 TFT_Intialize_16bit();
//Delay_ms(100);

  //delay_ms(10);
  // RGB565_converter(179, 255,153)
   
//Set_BackLight(0x00);
   

  //   Back_Color = 0Xffffff ;
  Back_Color = 0Xffffff ;
   // TFT_FULL_ON(0x0000)  ;
   // delay_ms(1000);
     TFT_FULL_ON(White);
      Set_BackLight(0xff);
InitializeObjects();  
  
/*DrawBox(1);
DrawLine();
DrawCircle(1) ;*/
DrawLabel(); 
DrawBox(0); 

Delay_ms(3000);
Set_BackLight(0x00);
DrawBox2(0);
DrawLine2();
 TFT_FULL_ON(White); 
 Set_BackLight(0xff);            
           





/*TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0x802000) ;
 TFT_Rectangle(660, 7, 138, 40, 0xffffff);
Draw_rectangle(796,4,650,50,0x00ffffff,4);
Display_String("AIR", 662, 7)  ;

  TFT_Rectangle(660, 63, 138, 40, 0xffffff);
//Draw_rectangle(796,(10+50),650,(10+50+46),0x00ffffff,4);
 Display_String("SKIN    ", 660, 63)  ;
   TFT_Rectangle(660, 121, 138, 40, 0xffffff);
// Draw_rectangle(796,(10+10+50+46),500,(116+46),0x00ffffff,4);
 Display_String("HUM   ", 662, 121)  ;
 TFT_Rectangle(660, 175, 138, 40, 0xffffff);
 // Draw_rectangle(796,(116+46+10),650,(116+46+46),0x00ffffff,4);
 Display_String("O2      ", 662, 175)  ;
    Back_Color = 0Xffffff ;
    TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0xff4000) ;
// Draw_rectangle(796,(10+10+116+46+40+30),600,(46+40+116+46+46),0x00ffffff,4);
 TFT_Rectangle(590, (116+46+40+37), 209, 40, 0xffffff);
 Display_String("OPTION  ", 590, (116+46+40+35))  ;



Draw_Line_H(0, 800, 290, 0x99fff3);
 // Draw_rectangle(0,800,5,(116+46),0x00ffffff,4);
 Draw_Line_V(593,  290, 480, 0x99fff3);
 Draw_Line_H(593, 800, 380, 0x99fff3);
  Back_Color = 0X000000 ;
   Back_Color = 0X000000 ;
 TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0x99fff3) ;
 Display_String("HUM %  ", 595, 300)  ;
 Display_String("O2 %  ", 595, 402)  ;
  Back_Color = 0X000000 ;
 ///////////////////////////////////////  ================================  air temp.
//Draw_rectangle(368,7,600,130,Red,2);
  Back_Color = 0X000000 ;

 TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0x99fff3) ;
 Display_String("C", 605, 110)  ;
 Display_String(".", 604, 60)  ;
  TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors, 0x99fff3) ;

Display1_String("AIR", 375, 14)  ;
 //=============================================================   skin temp.
 //Draw_rectangle(100,7,300,130,0x99fff3,2);
  Back_Color = 0X000000 ;

 TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0x99fff3) ;
 Display_String("C", 305, 110)  ;
 Display_String(".", 304, 60)  ;
  TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors, 0x99fff3) ;

Display1_String("skin ", 110, 14)  ;
 //=============================================================  set temp.
// Draw_rectangle(100,140,300,260,0x99fff3,2);
   Back_Color = 0X000000 ;

  TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0x99fff3) ;
 Display_String("C", 305, 250)  ;
 Display_String(".", 304, 200)  ;
  TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors, 0x99fff3) ;

Display1_String("Set Point", 110, 152)  ;

 //=============================================================
 Draw_rectangle(20,100,50,150,0x99fff3,2);   //heater
   TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors, 0x99fff3) ;

Display1_String("Heater", 0, 60)  ;
//=============================================================  aix temp
  Draw_Line_H(50, 580, 450, Red);
 Draw_Line_V(50,  310, 450, Red);
   TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors, 0x99fff3) ;
   //==========================
   kk=140;
while(kk>0){

   Draw_Line_H(40, 50,( 450-kk), Red);
        kk=kk-3;}
        //====
        kk=80;
   while(kk>0){
  Draw_Line_H(20, 50,( 425-kk), Red);
   kk=kk-40;
   }
   //==========================

Display1_String("TEMP-TIME CURVE", 320, 300)  ;
Display1_String("25", 0, 400)  ;
Display1_String("35", 0, 350)  ;


 Back_Color =0x6666ff ;
TFT_Set_Font(tahoma_30pt_Font, tahoma_30pt_FontDescriptors, 0xff4000) ;
 //TFT_Rectangle(590, (116+46+40+40), 209, 40, 0x6666ff);
//Display_String("OPTION  ", 590, (116+46+40+35))  ;
// TFT_Rectangle(20, 100, 31, 20, Red);
     Set_BackLight(0xF0);*/
  }   // End main*/






 /*TFT_Write_Text("TFT LIBRARY DEMO, WELCOME !", 0, 0);*/


///////////////////////////////////////////////////////////////////////////////////////////////////
/*void main() {

   AD1PCFG = 0xFFFF;      // Configure AN pins as digital I/O

 JTAGEN_bit= 0;
   trisf=0x00;
   trisC=0X00;
   trisE=0x00;

   LATf = 0;
   LATC = 0;
   LATE = 0;
   TRISB = 0X00;             // Initialize PORTB as output
   LATB = 0;

   //ODCB.F0=0;
portf.f0 =1 ;
   portC.f14 =1 ;
   portC.f13 =1 ;
   portE.f1 =0 ;
   portE.f2 =1 ;
   //portB.f0=0;
   PORTB=0x00000;
while(1){

     delay_ms(3000);

//portB=~portb;
   portf.f0=~portf.f0;
   portC.f14=~portC.f14;
   portC.f13=~portC.f13;
 portE.f2=~portE.f2;
   portE.f1 =~portE.f1 ;

}     }*/