
/* some RGB color definitions                                                 */
#define Black           0x0000      /*   0,   0,   0 */
#define Navy            0x000F      /*   0,   0, 128 */
#define DarkGreen       0x03E0      /*   0, 128,   0 */
#define DarkCyan        0x03EF      /*   0, 128, 128 */
#define Maroon          0x7800      /* 128,   0,   0 */
#define Purple          0x780F      /* 128,   0, 128 */
#define Olive           0x7BE0      /* 128, 128,   0 */
#define LightGrey       0xC618      /* 192, 192, 192 */
#define DarkGrey        0x7BEF      /* 128, 128, 128 */
#define Blue            0x001F      /*   0,   0, 255 */
#define Green           0x07E0      /*   0, 255,   0 */
#define Cyan            0x07FF      /*   0, 255, 255 */
#define Red             0xF800      /* 255,   0,   0 */
#define Magenta         0xF81F      /* 255,   0, 255 */
#define Yellow          0xFFE0      /* 255, 255,   0 */
#define White           0xFFFF      /* 255, 255, 255 */
#define Orange          0xFD20      /* 255, 165,   0 */
#define GreenYellow     0xAFE5      /* 173, 255,  47 */
#define Pink                        0xF81F
// TFT module connections
unsigned int Lcd_Color565(unsigned long RGB);  // RGB???«×???16?»(565)
typedef union
{
  unsigned int U16;
  unsigned char U8[2];
}ColorTypeDef;
unsigned int TFT_DataPort at LATB;

sbit TFT_RST      at LATF0_bit;    //
sbit TFT_CS       at LATE2_bit;    //
sbit TFT_RS       at LATC13_bit;    //  == D/C
sbit TFT_RD       at LATE1_bit;    //
sbit TFT_WR       at LATC14_bit;    //
unsigned long Font_Color = 0 ;
unsigned long Back_Color ;
const unsigned short *Font_Pointer;
unsigned short Tempo ;
const unsigned int *Font_Description_Pointer ;

#define TFT_Write_Strobe()  TFT_WR = 0; asm nop; TFT_WR = 1;

const unsigned short Numbers28pt[];
const unsigned int Numbers28pt_Descriptors[];

const unsigned short tahoma_52pt[];
const unsigned int tahoma_52ptDescriptors[];

const unsigned short tahoma_30pt[];
const unsigned int tahoma_30ptDescriptors[];

const unsigned short tahoma_30pt_Font[];
const unsigned int tahoma_30pt_FontDescriptors[];

const unsigned short tahoma_24pt_Font[];
const unsigned int tahoma_24pt_FontDescriptors[];

/**
  * @brief  Sets controllers register address to be written in next cycle.
  * @param  index : The values can be in [0x00 - 0xFF] range
  */
void TFT_Set_Index(unsigned int  index) {
  /*TFT_RS = 0;
  TFT_DataPort = index;
  TFT_Write_Strobe();*/
  Delay_1us(); Delay_1us();
  TFT_CS = 0;
  TFT_RD = 1;
  TFT_RS = 0;
  TFT_DataPort= index;

  
  TFT_WR = 0;
  TFT_WR = 1;
  TFT_CS = 1;
}

/**
  * @brief  Sets value of controller register (address must be previously defined with TFT_Set_Index)
  * @param  cmd : The values can be in [0x00 - 0xFF] range
  */
void TFT_Write_Command(unsigned int  cmd) {
  /*TFT_RS = 1;
  TFT_DataPort = cmd;
  TFT_Write_Strobe();*/
  TFT_CS = 0;
  TFT_RD = 1;
  TFT_RS = 1;
  TFT_DataPort = cmd;

  TFT_WR = 0;
  TFT_WR = 1;
  TFT_CS = 1;
  Delay_1us();
}

/**
  * @brief  Write 16bit value on TFT Data bus. This is 8bit communication
  *         so it is done in two cycles. This should be used when working with
  *         TFT controller in 8bit mode.
  * @param  _data : Data to be transfered. Range values [0x00 - 0xFFFF]
  
  */



unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
{  unsigned int value ;
 value = (((31*(r+4))/255)<<11) |
               (((63*(g+2))/255)<<5) |
               ((31*(b+4))/255);
    return (value);
}

