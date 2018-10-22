// TFT header file
//tft Proto7     BULIT IN controller ssd1963

#ifndef ssd1963_16bit_library
#define ssd1963_16bit_library

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
#define Pink            0xF81F


  
// Functions definitions
/**
  * @brief  Sets controllers register address to be written in next cycle.
  * @param  index : The values can be in [0x00 - 0xFF] range
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Index(unsigned int  index);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Sets value of controller register (address must be previously defined with TFT_Set_Index)
  * @param  cmd : The values can be in [0x00 - 0xFF] range
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Write_Command(unsigned int  cmd);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Write 16bit value on TFT Data bus. This is 16bit communication
  *         so it is done in one cycles. This should be used when working with
  *         TFT controller in 16bit mode.
  * @param  color : Data to be transfered. Range values [0x00 - 0xFFFF]
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Write_Data(unsigned int color);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Turn OFF display (SSD1963)
  * @param  None.
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Display_OFF_SSD1963();
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Turn ON display (SSD1963)
  * @param  None.
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Display_ON_SSD1963();
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Enter sleep mode (SSD1963)
  * @param  None.
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Enter_Sleep_Mode_SSD1963();
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Exit sleep mode (SSD1963)
  * @param  None.
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Exit_Sleep_Mode_SSD1963();
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @tft __TFT_Intialize_16bit
  *@This is 16bit communication mode
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Intialize_16bit(void);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Set_BackLight(unsigned char Bkl);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**
  * @brief  Move cursor to designated coordinates, in preparation for drawing on display.
  * @param  x : X coordinate. Range shoud be [0 - TFT_DISP_WIDTH-1]
  * @param  y : Y coordinate. Range shoud be [0 - TFT_DISP_HEIGHT-1]
  */
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void WindowSet(unsigned int s_x,unsigned int e_x,unsigned int s_y,unsigned int e_y);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*  Fills screen memory block with given color.
*  dat :Range values [0x00 - 0xFFFF]  color
*/
void TFT_FULL_ON(unsigned long dat);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Set Font
//    Font: NAME FONT
//    Font_Descrip=
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Set_Font(const unsigned short *Font, const unsigned int *Font_Descrip, unsigned int dat);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Number ( )
//    b: Ascii
//    c: Start X Address
//    d: Start Y Address
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_number(unsigned char b, unsigned int x0, unsigned int y0);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Numbers
//
//    a: Database
//    b: Start X Address    Row
//    c: Start Y Address    Column
//    * Must write "0" in the end...
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_numbers(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0);
 //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show Character ( )
//    b: Ascii
//    c: Start X Address
//    d: Start Y Address
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_char(unsigned char b, unsigned int x0, unsigned int y0);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//  Show String
//
//    a: Database
//    b: Start X Address    Row
//    c: Start Y Address    Column
//    * Must write "0" in the end...
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Display_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*   x0: x0 coordinate of the upper left rectangle corner.
*   y0: y coordinate of the upper left rectangle corner.
*   w: WEIGHT rectangle .
*   H: HIGHT  rectangle .
*  dat: COLOR   rectangle.
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Rectangle(unsigned int x0, unsigned int y0, unsigned int W, unsigned int H, unsigned int dat);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*  x1: x coordinate of the line start.
*  y1: y coordinate of the line end.
*  x2: x coordinate of the line start.
*  y2: y coordinate of the line end.
*  colour: COLOR   line.
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned long colour);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*   xc: x coordinate of the circle center.
*   yc: y coordinate of the circle center.
*   radius: radius size.
*   colour: COLOR Circle.
*   fill :if(fill=0) Circle is hollow and  if(fill=1)Circle is solid
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*  x1: x coordinate of the line start.
*  x2: x coordinate of the line end.
*  y: y coordinate of horizontal line.
*  colour: COLOR   line.
*/
void Draw_Line_H(signed int x1,signed int x2, signed int y,unsigned long colour);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*  y1: y coordinate of the line start.
*  y2: y coordinate of the line end.
*  x: x coordinate of vertical line.
*  colour: COLOR   line.
*/
void Draw_Line_V(signed int x,signed int y1, signed int y2,unsigned long colour);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*   x0: x0 coordinate of the upper left rectangle corner.
*   y0: y coordinate of the upper left rectangle corner.
*   w: WEIGHT rectangle .
*   H: HIGHT  rectangle .
*  dat: COLOR   rectangle.
*  size: size font (lines rectangle).
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void Draw_rectangle(signed int x1,signed int y1,signed int W,signed int H,unsigned long colour,unsigned int size);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
*  x11: position of the image's left edge.
*  y11:position of the image's top edge.
*  imgX: weight image. .
*  imgY: hight image.
*  img: image to be displayed. Bitmap array is located in code memory.
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void sam_load_raw_image_mem(int x11, int y11, int imgX, int imgY, const unsigned char*img) ;
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*

*  str: image to be displayed. Bitmap array is located in code memory.

*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void LCD_DispPic_FullSize(const unsigned char *str);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/**@export BMP image 16 bit from the SD card
@ the image name should have 11 characters including the extension ".txt"
*/
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void TFT_Image_Ext(void);
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  
  
  
  
  
  
  
#endif