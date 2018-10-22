// SSD1963 custom library

// TFT module connections

extern unsigned long Font_Color ;
extern unsigned long Back_Color ;
extern const unsigned short *Font_Pointer;
extern const unsigned int *Font_Description_Pointer;

extern const unsigned char gImage_img[115200];

unsigned int Lcd_Color565(unsigned long RGB);  // RGB???«×???16?»(565)
typedef union
{
  unsigned int U16;
  unsigned char U8[2];
}ColorTypeDef;

unsigned int TFT_DataPort at LATB;

sbit TFT_RST      at LATF0_bit;    //
sbit TFT_CS       at LATE2_bit;    //     D6
sbit TFT_RS       at LATC13_bit;    //  == D/C
sbit TFT_RD       at LATE1_bit;    //    D5
sbit TFT_WR       at LATC14_bit;    //
#define TFT_Write_Strobe()  TFT_WR = 0; asm nop; TFT_WR = 1;
extern const unsigned short Numbers28pt[]; //Number
extern const unsigned int Numbers28pt_Descriptors[];

const unsigned short tahoma_52pt[];     //FONT
const unsigned int tahoma_52ptDescriptors[];

extern const unsigned short tahoma_30pt_Font[]; //FONT
extern const unsigned int tahoma_30pt_FontDescriptors[];
const unsigned short tahoma_24pt_Font[];           //FONT
const unsigned int tahoma_24pt_FontDescriptors[];

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  //index
void TFT_Set_Index(unsigned int  index) {
  TFT_CS = 0;
  TFT_RD = 1;
  TFT_RS = 0;
  TFT_DataPort= index;
  
  TFT_WR = 0;
  TFT_WR = 1;
  TFT_CS = 1;
  asm nop;     // delay
}

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  //command
void TFT_Write_Command(unsigned int  cmd) {
  TFT_CS = 0;
  TFT_RS = 1;
  TFT_DataPort = cmd;

  TFT_WR = 0;
  TFT_WR = 1;
  TFT_CS = 1;
  asm nop;     // delay
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  //data
void TFT_Write_Data(unsigned int color) {

     TFT_Write_Command(color);
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Display_OFF_SSD1963(){
  TFT_CS = 0;
  TFT_Set_Index(0x28);
  TFT_CS = 1;
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Display_ON_SSD1963(){
  TFT_CS = 0;
  TFT_Set_Index(0x29);
  TFT_CS = 1;
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Enter_Sleep_Mode_SSD1963(){
  TFT_CS = 0;
  TFT_Set_Index(0x10);
  TFT_CS = 1;
  // The host processor must wait 5ms after sending this
  // command before sending another command.
  Delay_5ms();
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Exit_Sleep_Mode_SSD1963(){
  TFT_CS = 0;
  TFT_Set_Index(0x11);
  TFT_CS = 1;
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  //Intialize tft bulit in controller ssd1963 using 16 bit mode
void TFT_Intialize_16bit(void){

  TFT_RST = 0; // Hardware Reset
  Delay_ms(5);
  TFT_RST = 1;
  TFT_CS = 0;
  TFT_Set_Index(0x01); // Soft Reset
  TFT_Set_Index(0x01); // Soft Reset
  delay_ms(1);

  TFT_Set_Index(0x0A);
  TFT_Write_Command(0x1C); //Power Mode

  TFT_Set_Index(0xE2);
  TFT_Write_Command(60); //35 PLLclk = REFclk * 36 (360MHz)
  TFT_Write_Command(5); // SYSclk = PLLclk / 3 (120MHz)
  TFT_Write_Command(0x54); // validate M and N dec 84
  //  delay_ms(100);             // wait at least 100 msec before enable the PLL as the system clock
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
  TFT_Set_Index(0x2a);                          //SET column address
  TFT_Write_Command((s_x)>>8);                  //SET start column address
  TFT_Write_Command(s_x);
  TFT_Write_Command((e_x)>>8);                  //SET end column address (MAx = 799)
  TFT_Write_Command(e_x);

  TFT_Set_Index(0x2b);                          //SET Row address
  TFT_Write_Command((s_y)>>8);                  //SET start Row address
  TFT_Write_Command(s_y);
  TFT_Write_Command((e_y)>>8);                  //SET end Row address (Max = 479)
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

void TFT_Rectangle(unsigned int x0, unsigned int y0, unsigned int W, unsigned int H, unsigned int dat)
{
  unsigned int x,y;

  WindowSet(x0,(x0+W-1),y0,(y0+H-1));      // 800 * 480  TFT
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

void TFT_Image_Ext(void) {                              // unsigned char *image_pointer

unsigned char *Src_Pointer ;
unsigned short error ;
unsigned int x = 0, y,z,j;
unsigned long size ;
unsigned int color, swap ;
char bdata ;
char image_name[]="           " ; /// 12


   error= Mmc_Fat_Assign("ExtFile6.RES", 0);      // incu_master    Image10
   Mmc_Fat_Reset(&size);

   WindowSet(0,799,0,479);       //  50*50
   TFT_Set_Index(0x2c);
   for(x=0; x<480; x++) {
       for(y=0; y<800; y++) {
          Mmc_Fat_Read(&bdata);        // High byte
          color = bdata ;
          //color = color << 8 ;
          Mmc_Fat_Read(&bdata);        // Low byte
          swap = bdata ;
          swap = swap << 8 ;
          color = color + swap ;

          TFT_Write_Data(color);
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
void TFT_Set_Font(const unsigned short *Font, const unsigned int *Font_Descrip, unsigned int dat)
{
  Font_Pointer = Font ;
  Font_Description_Pointer = Font_Descrip ;


  Font_Color = dat ;

 }

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Number ( )

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
           if(dataBuf == 0)   TFT_Write_Data(Back_Color);
           else               TFT_Write_Data(Font_Color);
          }


     }
   }
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Numbers

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
            // if(alpha == 0)   width = *(Font_Description_Pointer+2) ; // width of (.)
           //  else             width = *(Font_Description_Pointer+1) ; // width of other numbers
             width = *(Font_Description_Pointer + (alpha*2) + 1);
             x0 = x0 + width + 5 ;
            }
            Src_Pointer++;
            if(*Src_Pointer == 0) break;         // 0 in ascii == nul

          }
}

 //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Character ( )

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
//==============================

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


//==============================
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
void sam_load_raw_image_mem(int x11, int y11, int imgX, int imgY, const unsigned char*img)  {

          unsigned int y,x, dataa;
          WindowSet(x11, (imgX + x11) -1, y11, (imgY + y11)-1);
          TFT_Set_Index(0x2c);
          
         for ( y = 0; y < imgY; y++) {
           for (x = 0; x < imgx; x++){
            // TFT_Write_Data(0XFFFF);
             dataa = img[(imgx*2*y)+2*x] ;
             dataa = dataa << 8 ;
             dataa = dataa + img[(imgx*2*y)+(2*x+1)] ;
                 TFT_Write_Data(dataa);
             // TFT_Write_Data(img[(imgx*y)+ x]);
            }
          }
      }
//==============================
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

//==============================
void Draw_rectangle(signed int x1,signed int y1,signed int W,signed int H,unsigned long colour,unsigned int size)
{    int i;
unsigned int x2,y2;
          X2= x1+W ;
          y2= y1+H;

 for(i=0;i<size;i++){
             Draw_Line_V(x1+i, y1+i, y2+i, colour);
             Draw_Line_V(x2+i, y1+i, y2+i, colour);
             Draw_Line_H(x1+i, x2+i, y1+i, colour);
             Draw_Line_H(x1+i, x2+i, y2+i, colour);

                     }

 }
 //==============================
void LCD_DispPic_FullSize(const unsigned char *str)
{

        unsigned long temp;
        ColorTypeDef color;

        WindowSet(0,0,200,500);
        TFT_Write_Command(0x2C);

        TFT_CS = 0;

        for (temp = 2; temp < ((200+1)*(500+1))+2; temp++)
        {
                color.U8[1] =*(unsigned short *)(&str[ 2 * temp]);
                color.U8[0]=*(unsigned short *)(&str[ 2 * temp+1]);
                //DataToWrite(i);

                TFT_Write_Data(color.U16);
        }
    TFT_CS = 1;

//==============================
}