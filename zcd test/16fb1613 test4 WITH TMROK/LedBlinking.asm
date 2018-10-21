
_InitTimer0:

;LedBlinking.c,13 :: 		void InitTimer0(){
;LedBlinking.c,14 :: 		OPTION_REG         = 0x88;
	MOVLW      136
	MOVWF      OPTION_REG+0
;LedBlinking.c,15 :: 		TMR0                 = 156;
	MOVLW      156
	MOVWF      TMR0+0
;LedBlinking.c,16 :: 		INTCON         = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;LedBlinking.c,17 :: 		}
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_zcd_initialize:

;LedBlinking.c,19 :: 		void zcd_initialize(){
;LedBlinking.c,20 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;LedBlinking.c,21 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;LedBlinking.c,22 :: 		ZCD1CON=0XC2;
	MOVLW      194
	MOVWF      ZCD1CON+0
;LedBlinking.c,24 :: 		PIR3.ZCDIF=0;  //FLAG
	BCF        PIR3+0, 4
;LedBlinking.c,25 :: 		PIE3.ZCDIE=1;   //ENABLE ZCD INT
	BSF        PIE3+0, 4
;LedBlinking.c,28 :: 		}
L_end_zcd_initialize:
	RETURN
; end of _zcd_initialize

_interrupt:

;LedBlinking.c,29 :: 		void interrupt(){     //ZCD_ISR
;LedBlinking.c,31 :: 		if (PIR3.ZCDIF) {
	BTFSS      PIR3+0, 4
	GOTO       L_interrupt0
;LedBlinking.c,32 :: 		PIR3.ZCDIF=0;  //CLEAR ZCD INTERRUPT FLAG
	BCF        PIR3+0, 4
;LedBlinking.c,33 :: 		FiringAngleDelay = 66;
	MOVLW      66
	MOVWF      _FiringAngleDelay+0
;LedBlinking.c,34 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;LedBlinking.c,51 :: 		}
L_interrupt0:
;LedBlinking.c,55 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt1
;LedBlinking.c,56 :: 		TMR0IF_bit         = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;LedBlinking.c,57 :: 		TMR0                 = 156;
	MOVLW      156
	MOVWF      TMR0+0
;LedBlinking.c,58 :: 		CntTmr1ToFiring++;
	INCF       _CntTmr1ToFiring+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CntTmr1ToFiring+1, 1
;LedBlinking.c,61 :: 		if (CntTmr1ToFiring == FiringAngleDelay ){
	MOVLW      0
	XORWF      _CntTmr1ToFiring+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt12
	MOVF       _FiringAngleDelay+0, 0
	XORWF      _CntTmr1ToFiring+0, 0
L__interrupt12:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
;LedBlinking.c,63 :: 		Air_Heater_Driver_PWM   = 0 ;
	BCF        LATC+0, 4
;LedBlinking.c,64 :: 		tmrflag=1;
	MOVLW      1
	MOVWF      _tmrflag+0
;LedBlinking.c,66 :: 		}
L_interrupt2:
;LedBlinking.c,67 :: 		if((CntTmr1ToFiring == FiringAngleDelay+3) ){
	MOVLW      3
	ADDWF      _FiringAngleDelay+0, 0
	MOVWF      R1
	CLRF       R2
	MOVLW      0
	ADDWFC     R2, 1
	MOVF       _CntTmr1ToFiring+1, 0
	XORWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt13
	MOVF       R1, 0
	XORWF      _CntTmr1ToFiring+0, 0
L__interrupt13:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
;LedBlinking.c,68 :: 		Air_Heater_Driver_PWM   = 1 ;
	BSF        LATC+0, 4
;LedBlinking.c,69 :: 		CntTmr1ToFiring         = 0 ;
	CLRF       _CntTmr1ToFiring+0
	CLRF       _CntTmr1ToFiring+1
;LedBlinking.c,70 :: 		tmrflag=1;
	MOVLW      1
	MOVWF      _tmrflag+0
;LedBlinking.c,71 :: 		TMR0IE_bit              = 0 ;
	BCF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;LedBlinking.c,73 :: 		}
L_interrupt3:
;LedBlinking.c,74 :: 		}
L_interrupt1:
;LedBlinking.c,81 :: 		}
L_end_interrupt:
L__interrupt11:
	RETFIE     %s
; end of _interrupt

_main:

;LedBlinking.c,89 :: 		void main() {
;LedBlinking.c,91 :: 		TRISA = 0x04;           // set direction to be output
	MOVLW      4
	MOVWF      TRISA+0
;LedBlinking.c,93 :: 		TRISC = 0;           // set direction to be output
	CLRF       TRISC+0
;LedBlinking.c,94 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;LedBlinking.c,95 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;LedBlinking.c,96 :: 		WPUC=0X00;
	CLRF       WPUC+0
;LedBlinking.c,97 :: 		OPTION_REG.nWPUEN=0x01;
	BSF        OPTION_REG+0, 7
;LedBlinking.c,98 :: 		zcd_initialize();
	CALL       _zcd_initialize+0
;LedBlinking.c,99 :: 		InitTimer0();
	CALL       _InitTimer0+0
;LedBlinking.c,100 :: 		Air_Heater_Driver_PWM=0;
	BCF        LATC+0, 4
;LedBlinking.c,101 :: 		while(1){
L_main4:
;LedBlinking.c,103 :: 		LATA = 0xFF;       // Turn OFF LEDs on PORTA
	MOVLW      255
	MOVWF      LATA+0
;LedBlinking.c,107 :: 		Delay_ms(100);    // 1 second delay
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
;LedBlinking.c,109 :: 		LATA = 0x00;       // Turn ON LEDs on PORTA
	CLRF       LATA+0
;LedBlinking.c,113 :: 		Delay_ms(100);    // 1 second delay
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main7:
	DECFSZ     R13, 1
	GOTO       L_main7
	DECFSZ     R12, 1
	GOTO       L_main7
	NOP
	NOP
;LedBlinking.c,114 :: 		}          // Endless loop
	GOTO       L_main4
;LedBlinking.c,115 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
