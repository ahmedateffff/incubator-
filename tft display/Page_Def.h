
// Page_Def

#define Rec_1 {100, 100, 200, 100}
#define Rec_2 {100, 300, 200, 100}
#define Rec_3 {400, 100, 200, 100}
#define Rec_4 {400, 300, 200, 100}



 # include "ssd1963_8bit_library.h"
const code char Tahoma12x16_Regular[];
const code char Tahoma11x13_Regular[];
 const unsigned char gImage_arduino[4608];
  const unsigned char gImage_MEGEG[21098];
  const code char MEGEGYPT_JPG[11727];
  


typedef struct Screen TScreen;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;



  
 //=======================================
typedef struct  Line {
  TScreen*      OwnerScreen;
  char          Order;
  unsigned int  First_Point_X;
  unsigned int  First_Point_Y;
  unsigned int  Second_Point_X;
  unsigned int  Second_Point_Y;
  char          Pen_Width;
  char          Visible;
  unsigned long  Color;
} TLine;



//========================================
typedef struct  Circle {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Radius;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCircle;





//===========================================
 typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

//=============================
 typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;
//=============================




struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           CirclesCount;
  TCircle                * const code *Circles;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
};


 TScreen*  CurrentScreen;

  TScreen                Screen1;
  TBox                   Box34;
  TBox                   Box1;
  TBox                   Box35;
  TBox                   Box16;
  TBox                   Box15;
  TBox                   Box14;
  TBox                   Box21;
  TBox                   Box20;
  TBox                   Box13;
  TBox                   Box31;
  TBox                   Box28;
  TBox                   * const code Screen1_Boxes[11]=
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
  Screen1.Color                     = 0x5AEB;
  Screen1.Width                     = 800;
  Screen1.Height                    = 480;
  Screen1.BoxesCount                = 11;
  Screen1.Boxes                     = Screen1_Boxes;
  Screen1.ObjectsCount              = 11;


  Box34.OwnerScreen     = &Screen1;
  Box34.Order           = 0;
  Box34.Left            = 379;
  Box34.Top             = 2;
  Box34.Width           = 358;
  Box34.Height          = 141;
  Box34.Pen_Width       = 1;
  Box34.Pen_Color       = 0x0000;
  Box34.Visible         = 1;
  Box34.Active          = 1;
  Box34.Transparent     = 1;
  Box34.Gradient        = 0;
  Box34.Gradient_Orientation = 0;
  Box34.Gradient_Start_Color = 0x001F;
  Box34.Gradient_End_Color = 0xC618;
  Box34.Color           = 0x001F;
  Box34.PressColEnabled = 1;
  Box34.Press_Color     = 0xFFFF;
  Box34.OnUpPtr         = 0;
  Box34.OnDownPtr       = 0;
  Box34.OnClickPtr      = 0;
  Box34.OnPressPtr      = 0;

  Box1.OwnerScreen     = &Screen1;
  Box1.Order           = 1;
  Box1.Left            = 116;
  Box1.Top             = 112;
  Box1.Width           = 253;
  Box1.Height          = 58;
  Box1.Pen_Width       = 1;
  Box1.Pen_Color       = 0x0000;
  Box1.Visible         = 1;
  Box1.Active          = 1;
  Box1.Transparent     = 1;
  Box1.Gradient        = 0;
  Box1.Gradient_Orientation = 0;
  Box1.Gradient_Start_Color = 0x001F;
  Box1.Gradient_End_Color = 0xC618;
  Box1.Color           = 0x001F;
  Box1.PressColEnabled = 1;
  Box1.Press_Color     = 0xFFFF;
  Box1.OnUpPtr         = 0;
  Box1.OnDownPtr       = 0;
  //Box1.OnClickPtr      = Box1OnClick;
  Box1.OnPressPtr      = 0;

  Box35.OwnerScreen     = &Screen1;
  Box35.Order           = 2;
  Box35.Left            = 204;
  Box35.Top             = 185;
  Box35.Width           = 188;
  Box35.Height          = 88;
  Box35.Pen_Width       = 1;
  Box35.Pen_Color       = 0x0000;
  Box35.Visible         = 1;
  Box35.Active          = 1;
  Box35.Transparent     = 1;
  Box35.Gradient        = 0;
  Box35.Gradient_Orientation = 0;
  Box35.Gradient_Start_Color = 0x001F;
  Box35.Gradient_End_Color = 0xC618;
  Box35.Color           = 0x001F;
  Box35.PressColEnabled = 1;
  Box35.Press_Color     = 0xFFFF;
  Box35.OnUpPtr         = 0;
  Box35.OnDownPtr       = 0;
 // Box35.OnClickPtr      = Box35OnClick;
  Box35.OnPressPtr      = 0;

  Box16.OwnerScreen     = &Screen1;
  Box16.Order           = 3;
  Box16.Left            = 132;
  Box16.Top             = 284;
  Box16.Width           = 213;
  Box16.Height          = 74;
  Box16.Pen_Width       = 1;
  Box16.Pen_Color       = 0x0000;
  Box16.Visible         = 1;
  Box16.Active          = 1;
  Box16.Transparent     = 1;
  Box16.Gradient        = 0;
  Box16.Gradient_Orientation = 0;
  Box16.Gradient_Start_Color = 0x801F;
  Box16.Gradient_End_Color = 0xC618;
  Box16.Color           = 0x801F;
  Box16.PressColEnabled = 1;
  Box16.Press_Color     = 0xFFFF;
  Box16.OnUpPtr         = 0;
  Box16.OnDownPtr       = 0;
  Box16.OnClickPtr      = 0;
  Box16.OnPressPtr      = 0;

  Box15.OwnerScreen     = &Screen1;
  Box15.Order           = 4;
  Box15.Left            = 368;
  Box15.Top             = 361;
  Box15.Width           = 376;
  Box15.Height          = 73;
  Box15.Pen_Width       = 1;
  Box15.Pen_Color       = 0x0000;
  Box15.Visible         = 1;
  Box15.Active          = 1;
  Box15.Transparent     = 1;
  Box15.Gradient        = 0;
  Box15.Gradient_Orientation = 0;
  Box15.Gradient_Start_Color = 0x801F;
  Box15.Gradient_End_Color = 0xC618;
  Box15.Color           = 0x801F;
  Box15.PressColEnabled = 1;
  Box15.Press_Color     = 0xFFFF;
  Box15.OnUpPtr         = 0;
  Box15.OnDownPtr       = 0;
  Box15.OnClickPtr      = 0;
  Box15.OnPressPtr      = 0;

  Box14.OwnerScreen     = &Screen1;
  Box14.Order           = 5;
  Box14.Left            = 419;
  Box14.Top             = 262;
  Box14.Width           = 317;
  Box14.Height          = 80;
  Box14.Pen_Width       = 1;
  Box14.Pen_Color       = 0x0000;
  Box14.Visible         = 1;
  Box14.Active          = 1;
  Box14.Transparent     = 1;
  Box14.Gradient        = 0;
  Box14.Gradient_Orientation = 0;
  Box14.Gradient_Start_Color = 0x801F;
  Box14.Gradient_End_Color = 0xC618;
  Box14.Color           = 0x801F;
  Box14.PressColEnabled = 1;
  Box14.Press_Color     = 0xFFFF;
  Box14.OnUpPtr         = 0;
  Box14.OnDownPtr       = 0;
  Box14.OnClickPtr      = 0;
  Box14.OnPressPtr      = 0;

  Box21.OwnerScreen     = &Screen1;
  Box21.Order           = 6;
  Box21.Left            = 795;
  Box21.Top             = 139;
  Box21.Width           = 195;
  Box21.Height          = 87;
  Box21.Pen_Width       = 1;
  Box21.Pen_Color       = 0x0000;
  Box21.Visible         = 1;
  Box21.Active          = 1;
  Box21.Transparent     = 1;
  Box21.Gradient        = 0;
  Box21.Gradient_Orientation = 0;
  Box21.Gradient_Start_Color = 0x0408;
  Box21.Gradient_End_Color = 0xC618;
  Box21.Color           = 0x0408;
  Box21.PressColEnabled = 1;
  Box21.Press_Color     = 0xFFFF;
  Box21.OnUpPtr         = 0;
  Box21.OnDownPtr       = 0;
  Box21.OnClickPtr      = 1;
  Box21.OnPressPtr      = 0;

  Box20.OwnerScreen     = &Screen1;
  Box20.Order           = 7;
  Box20.Left            = 70;
  Box20.Top             = 187;
  Box20.Width           = 116;
  Box20.Height          = 87;
  Box20.Pen_Width       = 1;
  Box20.Pen_Color       = 0x0000;
  Box20.Visible         = 1;
  Box20.Active          = 1;
  Box20.Transparent     = 1;
  Box20.Gradient        = 0;
  Box20.Gradient_Orientation = 0;
  Box20.Gradient_Start_Color = 0xFC00;
  Box20.Gradient_End_Color = 0xC618;
  Box20.Color           = 0xFC00;
  Box20.PressColEnabled = 1;
  Box20.Press_Color     = 0xFFFF;
  Box20.OnUpPtr         = 0;
  Box20.OnDownPtr       = 0;
  Box20.OnClickPtr      = 1;
  Box20.OnPressPtr      = 0;

  Box13.OwnerScreen     = &Screen1;
  Box13.Order           = 8;
  Box13.Left            = 89;
  Box13.Top             = 10;
  Box13.Width           = 120;
  Box13.Height          = 87;
  Box13.Pen_Width       = 1;
  Box13.Pen_Color       = 0x0000;
  Box13.Visible         = 1;
  Box13.Active          = 1;
  Box13.Transparent     = 1;
  Box13.Gradient        = 0;
  Box13.Gradient_Orientation = 0;
  Box13.Gradient_Start_Color = 0x801F;
  Box13.Gradient_End_Color = 0xC618;
  Box13.Color           = 0x801F;
  Box13.PressColEnabled = 1;
  Box13.Press_Color     = 0xFFFF;
  Box13.OnUpPtr         = 0;
  Box13.OnDownPtr       = 0;
  Box13.OnClickPtr      = 1;
  Box13.OnPressPtr      = 0;

  Box31.OwnerScreen     = &Screen1;
  Box31.Order           = 9;
  Box31.Left            = 450;
  Box31.Top             = 166;
  Box31.Width           = 286;
  Box31.Height          = 82;
  Box31.Pen_Width       = 1;
  Box31.Pen_Color       = 0x0000;
  Box31.Visible         = 1;
  Box31.Active          = 1;
  Box31.Transparent     = 1;
  Box31.Gradient        = 0;
  Box31.Gradient_Orientation = 0;
  Box31.Gradient_Start_Color = 0x8408;
  Box31.Gradient_End_Color = 0xC618;
  Box31.Color           = 0x8408;
  Box31.PressColEnabled = 1;
  Box31.Press_Color     = 0xFFFF;
  Box31.OnUpPtr         = 0;
  Box31.OnDownPtr       = 0;
  Box31.OnClickPtr      = 1;
  Box31.OnPressPtr      = 0;

  Box28.OwnerScreen     = &Screen1;
  Box28.Order           = 10;
  Box28.Left            = 228;
  Box28.Top             = 11;
  Box28.Width           = 116;
  Box28.Height          = 87;
  Box28.Pen_Width       = 1;
  Box28.Pen_Color       = 0x0000;
  Box28.Visible         = 1;
  Box28.Active          = 1;
  Box28.Transparent     = 1;
  Box28.Gradient        = 0;
  Box28.Gradient_Orientation = 0;
  Box28.Gradient_Start_Color = 0xF800;
  Box28.Gradient_End_Color = 0xC618;
  Box28.Color           = 0xF800;
  Box28.PressColEnabled = 1;
  Box28.Press_Color     = 0xFFFF;
  Box28.OnUpPtr         = 0;
  Box28.OnDownPtr       = 0;
  Box28.OnClickPtr      = 1;
  Box28.OnPressPtr      = 0;
}



  //====================================================================
