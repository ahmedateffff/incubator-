#line 1 "C:/Users/ahmed/Desktop/incubator/zcd test/16fb1613 test4 WITH TMROK/LedBlinking.c"



unsigned int CntTmr1ToFiring = 1 ;
unsigned char FiringAngleDelay=0;
int FiringFlag=0;
unsigned short tmrflag=0;





void InitTimer0(){
 OPTION_REG = 0x88;
 TMR0 = 156;
 INTCON = 0xA0;
 }

 void zcd_initialize(){
 INTCON.GIE=1;
 INTCON.PEIE=1;
 ZCD1CON=0XC2;

 PIR3.ZCDIF=0;
 PIE3.ZCDIE=1;


 }
 void interrupt(){

 if (PIR3.ZCDIF) {
 PIR3.ZCDIF=0;
 FiringAngleDelay = 66;
 TMR0IE_bit = 1;
#line 51 "C:/Users/ahmed/Desktop/incubator/zcd test/16fb1613 test4 WITH TMROK/LedBlinking.c"
 }



 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 156;
 CntTmr1ToFiring++;


 if (CntTmr1ToFiring == FiringAngleDelay ){

  LATC.F4  = 0 ;
 tmrflag=1;

 }
 if((CntTmr1ToFiring == FiringAngleDelay+3) ){
  LATC.F4  = 1 ;
 CntTmr1ToFiring = 0 ;
 tmrflag=1;
 TMR0IE_bit = 0 ;

 }
 }






}







void main() {

 TRISA = 0x04;

 TRISC = 0;
 ANSELA=0x00;
 ANSELC=0x00;
WPUC=0X00;
OPTION_REG.nWPUEN=0x01;
 zcd_initialize();
 InitTimer0();
  LATC.F4 =0;
while(1){

 LATA = 0xFF;



 Delay_ms(100);

 LATA = 0x00;



 Delay_ms(100);
 }
}
