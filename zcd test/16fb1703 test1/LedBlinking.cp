#line 1 "C:/Users/AhmedAtef/Desktop/New folder/LedBlinking.c"
#line 25 "C:/Users/AhmedAtef/Desktop/New folder/LedBlinking.c"
void main() {

 TRISA = 0;

 TRISC = 0;


 do {
 LATA = 0x00;

 LATC = 0x00;

 Delay_ms(500);

 LATA = 0xFF;

 LATC = 0xFF;

 Delay_ms(1000);
 } while(1);
}
