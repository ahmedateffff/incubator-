
_main:

;LedBlinking.c,25 :: 		void main() {
;LedBlinking.c,27 :: 		TRISA = 0;           // set direction to be output
	CLRF       TRISA+0
;LedBlinking.c,29 :: 		TRISC = 0;           // set direction to be output
	CLRF       TRISC+0
;LedBlinking.c,32 :: 		do {
L_main0:
;LedBlinking.c,33 :: 		LATA = 0x00;       // Turn OFF LEDs on PORTA
	CLRF       LATA+0
;LedBlinking.c,35 :: 		LATC = 0x00;       // Turn OFF LEDs on PORTC
	CLRF       LATC+0
;LedBlinking.c,37 :: 		Delay_ms(500);    // 1 second delay
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main3:
	DECFSZ     R13, 1
	GOTO       L_main3
	DECFSZ     R12, 1
	GOTO       L_main3
	DECFSZ     R11, 1
	GOTO       L_main3
	NOP
	NOP
;LedBlinking.c,39 :: 		LATA = 0xFF;       // Turn ON LEDs on PORTA
	MOVLW      255
	MOVWF      LATA+0
;LedBlinking.c,41 :: 		LATC = 0xFF;       // Turn ON LEDs on PORTC
	MOVLW      255
	MOVWF      LATC+0
;LedBlinking.c,43 :: 		Delay_ms(500);    // 1 second delay
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	DECFSZ     R11, 1
	GOTO       L_main4
	NOP
	NOP
;LedBlinking.c,44 :: 		} while(1);          // Endless loop
	GOTO       L_main0
;LedBlinking.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