void TFT_Write_Data(unsigned int color) {
/*TFT_RS = 1;
  TFT_DataPort = (color >>16);
  TFT_Write_Strobe();
  TFT_DataPort = (color >>8);
  TFT_Write_Strobe();
  TFT_DataPort = color ;
  TFT_Write_Strobe();*/
  
/*TFT_Write_Command((color>>16));
  TFT_Write_Command((color>>8));*/
  TFT_Write_Command(color);
  
}

void TFT_Intialize_16bit(void){

TFT_RST = 0; // Hardware Reset
 Delay_ms(5);

  TFT_RST = 1;
  //delay_ms(100);

  TFT_CS = 0;
  TFT_Set_Index(0x01); // Soft Reset
  TFT_Set_Index(0x01); // Soft Reset
 // TFT_Set_Index(0x01); // Soft Reset
  Delay_ms(1);

  //TFT_Set_Index(0xE0); // Set PLL

/*TFT_Write_Command(0x01); // Enable PLL
  delay_ms(10);*/
  
  
  TFT_Set_Index(0x0A);
TFT_Write_Command(0x1C); //Power Mode
/*TFT_Set_Index(0xE2);       // Set PLL mn
  TFT_Write_Command(0x22);   // 110 MHz
  TFT_Write_Command(0x03);
  TFT_Write_Command(0x04);*/

TFT_Set_Index(0xE2);
TFT_Write_Command(60); //35 PLLclk = REFclk * 36 (360MHz)
TFT_Write_Command(5); // SYSclk = PLLclk / 3 (120MHz)
TFT_Write_Command(0x54); // validate M and N dec 84
//  delay_ms(100);             // wait at least 100 msec before enable the PLL as the system clock

/*TFT_Set_Index(0xE0); // Set PLL
  TFT_Write_Command(0x03); // Use PLL as the system clock
  delay_ms(10);*/
  TFT_Set_Index(0xe0);
TFT_Write_Command(0x01); // START PLL
Delay_50us(); Delay_50us(); // Wait 100us to let the PLL stable

TFT_Set_Index(0xe0);
TFT_Write_Command(0x03); // LOCK PLL
////////////////
  TFT_Set_Index(0xB0); // Set LCD Mode   //////////////////////////////////////
  TFT_Write_Command(0x60); // 24 bit data resolution,
  TFT_Write_Command(0x00); // TFT parallel interface mode
  TFT_Write_Command(0x03); // 800 pixel width
  TFT_Write_Command(0x1f);
  TFT_Write_Command(0x01); // 480 pixel hight
  TFT_Write_Command(0xdf);
  TFT_Write_Command(0x03); // RGB mode

  TFT_Set_Index(0xF0); // Set Pixel Data Interface
  TFT_Write_Command(0x03); //16 bits
  


/*TFT_Set_Index(0xE6); // Pixel Clk                     ////////////
  TFT_Write_Command(0x02); // 06 //33 MHz
  TFT_Write_Command(0xff); // d7
  TFT_Write_Command(0xff); // f9*/

TFT_Set_Index(0xe6); // pixel clock frequency
TFT_Write_Command(0x04); // LCD_FPR = 290985 = 33.300 Mhz Result for 7" Display
TFT_Write_Command(0x70);
TFT_Write_Command(0xA9);

  TFT_Set_Index(0xB4); // SET HBP                       ///////////
  TFT_Write_Command(0x20); // SET HSYNC Total = 440
  TFT_Write_Command(0xaf);
  TFT_Write_Command(0x00); // SET HBP = 68
  TFT_Write_Command(0xa3); // Offset x
  TFT_Write_Command(0x07); // SET VBP 16 = 15 + 1
  TFT_Write_Command(0x00);
  TFT_Write_Command(0x00); // SET Hsync pulse start position
  TFT_Write_Command(0x00);

  TFT_Set_Index(0xB6); // SET VBP
  TFT_Write_Command(0x01); //SET Vsync total 265 = 264 + 1
  TFT_Write_Command(0xef);
  TFT_Write_Command(0x00); // SET VBP = 18
  TFT_Write_Command(0x04); // Offset y
  TFT_Write_Command(0x01); // SET Vsync pulse 8 = 7 + 1
  TFT_Write_Command(0x00); // SET Vsync pulse start position
  TFT_Write_Command(0x00);

  TFT_Set_Index(0x36); // Set Address Mode
  TFT_Write_Command(0x00); // normal mode

  TFT_Set_Index(0x2A);     // set column address
  TFT_Write_Command(0x00); // 0
  TFT_Write_Command(0x00);
  TFT_Write_Command(0x03); // 799
  TFT_Write_Command(0x1F);

  TFT_Set_Index(0x2B); // Set Page Address
  TFT_Write_Command(0x00); // 0
  TFT_Write_Command(0x00);
  TFT_Write_Command(0x01); // 479
  TFT_Write_Command(0xdf);
   /////////////////////////////////

  TFT_Set_Index(0x3a); //
  TFT_Write_Command(0x50);
  TFT_Set_Index(0x29); // Display On
  TFT_CS = 0;
}

