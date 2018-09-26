#line 1 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"
#line 1 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
#line 1 "c:/users/ahmed/desktop/incubator/tft display/hal_pic32.h"




 unsigned char count_rotary;


 void INT1_interrupt() iv IVT_EXTERNAL_1 ilevel 1 ics ICS_AUTO {
 if(INT1IF_bit){

 INT1IF_bit = 0;
 count_rotary--;


 }
 }
 void INT3_interrupt() iv IVT_EXTERNAL_3 ilevel 2 ics ICS_AUTO {
 if(INT3IF_bit){

 INT3IF_bit = 0;
 count_rotary++;


 }
 }
 void INT4_interrupt() iv IVT_EXTERNAL_4 ilevel 3 ics ICS_AUTO {
 if(INT4IF_bit){

 INT4IF_bit = 0;
 portf.f3=~portf.f3;
 count_rotary++;
 }
 }


 void inti_ports_pIC32_HAL(){

 AD1PCFG = 0xFFFF;
 JTAGEN_bit= 0;

 TRISB = 0X00;
 TRISF0_bit=0;
 TRISE2_bit=0;
 TRISC13_bit=0;
 TRISE1_bit=0;
 TRISC14_bit=0;

 trisf.f3=0;
 LATf.f3 = 0;
 portf.f3 =0 ;
 TRISd.f11 = 1;
 TRISd.f10 = 1;
 TRISd.f8 = 1;

 INT4IP0_bit = 0;
 INT4IP1_bit = 0;
 INT4IP2_bit = 1;
 INT4IE_bit = 1;

 INT1IP0_bit = 0;
 INT1IP1_bit = 0;
 INT1IP2_bit = 1;
 INT1IE_bit = 1;

 INT3IP0_bit = 0;
 INT3IP1_bit = 0;
 INT3IP2_bit = 1;
 INT3IE_bit = 1;
 EnableInterrupts();

}
#line 1 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
#line 23 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
unsigned int Lcd_Color565(unsigned long RGB);
typedef union
{
 unsigned int U16;
 unsigned char U8[2];
}ColorTypeDef;
unsigned int TFT_DataPort at LATB;

sbit TFT_RST at LATF0_bit;
sbit TFT_CS at LATE2_bit;
sbit TFT_RS at LATC13_bit;
sbit TFT_RD at LATE1_bit;
sbit TFT_WR at LATC14_bit;
unsigned long Font_Color = 0 ;
unsigned long Back_Color ;
const unsigned short *Font_Pointer;
unsigned short Tempo ;
const unsigned int *Font_Description_Pointer ;



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
#line 63 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
void TFT_Set_Index(unsigned int index) {
#line 67 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 Delay_1us(); Delay_1us();
 TFT_CS = 0;
 TFT_RD = 1;
 TFT_RS = 0;
 TFT_DataPort= index;


 TFT_WR = 0;
 TFT_WR = 1;
 TFT_CS = 1;
}
#line 83 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
void TFT_Write_Command(unsigned int cmd) {
#line 87 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 TFT_CS = 0;
 TFT_RD = 1;
 TFT_RS = 1;
 TFT_DataPort = cmd;

 TFT_WR = 0;
 TFT_WR = 1;
 TFT_CS = 1;
 Delay_1us();
}
#line 108 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
{ unsigned int value ;
 value = (((31*(r+4))/255)<<11) |
 (((63*(g+2))/255)<<5) |
 ((31*(b+4))/255);
 return (value);
}

void TFT_Write_Data(unsigned int color) {
#line 127 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 TFT_Write_Command(color);

}

void TFT_Intialize_16bit(void){

TFT_RST = 0;
 Delay_ms(5);

 TFT_RST = 1;


 TFT_CS = 0;
 TFT_Set_Index(0x01);
 TFT_Set_Index(0x01);

 Delay_ms(1);
#line 151 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 TFT_Set_Index(0x0A);
TFT_Write_Command(0x1C);
#line 158 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
TFT_Set_Index(0xE2);
TFT_Write_Command(60);
TFT_Write_Command(5);
TFT_Write_Command(0x54);
#line 167 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 TFT_Set_Index(0xe0);
TFT_Write_Command(0x01);
Delay_50us(); Delay_50us();

TFT_Set_Index(0xe0);
TFT_Write_Command(0x03);

 TFT_Set_Index(0xB0);
 TFT_Write_Command(0x60);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x03);
 TFT_Write_Command(0x1f);
 TFT_Write_Command(0x01);
 TFT_Write_Command(0xdf);
 TFT_Write_Command(0x03);

 TFT_Set_Index(0xF0);
 TFT_Write_Command(0x03);
