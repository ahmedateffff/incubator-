
_zcd_initialize:

;MyProject.c,2 :: 		void zcd_initialize(){
;MyProject.c,3 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;MyProject.c,4 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;MyProject.c,5 :: 		ZCD1CON=0XC2;
	MOVLW      194
	MOVWF      ZCD1CON+0
;MyProject.c,7 :: 		PIR3.ZCDIF=0;  //FLAG
	BCF        PIR3+0, 4
;MyProject.c,8 :: 		PIE3.ZCDIE=1;   //ENABLE ZCD INT
	BSF        PIE3+0, 4
;MyProject.c,11 :: 		}
L_end_zcd_initialize:
	RETURN
; end of _zcd_initialize

_interrupt:

;MyProject.c,13 :: 		void interrupt(){     //ZCD_ISR
;MyProject.c,15 :: 		if (PIR3.ZCDIF) {
	BTFSS      PIR3+0, 4
	GOTO       L_interrupt0
;MyProject.c,18 :: 		PIR3.ZCDIF=0;  //CLEAR ZCD INTERRUPT FLAG
	BCF        PIR3+0, 4
;MyProject.c,22 :: 		} }
L_interrupt0:
L_end_interrupt:
L__interrupt3:
	RETFIE     %s
; end of _interrupt

_main:

;MyProject.c,25 :: 		void main() {
;MyProject.c,26 :: 		LATA=0x00;
	CLRF       LATA+0
;MyProject.c,27 :: 		trisa=0x04;
	MOVLW      4
	MOVWF      TRISA+0
;MyProject.c,28 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;MyProject.c,29 :: 		WPUA= 0x00;
	CLRF       WPUA+0
;MyProject.c,30 :: 		trisc=0x00;
	CLRF       TRISC+0
;MyProject.c,31 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;MyProject.c,32 :: 		WPUC=0X00;
	CLRF       WPUC+0
;MyProject.c,33 :: 		OPTION_REG.nWPUEN=0x01;
	BSF        OPTION_REG+0, 7
;MyProject.c,34 :: 		RC1_bit = 0 ;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,35 :: 		zcd_initialize();
	CALL       _zcd_initialize+0
;MyProject.c,36 :: 		portc=0xff;
	MOVLW      255
	MOVWF      PORTC+0
;MyProject.c,37 :: 		porta=0xff;
	MOVLW      255
	MOVWF      PORTA+0
;MyProject.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