void DrawBox(int x,TBox *ABox){

     Back_Color= ABox->Color;

     if(x==0){
          Draw_rectangle(ABox->Left, ABox->Top,  ABox->Width,  ABox->Height,  ABox->Color,2 );
         }
     else {
          TFT_Rectangle(ABox->Left, ABox->Top,  ABox->Width,  ABox->Height,  ABox->Color );
         }
     }
 //===============================================================
void DrawLine(TLine *ALine  ){




   Draw_Line(ALine->First_Point_X, ALine->First_Point_Y,  ALine->Second_Point_X,  ALine->Second_Point_Y,  ALine->Color );

               }
 //=============================================================
void DrawCircle(int fill , TCircle *ACircle){




   Draw_Circle((ACircle->Left), (ACircle->Top)+12,  ACircle->Radius,  fill,  ACircle->Color );


      }
  //======================================================================================string===================================
void DrawLabel(TLabel *ALabel) {


     Back_Color=White;

   TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors,ALabel-> Font_Color);
   Display_String(ALabel->Caption, ALabel->Left,ALabel->Top );



 }  
 //=========================================
 
void DrawImage(TImage *AImage){

     img_load_raw_image_mem(AImage->Left, AImage->Top, AImage->Width, AImage->Height, AImage->Picture_Name);





     }

 //=========================================
 void display_page(TScreen *Screen){
        int iii=0;
      TFT_FULL_ON(Screen->Color);
      
   
          
          
          while(Screen->BoxesCount != 0){
             DrawBox(1 , *Screen->Boxes );
             Screen->Boxes++;
             Screen->BoxesCount--;
            }
           
            while(Screen->LabelsCount != 0){
     if(Screen->LabelsCount==3){Back_Color=Blue;}

        // DrawCircle(1 ,Screen->CirclesCount,*Screen->Circles);
         DrawLabel(*Screen->Labels);
         *Screen->Labels++;
         Screen->LabelsCount--;
         }
         
         
  /*while(Screen->ImagesCount != 0){
           DrawImage(Screen->Images) ;
           Screen->Images++;
            Screen->ImagesCount--;

          }*/ 
      

     }