//======================================================
void Set_BackLight(unsigned char Bkl){
  TFT_Set_Index(0xBE); //set PWM for B/L
  TFT_Write_Command(0x06);
  TFT_Write_Command(Bkl);
  TFT_Write_Command(0x01);
  TFT_Write_Command(0xf0);
  TFT_Write_Command(0x00);
  TFT_Write_Command(0x00);
}

//=========================================================

void WindowSet(unsigned int s_x,unsigned int e_x,unsigned int s_y,unsigned int e_y)
{
  TFT_Set_Index(0x2a);                //SET column address
  TFT_Write_Command((s_x)>>8);                        //SET start page address=0
  TFT_Write_Command(s_x);
  TFT_Write_Command((e_x)>>8);                        //SET end page address=639
  TFT_Write_Command(e_x);

  TFT_Set_Index(0x2b);                //SET page address
  TFT_Write_Command((s_y)>>8);                        //SET start column address=0
  TFT_Write_Command(s_y);
  TFT_Write_Command((e_y)>>8);                        //SET end column address=479
  TFT_Write_Command(e_y);

}

//=========================================================

void TFT_FULL_ON(unsigned long dat)
{
  unsigned int x,y;

  WindowSet(0,799,0,479);      // 800 * 480  TFT
  TFT_Set_Index(0x2c);

  for(x=0;x<480;x++)  {
    for(y= 0;y<800;y++){
         TFT_Write_Data(dat);
     }
   }

}

//=========================================================

void TFT_Rectangle(unsigned int x0, unsigned int y0, unsigned int W, unsigned int H, unsigned long dat)
{
  unsigned int x,y;

  WindowSet(x0,(x0+W),y0,(y0+H));      // 800 * 480  TFT
  TFT_Set_Index(0x2c);

  for(x=0;x<H;x++)  {
    for(y= 0;y<W;y++){
         TFT_Write_Data(dat);
     }
   }

}

