#line 1 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"





unsigned long Font_Color = 0 ;
unsigned long Back_Color ;
const unsigned short *Font_Pointer;
unsigned short Tempo ;
const unsigned int *Font_Description_Pointer ;
#line 1 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
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
#line 59 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
void TFT_Set_Index(unsigned int index) {
#line 63 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 Delay_1us(); Delay_1us();
 TFT_CS = 0;
 TFT_RD = 1;
 TFT_RS = 0;
 TFT_DataPort= index;


 TFT_WR = 0;
 TFT_WR = 1;
 TFT_CS = 1;
}
#line 79 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
void TFT_Write_Command(unsigned int cmd) {
#line 83 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 TFT_CS = 0;
 TFT_RD = 1;
 TFT_RS = 1;
 TFT_DataPort = cmd;

 TFT_WR = 0;
 TFT_WR = 1;
 TFT_CS = 1;
 Delay_1us();
}
#line 104 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
{ unsigned int value ;
 value = (((31*(r+4))/255)<<11) |
 (((63*(g+2))/255)<<5) |
 ((31*(b+4))/255);
 return (value);
}

void TFT_Write_Data(unsigned int color) {
#line 123 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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
#line 147 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
 TFT_Set_Index(0x0A);
TFT_Write_Command(0x1C);
#line 154 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
TFT_Set_Index(0xE2);
TFT_Write_Command(60);
TFT_Write_Command(5);
TFT_Write_Command(0x54);
#line 163 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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
#line 189 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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
#line 358 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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
#line 449 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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
#line 662 "c:/users/ahmed/desktop/incubator/tft display/ssd1963_8bit_library.h"
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


 TFT_Write_Data(color.U16);
 }
 TFT_CS = 1;


}
#line 14 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
unsigned int Rec[4][4] = { {100, 100, 200, 100} ,  {100, 300, 200, 100} ,  {400, 100, 200, 100} ,  {400, 300, 200, 100} } ;





typedef struct Box {

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
 unsigned long Color;
 char PressColEnabled;
 unsigned int Press_Color;

} TBox;






