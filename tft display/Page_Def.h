
// Page_Def

#define Rec_1 {100, 100, 200, 100}
#define Rec_2 {100, 300, 200, 100}
#define Rec_3 {400, 100, 200, 100}
#define Rec_4 {400, 300, 200, 100}

    

 # include "ssd1963_8bit_library.h"
  
 
unsigned int Rec[4][4] = {Rec_1, Rec_2, Rec_3, Rec_4}  ;





typedef struct  Box {

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
  unsigned long  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;

} TBox;




  
 //=======================================
typedef struct  Line {

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
  unsigned long  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;

} TCircle;





//===========================================
  typedef struct  Label {

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


    
 

 
  TBox                   Box1;
  TLabel                 Label1;
char Label1_Caption[4] = "MEG";

  TLabel                 Label2;
char Label2_Caption[13] = "for medical ";

  TBox                   Box2;
  TLabel                 * const code Screen1_Labels[2]=
         {
         &Label1,              
         &Label2               
         };
  TBox                   * const code Screen1_Boxes[2]=
         {
         &Box1,                
         &Box2                 
         };

  
  TCircle                Circle1;
  TLine                  Line1;
  TBox                   Box3;
  TCircle                * const code Screen2_Circles[1]=
         {
         &Circle1              
         };
  TBox                   * const code Screen2_Boxes[1]=
         {
         &Box3                 
         };
  TLine                  * const code Screen2_Lines[1]=
         {
         &Line1                
         };



static void InitializeObjects() {
  
  


  Box1.Order           = 0;
  Box1.Left            = 259;
  Box1.Top             = 242;
  Box1.Width           = 141;
  Box1.Height          = 22;
  Box1.Pen_Width       = 1;
  Box1.Pen_Color       = 0x0000;
  Box1.Visible         = 1;
  Box1.Active          = 1;
  Box1.Transparent     = 1;
  Box1.Gradient        = 1;
  Box1.Gradient_Orientation = 0;
  Box1.Gradient_Start_Color = 0xFFFF;
  Box1.Gradient_End_Color = 0xC618;
  Box1.Color           = 0xC618;
  Box1.PressColEnabled = 1;
  Box1.Press_Color     = 0xE71C;
 

  
  Label1.Order           = 1;
  Label1.Left            = 348;
  Label1.Top             = 124;
  Label1.Width           = 82;
  Label1.Height          = 53;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = tahoma_24pt_Font;
  Label1.Font_Color      = 0x0000;


  
  Label2.Order           = 2;
  Label2.Left            = 412;
  Label2.Top             = 169;
  Label2.Width           = 161;
  Label2.Height          = 43;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = tahoma_24pt_Font;
  Label2.Font_Color      = 0x0000;
  Label2.VerticalText    = 0;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;


  Box2.Order           = 3;
  Box2.Left            = 399;
  Box2.Top             = 242;
  Box2.Width           = 141;
  Box2.Height          = 22;
  Box2.Pen_Width       = 1;
  Box2.Pen_Color       = 0x0000;
  Box2.Visible         = 1;
  Box2.Active          = 1;
  Box2.Transparent     = 1;
  Box2.Gradient        = 1;
  Box2.Gradient_Orientation = 0;
  Box2.Gradient_Start_Color = 0xFFFF;
  Box2.Gradient_End_Color = 0xC618;
  Box2.Color           = 0xC618;
  Box2.PressColEnabled = 1;
  Box2.Press_Color     = 0xE71C;


 
  Circle1.Order           = 0;
  Circle1.Left            = 148;
  Circle1.Top             = 82;
  Circle1.Radius          = 18;
  Circle1.Pen_Width       = 1;
  Circle1.Pen_Color       = 0x0000;
  Circle1.Visible         = 1;
  Circle1.Active          = 1;
  Circle1.Transparent     = 1;
  Circle1.Gradient        = 1;
  Circle1.Gradient_Orientation = 0;
  Circle1.Gradient_Start_Color = 0xFFFF;
  Circle1.Gradient_End_Color = 0xC618;
  Circle1.Color           = 0xC618;
  Circle1.PressColEnabled = 1;
  Circle1.Press_Color     = 0xE71C;


 
  Line1.Order           = 1;
  Line1.First_Point_X   = 285;
  Line1.First_Point_Y   = 54;
  Line1.Second_Point_X  = 385;
  Line1.Second_Point_Y  = 104;
  Line1.Visible         = 1;
  Line1.Pen_Width       = 1;
  Line1.Color           = 0x0000;

 
  Box3.Order           = 2;
  Box3.Left            = 410;
  Box3.Top             = 166;
  Box3.Width           = 50;
  Box3.Height          = 25;
  Box3.Pen_Width       = 1;
  Box3.Pen_Color       = 0x0000;
  Box3.Visible         = 1;
  Box3.Active          = 1;
  Box3.Transparent     = 1;
  Box3.Gradient        = 1;
  Box3.Gradient_Orientation = 0;
  Box3.Gradient_Start_Color = 0xFFFF;
  Box3.Gradient_End_Color = 0xC618;
  Box3.Color           = 0xC618;
  Box3.PressColEnabled = 1;
  Box3.Press_Color     = 0xE71C;

}


  //====================================================================
void DrawBox(int x){
int ii;     
  for(ii=0; ii<4; ii++ )                           {
  
       Back_Color= Screen1_Boxes[ii]->Color;
  //TFT_Rectangle(Rec[ii][0], Rec[ii][1], Rec[ii][2], Rec[ii][3], 0xFF00FF);
    if(x==0){
   Draw_rectangle(Screen1_Boxes[ii]->Left, Screen1_Boxes[ii]->Top,  Screen1_Boxes[ii]->Width,  Screen1_Boxes[ii]->Height,  Screen1_Boxes[ii]->Color,2 );}
   else
        TFT_Rectangle(Screen1_Boxes[ii]->Left, Screen1_Boxes[ii]->Top,  Screen1_Boxes[ii]->Width,  Screen1_Boxes[ii]->Height,  Screen1_Boxes[ii]->Color );                                            }
               } 
               
               
 void DrawBox2(int x){
int ii;     
  for(ii=0; ii<4; ii++ )                           {
  
       Back_Color= Screen2_Boxes[ii]->Color;
  //TFT_Rectangle(Rec[ii][0], Rec[ii][1], Rec[ii][2], Rec[ii][3], 0xFF00FF);
    if(x==0){
   Draw_rectangle(Screen2_Boxes[ii]->Left, Screen2_Boxes[ii]->Top,  Screen2_Boxes[ii]->Width,  Screen2_Boxes[ii]->Height,  Screen2_Boxes[ii]->Color,2 );}
   else
        TFT_Rectangle(Screen2_Boxes[ii]->Left, Screen2_Boxes[ii]->Top,  Screen2_Boxes[ii]->Width,  Screen2_Boxes[ii]->Height,  Screen2_Boxes[ii]->Color );                                            }
               }           
 //===============================================================
/*void DrawLine(){
int ii;
  for(ii=0; ii<1; ii++ )                           {



   Draw_Line(Screen1_Lines[ii]->First_Point_X, Screen1_Lines[ii]->First_Point_Y,  Screen1_Lines[ii]->Second_Point_X,  Screen1_Lines[ii]->Second_Point_Y,  Screen1_Lines[ii]->Color );
                                                    }
               }*/
               
void DrawLine2(){
int ii;
  for(ii=0; ii<1; ii++ )                           {



   Draw_Line(Screen2_Lines[ii]->First_Point_X, Screen2_Lines[ii]->First_Point_Y,  Screen2_Lines[ii]->Second_Point_X,  Screen2_Lines[ii]->Second_Point_Y,  Screen2_Lines[ii]->Color );
                                                    }
               }
 //=============================================================
/*void DrawCircle(int fill){
 int ii;
  for(ii=0; ii<1; ii++ )                           {



   Draw_Circle((Screen1_Circles[ii]->Left), (Screen1_Circles[ii]->Top)+12,  Screen1_Circles[ii]->Radius,  fill,  Screen1_Circles[ii]->Color );
                                                    }
  
      }*/
  //======================================================================================string===================================
void DrawLabel() {
int iii;
     Back_Color = Black ;
        
    for(iii=0; iii<9; iii++ ){
    TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors,Screen1_Labels[iii]-> Font_Color);
   Display_String(Screen1_Labels[iii]->Caption, Screen1_Labels[iii]->Left,Screen1_Labels[iii]->Top );
                 } 

 }
 
/*void DrawLabe2() {
int iii;
     Back_Color = Black ;
        
    for(iii=0; iii<9; iii++ ){
    TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors,Screen2_Labels[iii]-> Font_Color);
   Display_String(Screen2_Labels[iii]->Caption, Screen2_Labels[iii]->Left,Screen2_Labels[iii]->Top );
                 } 

 }*/