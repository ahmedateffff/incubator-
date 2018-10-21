#line 1 "C:/Users/ahmed/Desktop/incubator/zcd test/16fb1613 test3/LedBlinking.c"



unsigned int CntTmr1ToFiring = 1 ;
unsigned char FiringAngleDelay;
int FiringFlag=0;





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
 FiringAngleDelay = 0;
#line 49 "C:/Users/ahmed/Desktop/incubator/zcd test/16fb1613 test3/LedBlinking.c"
 }



 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 156;
 CntTmr1ToFiring++;
 if (CntTmr1ToFiring ==2000){
 CntTmr1ToFiring=0;
  LATC.F4  = ~  LATC.F4 ;
 }
#line 72 "C:/Users/ahmed/Desktop/incubator/zcd test/16fb1613 test3/LedBlinking.c"
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