//===========================================================
// export BMP image 16 bit from the SD card
// the image name should have 11 characters including the extension ".txt"
/*void TFT_Image_Ext() {        // (unsigned char *image_pointer)

unsigned char *Src_Pointer ;
unsigned short error ;
unsigned int x , y,z,j, num,RGB16, R, G, B  ;
unsigned long size, color ;
char bdata ;
char image_name[]="           " ; /// 12
short fhandle;
char ReadBuffer[150];
unsigned long fsize ;
unsigned long position;
unsigned long current_position ;


 //  fhandle = FAT32_Open("incu3.txt", FILE_READ);           //

   WindowSet(0,799,0,479);                  //  50*50
   TFT_Set_Index(0x2c);
   for(x=0; x<480; x++) {
       for(y=0; y<100; y++) {

        loop5:
        while(1) {
          FAT32_Read(fhandle, ReadBuffer, 1) ;
          bdata = ReadBuffer[0] ;
          if(( bdata == 88) || ( bdata == 120))  break  ;        // == x or X in ascii
         }

        FAT32_Read(fhandle, ReadBuffer, 32);

            for(z=0; z<8; z++) {
              for(j=0; j<4; j++) {
                bdata = ReadBuffer[j+(4*z)] ;
                if(bdata >= 65) num = (bdata - 55);
                else            num = (bdata - 48);
                RGB16 = (RGB16 << 4) + num ;
               }

              R = (RGB16 & 0xF800) ;
              color = R ;
              G = (RGB16 & 0x07E0) << 5 ;
              B = (RGB16 & 0x001F) << 3 ;
              color = (color << 8) + G + B ;

              TFT_Write_Data(color);

             }

       }
    }
}*/

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Set Font
//
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Font(const unsigned short *Font, const unsigned int *Font_Descrip, unsigned long dat)
{
  Font_Pointer = Font ;
  Font_Description_Pointer = Font_Descrip ;


  Font_Color = dat ;

 }

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Number ( )
//    b: Ascii
//    c: Start X Address
//    d: Start Y Address
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_number(unsigned char b, unsigned int x0, unsigned int y0)
{
  unsigned short i,j,k, repeat ;
  unsigned short buf, dataBuf ;
  unsigned int alpha, index, width, hight, width_byte , bdata ;
  unsigned short *data_index;
  unsigned int *data_Descr_index ;

  alpha = b - 46 ;                                // which the data base start with ( . ) which equal 32 in Ascci
// find the required char at the array
  hight = *Font_Description_Pointer ;
  if(alpha == 0)   width = *(Font_Description_Pointer+2) ; // width of (.)
  else             width = *(Font_Description_Pointer+1) ; // width of other numbers
  
  //width = *(Font_Description_Pointer + (alpha*2) + 2);
  index = *(Font_Description_Pointer + (alpha*2) + 3)  ;

  width_byte = (width / 8)+1 ;

  WindowSet(x0,(x0+width-1),y0,(y0+hight-1));      //
  TFT_Set_Index(0x2c);

  for (i=0 ; i<hight ; i++){
     for (j=0 ; j<width_byte ; j++) {
        bdata = *(Font_Pointer + (index+j) + (i * width_byte)) ;
      
        buf = 0b10000000 ;
        if((width_byte - 1 - j) > 0 ) repeat = 8 ;
        else                        repeat = width - (width_byte-1)*8 ;
      
        for (k=1 ; k <= repeat ; k++){
           dataBuf = bdata & buf ;
           buf = buf >> 1 ;
           if(dataBuf == 0)   TFT_Write_Data(Back_Color);
           else               TFT_Write_Data(Font_Color);
          }


     }
   }
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Numbers
//
//    a: Database
//    b: Start X Address    Row
//    c: Start Y Address    Column
//    * Must write "0" in the end...
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_numbers(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
{
  unsigned char *Src_Pointer;
  int alpha, width, hight, counter = 0,i,j ;
  
        Src_Pointer=Data_Pointer;
     
     // clear the area of the new data
        /*while(1){
         counter++ ;
         Src_Pointer++;
         if(*Src_Pointer == 0) break;         // 0 in ascii == nul
        }
        Src_Pointer=Data_Pointer;

        hight = *Font_Description_Pointer ;
        width = *(Font_Description_Pointer+13) ;                 // width of number 4, the max width
        width = width * counter ;
        WindowSet(x0,(x0+width-1),y0,(y0+hight-1));      //
        TFT_Set_Index(0x2c);

        for (i=0 ; i<hight ; i++){
             for (j=0 ; j<(width*counter) ; j++) {
                  TFT_Write_Data(Back_Color);
                }
          }*/
        while(1)
        {
           if(*Src_Pointer != 32) {
             Display_number(*Src_Pointer,x0,y0);
             alpha = *Src_Pointer - 46 ;
             if(alpha == 0)   width = *(Font_Description_Pointer+2) ; // width of (.)
             else             width = *(Font_Description_Pointer+1) ; // width of other numbers
             x0 = x0 + width + 5 ;
            }
            Src_Pointer++;
            if(*Src_Pointer == 0) break;         // 0 in ascii == nul

          }
}

 //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Character ( )
//    b: Ascii
//    c: Start X Address
//    d: Start Y Address
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_char(unsigned char b, unsigned int x0, unsigned int y0)
{
  unsigned short i,j,k, repeat ;
  unsigned short buf, dataBuf ;
  unsigned int alpha, index, width, hight, width_byte , bdata ;
  unsigned short *data_index;
  unsigned int *data_Descr_index ;

  if (b <= 91) alpha = b - 33 ;       // which the data base start with ( . ) which equal 32 in Ascci
  else         alpha = b - 34 ;
// find the required char at the array
  hight = *Font_Description_Pointer ;
  width = *(Font_Description_Pointer + (alpha*2) + 1);
  index = *(Font_Description_Pointer + (alpha*2) + 2)  ;

  width_byte = (width / 8)+1 ;

  WindowSet(x0,(x0+width-1),y0,(y0+hight-1));      //
  TFT_Set_Index(0x2c);

  for (i=0 ; i<hight ; i++){
     for (j=0 ; j<width_byte ; j++) {
        bdata = *(Font_Pointer + (index+j) + (i * width_byte)) ;

        buf = 0b10000000 ;
        if((width_byte - 1 - j) > 0 ) repeat = 8 ;
        else                        repeat = width - (width_byte-1)*8 ;

        for (k=1 ; k <= repeat ; k++){
           dataBuf = bdata & buf ;
           buf = buf >> 1 ;
           if(dataBuf == 0)   TFT_Write_Data(Back_Color);   //Back_Color
           else               TFT_Write_Data(Font_Color);
          }


     }
   }
}

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show String
//
//    a: Database
//    b: Start X Address    Row
//    c: Start Y Address    Column
//    * Must write "0" in the end...
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
{
  unsigned char *Src_Pointer;
  int width, hight, alpha ;

        Src_Pointer = Data_Pointer;

        while(1)
        {  
         if(*Src_Pointer != 32) {
             Display_char(*Src_Pointer,x0,y0);
             if (*Src_Pointer <= 91) alpha = *Src_Pointer - 33 ;     // which the data base start with ( . ) which equal 32 in Ascci
             else                    alpha = *Src_Pointer - 34 ;
             alpha = alpha * 2 + 1 ;                            // which the data base start with ( . ) which equal 32 in Ascci
             width = *(Font_Description_Pointer + alpha);
             x0 = x0 + width+2  ;
            }

            Src_Pointer++;
            if(*Src_Pointer == 0) break;         // 0 in ascii == nul

          }
 }
 ////////////
 
  void Display1_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
{
  unsigned char *Src_Pointer;
  int width, hight, alpha ;

        Src_Pointer = Data_Pointer;

        while(1)
        {
         if(*Src_Pointer != 32) {
             Display_char(*Src_Pointer,x0,y0);
             if (*Src_Pointer <= 91) alpha = *Src_Pointer - 33 ;     // which the data base start with ( . ) which equal 32 in Ascci
             else                    alpha = *Src_Pointer - 34 ;
             alpha = alpha * 2 + 1 ;                            // which the data base start with ( . ) which equal 32 in Ascci
             width = *(Font_Description_Pointer + alpha);
             x0 = x0 + width +3;
            }

            Src_Pointer++;
            if(*Src_Pointer == 0) break;         // 0 in ascii == nul

          }
 }
 
 
 
 
 //////
 void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned long colour)
{
    signed int dx = 0x0000;
    signed int dy = 0x0000;
    signed int stepx = 0x0000;
    signed int stepy = 0x0000;
    signed int fraction = 0x0000;

    dy = (y2 - y1);
    dx = (x2 - x1);

    if(dy < 0)
    {
        dy = -dy;
        stepy = -1;
    }
    else
    {
        stepy = 1;
    }

    if(dx < 0)
    {
        dx = -dx;
        stepx = -1;
    }
    else
    {
        stepx = 1;
    }

    dx <<= 0x01;
    dy <<= 0x01;


   WindowSet(x1,x2,y1,y2);
   TFT_Set_Index(0x2c);
   TFT_Write_Data(colour);
    if(dx > dy)
    {
        fraction = (dy - (dx >> 1));
        while(x1 != x2)
        {
            if(fraction >= 0)
            {
                y1 += stepy;
                fraction -= dx;
            }
            x1 += stepx;
            fraction += dy;


            WindowSet(x1,x2,y1,y2);
   TFT_Set_Index(0x2c);
   TFT_Write_Data(colour);
        }
    }
    else
    {
        fraction = (dx - (dy >> 1));

        while(y1 != y2)
        {
            if (fraction >= 0)
            {
                x1 += stepx;
                fraction -= dy;
            }
            y1 += stepy;
            fraction += dx;

              WindowSet(x1,x2,y1,y2);
   TFT_Set_Index(0x2c);
   TFT_Write_Data(colour);
        }
    }
}
//============
//
/*void sam_load_raw_image_mem(int x11, int y11, int imgX, int imgY, const unsigned char*img)  {

          int y,x;
         WindowSet(x11, y11,(imgX + x11) -1, (imgY + y11)-1);
          TFT_Set_Index(0x2c);
        for ( y = 0; y < (imgY + y11); y++) {
           for (x = 0; x < (imgx + x11); x++){

                 TFT_Write_Data(img++);

        }}}*/
///////////////////////////////////
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
{
     signed int a = 0x0000;
     signed int b = 0x0000;
     signed int p = 0x0000;

     b = radius;
     p = (1 - b);

     do
     {
          switch(fill)
          {
              case 1:
              {
                  Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
                  Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
                  Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
                  Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
                  break;
              }
              default:
              {
             WindowSet((xc + a),(xc + a), (yc + b), (yc + b));
                  TFT_Write_Data(colour);
                  WindowSet((xc + b),(xc + b) , (yc + a),(yc + a));
             TFT_Write_Data(colour);
                  WindowSet((xc - a),(xc - a), (yc + b), (yc + b));
                  TFT_Write_Data(colour);
                  WindowSet((xc - b),(xc - b), (yc + a), (yc + a));
                  TFT_Write_Data(colour);
               WindowSet((xc + b),(xc + b), (yc - a),(yc - a));
                  TFT_Write_Data(colour);
                  WindowSet((xc + a),(xc + a), (yc - b), (yc - b));
                  TFT_Write_Data(colour);
                WindowSet((xc - a), (xc - a),(yc - b),(yc - b));
                  TFT_Write_Data(colour);
                  WindowSet((xc - b),(xc - b), (yc - a), (yc - a));
                  TFT_Write_Data(colour);
                  break;
              }
          }

          if(p < 0)
          {
              p += (0x03 + (0x02 * a++));
          }
          else
          {
              p += (0x05 + (0x02 * ((a++) - (b--))));
          }
    }while(a <= b);
}
//======================================================
void Draw_Line_H(signed int x1,signed int x2, signed int y,unsigned long colour)
{
   Draw_Line(x1,y,x2,y, colour);
}

void Draw_Line_V(signed int x,signed int y1, signed int y2,unsigned long colour)
{
   Draw_Line(x,y1,x,y2, colour);
}


void Draw_rectangle(signed int x1,signed int y1,signed int W,signed int H,unsigned long colour,unsigned int size)
{    int i;
unsigned int x2,y2;

          x2= x1+W ;
          y2= y1+H;

 for(i=0;i<size;i++){
             Draw_Line_V(x1+i, y1+i, y2+i, colour);
             Draw_Line_V(x2+i, y1+i, y2+i, colour);
             Draw_Line_H(x1+i, x2+i, y1+i, colour);
             Draw_Line_H(x1+i, x2+i, y2+i, colour);

                     }

 }
 
void img_load_raw_image_mem(int x11, int y11, int imgX, int imgY, const unsigned char*img)  {

          unsigned int y,x, dataa;
          WindowSet(x11, (imgX + x11) -1, y11, (imgY + y11)-1);
          TFT_Set_Index(0x2c);
          
         for ( y = 0; y < imgY; y++) {
           for (x = 0; x < imgX; x++){
            // TFT_Write_Data(0XFFFF);
             dataa = img[(imgX*2*y)+2*x] ;
             dataa = dataa << 8 ;
             dataa = dataa + img[(imgX*2*y)+(2*x+1)] ;
                 TFT_Write_Data(dataa);
             // TFT_Write_Data(img[(imgx*y)+ x]);
            }
          }
      }