typedef struct Line {

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
 unsigned long Color;
 char PressColEnabled;
 unsigned int Press_Color;

} TCircle;






 typedef struct Label {

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








 TBox Box1;
 TLabel Label1;
char Label1_Caption[4] = "MEG";

 TLabel Label2;
char Label2_Caption[13] = "for medical ";

 TBox Box2;
 TLabel * const code Screen1_Labels[2]=
 {
 &Label1,
 &Label2
 };
 TBox * const code Screen1_Boxes[2]=
 {
 &Box1,
 &Box2
 };


 TCircle Circle1;
 TLine Line1;
 TBox Box3;
 TCircle * const code Screen2_Circles[1]=
 {
 &Circle1
 };
 TBox * const code Screen2_Boxes[1]=
 {
 &Box3
 };
 TLine * const code Screen2_Lines[1]=
 {
 &Line1
 };



static void InitializeObjects() {




 Box1.Order = 0;
 Box1.Left = 259;
 Box1.Top = 242;
 Box1.Width = 141;
 Box1.Height = 22;
 Box1.Pen_Width = 1;
 Box1.Pen_Color = 0x0000;
 Box1.Visible = 1;
 Box1.Active = 1;
 Box1.Transparent = 1;
 Box1.Gradient = 1;
 Box1.Gradient_Orientation = 0;
 Box1.Gradient_Start_Color = 0xFFFF;
 Box1.Gradient_End_Color = 0xC618;
 Box1.Color = 0xC618;
 Box1.PressColEnabled = 1;
 Box1.Press_Color = 0xE71C;



 Label1.Order = 1;
 Label1.Left = 348;
 Label1.Top = 124;
 Label1.Width = 82;
 Label1.Height = 53;
 Label1.Visible = 1;
 Label1.Active = 1;
 Label1.Caption = Label1_Caption;
 Label1.FontName = tahoma_24pt_Font;
 Label1.Font_Color = 0x0000;



 Label2.Order = 2;
 Label2.Left = 412;
 Label2.Top = 169;
 Label2.Width = 161;
 Label2.Height = 43;
 Label2.Visible = 1;
 Label2.Active = 1;
 Label2.Caption = Label2_Caption;
 Label2.FontName = tahoma_24pt_Font;
 Label2.Font_Color = 0x0000;
 Label2.VerticalText = 0;
 Label2.OnUpPtr = 0;
 Label2.OnDownPtr = 0;
 Label2.OnClickPtr = 0;
 Label2.OnPressPtr = 0;


 Box2.Order = 3;
 Box2.Left = 399;
 Box2.Top = 242;
 Box2.Width = 141;
 Box2.Height = 22;
 Box2.Pen_Width = 1;
 Box2.Pen_Color = 0x0000;
 Box2.Visible = 1;
 Box2.Active = 1;
 Box2.Transparent = 1;
 Box2.Gradient = 1;
 Box2.Gradient_Orientation = 0;
 Box2.Gradient_Start_Color = 0xFFFF;
 Box2.Gradient_End_Color = 0xC618;
 Box2.Color = 0xC618;
 Box2.PressColEnabled = 1;
 Box2.Press_Color = 0xE71C;



 Circle1.Order = 0;
 Circle1.Left = 148;
 Circle1.Top = 82;
 Circle1.Radius = 18;
 Circle1.Pen_Width = 1;
 Circle1.Pen_Color = 0x0000;
 Circle1.Visible = 1;
 Circle1.Active = 1;
 Circle1.Transparent = 1;
 Circle1.Gradient = 1;
 Circle1.Gradient_Orientation = 0;
 Circle1.Gradient_Start_Color = 0xFFFF;
 Circle1.Gradient_End_Color = 0xC618;
 Circle1.Color = 0xC618;
 Circle1.PressColEnabled = 1;
 Circle1.Press_Color = 0xE71C;



 Line1.Order = 1;
 Line1.First_Point_X = 285;
 Line1.First_Point_Y = 54;
 Line1.Second_Point_X = 385;
 Line1.Second_Point_Y = 104;
 Line1.Visible = 1;
 Line1.Pen_Width = 1;
 Line1.Color = 0x0000;


 Box3.Order = 2;
 Box3.Left = 410;
 Box3.Top = 166;
 Box3.Width = 50;
 Box3.Height = 25;
 Box3.Pen_Width = 1;
 Box3.Pen_Color = 0x0000;
 Box3.Visible = 1;
 Box3.Active = 1;
 Box3.Transparent = 1;
 Box3.Gradient = 1;
 Box3.Gradient_Orientation = 0;
 Box3.Gradient_Start_Color = 0xFFFF;
 Box3.Gradient_End_Color = 0xC618;
 Box3.Color = 0xC618;
 Box3.PressColEnabled = 1;
 Box3.Press_Color = 0xE71C;

}



void DrawBox(int x){
int ii;
 for(ii=0; ii<4; ii++ ) {

 Back_Color= Screen1_Boxes[ii]->Color;

 if(x==0){
 Draw_rectangle(Screen1_Boxes[ii]->Left, Screen1_Boxes[ii]->Top, Screen1_Boxes[ii]->Width, Screen1_Boxes[ii]->Height, Screen1_Boxes[ii]->Color,2 );}
 else
 TFT_Rectangle(Screen1_Boxes[ii]->Left, Screen1_Boxes[ii]->Top, Screen1_Boxes[ii]->Width, Screen1_Boxes[ii]->Height, Screen1_Boxes[ii]->Color ); }
 }


 void DrawBox2(int x){
int ii;
 for(ii=0; ii<4; ii++ ) {

 Back_Color= Screen2_Boxes[ii]->Color;

 if(x==0){
 Draw_rectangle(Screen2_Boxes[ii]->Left, Screen2_Boxes[ii]->Top, Screen2_Boxes[ii]->Width, Screen2_Boxes[ii]->Height, Screen2_Boxes[ii]->Color,2 );}
 else
 TFT_Rectangle(Screen2_Boxes[ii]->Left, Screen2_Boxes[ii]->Top, Screen2_Boxes[ii]->Width, Screen2_Boxes[ii]->Height, Screen2_Boxes[ii]->Color ); }
 }
#line 314 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
void DrawLine2(){
int ii;
 for(ii=0; ii<1; ii++ ) {



 Draw_Line(Screen2_Lines[ii]->First_Point_X, Screen2_Lines[ii]->First_Point_Y, Screen2_Lines[ii]->Second_Point_X, Screen2_Lines[ii]->Second_Point_Y, Screen2_Lines[ii]->Color );
 }
 }
#line 335 "c:/users/ahmed/desktop/incubator/tft display/page_def.h"
void DrawLabel() {
int iii;
 Back_Color =  0x0000  ;

 for(iii=0; iii<9; iii++ ){
 TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors,Screen1_Labels[iii]-> Font_Color);
 Display_String(Screen1_Labels[iii]->Caption, Screen1_Labels[iii]->Left,Screen1_Labels[iii]->Top );
 }

 }
#line 14 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"
char nu[]= "    " ;


 int kk;



void main() {


AD1PCFG = 0xFFFF;

 JTAGEN_bit= 0;


TRISB = 0X00;
 TRISF0_bit=0;
 TRISE2_bit=0;
 TRISC13_bit=0;
 TRISE1_bit=0;
TRISC14_bit=0;
#line 39 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"
 TFT_Intialize_16bit();









 Back_Color = 0Xffffff ;


 TFT_FULL_ON( 0xFFFF );
 Set_BackLight(0xff);
InitializeObjects();
#line 59 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"
DrawLabel();
DrawBox(0);

Delay_ms(3000);
Set_BackLight(0x00);
DrawBox2(0);
DrawLine2();
 TFT_FULL_ON( 0xFFFF );
 Set_BackLight(0xff);
#line 171 "C:/Users/ahmed/Desktop/incubator/tft display/MyProjectff.c"
 }
