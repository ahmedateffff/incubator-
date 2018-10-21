
_zcd_initialize:

;LedBlinking.c,1 :: 		void zcd_initialize(){
;LedBlinking.c,2 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;LedBlinking.c,3 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;LedBlinking.c,4 :: 		ZCD1CON=0XC2;
	MOVLW      194
	MOVWF      ZCD1CON+0
;LedBlinking.c,6 :: 		PIR3.ZCDIF=0;  //FLAG
	BCF        PIR3+0, 4
;LedBlinking.c,7 :: 		PIE3.ZCDIE=1;   //ENABLE ZCD INT
	BSF        PIE3+0, 4
;LedBlinking.c,10 :: 		}
L_end_zcd_initialize:
	RETURN
; end of _zcd_initialize

_interrupt:

;LedBlinking.c,11 :: 		void interrupt(){     //ZCD_ISR
;LedBlinking.c,13 :: 		if (PIR3.ZCDIF) {
	BTFSS      PIR3+0, 4
	GOTO       L_interrupt0
;LedBlinking.c,16 :: 		PIR3.ZCDIF=0;  //CLEAR ZCD INTERRUPT FLAG
	BCF        PIR3+0, 4
;LedBlinking.c,20 :: 		} }
L_interrupt0:
L_end_interrupt:
L__interrupt7:
	RETFIE     %s
; end of _interrupt

_main:

;LedBlinking.c,28 :: 		void main() {
;LedBlinking.c,30 :: 		TRISA = 0x04;           // set direction to be output
	MOVLW      4
	MOVWF      TRISA+0
;LedBlinking.c,32 :: 		TRISC = 0;           // set direction to be output
	CLRF       TRISC+0
;LedBlinking.c,33 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;LedBlinking.c,34 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;LedBlinking.c,35 :: 		WPUC=0X00;
	CLRF       WPUC+0
;LedBlinking.c,36 :: 		OPTION_REG.nWPUEN=0x01;
	BSF        OPTION_REG+0, 7
;LedBlinking.c,37 :: 		zcd_initialize();
	CALL       _zcd_initialize+0
;LedBlinking.c,38 :: 		while(1){
L_main1:
;LedBlinking.c,39 :: 		LATA = 0xFF;       // Turn OFF LEDs on PORTA
	MOVLW      255
	MOVWF      LATA+0
;LedBlinking.c,41 :: 		LATC = 0x00;       // Turn OFF LEDs on PORTC
	CLRF       LATC+0
;LedBlinking.c,43 :: 		Delay_ms(100);    // 1 second delay
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main3:
	DECFSZ     R13, 1
	GOTO       L_main3
	DECFSZ     R12, 1
	GOTO       L_main3
	NOP
	NOP
;LedBlinking.c,45 :: 		LATA = 0x00;       // Turn ON LEDs on PORTA
	CLRF       LATA+0
;LedBlinking.c,47 :: 		LATC = 0xFF;       // Turn ON LEDs on PORTC
	MOVLW      255
	MOVWF      LATC+0
;LedBlinking.c,49 :: 		Delay_ms(100);    // 1 second delay
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	NOP
	NOP
;LedBlinking.c,50 :: 		}          // Endless loop
	GOTO       L_main1
;LedBlinking.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
