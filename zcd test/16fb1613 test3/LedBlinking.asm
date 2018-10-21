
_InitTimer0:

;LedBlinking.c,12 :: 		void InitTimer0(){
;LedBlinking.c,13 :: 		OPTION_REG         = 0x88;
	MOVLW      136
	MOVWF      OPTION_REG+0
;LedBlinking.c,14 :: 		TMR0                 = 156;
	MOVLW      156
	MOVWF      TMR0+0
;LedBlinking.c,15 :: 		INTCON         = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;LedBlinking.c,16 :: 		}
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_zcd_initialize:

;LedBlinking.c,18 :: 		void zcd_initialize(){
;LedBlinking.c,19 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;LedBlinking.c,20 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;LedBlinking.c,21 :: 		ZCD1CON=0XC2;
	MOVLW      194
	MOVWF      ZCD1CON+0
;LedBlinking.c,23 :: 		PIR3.ZCDIF=0;  //FLAG
	BCF        PIR3+0, 4
;LedBlinking.c,24 :: 		PIE3.ZCDIE=1;   //ENABLE ZCD INT
	BSF        PIE3+0, 4
;LedBlinking.c,27 :: 		}
L_end_zcd_initialize:
	RETURN
; end of _zcd_initialize

_interrupt:

;LedBlinking.c,28 :: 		void interrupt(){     //ZCD_ISR
;LedBlinking.c,30 :: 		if (PIR3.ZCDIF) {
	BTFSS      PIR3+0, 4
	GOTO       L_interrupt0
;LedBlinking.c,31 :: 		PIR3.ZCDIF=0;  //CLEAR ZCD INTERRUPT FLAG
	BCF        PIR3+0, 4
;LedBlinking.c,32 :: 		FiringAngleDelay = 0;
	CLRF       _FiringAngleDelay+0
;LedBlinking.c,49 :: 		}
L_interrupt0:
;LedBlinking.c,53 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt1
;LedBlinking.c,54 :: 		TMR0IF_bit         = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;LedBlinking.c,55 :: 		TMR0                 = 156;
	MOVLW      156
	MOVWF      TMR0+0
;LedBlinking.c,56 :: 		CntTmr1ToFiring++;
	INCF       _CntTmr1ToFiring+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CntTmr1ToFiring+1, 1
;LedBlinking.c,57 :: 		if (CntTmr1ToFiring ==2000){
	MOVF       _CntTmr1ToFiring+1, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt11
	MOVLW      208
	XORWF      _CntTmr1ToFiring+0, 0
L__interrupt11:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
;LedBlinking.c,58 :: 		CntTmr1ToFiring=0;
	CLRF       _CntTmr1ToFiring+0
	CLRF       _CntTmr1ToFiring+1
;LedBlinking.c,59 :: 		Air_Heater_Driver_PWM = ~ Air_Heater_Driver_PWM;
	MOVLW      16
	XORWF      LATC+0, 1
;LedBlinking.c,60 :: 		}
L_interrupt2:
;LedBlinking.c,72 :: 		}
L_interrupt1:
;LedBlinking.c,79 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE     %s
; end of _interrupt

_main:

;LedBlinking.c,87 :: 		void main() {
;LedBlinking.c,89 :: 		TRISA = 0x04;           // set direction to be output
	MOVLW      4
	MOVWF      TRISA+0
;LedBlinking.c,91 :: 		TRISC = 0;           // set direction to be output
	CLRF       TRISC+0
;LedBlinking.c,92 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;LedBlinking.c,93 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;LedBlinking.c,94 :: 		WPUC=0X00;
	CLRF       WPUC+0
;LedBlinking.c,95 :: 		OPTION_REG.nWPUEN=0x01;
	BSF        OPTION_REG+0, 7
;LedBlinking.c,96 :: 		zcd_initialize();
	CALL       _zcd_initialize+0
;LedBlinking.c,97 :: 		InitTimer0();
	CALL       _InitTimer0+0
;LedBlinking.c,98 :: 		Air_Heater_Driver_PWM=0;
	BCF        LATC+0, 4
;LedBlinking.c,99 :: 		while(1){
L_main3:
;LedBlinking.c,101 :: 		LATA = 0xFF;       // Turn OFF LEDs on PORTA
	MOVLW      255
	MOVWF      LATA+0
;LedBlinking.c,105 :: 		Delay_ms(100);    // 1 second delay
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	NOP
	NOP
;LedBlinking.c,107 :: 		LATA = 0x00;       // Turn ON LEDs on PORTA
	CLRF       LATA+0
;LedBlinking.c,111 :: 		Delay_ms(100);    // 1 second delay
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main6:
	DECFSZ     R13, 1
	GOTO       L_main6
	DECFSZ     R12, 1
	GOTO       L_main6
	NOP
	NOP
;LedBlinking.c,112 :: 		}          // Endless loop
	GOTO       L_main3
;LedBlinking.c,113 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