#line 193 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
TFT_Set_Index(0xe6);
TFT_Write_Command(0x04);
TFT_Write_Command(0x70);
TFT_Write_Command(0xA9);

 TFT_Set_Index(0xB4);
 TFT_Write_Command(0x20);
 TFT_Write_Command(0xaf);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0xa3);
 TFT_Write_Command(0x07);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x00);

 TFT_Set_Index(0xB6);
 TFT_Write_Command(0x01);
 TFT_Write_Command(0xef);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x04);
 TFT_Write_Command(0x01);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x00);

 TFT_Set_Index(0x36);
 TFT_Write_Command(0x00);

 TFT_Set_Index(0x2A);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x03);
 TFT_Write_Command(0x1F);

 TFT_Set_Index(0x2B);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x01);
 TFT_Write_Command(0xdf);


 TFT_Set_Index(0x3a);
 TFT_Write_Command(0x50);
 TFT_Set_Index(0x29);
 TFT_CS = 0;
}


void Set_BackLight(unsigned char Bkl){
 TFT_Set_Index(0xBE);
 TFT_Write_Command(0x06);
 TFT_Write_Command(Bkl);
 TFT_Write_Command(0x01);
 TFT_Write_Command(0xf0);
 TFT_Write_Command(0x00);
 TFT_Write_Command(0x00);
}



void WindowSet(unsigned int s_x,unsigned int e_x,unsigned int s_y,unsigned int e_y)
{
 TFT_Set_Index(0x2a);
 TFT_Write_Command((s_x)>>8);
 TFT_Write_Command(s_x);
 TFT_Write_Command((e_x)>>8);
 TFT_Write_Command(e_x);

 TFT_Set_Index(0x2b);
 TFT_Write_Command((s_y)>>8);
 TFT_Write_Command(s_y);
 TFT_Write_Command((e_y)>>8);
 TFT_Write_Command(e_y);

}



void TFT_FULL_ON(unsigned long dat)
{
 unsigned int x,y;

 WindowSet(0,799,0,479);
 TFT_Set_Index(0x2c);

 for(x=0;x<480;x++) {
 for(y= 0;y<800;y++){
 TFT_Write_Data(dat);
 }
 }

}



void TFT_Rectangle(unsigned int x0, unsigned int y0, unsigned int W, unsigned int H, unsigned long dat)
{
 unsigned int x,y;

 WindowSet(x0,(x0+W),y0,(y0+H));
 TFT_Set_Index(0x2c);

 for(x=0;x<H;x++) {
 for(y= 0;y<W;y++){
 TFT_Write_Data(dat);
 }
 }

}
#line 362 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
void TFT_Set_Font(const unsigned short *Font, const unsigned int *Font_Descrip, unsigned long dat)
{
 Font_Pointer = Font ;
 Font_Description_Pointer = Font_Descrip ;


 Font_Color = dat ;

 }







void Display_number(unsigned char b, unsigned int x0, unsigned int y0)
{
 unsigned short i,j,k, repeat ;
 unsigned short buf, dataBuf ;
 unsigned int alpha, index, width, hight, width_byte , bdata ;
 unsigned short *data_index;
 unsigned int *data_Descr_index ;

 alpha = b - 46 ;

 hight = *Font_Description_Pointer ;
 if(alpha == 0) width = *(Font_Description_Pointer+2) ;
 else width = *(Font_Description_Pointer+1) ;


 index = *(Font_Description_Pointer + (alpha*2) + 3) ;

 width_byte = (width / 8)+1 ;

 WindowSet(x0,(x0+width-1),y0,(y0+hight-1));
 TFT_Set_Index(0x2c);

 for (i=0 ; i<hight ; i++){
 for (j=0 ; j<width_byte ; j++) {
 bdata = *(Font_Pointer + (index+j) + (i * width_byte)) ;

 buf = 0b10000000 ;
 if((width_byte - 1 - j) > 0 ) repeat = 8 ;
 else repeat = width - (width_byte-1)*8 ;

 for (k=1 ; k <= repeat ; k++){
 dataBuf = bdata & buf ;
 buf = buf >> 1 ;
 if(dataBuf == 0) TFT_Write_Data(Back_Color);
 else TFT_Write_Data(Font_Color);
 }


 }
 }
}








