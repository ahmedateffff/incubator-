#line 1 "C:/Users/ahmed/Desktop/incubator/zcd test/16fb1613 test2/LedBlinking.c"
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



} }







void main() {

 TRISA = 0x04;

 TRISC = 0;
 ANSELA=0x00;
 ANSELC=0x00;
WPUC=0X00;
OPTION_REG.nWPUEN=0x01;
 zcd_initialize();
while(1){
 LATA = 0xFF;

 LATC = 0x00;

 Delay_ms(100);

 LATA = 0x00;

 LATC = 0xFF;

 Delay_ms(100);
 }
}
