
 void zcd_initialize(){
 INTCON.GIE=1;
 INTCON.PEIE=1;
 ZCD1CON=0XC2;

 PIR3.ZCDIF=0;  //FLAG
 PIE3.ZCDIE=1;   //ENABLE ZCD INT


 }
 
void interrupt(){     //ZCD_ISR

  if (PIR3.ZCDIF) {


PIR3.ZCDIF=0;  //CLEAR ZCD INTERRUPT FLAG
//RC1_bit = ~ RC1_bit ;


} }


void main() {
LATA=0x00;
trisa=0x04;
ANSELA=0x00;
WPUA= 0x00;
trisc=0x00;
ANSELC=0x00;
WPUC=0X00;
OPTION_REG.nWPUEN=0x01;
RC1_bit = 0 ;
zcd_initialize();
portc=0xff  ;
porta=0xff;
//porta.f5=1;

}