void Display_numbers(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
{
 unsigned char *Src_Pointer;
 int alpha, width, hight, counter = 0,i,j ;

 Src_Pointer=Data_Pointer;
#line 453 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 while(1)
 {
 if(*Src_Pointer != 32) {
 Display_number(*Src_Pointer,x0,y0);
 alpha = *Src_Pointer - 46 ;
 if(alpha == 0) width = *(Font_Description_Pointer+2) ;
 else width = *(Font_Description_Pointer+1) ;
 x0 = x0 + width + 5 ;
 }
 Src_Pointer++;
 if(*Src_Pointer == 0) break;

 }
}







void Display_char(unsigned char b, unsigned int x0, unsigned int y0)
{
 unsigned short i,j,k, repeat ;
 unsigned short buf, dataBuf ;
 unsigned int alpha, index, width, hight, width_byte , bdata ;
 unsigned short *data_index;
 unsigned int *data_Descr_index ;

 if (b <= 91) alpha = b - 33 ;
 else alpha = b - 34 ;

 hight = *Font_Description_Pointer ;
 width = *(Font_Description_Pointer + (alpha*2) + 1);
 index = *(Font_Description_Pointer + (alpha*2) + 2) ;

 width_byte = (width / 8)+1 ;

 WindowSet(x0,(x0+width-1),y0,(y0+hight-1));
 TFT_Set_Index(0x2c);

 for (i=0 ; i<hight ; i++){
 for (j=0 ; j<width_byte ; j++) {
 bdata = *(Font_Pointer + (index+j) + (i * width_byte)) ;

 buf = 0b10000000 ;
 if((width_byte - 1 - j) > 0 ) repeat = 8 ;
 else repeat = width - (width_byte-1)*8 ;

 for (k=1 ; k <= repeat ; k++){
 dataBuf = bdata & buf ;
 buf = buf >> 1 ;
 if(dataBuf == 0) TFT_Write_Data(Back_Color);
 else TFT_Write_Data(Font_Color);
 }


 }
 }
}









void Display_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
{
 unsigned char *Src_Pointer;
 int width, hight, alpha ;

 Src_Pointer = Data_Pointer;

 while(1)
 {
 if(*Src_Pointer != 32) {
 Display_char(*Src_Pointer,x0,y0);
 if (*Src_Pointer <= 91) alpha = *Src_Pointer - 33 ;
 else alpha = *Src_Pointer - 34 ;
 alpha = alpha * 2 + 1 ;
 width = *(Font_Description_Pointer + alpha);
 x0 = x0 + width+2 ;
 }

 Src_Pointer++;
 if(*Src_Pointer == 0) break;

 }
 }


 void Display1_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
{
 unsigned char *Src_Pointer;
 int width, hight, alpha ;

 Src_Pointer = Data_Pointer;

 while(1)
 {
 if(*Src_Pointer != 32) {
 Display_char(*Src_Pointer,x0,y0);
 if (*Src_Pointer <= 91) alpha = *Src_Pointer - 33 ;
 else alpha = *Src_Pointer - 34 ;
 alpha = alpha * 2 + 1 ;
 width = *(Font_Description_Pointer + alpha);
 x0 = x0 + width +3;
 }

 Src_Pointer++;
 if(*Src_Pointer == 0) break;

 }
 }





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
#line 666 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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

void Draw_Line_H(signed int x1,signed int x2, signed int y,unsigned long colour)
{
 Draw_Line(x1,y,x2,y, colour);
}

void Draw_Line_V(signed int x,signed int y1, signed int y2,unsigned long colour)
{
 Draw_Line(x,y1,x,y2, colour);
}


void Draw_rectangle(signed int x1,signed int y1,signed int W,signed int H,unsigned long colour,unsigned int size)
{ int i;
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

void img_load_raw_image_mem(int x11, int y11, int imgX, int imgY, const unsigned char*img) {

 unsigned int y,x, dataa;
 WindowSet(x11, (imgX + x11) -1, y11, (imgY + y11)-1);
 TFT_Set_Index(0x2c);

 for ( y = 0; y < imgY; y++) {
 for (x = 0; x < imgX; x++){

 dataa = img[(imgX*2*y)+2*x] ;
 dataa = dataa << 8 ;
 dataa = dataa + img[(imgX*2*y)+(2*x+1)] ;
 TFT_Write_Data(dataa);

 }
 }
 }
#line 12 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
const code char Tahoma12x16_Regular[];
const code char Tahoma11x13_Regular[];
 const unsigned char gImage_arduino[4608];
 const unsigned char gImage_MEGEG[21098];
 const code char MEGEGYPT_JPG[11727];



typedef struct Screen TScreen;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;





typedef struct Line {
 TScreen* OwnerScreen;
 char Order;
 unsigned int First_Point_X;
 unsigned int First_Point_Y;
 unsigned int Second_Point_X;
 unsigned int Second_Point_Y;
 char Pen_Width;
 char Visible;
 unsigned long Color;
} TLine;




typedef struct Circle {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircle;






 typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;


 typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;





struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
};


 TScreen* CurrentScreen;

 TScreen Screen1;
 TBox Box34;
 TBox Box1;
 TBox Box35;
 TBox Box16;
 TBox Box15;
 TBox Box14;
 TBox Box21;
 TBox Box20;
 TBox Box13;
 TBox Box31;
 TBox Box28;
 TBox * const code Screen1_Boxes[11]=
 {
 &Box34,
 &Box1,
 &Box35,
 &Box16,
 &Box15,
 &Box14,
 &Box21,
 &Box20,
 &Box13,
 &Box31,
 &Box28
 };



static void InitializeObjects() {
 Screen1.Color = 0x5AEB;
 Screen1.Width = 800;
 Screen1.Height = 480;
 Screen1.BoxesCount = 11;
 Screen1.Boxes = Screen1_Boxes;
 Screen1.ObjectsCount = 11;


 Box34.OwnerScreen = &Screen1;
 Box34.Order = 0;
 Box34.Left = 379;
 Box34.Top = 2;
 Box34.Width = 358;
 Box34.Height = 141;
 Box34.Pen_Width = 1;
 Box34.Pen_Color = 0x0000;
 Box34.Visible = 1;
 Box34.Active = 1;
 Box34.Transparent = 1;
 Box34.Gradient = 0;
 Box34.Gradient_Orientation = 0;
 Box34.Gradient_Start_Color = 0x001F;
 Box34.Gradient_End_Color = 0xC618;
 Box34.Color = 0x001F;
 Box34.PressColEnabled = 1;
 Box34.Press_Color = 0xFFFF;
 Box34.OnUpPtr = 0;
 Box34.OnDownPtr = 0;
 Box34.OnClickPtr = 0;
 Box34.OnPressPtr = 0;

 Box1.OwnerScreen = &Screen1;
 Box1.Order = 1;
 Box1.Left = 116;
 Box1.Top = 112;
 Box1.Width = 253;
 Box1.Height = 58;
 Box1.Pen_Width = 1;
 Box1.Pen_Color = 0x0000;
 Box1.Visible = 1;
 Box1.Active = 1;
 Box1.Transparent = 1;
 Box1.Gradient = 0;
 Box1.Gradient_Orientation = 0;
 Box1.Gradient_Start_Color = 0x001F;
 Box1.Gradient_End_Color = 0xC618;
 Box1.Color = 0x001F;
 Box1.PressColEnabled = 1;
 Box1.Press_Color = 0xFFFF;
 Box1.OnUpPtr = 0;
 Box1.OnDownPtr = 0;

 Box1.OnPressPtr = 0;

 Box35.OwnerScreen = &Screen1;
 Box35.Order = 2;
 Box35.Left = 204;
 Box35.Top = 185;
 Box35.Width = 188;
 Box35.Height = 88;
 Box35.Pen_Width = 1;
 Box35.Pen_Color = 0x0000;
 Box35.Visible = 1;
 Box35.Active = 1;
 Box35.Transparent = 1;
 Box35.Gradient = 0;
 Box35.Gradient_Orientation = 0;
 Box35.Gradient_Start_Color = 0x001F;
 Box35.Gradient_End_Color = 0xC618;
 Box35.Color = 0x001F;
 Box35.PressColEnabled = 1;
 Box35.Press_Color = 0xFFFF;
 Box35.OnUpPtr = 0;
 Box35.OnDownPtr = 0;

 Box35.OnPressPtr = 0;

 Box16.OwnerScreen = &Screen1;
 Box16.Order = 3;
 Box16.Left = 132;
 Box16.Top = 284;
 Box16.Width = 213;
 Box16.Height = 74;
 Box16.Pen_Width = 1;
 Box16.Pen_Color = 0x0000;
 Box16.Visible = 1;
 Box16.Active = 1;
 Box16.Transparent = 1;
 Box16.Gradient = 0;
 Box16.Gradient_Orientation = 0;
 Box16.Gradient_Start_Color = 0x801F;
 Box16.Gradient_End_Color = 0xC618;
 Box16.Color = 0x801F;
 Box16.PressColEnabled = 1;
 Box16.Press_Color = 0xFFFF;
 Box16.OnUpPtr = 0;
 Box16.OnDownPtr = 0;
 Box16.OnClickPtr = 0;
 Box16.OnPressPtr = 0;

 Box15.OwnerScreen = &Screen1;
 Box15.Order = 4;
 Box15.Left = 368;
 Box15.Top = 361;
 Box15.Width = 376;
 Box15.Height = 73;
 Box15.Pen_Width = 1;
 Box15.Pen_Color = 0x0000;
 Box15.Visible = 1;
 Box15.Active = 1;
 Box15.Transparent = 1;
 Box15.Gradient = 0;
 Box15.Gradient_Orientation = 0;
 Box15.Gradient_Start_Color = 0x801F;
 Box15.Gradient_End_Color = 0xC618;
 Box15.Color = 0x801F;
 Box15.PressColEnabled = 1;
 Box15.Press_Color = 0xFFFF;
 Box15.OnUpPtr = 0;
 Box15.OnDownPtr = 0;
 Box15.OnClickPtr = 0;
 Box15.OnPressPtr = 0;

 Box14.OwnerScreen = &Screen1;
 Box14.Order = 5;
 Box14.Left = 419;
 Box14.Top = 262;
 Box14.Width = 317;
 Box14.Height = 80;
 Box14.Pen_Width = 1;
 Box14.Pen_Color = 0x0000;
 Box14.Visible = 1;
 Box14.Active = 1;
 Box14.Transparent = 1;
 Box14.Gradient = 0;
 Box14.Gradient_Orientation = 0;
 Box14.Gradient_Start_Color = 0x801F;
 Box14.Gradient_End_Color = 0xC618;
 Box14.Color = 0x801F;
 Box14.PressColEnabled = 1;
 Box14.Press_Color = 0xFFFF;
 Box14.OnUpPtr = 0;
 Box14.OnDownPtr = 0;
 Box14.OnClickPtr = 0;
 Box14.OnPressPtr = 0;

 Box21.OwnerScreen = &Screen1;
 Box21.Order = 6;
 Box21.Left = 795;
 Box21.Top = 139;
 Box21.Width = 195;
 Box21.Height = 87;
 Box21.Pen_Width = 1;
 Box21.Pen_Color = 0x0000;
 Box21.Visible = 1;
 Box21.Active = 1;
 Box21.Transparent = 1;
 Box21.Gradient = 0;
 Box21.Gradient_Orientation = 0;
 Box21.Gradient_Start_Color = 0x0408;
 Box21.Gradient_End_Color = 0xC618;
 Box21.Color = 0x0408;
 Box21.PressColEnabled = 1;
 Box21.Press_Color = 0xFFFF;
 Box21.OnUpPtr = 0;
 Box21.OnDownPtr = 0;
 Box21.OnClickPtr = 1;
 Box21.OnPressPtr = 0;

 Box20.OwnerScreen = &Screen1;
 Box20.Order = 7;
 Box20.Left = 70;
 Box20.Top = 187;
 Box20.Width = 116;
 Box20.Height = 87;
 Box20.Pen_Width = 1;
 Box20.Pen_Color = 0x0000;
 Box20.Visible = 1;
 Box20.Active = 1;
 Box20.Transparent = 1;
 Box20.Gradient = 0;
 Box20.Gradient_Orientation = 0;
 Box20.Gradient_Start_Color = 0xFC00;
 Box20.Gradient_End_Color = 0xC618;
 Box20.Color = 0xFC00;
 Box20.PressColEnabled = 1;
 Box20.Press_Color = 0xFFFF;
 Box20.OnUpPtr = 0;
 Box20.OnDownPtr = 0;
 Box20.OnClickPtr = 1;
 Box20.OnPressPtr = 0;

 Box13.OwnerScreen = &Screen1;
 Box13.Order = 8;
 Box13.Left = 89;
 Box13.Top = 10;
 Box13.Width = 120;
 Box13.Height = 87;
 Box13.Pen_Width = 1;
 Box13.Pen_Color = 0x0000;
 Box13.Visible = 1;
 Box13.Active = 1;
 Box13.Transparent = 1;
 Box13.Gradient = 0;
 Box13.Gradient_Orientation = 0;
 Box13.Gradient_Start_Color = 0x801F;
 Box13.Gradient_End_Color = 0xC618;
 Box13.Color = 0x801F;
 Box13.PressColEnabled = 1;
 Box13.Press_Color = 0xFFFF;
 Box13.OnUpPtr = 0;
 Box13.OnDownPtr = 0;
 Box13.OnClickPtr = 1;
 Box13.OnPressPtr = 0;

 Box31.OwnerScreen = &Screen1;
 Box31.Order = 9;
 Box31.Left = 450;
 Box31.Top = 166;
 Box31.Width = 286;
 Box31.Height = 82;
 Box31.Pen_Width = 1;
 Box31.Pen_Color = 0x0000;
 Box31.Visible = 1;
 Box31.Active = 1;
 Box31.Transparent = 1;
 Box31.Gradient = 0;
 Box31.Gradient_Orientation = 0;
 Box31.Gradient_Start_Color = 0x8408;
 Box31.Gradient_End_Color = 0xC618;
 Box31.Color = 0x8408;
 Box31.PressColEnabled = 1;
 Box31.Press_Color = 0xFFFF;
 Box31.OnUpPtr = 0;
 Box31.OnDownPtr = 0;
 Box31.OnClickPtr = 1;
 Box31.OnPressPtr = 0;

 Box28.OwnerScreen = &Screen1;
 Box28.Order = 10;
 Box28.Left = 228;
 Box28.Top = 11;
 Box28.Width = 116;
 Box28.Height = 87;
 Box28.Pen_Width = 1;
 Box28.Pen_Color = 0x0000;
 Box28.Visible = 1;
 Box28.Active = 1;
 Box28.Transparent = 1;
 Box28.Gradient = 0;
 Box28.Gradient_Orientation = 0;
 Box28.Gradient_Start_Color = 0xF800;
 Box28.Gradient_End_Color = 0xC618;
 Box28.Color = 0xF800;
 Box28.PressColEnabled = 1;
 Box28.Press_Color = 0xFFFF;
 Box28.OnUpPtr = 0;
 Box28.OnDownPtr = 0;
 Box28.OnClickPtr = 1;
 Box28.OnPressPtr = 0;
}




void DrawBox(int x,TBox *ABox){

 Back_Color= ABox->Color;

 if(x==0){
 Draw_rectangle(ABox->Left, ABox->Top, ABox->Width, ABox->Height, ABox->Color,2 );
 }
 else {
 TFT_Rectangle(ABox->Left, ABox->Top, ABox->Width, ABox->Height, ABox->Color );
 }
 }

void DrawLine(TLine *ALine ){




 Draw_Line(ALine->First_Point_X, ALine->First_Point_Y, ALine->Second_Point_X, ALine->Second_Point_Y, ALine->Color );

 }

void DrawCircle(int fill , TCircle *ACircle){




 Draw_Circle((ACircle->Left), (ACircle->Top)+12, ACircle->Radius, fill, ACircle->Color );


 }

void DrawLabel(TLabel *ALabel) {


 Back_Color= 0xFFFF ;

 TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors,ALabel-> Font_Color);
 Display_String(ALabel->Caption, ALabel->Left,ALabel->Top );



 }


void DrawImage(TImage *AImage){

 img_load_raw_image_mem(AImage->Left, AImage->Top, AImage->Width, AImage->Height, AImage->Picture_Name);





 }


 void display_page(TScreen *Screen){
 int iii=0;
 TFT_FULL_ON(Screen->Color);




 while(Screen->BoxesCount != 0){
 DrawBox(1 , *Screen->Boxes );
 *Screen->Boxes++;
 Screen->BoxesCount--;
 }
#line 536 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
 }
void rotary_b_click(unsigned char count_rotary ){



if(count_rotary==1){
 TFT_Rectangle(Screen1_Boxes[1]->Left,Screen1_Boxes[1]->Top, Screen1_Boxes[1]->Width, Screen1_Boxes[1]->Height,  0xFFFF  );
 }

if(count_rotary==2){
TFT_Rectangle(Screen1_Boxes[1]->Left,Screen1_Boxes[1]->Top, Screen1_Boxes[1]->Width, Screen1_Boxes[1]->Height,  0x001F  );
TFT_Rectangle(Screen1_Boxes[2]->Left,Screen1_Boxes[2]->Top, Screen1_Boxes[2]->Width, Screen1_Boxes[2]->Height,  0xFFFF  );
 count_rotary=0;}
#line 561 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
}
#line 5 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"
 extern unsigned char count_rotary;


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
