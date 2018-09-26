_INT1_interrupt:
;hal_pic32.h,8 :: 		void INT1_interrupt() iv IVT_EXTERNAL_1 ilevel 1 ics ICS_AUTO {   //INC_B  ratory
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 1024
MTC0	R30, 12, 0
;hal_pic32.h,9 :: 		if(INT1IF_bit){
_LX	
EXT	R2, R2, BitPos(INT1IF_bit+0), 1
BNE	R2, R0, L__INT1_interrupt112
NOP	
J	L_INT1_interrupt0
NOP	
L__INT1_interrupt112:
;hal_pic32.h,11 :: 		INT1IF_bit = 0;
LUI	R2, BitMask(INT1IF_bit+0)
ORI	R2, R2, BitMask(INT1IF_bit+0)
_SX	
;hal_pic32.h,12 :: 		count_rotary--;
LBU	R2, Offset(_count_rotary+0)(GP)
ADDIU	R2, R2, -1
SB	R2, Offset(_count_rotary+0)(GP)
;hal_pic32.h,15 :: 		}                    // Reset INT2 flag
L_INT1_interrupt0:
;hal_pic32.h,16 :: 		}
L_end_INT1_interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 12(SP)
ADDIU	SP, SP, 16
ERET	
; end of _INT1_interrupt
_INT3_interrupt:
;hal_pic32.h,17 :: 		void INT3_interrupt() iv IVT_EXTERNAL_3 ilevel 2 ics ICS_AUTO {  //INC_A  ratory
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 2048
MTC0	R30, 12, 0
;hal_pic32.h,18 :: 		if(INT3IF_bit){
_LX	
EXT	R2, R2, BitPos(INT3IF_bit+0), 1
BNE	R2, R0, L__INT3_interrupt115
NOP	
J	L_INT3_interrupt1
NOP	
L__INT3_interrupt115:
;hal_pic32.h,20 :: 		INT3IF_bit = 0;
LUI	R2, BitMask(INT3IF_bit+0)
ORI	R2, R2, BitMask(INT3IF_bit+0)
_SX	
;hal_pic32.h,21 :: 		count_rotary++;
LBU	R2, Offset(_count_rotary+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_count_rotary+0)(GP)
;hal_pic32.h,24 :: 		}                    // Reset INT2 flag
L_INT3_interrupt1:
;hal_pic32.h,25 :: 		}
L_end_INT3_interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 12(SP)
ADDIU	SP, SP, 16
ERET	
; end of _INT3_interrupt
_INT4_interrupt:
;hal_pic32.h,26 :: 		void INT4_interrupt() iv IVT_EXTERNAL_4 ilevel 3 ics ICS_AUTO {   //sw ratory
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;hal_pic32.h,27 :: 		if(INT4IF_bit){
_LX	
EXT	R2, R2, BitPos(INT4IF_bit+0), 1
BNE	R2, R0, L__INT4_interrupt118
NOP	
J	L_INT4_interrupt2
NOP	
L__INT4_interrupt118:
;hal_pic32.h,29 :: 		INT4IF_bit = 0;
LUI	R2, BitMask(INT4IF_bit+0)
ORI	R2, R2, BitMask(INT4IF_bit+0)
_SX	
;hal_pic32.h,30 :: 		portf.f3=~portf.f3;
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 3, 1
XORI	R3, R2, 1
LBU	R2, Offset(PORTF+0)(GP)
INS	R2, R3, 3, 1
SB	R2, Offset(PORTF+0)(GP)
;hal_pic32.h,31 :: 		count_rotary++;
LBU	R2, Offset(_count_rotary+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_count_rotary+0)(GP)
;hal_pic32.h,32 :: 		}                    // Reset INT2 flag
L_INT4_interrupt2:
;hal_pic32.h,33 :: 		}
L_end_INT4_interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 12(SP)
ADDIU	SP, SP, 16
ERET	
; end of _INT4_interrupt
_inti_ports_pIC32_HAL:
;hal_pic32.h,36 :: 		void inti_ports_pIC32_HAL(){
;hal_pic32.h,38 :: 		AD1PCFG = 0xFFFF;      // Configure AN pins as digital I/O
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;hal_pic32.h,39 :: 		JTAGEN_bit= 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;hal_pic32.h,41 :: 		TRISB = 0X00;
SW	R0, Offset(TRISB+0)(GP)
;hal_pic32.h,42 :: 		TRISF0_bit=0;    //
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;hal_pic32.h,43 :: 		TRISE2_bit=0;    //
LUI	R2, BitMask(TRISE2_bit+0)
ORI	R2, R2, BitMask(TRISE2_bit+0)
_SX	
;hal_pic32.h,44 :: 		TRISC13_bit=0;    //  == D/C
LUI	R2, BitMask(TRISC13_bit+0)
ORI	R2, R2, BitMask(TRISC13_bit+0)
_SX	
;hal_pic32.h,45 :: 		TRISE1_bit=0;    //
LUI	R2, BitMask(TRISE1_bit+0)
ORI	R2, R2, BitMask(TRISE1_bit+0)
_SX	
;hal_pic32.h,46 :: 		TRISC14_bit=0;
LUI	R2, BitMask(TRISC14_bit+0)
ORI	R2, R2, BitMask(TRISC14_bit+0)
_SX	
;hal_pic32.h,48 :: 		trisf.f3=0;
ORI	R2, R0, 8
SW	R2, Offset(TRISF+4)(GP)
;hal_pic32.h,49 :: 		LATf.f3 = 0;
SW	R2, Offset(LATF+4)(GP)
;hal_pic32.h,50 :: 		portf.f3 =0 ;
SW	R2, Offset(PORTF+4)(GP)
;hal_pic32.h,51 :: 		TRISd.f11 = 1;
ORI	R2, R0, 2048
SW	R2, Offset(TRISD+8)(GP)
;hal_pic32.h,52 :: 		TRISd.f10 = 1;
ORI	R2, R0, 1024
SW	R2, Offset(TRISD+8)(GP)
;hal_pic32.h,53 :: 		TRISd.f8 = 1;
ORI	R2, R0, 256
SW	R2, Offset(TRISD+8)(GP)
;hal_pic32.h,55 :: 		INT4IP0_bit = 0;                   // Set INT2 interrupt
LUI	R2, BitMask(INT4IP0_bit+0)
ORI	R2, R2, BitMask(INT4IP0_bit+0)
_SX	
;hal_pic32.h,56 :: 		INT4IP1_bit = 0;                   // Set interrupt priorities
LUI	R2, BitMask(INT4IP1_bit+0)
ORI	R2, R2, BitMask(INT4IP1_bit+0)
_SX	
;hal_pic32.h,57 :: 		INT4IP2_bit = 1;                   // Set inrrupt priority to 4
LUI	R2, BitMask(INT4IP2_bit+0)
ORI	R2, R2, BitMask(INT4IP2_bit+0)
_SX	
;hal_pic32.h,58 :: 		INT4IE_bit  = 1;                   // Set interrupt on INT2 (RE9) to be enabled
LUI	R2, BitMask(INT4IE_bit+0)
ORI	R2, R2, BitMask(INT4IE_bit+0)
_SX	
;hal_pic32.h,60 :: 		INT1IP0_bit = 0;                   // Set INT2 interrupt
LUI	R2, BitMask(INT1IP0_bit+0)
ORI	R2, R2, BitMask(INT1IP0_bit+0)
_SX	
;hal_pic32.h,61 :: 		INT1IP1_bit = 0;                   // Set interrupt priorities
LUI	R2, BitMask(INT1IP1_bit+0)
ORI	R2, R2, BitMask(INT1IP1_bit+0)
_SX	
;hal_pic32.h,62 :: 		INT1IP2_bit = 1;                   // Set inrrupt priority to 4
LUI	R2, BitMask(INT1IP2_bit+0)
ORI	R2, R2, BitMask(INT1IP2_bit+0)
_SX	
;hal_pic32.h,63 :: 		INT1IE_bit  = 1;
LUI	R2, BitMask(INT1IE_bit+0)
ORI	R2, R2, BitMask(INT1IE_bit+0)
_SX	
;hal_pic32.h,65 :: 		INT3IP0_bit = 0;                   // Set INT2 interrupt
LUI	R2, BitMask(INT3IP0_bit+0)
ORI	R2, R2, BitMask(INT3IP0_bit+0)
_SX	
;hal_pic32.h,66 :: 		INT3IP1_bit = 0;                   // Set interrupt priorities
LUI	R2, BitMask(INT3IP1_bit+0)
ORI	R2, R2, BitMask(INT3IP1_bit+0)
_SX	
;hal_pic32.h,67 :: 		INT3IP2_bit = 1;                   // Set inrrupt priority to 4
LUI	R2, BitMask(INT3IP2_bit+0)
ORI	R2, R2, BitMask(INT3IP2_bit+0)
_SX	
;hal_pic32.h,68 :: 		INT3IE_bit  = 1;
LUI	R2, BitMask(INT3IE_bit+0)
ORI	R2, R2, BitMask(INT3IE_bit+0)
_SX	
;hal_pic32.h,69 :: 		EnableInterrupts();                // Enable interruts as previously set
EI	R30
;hal_pic32.h,71 :: 		}
L_end_inti_ports_pIC32_HAL:
JR	RA
NOP	
; end of _inti_ports_pIC32_HAL
_TFT_Set_Index:
;ssd1963_8bit_library.h,63 :: 		void TFT_Set_Index(unsigned int  index) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ssd1963_8bit_library.h,67 :: 		Delay_1us(); Delay_1us();
JAL	_Delay_1us+0
NOP	
JAL	_Delay_1us+0
NOP	
;ssd1963_8bit_library.h,68 :: 		TFT_CS = 0;
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
;ssd1963_8bit_library.h,69 :: 		TFT_RD = 1;
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
;ssd1963_8bit_library.h,70 :: 		TFT_RS = 0;
LUI	R2, BitMask(LATC13_bit+0)
ORI	R2, R2, BitMask(LATC13_bit+0)
_SX	
;ssd1963_8bit_library.h,71 :: 		TFT_DataPort= index;
SH	R25, Offset(LATB+0)(GP)
;ssd1963_8bit_library.h,74 :: 		TFT_WR = 0;
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
;ssd1963_8bit_library.h,75 :: 		TFT_WR = 1;
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
;ssd1963_8bit_library.h,76 :: 		TFT_CS = 1;
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
;ssd1963_8bit_library.h,77 :: 		}
L_end_TFT_Set_Index:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Set_Index
_TFT_Write_Command:
;ssd1963_8bit_library.h,83 :: 		void TFT_Write_Command(unsigned int  cmd) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ssd1963_8bit_library.h,87 :: 		TFT_CS = 0;
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
;ssd1963_8bit_library.h,88 :: 		TFT_RD = 1;
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
;ssd1963_8bit_library.h,89 :: 		TFT_RS = 1;
LUI	R2, BitMask(LATC13_bit+0)
ORI	R2, R2, BitMask(LATC13_bit+0)
_SX	
;ssd1963_8bit_library.h,90 :: 		TFT_DataPort = cmd;
SH	R25, Offset(LATB+0)(GP)
;ssd1963_8bit_library.h,92 :: 		TFT_WR = 0;
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
;ssd1963_8bit_library.h,93 :: 		TFT_WR = 1;
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
;ssd1963_8bit_library.h,94 :: 		TFT_CS = 1;
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
;ssd1963_8bit_library.h,95 :: 		Delay_1us();
JAL	_Delay_1us+0
NOP	
;ssd1963_8bit_library.h,96 :: 		}
L_end_TFT_Write_Command:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Write_Command
_RGB565_converter:
;ssd1963_8bit_library.h,108 :: 		unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
;ssd1963_8bit_library.h,110 :: 		value = (((31*(r+4))/255)<<11) |
ANDI	R2, R25, 255
ADDIU	R3, R2, 4
ORI	R2, R0, 31
MUL	R3, R2, R3
ORI	R2, R0, 255
DIV	R3, R2
MFLO	R2
SEH	R2, R2
SLL	R4, R2, 11
;ssd1963_8bit_library.h,111 :: 		(((63*(g+2))/255)<<5) |
ANDI	R2, R26, 255
ADDIU	R3, R2, 2
ORI	R2, R0, 63
MUL	R3, R2, R3
ORI	R2, R0, 255
DIV	R3, R2
MFLO	R2
SEH	R2, R2
SLL	R2, R2, 5
OR	R4, R4, R2
;ssd1963_8bit_library.h,112 :: 		((31*(b+4))/255);
ANDI	R2, R27, 255
ADDIU	R3, R2, 4
ORI	R2, R0, 31
MUL	R3, R2, R3
ORI	R2, R0, 255
DIV	R3, R2
MFLO	R2
OR	R2, R4, R2
;ssd1963_8bit_library.h,113 :: 		return (value);
;ssd1963_8bit_library.h,114 :: 		}
L_end_RGB565_converter:
JR	RA
NOP	
; end of _RGB565_converter
_TFT_Write_Data:
;ssd1963_8bit_library.h,116 :: 		void TFT_Write_Data(unsigned int color) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ssd1963_8bit_library.h,127 :: 		TFT_Write_Command(color);
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,129 :: 		}
L_end_TFT_Write_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Write_Data
_TFT_Intialize_16bit:
;ssd1963_8bit_library.h,131 :: 		void TFT_Intialize_16bit(void){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ssd1963_8bit_library.h,133 :: 		TFT_RST = 0; // Hardware Reset
SW	R25, 4(SP)
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;ssd1963_8bit_library.h,134 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_TFT_Intialize_16bit3:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TFT_Intialize_16bit3
NOP	
NOP	
NOP	
;ssd1963_8bit_library.h,136 :: 		TFT_RST = 1;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;ssd1963_8bit_library.h,139 :: 		TFT_CS = 0;
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
;ssd1963_8bit_library.h,140 :: 		TFT_Set_Index(0x01); // Soft Reset
ORI	R25, R0, 1
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,141 :: 		TFT_Set_Index(0x01); // Soft Reset
ORI	R25, R0, 1
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,143 :: 		Delay_ms(1);
LUI	R24, 0
ORI	R24, R24, 26666
L_TFT_Intialize_16bit5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TFT_Intialize_16bit5
NOP	
;ssd1963_8bit_library.h,151 :: 		TFT_Set_Index(0x0A);
ORI	R25, R0, 10
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,152 :: 		TFT_Write_Command(0x1C); //Power Mode
ORI	R25, R0, 28
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,158 :: 		TFT_Set_Index(0xE2);
ORI	R25, R0, 226
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,159 :: 		TFT_Write_Command(60); //35 PLLclk = REFclk * 36 (360MHz)
ORI	R25, R0, 60
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,160 :: 		TFT_Write_Command(5); // SYSclk = PLLclk / 3 (120MHz)
ORI	R25, R0, 5
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,161 :: 		TFT_Write_Command(0x54); // validate M and N dec 84
ORI	R25, R0, 84
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,167 :: 		TFT_Set_Index(0xe0);
ORI	R25, R0, 224
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,168 :: 		TFT_Write_Command(0x01); // START PLL
ORI	R25, R0, 1
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,169 :: 		Delay_50us(); Delay_50us(); // Wait 100us to let the PLL stable
JAL	_Delay_50us+0
NOP	
JAL	_Delay_50us+0
NOP	
;ssd1963_8bit_library.h,171 :: 		TFT_Set_Index(0xe0);
ORI	R25, R0, 224
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,172 :: 		TFT_Write_Command(0x03); // LOCK PLL
ORI	R25, R0, 3
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,174 :: 		TFT_Set_Index(0xB0); // Set LCD Mode   //////////////////////////////////////
ORI	R25, R0, 176
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,175 :: 		TFT_Write_Command(0x60); // 24 bit data resolution,
ORI	R25, R0, 96
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,176 :: 		TFT_Write_Command(0x00); // TFT parallel interface mode
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,177 :: 		TFT_Write_Command(0x03); // 800 pixel width
ORI	R25, R0, 3
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,178 :: 		TFT_Write_Command(0x1f);
ORI	R25, R0, 31
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,179 :: 		TFT_Write_Command(0x01); // 480 pixel hight
ORI	R25, R0, 1
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,180 :: 		TFT_Write_Command(0xdf);
ORI	R25, R0, 223
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,181 :: 		TFT_Write_Command(0x03); // RGB mode
ORI	R25, R0, 3
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,183 :: 		TFT_Set_Index(0xF0); // Set Pixel Data Interface
ORI	R25, R0, 240
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,184 :: 		TFT_Write_Command(0x03); //16 bits
ORI	R25, R0, 3
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,193 :: 		TFT_Set_Index(0xe6); // pixel clock frequency
ORI	R25, R0, 230
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,194 :: 		TFT_Write_Command(0x04); // LCD_FPR = 290985 = 33.300 Mhz Result for 7" Display
ORI	R25, R0, 4
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,195 :: 		TFT_Write_Command(0x70);
ORI	R25, R0, 112
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,196 :: 		TFT_Write_Command(0xA9);
ORI	R25, R0, 169
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,198 :: 		TFT_Set_Index(0xB4); // SET HBP                       ///////////
ORI	R25, R0, 180
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,199 :: 		TFT_Write_Command(0x20); // SET HSYNC Total = 440
ORI	R25, R0, 32
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,200 :: 		TFT_Write_Command(0xaf);
ORI	R25, R0, 175
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,201 :: 		TFT_Write_Command(0x00); // SET HBP = 68
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,202 :: 		TFT_Write_Command(0xa3); // Offset x
ORI	R25, R0, 163
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,203 :: 		TFT_Write_Command(0x07); // SET VBP 16 = 15 + 1
ORI	R25, R0, 7
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,204 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,205 :: 		TFT_Write_Command(0x00); // SET Hsync pulse start position
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,206 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,208 :: 		TFT_Set_Index(0xB6); // SET VBP
ORI	R25, R0, 182
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,209 :: 		TFT_Write_Command(0x01); //SET Vsync total 265 = 264 + 1
ORI	R25, R0, 1
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,210 :: 		TFT_Write_Command(0xef);
ORI	R25, R0, 239
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,211 :: 		TFT_Write_Command(0x00); // SET VBP = 18
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,212 :: 		TFT_Write_Command(0x04); // Offset y
ORI	R25, R0, 4
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,213 :: 		TFT_Write_Command(0x01); // SET Vsync pulse 8 = 7 + 1
ORI	R25, R0, 1
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,214 :: 		TFT_Write_Command(0x00); // SET Vsync pulse start position
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,215 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,217 :: 		TFT_Set_Index(0x36); // Set Address Mode
ORI	R25, R0, 54
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,218 :: 		TFT_Write_Command(0x00); // normal mode
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,220 :: 		TFT_Set_Index(0x2A);     // set column address
ORI	R25, R0, 42
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,221 :: 		TFT_Write_Command(0x00); // 0
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,222 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,223 :: 		TFT_Write_Command(0x03); // 799
ORI	R25, R0, 3
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,224 :: 		TFT_Write_Command(0x1F);
ORI	R25, R0, 31
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,226 :: 		TFT_Set_Index(0x2B); // Set Page Address
ORI	R25, R0, 43
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,227 :: 		TFT_Write_Command(0x00); // 0
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,228 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,229 :: 		TFT_Write_Command(0x01); // 479
ORI	R25, R0, 1
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,230 :: 		TFT_Write_Command(0xdf);
ORI	R25, R0, 223
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,233 :: 		TFT_Set_Index(0x3a); //
ORI	R25, R0, 58
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,234 :: 		TFT_Write_Command(0x50);
ORI	R25, R0, 80
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,235 :: 		TFT_Set_Index(0x29); // Display On
ORI	R25, R0, 41
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,236 :: 		TFT_CS = 0;
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
;ssd1963_8bit_library.h,237 :: 		}
L_end_TFT_Intialize_16bit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TFT_Intialize_16bit
_Set_BackLight:
;ssd1963_8bit_library.h,240 :: 		void Set_BackLight(unsigned char Bkl){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;ssd1963_8bit_library.h,241 :: 		TFT_Set_Index(0xBE); //set PWM for B/L
SW	R25, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 190
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,242 :: 		TFT_Write_Command(0x06);
ORI	R25, R0, 6
JAL	_TFT_Write_Command+0
NOP	
LBU	R25, 8(SP)
;ssd1963_8bit_library.h,243 :: 		TFT_Write_Command(Bkl);
ANDI	R25, R25, 255
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,244 :: 		TFT_Write_Command(0x01);
ORI	R25, R0, 1
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,245 :: 		TFT_Write_Command(0xf0);
ORI	R25, R0, 240
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,246 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,247 :: 		TFT_Write_Command(0x00);
MOVZ	R25, R0, R0
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,248 :: 		}
L_end_Set_BackLight:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Set_BackLight
_WindowSet:
;ssd1963_8bit_library.h,252 :: 		void WindowSet(unsigned int s_x,unsigned int e_x,unsigned int s_y,unsigned int e_y)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;ssd1963_8bit_library.h,254 :: 		TFT_Set_Index(0x2a);                //SET column address
SW	R25, 4(SP)
SH	R25, 8(SP)
ORI	R25, R0, 42
JAL	_TFT_Set_Index+0
NOP	
LHU	R25, 8(SP)
;ssd1963_8bit_library.h,255 :: 		TFT_Write_Command((s_x)>>8);                        //SET start page address=0
ANDI	R2, R25, 65535
SRL	R2, R2, 8
SH	R25, 8(SP)
ANDI	R25, R2, 65535
JAL	_TFT_Write_Command+0
NOP	
LHU	R25, 8(SP)
;ssd1963_8bit_library.h,256 :: 		TFT_Write_Command(s_x);
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,257 :: 		TFT_Write_Command((e_x)>>8);                        //SET end page address=639
ANDI	R2, R26, 65535
SRL	R2, R2, 8
ANDI	R25, R2, 65535
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,258 :: 		TFT_Write_Command(e_x);
ANDI	R25, R26, 65535
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,260 :: 		TFT_Set_Index(0x2b);                //SET page address
ORI	R25, R0, 43
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,261 :: 		TFT_Write_Command((s_y)>>8);                        //SET start column address=0
ANDI	R2, R27, 65535
SRL	R2, R2, 8
ANDI	R25, R2, 65535
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,262 :: 		TFT_Write_Command(s_y);
ANDI	R25, R27, 65535
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,263 :: 		TFT_Write_Command((e_y)>>8);                        //SET end column address=479
ANDI	R2, R28, 65535
SRL	R2, R2, 8
ANDI	R25, R2, 65535
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,264 :: 		TFT_Write_Command(e_y);
ANDI	R25, R28, 65535
JAL	_TFT_Write_Command+0
NOP	
;ssd1963_8bit_library.h,266 :: 		}
L_end_WindowSet:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WindowSet
_TFT_FULL_ON:
;ssd1963_8bit_library.h,270 :: 		void TFT_FULL_ON(unsigned long dat)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ssd1963_8bit_library.h,274 :: 		WindowSet(0,799,0,479);      // 800 * 480  TFT
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
SW	R25, 16(SP)
ORI	R28, R0, 479
MOVZ	R27, R0, R0
ORI	R26, R0, 799
MOVZ	R25, R0, R0
JAL	_WindowSet+0
NOP	
;ssd1963_8bit_library.h,275 :: 		TFT_Set_Index(0x2c);
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
LW	R25, 16(SP)
;ssd1963_8bit_library.h,277 :: 		for(x=0;x<480;x++)  {
; x start address is: 12 (R3)
MOVZ	R3, R0, R0
; x end address is: 12 (R3)
L_TFT_FULL_ON7:
; x start address is: 12 (R3)
ANDI	R2, R3, 65535
SLTIU	R2, R2, 480
BNE	R2, R0, L__TFT_FULL_ON128
NOP	
J	L_TFT_FULL_ON8
NOP	
L__TFT_FULL_ON128:
;ssd1963_8bit_library.h,278 :: 		for(y= 0;y<800;y++){
; y start address is: 16 (R4)
MOVZ	R4, R0, R0
; y end address is: 16 (R4)
; x end address is: 12 (R3)
L_TFT_FULL_ON10:
; y start address is: 16 (R4)
; x start address is: 12 (R3)
ANDI	R2, R4, 65535
SLTIU	R2, R2, 800
BNE	R2, R0, L__TFT_FULL_ON129
NOP	
J	L_TFT_FULL_ON11
NOP	
L__TFT_FULL_ON129:
;ssd1963_8bit_library.h,279 :: 		TFT_Write_Data(dat);
JAL	_TFT_Write_Data+0
NOP	
;ssd1963_8bit_library.h,278 :: 		for(y= 0;y<800;y++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 65535
;ssd1963_8bit_library.h,280 :: 		}
; y end address is: 16 (R4)
J	L_TFT_FULL_ON10
NOP	
L_TFT_FULL_ON11:
;ssd1963_8bit_library.h,277 :: 		for(x=0;x<480;x++)  {
ADDIU	R2, R3, 1
ANDI	R3, R2, 65535
;ssd1963_8bit_library.h,281 :: 		}
; x end address is: 12 (R3)
J	L_TFT_FULL_ON7
NOP	
L_TFT_FULL_ON8:
;ssd1963_8bit_library.h,283 :: 		}
L_end_TFT_FULL_ON:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TFT_FULL_ON
_TFT_Rectangle:
;ssd1963_8bit_library.h,287 :: 		void TFT_Rectangle(unsigned int x0, unsigned int y0, unsigned int W, unsigned int H, unsigned long dat)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
; dat start address is: 16 (R4)
LW	R4, 16(SP)
;ssd1963_8bit_library.h,291 :: 		WindowSet(x0,(x0+W),y0,(y0+H));      // 800 * 480  TFT
ADDU	R3, R26, R28
ADDU	R2, R25, R27
SH	R28, 12(SP)
SH	R27, 14(SP)
ANDI	R28, R3, 65535
ANDI	R27, R26, 65535
ANDI	R26, R2, 65535
JAL	_WindowSet+0
NOP	
LHU	R27, 14(SP)
LHU	R28, 12(SP)
;ssd1963_8bit_library.h,292 :: 		TFT_Set_Index(0x2c);
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,294 :: 		for(x=0;x<H;x++)  {
; x start address is: 20 (R5)
MOVZ	R5, R0, R0
; dat end address is: 16 (R4)
; x end address is: 20 (R5)
L_TFT_Rectangle13:
; x start address is: 20 (R5)
; dat start address is: 16 (R4)
ANDI	R3, R5, 65535
ANDI	R2, R28, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__TFT_Rectangle131
NOP	
J	L_TFT_Rectangle14
NOP	
L__TFT_Rectangle131:
;ssd1963_8bit_library.h,295 :: 		for(y= 0;y<W;y++){
; y start address is: 24 (R6)
MOVZ	R6, R0, R0
; dat end address is: 16 (R4)
; y end address is: 24 (R6)
; x end address is: 20 (R5)
L_TFT_Rectangle16:
; y start address is: 24 (R6)
; dat start address is: 16 (R4)
; x start address is: 20 (R5)
ANDI	R3, R6, 65535
ANDI	R2, R27, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__TFT_Rectangle132
NOP	
J	L_TFT_Rectangle17
NOP	
L__TFT_Rectangle132:
;ssd1963_8bit_library.h,296 :: 		TFT_Write_Data(dat);
SH	R25, 12(SP)
MOVZ	R25, R4, R0
JAL	_TFT_Write_Data+0
NOP	
LHU	R25, 12(SP)
;ssd1963_8bit_library.h,295 :: 		for(y= 0;y<W;y++){
ADDIU	R2, R6, 1
ANDI	R6, R2, 65535
;ssd1963_8bit_library.h,297 :: 		}
; y end address is: 24 (R6)
J	L_TFT_Rectangle16
NOP	
L_TFT_Rectangle17:
;ssd1963_8bit_library.h,294 :: 		for(x=0;x<H;x++)  {
ADDIU	R2, R5, 1
ANDI	R5, R2, 65535
;ssd1963_8bit_library.h,298 :: 		}
; dat end address is: 16 (R4)
; x end address is: 20 (R5)
J	L_TFT_Rectangle13
NOP	
L_TFT_Rectangle14:
;ssd1963_8bit_library.h,300 :: 		}
L_end_TFT_Rectangle:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TFT_Rectangle
_TFT_Set_Font:
;ssd1963_8bit_library.h,362 :: 		void TFT_Set_Font(const unsigned short *Font, const unsigned int *Font_Descrip, unsigned long dat)
;ssd1963_8bit_library.h,364 :: 		Font_Pointer = Font ;
SW	R25, Offset(_Font_Pointer+0)(GP)
;ssd1963_8bit_library.h,365 :: 		Font_Description_Pointer = Font_Descrip ;
SW	R26, Offset(_Font_Description_Pointer+0)(GP)
;ssd1963_8bit_library.h,368 :: 		Font_Color = dat ;
SW	R27, Offset(_Font_Color+0)(GP)
;ssd1963_8bit_library.h,370 :: 		}
L_end_TFT_Set_Font:
JR	RA
NOP	
; end of _TFT_Set_Font
_Display_number:
;ssd1963_8bit_library.h,378 :: 		void Display_number(unsigned char b, unsigned int x0, unsigned int y0)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ssd1963_8bit_library.h,386 :: 		alpha = b - 46 ;                                // which the data base start with ( . ) which equal 32 in Ascci
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R28, 12(SP)
ANDI	R2, R25, 255
ADDIU	R3, R2, -46
; alpha start address is: 24 (R6)
SEH	R6, R3
;ssd1963_8bit_library.h,388 :: 		hight = *Font_Description_Pointer ;
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
LHU	R2, 0(R2)
; hight start address is: 16 (R4)
ANDI	R4, R2, 65535
;ssd1963_8bit_library.h,389 :: 		if(alpha == 0)   width = *(Font_Description_Pointer+2) ; // width of (.)
ANDI	R2, R3, 65535
BEQ	R2, R0, L__Display_number135
NOP	
J	L_Display_number19
NOP	
L__Display_number135:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
; width start address is: 20 (R5)
ANDI	R5, R2, 65535
; width end address is: 20 (R5)
J	L_Display_number20
NOP	
L_Display_number19:
;ssd1963_8bit_library.h,390 :: 		else             width = *(Font_Description_Pointer+1) ; // width of other numbers
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
; width start address is: 20 (R5)
ANDI	R5, R2, 65535
; width end address is: 20 (R5)
L_Display_number20:
;ssd1963_8bit_library.h,393 :: 		index = *(Font_Description_Pointer + (alpha*2) + 3)  ;
; width start address is: 20 (R5)
ANDI	R2, R6, 65535
; alpha end address is: 24 (R6)
SLL	R2, R2, 1
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
; index start address is: 24 (R6)
ANDI	R6, R2, 65535
;ssd1963_8bit_library.h,395 :: 		width_byte = (width / 8)+1 ;
ANDI	R2, R5, 65535
SRL	R2, R2, 3
ADDIU	R2, R2, 1
; width_byte start address is: 40 (R10)
ANDI	R10, R2, 65535
;ssd1963_8bit_library.h,397 :: 		WindowSet(x0,(x0+width-1),y0,(y0+hight-1));      //
ADDU	R2, R27, R4
ADDIU	R3, R2, -1
ADDU	R2, R26, R5
ADDIU	R2, R2, -1
ANDI	R28, R3, 65535
ANDI	R25, R26, 65535
ANDI	R26, R2, 65535
JAL	_WindowSet+0
NOP	
;ssd1963_8bit_library.h,398 :: 		TFT_Set_Index(0x2c);
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,400 :: 		for (i=0 ; i<hight ; i++){
; i start address is: 32 (R8)
MOVZ	R8, R0, R0
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; i end address is: 32 (R8)
L_Display_number21:
; i start address is: 32 (R8)
; width_byte start address is: 40 (R10)
; index start address is: 24 (R6)
; width start address is: 20 (R5)
; hight start address is: 16 (R4)
ANDI	R3, R8, 255
ANDI	R2, R4, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__Display_number136
NOP	
J	L_Display_number22
NOP	
L__Display_number136:
;ssd1963_8bit_library.h,401 :: 		for (j=0 ; j<width_byte ; j++) {
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
; j end address is: 28 (R7)
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; i end address is: 32 (R8)
L_Display_number24:
; j start address is: 28 (R7)
; hight start address is: 16 (R4)
; width start address is: 20 (R5)
; index start address is: 24 (R6)
; width_byte start address is: 40 (R10)
; i start address is: 32 (R8)
ANDI	R3, R7, 255
ANDI	R2, R10, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__Display_number137
NOP	
J	L_Display_number25
NOP	
L__Display_number137:
;ssd1963_8bit_library.h,402 :: 		bdata = *(Font_Pointer + (index+j) + (i * width_byte)) ;
ANDI	R2, R7, 255
ADDU	R2, R6, R2
ANDI	R3, R2, 65535
LW	R2, Offset(_Font_Pointer+0)(GP)
ADDU	R3, R2, R3
ANDI	R2, R8, 255
MULTU	R2, R10
MFLO	R2
ANDI	R2, R2, 65535
ADDU	R2, R3, R2
LBU	R2, 0(R2)
; bdata start address is: 36 (R9)
ANDI	R9, R2, 255
;ssd1963_8bit_library.h,404 :: 		buf = 0b10000000 ;
; buf start address is: 48 (R12)
ORI	R12, R0, 128
;ssd1963_8bit_library.h,405 :: 		if((width_byte - 1 - j) > 0 ) repeat = 8 ;
ADDIU	R3, R10, -1
ANDI	R2, R7, 255
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Display_number138
NOP	
J	L_Display_number27
NOP	
L__Display_number138:
; repeat start address is: 8 (R2)
ORI	R2, R0, 8
; repeat end address is: 8 (R2)
J	L_Display_number28
NOP	
L_Display_number27:
;ssd1963_8bit_library.h,406 :: 		else                        repeat = width - (width_byte-1)*8 ;
ADDIU	R2, R10, -1
ANDI	R2, R2, 255
SLL	R2, R2, 3
SUBU	R2, R5, R2
; repeat start address is: 12 (R3)
ANDI	R3, R2, 255
; repeat end address is: 12 (R3)
ANDI	R2, R3, 255
L_Display_number28:
;ssd1963_8bit_library.h,408 :: 		for (k=1 ; k <= repeat ; k++){
; repeat start address is: 8 (R2)
; k start address is: 44 (R11)
ORI	R11, R0, 1
; j end address is: 28 (R7)
; repeat end address is: 8 (R2)
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; buf end address is: 48 (R12)
; k end address is: 44 (R11)
; i end address is: 32 (R8)
ANDI	R13, R7, 255
ANDI	R7, R8, 255
ANDI	R8, R2, 255
L_Display_number29:
; k start address is: 44 (R11)
; repeat start address is: 32 (R8)
; buf start address is: 48 (R12)
; bdata start address is: 36 (R9)
; bdata end address is: 36 (R9)
; i start address is: 28 (R7)
; width_byte start address is: 40 (R10)
; index start address is: 24 (R6)
; width start address is: 20 (R5)
; hight start address is: 16 (R4)
; j start address is: 52 (R13)
ANDI	R3, R11, 255
ANDI	R2, R8, 255
SLTU	R2, R2, R3
BEQ	R2, R0, L__Display_number139
NOP	
J	L_Display_number30
NOP	
L__Display_number139:
; bdata end address is: 36 (R9)
;ssd1963_8bit_library.h,409 :: 		dataBuf = bdata & buf ;
; bdata start address is: 36 (R9)
AND	R3, R9, R12
;ssd1963_8bit_library.h,410 :: 		buf = buf >> 1 ;
ANDI	R2, R12, 255
; buf end address is: 48 (R12)
SRL	R2, R2, 1
; buf start address is: 48 (R12)
ANDI	R12, R2, 255
;ssd1963_8bit_library.h,411 :: 		if(dataBuf == 0)   TFT_Write_Data(Back_Color);
ANDI	R2, R3, 255
BEQ	R2, R0, L__Display_number140
NOP	
J	L_Display_number32
NOP	
L__Display_number140:
SB	R25, 16(SP)
LW	R25, Offset(_Back_Color+0)(GP)
JAL	_TFT_Write_Data+0
NOP	
LBU	R25, 16(SP)
J	L_Display_number33
NOP	
L_Display_number32:
;ssd1963_8bit_library.h,412 :: 		else               TFT_Write_Data(Font_Color);
SB	R25, 16(SP)
LW	R25, Offset(_Font_Color+0)(GP)
JAL	_TFT_Write_Data+0
NOP	
LBU	R25, 16(SP)
L_Display_number33:
;ssd1963_8bit_library.h,408 :: 		for (k=1 ; k <= repeat ; k++){
ADDIU	R2, R11, 1
ANDI	R11, R2, 255
;ssd1963_8bit_library.h,413 :: 		}
; repeat end address is: 32 (R8)
; bdata end address is: 36 (R9)
; buf end address is: 48 (R12)
; k end address is: 44 (R11)
J	L_Display_number29
NOP	
L_Display_number30:
;ssd1963_8bit_library.h,401 :: 		for (j=0 ; j<width_byte ; j++) {
ADDIU	R2, R13, 1
; j end address is: 52 (R13)
; j start address is: 8 (R2)
;ssd1963_8bit_library.h,416 :: 		}
ANDI	R8, R7, 255
; i end address is: 28 (R7)
; j end address is: 8 (R2)
ANDI	R7, R2, 255
J	L_Display_number24
NOP	
L_Display_number25:
;ssd1963_8bit_library.h,400 :: 		for (i=0 ; i<hight ; i++){
; i start address is: 32 (R8)
ADDIU	R2, R8, 1
ANDI	R8, R2, 255
;ssd1963_8bit_library.h,417 :: 		}
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; i end address is: 32 (R8)
J	L_Display_number21
NOP	
L_Display_number22:
;ssd1963_8bit_library.h,418 :: 		}
L_end_Display_number:
LW	R28, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Display_number
_Display_numbers:
;ssd1963_8bit_library.h,427 :: 		void Display_numbers(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;ssd1963_8bit_library.h,430 :: 		int alpha, width, hight, counter = 0,i,j ;
;ssd1963_8bit_library.h,432 :: 		Src_Pointer=Data_Pointer;
; Src_Pointer start address is: 56 (R14)
MOVZ	R14, R25, R0
; Src_Pointer end address is: 56 (R14)
;ssd1963_8bit_library.h,453 :: 		while(1)
L_Display_numbers34:
;ssd1963_8bit_library.h,455 :: 		if(*Src_Pointer != 32) {
; Src_Pointer start address is: 56 (R14)
LBU	R2, 0(R14)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L__Display_numbers143
NOP	
J	L_Display_numbers36
NOP	
L__Display_numbers143:
;ssd1963_8bit_library.h,456 :: 		Display_number(*Src_Pointer,x0,y0);
LBU	R2, 0(R14)
SW	R25, 4(SP)
ANDI	R25, R2, 255
JAL	_Display_number+0
NOP	
LW	R25, 4(SP)
;ssd1963_8bit_library.h,457 :: 		alpha = *Src_Pointer - 46 ;
LBU	R2, 0(R14)
ANDI	R2, R2, 255
ADDIU	R2, R2, -46
;ssd1963_8bit_library.h,458 :: 		if(alpha == 0)   width = *(Font_Description_Pointer+2) ; // width of (.)
SEH	R2, R2
BEQ	R2, R0, L__Display_numbers144
NOP	
J	L_Display_numbers37
NOP	
L__Display_numbers144:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
SH	R2, 8(SP)
J	L_Display_numbers38
NOP	
L_Display_numbers37:
;ssd1963_8bit_library.h,459 :: 		else             width = *(Font_Description_Pointer+1) ; // width of other numbers
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SH	R2, 8(SP)
L_Display_numbers38:
;ssd1963_8bit_library.h,460 :: 		x0 = x0 + width + 5 ;
LH	R2, 8(SP)
ADDU	R2, R26, R2
ADDIU	R2, R2, 5
ANDI	R26, R2, 65535
;ssd1963_8bit_library.h,461 :: 		}
L_Display_numbers36:
;ssd1963_8bit_library.h,462 :: 		Src_Pointer++;
ADDIU	R2, R14, 1
MOVZ	R14, R2, R0
;ssd1963_8bit_library.h,463 :: 		if(*Src_Pointer == 0) break;         // 0 in ascii == nul
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Display_numbers145
NOP	
J	L_Display_numbers39
NOP	
L__Display_numbers145:
; Src_Pointer end address is: 56 (R14)
J	L_Display_numbers35
NOP	
L_Display_numbers39:
;ssd1963_8bit_library.h,465 :: 		}
; Src_Pointer start address is: 56 (R14)
; Src_Pointer end address is: 56 (R14)
J	L_Display_numbers34
NOP	
L_Display_numbers35:
;ssd1963_8bit_library.h,466 :: 		}
L_end_Display_numbers:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Display_numbers
_Display_char:
;ssd1963_8bit_library.h,474 :: 		void Display_char(unsigned char b, unsigned int x0, unsigned int y0)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ssd1963_8bit_library.h,482 :: 		if (b <= 91) alpha = b - 33 ;       // which the data base start with ( . ) which equal 32 in Ascci
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R28, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 92
BNE	R2, R0, L__Display_char147
NOP	
J	L_Display_char40
NOP	
L__Display_char147:
ANDI	R2, R25, 255
ADDIU	R2, R2, -33
; alpha start address is: 12 (R3)
SEH	R3, R2
; alpha end address is: 12 (R3)
J	L_Display_char41
NOP	
L_Display_char40:
;ssd1963_8bit_library.h,483 :: 		else         alpha = b - 34 ;
ANDI	R2, R25, 255
ADDIU	R2, R2, -34
; alpha start address is: 12 (R3)
SEH	R3, R2
; alpha end address is: 12 (R3)
L_Display_char41:
;ssd1963_8bit_library.h,485 :: 		hight = *Font_Description_Pointer ;
; alpha start address is: 12 (R3)
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
LHU	R5, 0(R2)
; hight start address is: 24 (R6)
ANDI	R6, R5, 65535
;ssd1963_8bit_library.h,486 :: 		width = *(Font_Description_Pointer + (alpha*2) + 1);
ANDI	R2, R3, 65535
; alpha end address is: 12 (R3)
SLL	R2, R2, 1
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R3, R2, R3
ADDIU	R2, R3, 2
LHU	R4, 0(R2)
; width start address is: 28 (R7)
ANDI	R7, R4, 65535
;ssd1963_8bit_library.h,487 :: 		index = *(Font_Description_Pointer + (alpha*2) + 2)  ;
ADDIU	R2, R3, 4
LHU	R2, 0(R2)
; index start address is: 32 (R8)
ANDI	R8, R2, 65535
;ssd1963_8bit_library.h,489 :: 		width_byte = (width / 8)+1 ;
ANDI	R2, R4, 65535
SRL	R2, R2, 3
ADDIU	R2, R2, 1
; width_byte start address is: 40 (R10)
ANDI	R10, R2, 65535
;ssd1963_8bit_library.h,491 :: 		WindowSet(x0,(x0+width-1),y0,(y0+hight-1));      //
ADDU	R2, R27, R5
ADDIU	R3, R2, -1
ADDU	R2, R26, R4
ADDIU	R2, R2, -1
ANDI	R28, R3, 65535
ANDI	R25, R26, 65535
ANDI	R26, R2, 65535
JAL	_WindowSet+0
NOP	
;ssd1963_8bit_library.h,492 :: 		TFT_Set_Index(0x2c);
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,494 :: 		for (i=0 ; i<hight ; i++){
; i start address is: 8 (R2)
MOVZ	R2, R0, R0
; hight end address is: 24 (R6)
; width end address is: 28 (R7)
; index end address is: 32 (R8)
; i end address is: 8 (R2)
; width_byte end address is: 40 (R10)
ANDI	R4, R6, 65535
ANDI	R6, R8, 65535
ANDI	R8, R2, 255
ANDI	R5, R7, 65535
L_Display_char42:
; i start address is: 32 (R8)
; width_byte start address is: 40 (R10)
; index start address is: 24 (R6)
; width start address is: 20 (R5)
; hight start address is: 16 (R4)
ANDI	R3, R8, 255
ANDI	R2, R4, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__Display_char148
NOP	
J	L_Display_char43
NOP	
L__Display_char148:
;ssd1963_8bit_library.h,495 :: 		for (j=0 ; j<width_byte ; j++) {
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
; j end address is: 28 (R7)
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; i end address is: 32 (R8)
L_Display_char45:
; j start address is: 28 (R7)
; hight start address is: 16 (R4)
; width start address is: 20 (R5)
; index start address is: 24 (R6)
; width_byte start address is: 40 (R10)
; i start address is: 32 (R8)
ANDI	R3, R7, 255
ANDI	R2, R10, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__Display_char149
NOP	
J	L_Display_char46
NOP	
L__Display_char149:
;ssd1963_8bit_library.h,496 :: 		bdata = *(Font_Pointer + (index+j) + (i * width_byte)) ;
ANDI	R2, R7, 255
ADDU	R2, R6, R2
ANDI	R3, R2, 65535
LW	R2, Offset(_Font_Pointer+0)(GP)
ADDU	R3, R2, R3
ANDI	R2, R8, 255
MULTU	R2, R10
MFLO	R2
ANDI	R2, R2, 65535
ADDU	R2, R3, R2
LBU	R2, 0(R2)
; bdata start address is: 36 (R9)
ANDI	R9, R2, 255
;ssd1963_8bit_library.h,498 :: 		buf = 0b10000000 ;
; buf start address is: 48 (R12)
ORI	R12, R0, 128
;ssd1963_8bit_library.h,499 :: 		if((width_byte - 1 - j) > 0 ) repeat = 8 ;
ADDIU	R3, R10, -1
ANDI	R2, R7, 255
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Display_char150
NOP	
J	L_Display_char48
NOP	
L__Display_char150:
; repeat start address is: 8 (R2)
ORI	R2, R0, 8
; repeat end address is: 8 (R2)
J	L_Display_char49
NOP	
L_Display_char48:
;ssd1963_8bit_library.h,500 :: 		else                        repeat = width - (width_byte-1)*8 ;
ADDIU	R2, R10, -1
ANDI	R2, R2, 255
SLL	R2, R2, 3
SUBU	R2, R5, R2
; repeat start address is: 12 (R3)
ANDI	R3, R2, 255
; repeat end address is: 12 (R3)
ANDI	R2, R3, 255
L_Display_char49:
;ssd1963_8bit_library.h,502 :: 		for (k=1 ; k <= repeat ; k++){
; repeat start address is: 8 (R2)
; k start address is: 44 (R11)
ORI	R11, R0, 1
; j end address is: 28 (R7)
; repeat end address is: 8 (R2)
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; buf end address is: 48 (R12)
; k end address is: 44 (R11)
; i end address is: 32 (R8)
ANDI	R13, R7, 255
ANDI	R7, R8, 255
ANDI	R8, R2, 255
L_Display_char50:
; k start address is: 44 (R11)
; repeat start address is: 32 (R8)
; buf start address is: 48 (R12)
; bdata start address is: 36 (R9)
; bdata end address is: 36 (R9)
; i start address is: 28 (R7)
; width_byte start address is: 40 (R10)
; index start address is: 24 (R6)
; width start address is: 20 (R5)
; hight start address is: 16 (R4)
; j start address is: 52 (R13)
ANDI	R3, R11, 255
ANDI	R2, R8, 255
SLTU	R2, R2, R3
BEQ	R2, R0, L__Display_char151
NOP	
J	L_Display_char51
NOP	
L__Display_char151:
; bdata end address is: 36 (R9)
;ssd1963_8bit_library.h,503 :: 		dataBuf = bdata & buf ;
; bdata start address is: 36 (R9)
AND	R3, R9, R12
;ssd1963_8bit_library.h,504 :: 		buf = buf >> 1 ;
ANDI	R2, R12, 255
; buf end address is: 48 (R12)
SRL	R2, R2, 1
; buf start address is: 48 (R12)
ANDI	R12, R2, 255
;ssd1963_8bit_library.h,505 :: 		if(dataBuf == 0)   TFT_Write_Data(Back_Color);   //Back_Color
ANDI	R2, R3, 255
BEQ	R2, R0, L__Display_char152
NOP	
J	L_Display_char53
NOP	
L__Display_char152:
SB	R25, 16(SP)
LW	R25, Offset(_Back_Color+0)(GP)
JAL	_TFT_Write_Data+0
NOP	
LBU	R25, 16(SP)
J	L_Display_char54
NOP	
L_Display_char53:
;ssd1963_8bit_library.h,506 :: 		else               TFT_Write_Data(Font_Color);
SB	R25, 16(SP)
LW	R25, Offset(_Font_Color+0)(GP)
JAL	_TFT_Write_Data+0
NOP	
LBU	R25, 16(SP)
L_Display_char54:
;ssd1963_8bit_library.h,502 :: 		for (k=1 ; k <= repeat ; k++){
ADDIU	R2, R11, 1
ANDI	R11, R2, 255
;ssd1963_8bit_library.h,507 :: 		}
; repeat end address is: 32 (R8)
; bdata end address is: 36 (R9)
; buf end address is: 48 (R12)
; k end address is: 44 (R11)
J	L_Display_char50
NOP	
L_Display_char51:
;ssd1963_8bit_library.h,495 :: 		for (j=0 ; j<width_byte ; j++) {
ADDIU	R2, R13, 1
; j end address is: 52 (R13)
; j start address is: 8 (R2)
;ssd1963_8bit_library.h,510 :: 		}
ANDI	R8, R7, 255
; i end address is: 28 (R7)
; j end address is: 8 (R2)
ANDI	R7, R2, 255
J	L_Display_char45
NOP	
L_Display_char46:
;ssd1963_8bit_library.h,494 :: 		for (i=0 ; i<hight ; i++){
; i start address is: 32 (R8)
ADDIU	R2, R8, 1
ANDI	R8, R2, 255
;ssd1963_8bit_library.h,511 :: 		}
; width_byte end address is: 40 (R10)
; index end address is: 24 (R6)
; width end address is: 20 (R5)
; hight end address is: 16 (R4)
; i end address is: 32 (R8)
J	L_Display_char42
NOP	
L_Display_char43:
;ssd1963_8bit_library.h,512 :: 		}
L_end_Display_char:
LW	R28, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Display_char
_Display_String:
;ssd1963_8bit_library.h,522 :: 		void Display_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;ssd1963_8bit_library.h,527 :: 		Src_Pointer = Data_Pointer;
; Src_Pointer start address is: 56 (R14)
MOVZ	R14, R25, R0
; Src_Pointer end address is: 56 (R14)
;ssd1963_8bit_library.h,529 :: 		while(1)
L_Display_String55:
;ssd1963_8bit_library.h,531 :: 		if(*Src_Pointer != 32) {
; Src_Pointer start address is: 56 (R14)
LBU	R2, 0(R14)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L__Display_String155
NOP	
J	L_Display_String57
NOP	
L__Display_String155:
;ssd1963_8bit_library.h,532 :: 		Display_char(*Src_Pointer,x0,y0);
LBU	R2, 0(R14)
SW	R25, 4(SP)
ANDI	R25, R2, 255
JAL	_Display_char+0
NOP	
LW	R25, 4(SP)
;ssd1963_8bit_library.h,533 :: 		if (*Src_Pointer <= 91) alpha = *Src_Pointer - 33 ;     // which the data base start with ( . ) which equal 32 in Ascci
LBU	R2, 0(R14)
ANDI	R2, R2, 255
SLTIU	R2, R2, 92
BNE	R2, R0, L__Display_String156
NOP	
J	L_Display_String58
NOP	
L__Display_String156:
LBU	R2, 0(R14)
ANDI	R2, R2, 255
ADDIU	R2, R2, -33
SH	R2, 8(SP)
J	L_Display_String59
NOP	
L_Display_String58:
;ssd1963_8bit_library.h,534 :: 		else                    alpha = *Src_Pointer - 34 ;
LBU	R2, 0(R14)
ANDI	R2, R2, 255
ADDIU	R2, R2, -34
SH	R2, 8(SP)
L_Display_String59:
;ssd1963_8bit_library.h,535 :: 		alpha = alpha * 2 + 1 ;                            // which the data base start with ( . ) which equal 32 in Ascci
LH	R2, 8(SP)
SLL	R2, R2, 1
ADDIU	R2, R2, 1
SH	R2, 8(SP)
;ssd1963_8bit_library.h,536 :: 		width = *(Font_Description_Pointer + alpha);
SEH	R2, R2
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
;ssd1963_8bit_library.h,537 :: 		x0 = x0 + width+2  ;
ADDU	R2, R26, R2
ADDIU	R2, R2, 2
ANDI	R26, R2, 65535
;ssd1963_8bit_library.h,538 :: 		}
L_Display_String57:
;ssd1963_8bit_library.h,540 :: 		Src_Pointer++;
ADDIU	R2, R14, 1
MOVZ	R14, R2, R0
;ssd1963_8bit_library.h,541 :: 		if(*Src_Pointer == 0) break;         // 0 in ascii == nul
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Display_String157
NOP	
J	L_Display_String60
NOP	
L__Display_String157:
; Src_Pointer end address is: 56 (R14)
J	L_Display_String56
NOP	
L_Display_String60:
;ssd1963_8bit_library.h,543 :: 		}
; Src_Pointer start address is: 56 (R14)
; Src_Pointer end address is: 56 (R14)
J	L_Display_String55
NOP	
L_Display_String56:
;ssd1963_8bit_library.h,544 :: 		}
L_end_Display_String:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Display_String
_Display1_String:
;ssd1963_8bit_library.h,547 :: 		void Display1_String(unsigned char *Data_Pointer, unsigned int x0, unsigned int y0)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;ssd1963_8bit_library.h,552 :: 		Src_Pointer = Data_Pointer;
; Src_Pointer start address is: 56 (R14)
MOVZ	R14, R25, R0
; Src_Pointer end address is: 56 (R14)
;ssd1963_8bit_library.h,554 :: 		while(1)
L_Display1_String61:
;ssd1963_8bit_library.h,556 :: 		if(*Src_Pointer != 32) {
; Src_Pointer start address is: 56 (R14)
LBU	R2, 0(R14)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L__Display1_String160
NOP	
J	L_Display1_String63
NOP	
L__Display1_String160:
;ssd1963_8bit_library.h,557 :: 		Display_char(*Src_Pointer,x0,y0);
LBU	R2, 0(R14)
SW	R25, 4(SP)
ANDI	R25, R2, 255
JAL	_Display_char+0
NOP	
LW	R25, 4(SP)
;ssd1963_8bit_library.h,558 :: 		if (*Src_Pointer <= 91) alpha = *Src_Pointer - 33 ;     // which the data base start with ( . ) which equal 32 in Ascci
LBU	R2, 0(R14)
ANDI	R2, R2, 255
SLTIU	R2, R2, 92
BNE	R2, R0, L__Display1_String161
NOP	
J	L_Display1_String64
NOP	
L__Display1_String161:
LBU	R2, 0(R14)
ANDI	R2, R2, 255
ADDIU	R2, R2, -33
SH	R2, 8(SP)
J	L_Display1_String65
NOP	
L_Display1_String64:
;ssd1963_8bit_library.h,559 :: 		else                    alpha = *Src_Pointer - 34 ;
LBU	R2, 0(R14)
ANDI	R2, R2, 255
ADDIU	R2, R2, -34
SH	R2, 8(SP)
L_Display1_String65:
;ssd1963_8bit_library.h,560 :: 		alpha = alpha * 2 + 1 ;                            // which the data base start with ( . ) which equal 32 in Ascci
LH	R2, 8(SP)
SLL	R2, R2, 1
ADDIU	R2, R2, 1
SH	R2, 8(SP)
;ssd1963_8bit_library.h,561 :: 		width = *(Font_Description_Pointer + alpha);
SEH	R2, R2
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
;ssd1963_8bit_library.h,562 :: 		x0 = x0 + width +3;
ADDU	R2, R26, R2
ADDIU	R2, R2, 3
ANDI	R26, R2, 65535
;ssd1963_8bit_library.h,563 :: 		}
L_Display1_String63:
;ssd1963_8bit_library.h,565 :: 		Src_Pointer++;
ADDIU	R2, R14, 1
MOVZ	R14, R2, R0
;ssd1963_8bit_library.h,566 :: 		if(*Src_Pointer == 0) break;         // 0 in ascii == nul
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Display1_String162
NOP	
J	L_Display1_String66
NOP	
L__Display1_String162:
; Src_Pointer end address is: 56 (R14)
J	L_Display1_String62
NOP	
L_Display1_String66:
;ssd1963_8bit_library.h,568 :: 		}
; Src_Pointer start address is: 56 (R14)
; Src_Pointer end address is: 56 (R14)
J	L_Display1_String61
NOP	
L_Display1_String62:
;ssd1963_8bit_library.h,569 :: 		}
L_end_Display1_String:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Display1_String
_Draw_Line:
;ssd1963_8bit_library.h,575 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned long colour)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
; colour start address is: 16 (R4)
LW	R4, 12(SP)
;ssd1963_8bit_library.h,577 :: 		signed int dx = 0x0000;
;ssd1963_8bit_library.h,578 :: 		signed int dy = 0x0000;
;ssd1963_8bit_library.h,579 :: 		signed int stepx = 0x0000;
;ssd1963_8bit_library.h,580 :: 		signed int stepy = 0x0000;
;ssd1963_8bit_library.h,581 :: 		signed int fraction = 0x0000;
;ssd1963_8bit_library.h,583 :: 		dy = (y2 - y1);
SUBU	R3, R28, R26
; dy start address is: 20 (R5)
SEH	R5, R3
;ssd1963_8bit_library.h,584 :: 		dx = (x2 - x1);
SUBU	R2, R27, R25
; dx start address is: 24 (R6)
SEH	R6, R2
;ssd1963_8bit_library.h,586 :: 		if(dy < 0)
SEH	R2, R3
SLTI	R2, R2, 0
BNE	R2, R0, L__Draw_Line164
NOP	
J	L_Draw_Line67
NOP	
L__Draw_Line164:
;ssd1963_8bit_library.h,588 :: 		dy = -dy;
MOVZ	R2, R0, R0
SUBU	R2, R2, R5
; dy end address is: 20 (R5)
; dy start address is: 12 (R3)
SEH	R3, R2
;ssd1963_8bit_library.h,589 :: 		stepy = -1;
; stepy start address is: 20 (R5)
ORI	R5, R0, 65535
;ssd1963_8bit_library.h,590 :: 		}
; dy end address is: 12 (R3)
; stepy end address is: 20 (R5)
J	L_Draw_Line68
NOP	
L_Draw_Line67:
;ssd1963_8bit_library.h,593 :: 		stepy = 1;
; stepy start address is: 8 (R2)
; dy start address is: 20 (R5)
ORI	R2, R0, 1
; dy end address is: 20 (R5)
; stepy end address is: 8 (R2)
SEH	R3, R5
SEH	R5, R2
;ssd1963_8bit_library.h,594 :: 		}
L_Draw_Line68:
;ssd1963_8bit_library.h,596 :: 		if(dx < 0)
; stepy start address is: 20 (R5)
; dy start address is: 12 (R3)
SEH	R2, R6
SLTI	R2, R2, 0
BNE	R2, R0, L__Draw_Line165
NOP	
J	L_Draw_Line69
NOP	
L__Draw_Line165:
;ssd1963_8bit_library.h,598 :: 		dx = -dx;
MOVZ	R2, R0, R0
SUBU	R2, R2, R6
SEH	R6, R2
;ssd1963_8bit_library.h,599 :: 		stepx = -1;
; stepx start address is: 32 (R8)
ORI	R8, R0, 65535
;ssd1963_8bit_library.h,600 :: 		}
; stepx end address is: 32 (R8)
J	L_Draw_Line70
NOP	
L_Draw_Line69:
;ssd1963_8bit_library.h,603 :: 		stepx = 1;
; stepx start address is: 32 (R8)
ORI	R8, R0, 1
; dx end address is: 24 (R6)
; stepx end address is: 32 (R8)
;ssd1963_8bit_library.h,604 :: 		}
L_Draw_Line70:
;ssd1963_8bit_library.h,606 :: 		dx <<= 0x01;
; stepx start address is: 32 (R8)
; dx start address is: 24 (R6)
SEH	R2, R6
; dx end address is: 24 (R6)
SLL	R2, R2, 1
; dx start address is: 28 (R7)
SEH	R7, R2
;ssd1963_8bit_library.h,607 :: 		dy <<= 0x01;
SEH	R2, R3
; dy end address is: 12 (R3)
SLL	R2, R2, 1
; dy start address is: 24 (R6)
SEH	R6, R2
;ssd1963_8bit_library.h,610 :: 		WindowSet(x1,x2,y1,y2);
SH	R27, 4(SP)
SH	R26, 6(SP)
SH	R27, 8(SP)
SEH	R27, R26
LHU	R26, 8(SP)
JAL	_WindowSet+0
NOP	
LH	R26, 6(SP)
LH	R27, 4(SP)
;ssd1963_8bit_library.h,611 :: 		TFT_Set_Index(0x2c);
SH	R25, 4(SP)
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,612 :: 		TFT_Write_Data(colour);
MOVZ	R25, R4, R0
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,613 :: 		if(dx > dy)
SEH	R3, R7
SEH	R2, R6
SLT	R2, R2, R3
BNE	R2, R0, L__Draw_Line166
NOP	
J	L_Draw_Line71
NOP	
L__Draw_Line166:
;ssd1963_8bit_library.h,615 :: 		fraction = (dy - (dx >> 1));
SEH	R2, R7
SRA	R2, R2, 1
SUBU	R2, R6, R2
; fraction start address is: 36 (R9)
SEH	R9, R2
; fraction end address is: 36 (R9)
;ssd1963_8bit_library.h,616 :: 		while(x1 != x2)
L_Draw_Line72:
; fraction start address is: 36 (R9)
; dy start address is: 24 (R6)
; dy end address is: 24 (R6)
; dx start address is: 28 (R7)
; dx end address is: 28 (R7)
; stepx start address is: 32 (R8)
; stepx end address is: 32 (R8)
; stepy start address is: 20 (R5)
; stepy end address is: 20 (R5)
; colour start address is: 16 (R4)
; colour end address is: 16 (R4)
SEH	R3, R25
SEH	R2, R27
BNE	R3, R2, L__Draw_Line168
NOP	
J	L_Draw_Line73
NOP	
L__Draw_Line168:
; dy end address is: 24 (R6)
; dx end address is: 28 (R7)
; stepx end address is: 32 (R8)
; stepy end address is: 20 (R5)
; colour end address is: 16 (R4)
;ssd1963_8bit_library.h,618 :: 		if(fraction >= 0)
; colour start address is: 16 (R4)
; stepy start address is: 20 (R5)
; stepx start address is: 32 (R8)
; dx start address is: 28 (R7)
; dy start address is: 24 (R6)
SEH	R2, R9
SLTI	R2, R2, 0
BEQ	R2, R0, L__Draw_Line169
NOP	
J	L__Draw_Line107
NOP	
L__Draw_Line169:
;ssd1963_8bit_library.h,620 :: 		y1 += stepy;
ADDU	R2, R26, R5
SEH	R26, R2
;ssd1963_8bit_library.h,621 :: 		fraction -= dx;
SUBU	R2, R9, R7
SEH	R9, R2
; fraction end address is: 36 (R9)
;ssd1963_8bit_library.h,622 :: 		}
J	L_Draw_Line74
NOP	
L__Draw_Line107:
;ssd1963_8bit_library.h,618 :: 		if(fraction >= 0)
;ssd1963_8bit_library.h,622 :: 		}
L_Draw_Line74:
;ssd1963_8bit_library.h,623 :: 		x1 += stepx;
; fraction start address is: 36 (R9)
ADDU	R3, R25, R8
SEH	R25, R3
;ssd1963_8bit_library.h,624 :: 		fraction += dy;
ADDU	R2, R9, R6
SEH	R9, R2
;ssd1963_8bit_library.h,627 :: 		WindowSet(x1,x2,y1,y2);
SH	R27, 4(SP)
SH	R26, 6(SP)
SH	R25, 8(SP)
SH	R27, 10(SP)
SEH	R25, R3
SEH	R27, R26
LHU	R26, 10(SP)
JAL	_WindowSet+0
NOP	
LH	R25, 8(SP)
LH	R26, 6(SP)
LH	R27, 4(SP)
;ssd1963_8bit_library.h,628 :: 		TFT_Set_Index(0x2c);
SH	R25, 4(SP)
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,629 :: 		TFT_Write_Data(colour);
MOVZ	R25, R4, R0
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,630 :: 		}
; dy end address is: 24 (R6)
; dx end address is: 28 (R7)
; stepx end address is: 32 (R8)
; stepy end address is: 20 (R5)
; colour end address is: 16 (R4)
; fraction end address is: 36 (R9)
J	L_Draw_Line72
NOP	
L_Draw_Line73:
;ssd1963_8bit_library.h,631 :: 		}
J	L_Draw_Line75
NOP	
L_Draw_Line71:
;ssd1963_8bit_library.h,634 :: 		fraction = (dx - (dy >> 1));
; colour start address is: 16 (R4)
; stepy start address is: 20 (R5)
; stepx start address is: 32 (R8)
; dx start address is: 28 (R7)
; dy start address is: 24 (R6)
SEH	R2, R6
SRA	R2, R2, 1
SUBU	R2, R7, R2
; fraction start address is: 36 (R9)
SEH	R9, R2
; dy end address is: 24 (R6)
; dx end address is: 28 (R7)
; stepx end address is: 32 (R8)
; stepy end address is: 20 (R5)
; colour end address is: 16 (R4)
; fraction end address is: 36 (R9)
SH	R7, 4(SP)
SH	R6, 6(SP)
SEH	R6, R8
MOVZ	R8, R4, R0
SEH	R7, R5
LH	R4, 6(SP)
LH	R5, 4(SP)
;ssd1963_8bit_library.h,636 :: 		while(y1 != y2)
L_Draw_Line76:
; fraction start address is: 36 (R9)
; colour start address is: 32 (R8)
; stepy start address is: 28 (R7)
; stepx start address is: 24 (R6)
; dx start address is: 20 (R5)
; dy start address is: 16 (R4)
; dy start address is: 16 (R4)
; dy end address is: 16 (R4)
; dx start address is: 20 (R5)
; dx end address is: 20 (R5)
; stepx start address is: 24 (R6)
; stepx end address is: 24 (R6)
; stepy start address is: 28 (R7)
; stepy end address is: 28 (R7)
; colour start address is: 32 (R8)
; colour end address is: 32 (R8)
SEH	R3, R26
SEH	R2, R28
BNE	R3, R2, L__Draw_Line171
NOP	
J	L_Draw_Line77
NOP	
L__Draw_Line171:
; dy end address is: 16 (R4)
; dx end address is: 20 (R5)
; stepx end address is: 24 (R6)
; stepy end address is: 28 (R7)
; colour end address is: 32 (R8)
;ssd1963_8bit_library.h,638 :: 		if (fraction >= 0)
; colour start address is: 32 (R8)
; stepy start address is: 28 (R7)
; stepx start address is: 24 (R6)
; dx start address is: 20 (R5)
; dy start address is: 16 (R4)
SEH	R2, R9
SLTI	R2, R2, 0
BEQ	R2, R0, L__Draw_Line172
NOP	
J	L__Draw_Line108
NOP	
L__Draw_Line172:
;ssd1963_8bit_library.h,640 :: 		x1 += stepx;
ADDU	R2, R25, R6
SEH	R25, R2
;ssd1963_8bit_library.h,641 :: 		fraction -= dy;
SUBU	R2, R9, R4
SEH	R9, R2
; fraction end address is: 36 (R9)
;ssd1963_8bit_library.h,642 :: 		}
J	L_Draw_Line78
NOP	
L__Draw_Line108:
;ssd1963_8bit_library.h,638 :: 		if (fraction >= 0)
;ssd1963_8bit_library.h,642 :: 		}
L_Draw_Line78:
;ssd1963_8bit_library.h,643 :: 		y1 += stepy;
; fraction start address is: 36 (R9)
ADDU	R3, R26, R7
SEH	R26, R3
;ssd1963_8bit_library.h,644 :: 		fraction += dx;
ADDU	R2, R9, R5
SEH	R9, R2
;ssd1963_8bit_library.h,646 :: 		WindowSet(x1,x2,y1,y2);
SH	R27, 4(SP)
SH	R26, 6(SP)
SEH	R26, R27
SEH	R27, R3
JAL	_WindowSet+0
NOP	
LH	R26, 6(SP)
LH	R27, 4(SP)
;ssd1963_8bit_library.h,647 :: 		TFT_Set_Index(0x2c);
SH	R25, 4(SP)
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,648 :: 		TFT_Write_Data(colour);
MOVZ	R25, R8, R0
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,649 :: 		}
; dy end address is: 16 (R4)
; dx end address is: 20 (R5)
; stepx end address is: 24 (R6)
; stepy end address is: 28 (R7)
; colour end address is: 32 (R8)
; fraction end address is: 36 (R9)
J	L_Draw_Line76
NOP	
L_Draw_Line77:
;ssd1963_8bit_library.h,650 :: 		}
L_Draw_Line75:
;ssd1963_8bit_library.h,651 :: 		}
L_end_Draw_Line:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Draw_Line
_Draw_Circle:
;ssd1963_8bit_library.h,666 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
; colour start address is: 40 (R10)
LHU	R10, 12(SP)
;ssd1963_8bit_library.h,668 :: 		signed int a = 0x0000;
; a start address is: 52 (R13)
MOVZ	R13, R0, R0
;ssd1963_8bit_library.h,669 :: 		signed int b = 0x0000;
;ssd1963_8bit_library.h,670 :: 		signed int p = 0x0000;
;ssd1963_8bit_library.h,672 :: 		b = radius;
; b start address is: 44 (R11)
SEH	R11, R27
;ssd1963_8bit_library.h,673 :: 		p = (1 - b);
ORI	R2, R0, 1
SUBU	R2, R2, R27
; p start address is: 48 (R12)
SEH	R12, R2
; b end address is: 44 (R11)
; a end address is: 52 (R13)
; p end address is: 48 (R12)
;ssd1963_8bit_library.h,675 :: 		do
J	L_Draw_Circle79
NOP	
L__Draw_Circle109:
;ssd1963_8bit_library.h,717 :: 		}while(a <= b);
SEH	R11, R4
;ssd1963_8bit_library.h,675 :: 		do
L_Draw_Circle79:
;ssd1963_8bit_library.h,677 :: 		switch(fill)
; p start address is: 48 (R12)
; b start address is: 44 (R11)
; a start address is: 52 (R13)
; colour start address is: 40 (R10)
; colour end address is: 40 (R10)
J	L_Draw_Circle82
NOP	
; colour end address is: 40 (R10)
;ssd1963_8bit_library.h,679 :: 		case 1:
L_Draw_Circle84:
;ssd1963_8bit_library.h,681 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
; colour start address is: 40 (R10)
ADDU	R4, R26, R11
ADDU	R3, R25, R13
SUBU	R2, R25, R13
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R4
SEH	R27, R3
SEH	R26, R4
SEH	R25, R2
ANDI	R2, R10, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
LH	R25, 10(SP)
LH	R26, 8(SP)
;ssd1963_8bit_library.h,682 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
SUBU	R4, R26, R11
ADDU	R3, R25, R13
SUBU	R2, R25, R13
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R4
SEH	R27, R3
SEH	R26, R4
SEH	R25, R2
ANDI	R2, R10, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
LH	R25, 10(SP)
LH	R26, 8(SP)
;ssd1963_8bit_library.h,683 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
ADDU	R4, R26, R13
ADDU	R3, R25, R11
SUBU	R2, R25, R11
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R4
SEH	R27, R3
SEH	R26, R4
SEH	R25, R2
ANDI	R2, R10, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
LH	R25, 10(SP)
LH	R26, 8(SP)
;ssd1963_8bit_library.h,684 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
SUBU	R4, R26, R13
ADDU	R3, R25, R11
SUBU	R2, R25, R11
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R4
SEH	R27, R3
SEH	R26, R4
SEH	R25, R2
ANDI	R2, R10, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,685 :: 		break;
J	L_Draw_Circle83
NOP	
;ssd1963_8bit_library.h,687 :: 		default:
L_Draw_Circle85:
;ssd1963_8bit_library.h,689 :: 		WindowSet((xc + a),(xc + a), (yc + b), (yc + b));
ADDU	R3, R26, R11
ADDU	R2, R25, R13
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,690 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,691 :: 		WindowSet((xc + b),(xc + b) , (yc + a),(yc + a));
ADDU	R3, R26, R13
ADDU	R2, R25, R11
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,692 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,693 :: 		WindowSet((xc - a),(xc - a), (yc + b), (yc + b));
ADDU	R3, R26, R11
SUBU	R2, R25, R13
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,694 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,695 :: 		WindowSet((xc - b),(xc - b), (yc + a), (yc + a));
ADDU	R3, R26, R13
SUBU	R2, R25, R11
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,696 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,697 :: 		WindowSet((xc + b),(xc + b), (yc - a),(yc - a));
SUBU	R3, R26, R13
ADDU	R2, R25, R11
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,698 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,699 :: 		WindowSet((xc + a),(xc + a), (yc - b), (yc - b));
SUBU	R3, R26, R11
ADDU	R2, R25, R13
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,700 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,701 :: 		WindowSet((xc - a), (xc - a),(yc - b),(yc - b));
SUBU	R3, R26, R11
SUBU	R2, R25, R13
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,702 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,703 :: 		WindowSet((xc - b),(xc - b), (yc - a), (yc - a));
SUBU	R3, R26, R13
SUBU	R2, R25, R11
SB	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
SEH	R28, R3
SEH	R27, R3
SEH	R26, R2
SEH	R25, R2
JAL	_WindowSet+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LBU	R28, 4(SP)
;ssd1963_8bit_library.h,704 :: 		TFT_Write_Data(colour);
SH	R25, 4(SP)
ANDI	R25, R10, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 4(SP)
;ssd1963_8bit_library.h,705 :: 		break;
J	L_Draw_Circle83
NOP	
;ssd1963_8bit_library.h,707 :: 		}
L_Draw_Circle82:
ANDI	R3, R28, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Draw_Circle175
NOP	
J	L_Draw_Circle84
NOP	
L__Draw_Circle175:
J	L_Draw_Circle85
NOP	
L_Draw_Circle83:
;ssd1963_8bit_library.h,709 :: 		if(p < 0)
SEH	R2, R12
SLTI	R2, R2, 0
BNE	R2, R0, L__Draw_Circle176
NOP	
J	L_Draw_Circle86
NOP	
L__Draw_Circle176:
;ssd1963_8bit_library.h,711 :: 		p += (0x03 + (0x02 * a++));
SEH	R2, R13
SLL	R2, R2, 1
ADDIU	R2, R2, 3
ADDU	R2, R12, R2
SEH	R12, R2
ADDIU	R2, R13, 1
SEH	R13, R2
;ssd1963_8bit_library.h,712 :: 		}
SEH	R4, R11
J	L_Draw_Circle87
NOP	
L_Draw_Circle86:
;ssd1963_8bit_library.h,715 :: 		p += (0x05 + (0x02 * ((a++) - (b--))));
SUBU	R2, R13, R11
SEH	R2, R2
SLL	R2, R2, 1
ADDIU	R2, R2, 5
ADDU	R2, R12, R2
SEH	R12, R2
ADDIU	R2, R13, 1
SEH	R13, R2
ADDIU	R2, R11, -1
; b end address is: 44 (R11)
; b start address is: 16 (R4)
SEH	R4, R2
; b end address is: 16 (R4)
; a end address is: 52 (R13)
; p end address is: 48 (R12)
;ssd1963_8bit_library.h,716 :: 		}
L_Draw_Circle87:
;ssd1963_8bit_library.h,717 :: 		}while(a <= b);
; b start address is: 16 (R4)
; a start address is: 52 (R13)
; p start address is: 48 (R12)
SEH	R3, R13
SEH	R2, R4
SLT	R2, R2, R3
BNE	R2, R0, L__Draw_Circle177
NOP	
J	L__Draw_Circle109
NOP	
L__Draw_Circle177:
; colour end address is: 40 (R10)
; b end address is: 16 (R4)
; a end address is: 52 (R13)
; p end address is: 48 (R12)
;ssd1963_8bit_library.h,718 :: 		}
L_end_Draw_Circle:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Draw_Circle
_Draw_Line_H:
;ssd1963_8bit_library.h,720 :: 		void Draw_Line_H(signed int x1,signed int x2, signed int y,unsigned long colour)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ssd1963_8bit_library.h,722 :: 		Draw_Line(x1,y,x2,y, colour);
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
ADDIU	SP, SP, -4
SW	R28, 0(SP)
SEH	R28, R27
SEH	R27, R26
SEH	R26, R28
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
;ssd1963_8bit_library.h,723 :: 		}
L_end_Draw_Line_H:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Draw_Line_H
_Draw_Line_V:
;ssd1963_8bit_library.h,725 :: 		void Draw_Line_V(signed int x,signed int y1, signed int y2,unsigned long colour)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;ssd1963_8bit_library.h,727 :: 		Draw_Line(x,y1,x,y2, colour);
SW	R27, 4(SP)
SW	R28, 8(SP)
ADDIU	SP, SP, -4
SW	R28, 0(SP)
SEH	R28, R27
SEH	R27, R25
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
;ssd1963_8bit_library.h,728 :: 		}
L_end_Draw_Line_V:
LW	R28, 8(SP)
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Draw_Line_V
_Draw_rectangle:
;ssd1963_8bit_library.h,731 :: 		void Draw_rectangle(signed int x1,signed int y1,signed int W,signed int H,unsigned long colour,unsigned int size)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
; colour start address is: 52 (R13)
LW	R13, 12(SP)
; size start address is: 48 (R12)
LHU	R12, 16(SP)
;ssd1963_8bit_library.h,735 :: 		x2= x1+W ;
ADDU	R2, R25, R27
; x2 start address is: 44 (R11)
SEH	R11, R2
;ssd1963_8bit_library.h,736 :: 		y2= y1+H;
ADDU	R2, R26, R28
; y2 start address is: 40 (R10)
SEH	R10, R2
;ssd1963_8bit_library.h,738 :: 		for(i=0;i<size;i++){
; i start address is: 56 (R14)
MOVZ	R14, R0, R0
; size end address is: 48 (R12)
; i end address is: 56 (R14)
L_Draw_rectangle88:
; i start address is: 56 (R14)
; y2 start address is: 40 (R10)
; y2 end address is: 40 (R10)
; x2 start address is: 44 (R11)
; x2 end address is: 44 (R11)
; size start address is: 48 (R12)
; colour start address is: 52 (R13)
; colour end address is: 52 (R13)
SEH	R3, R14
ANDI	R2, R12, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__Draw_rectangle181
NOP	
J	L_Draw_rectangle89
NOP	
L__Draw_rectangle181:
; y2 end address is: 40 (R10)
; x2 end address is: 44 (R11)
; colour end address is: 52 (R13)
;ssd1963_8bit_library.h,739 :: 		Draw_Line_V(x1+i, y1+i, y2+i, colour);
; colour start address is: 52 (R13)
; x2 start address is: 44 (R11)
; y2 start address is: 40 (R10)
ADDU	R4, R10, R14
ADDU	R3, R26, R14
ADDU	R2, R25, R14
SH	R28, 4(SP)
SH	R27, 6(SP)
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R28, R13, R0
ANDI	R27, R4, 65535
SEH	R26, R3
SEH	R25, R2
JAL	_Draw_Line_V+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;ssd1963_8bit_library.h,740 :: 		Draw_Line_V(x2+i, y1+i, y2+i, colour);
ADDU	R4, R10, R14
ADDU	R3, R26, R14
ADDU	R2, R11, R14
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R28, R13, R0
ANDI	R27, R4, 65535
SEH	R26, R3
ANDI	R25, R2, 65535
JAL	_Draw_Line_V+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
;ssd1963_8bit_library.h,741 :: 		Draw_Line_H(x1+i, x2+i, y1+i, colour);
ADDU	R4, R26, R14
ADDU	R3, R11, R14
ADDU	R2, R25, R14
SH	R26, 8(SP)
SH	R25, 10(SP)
MOVZ	R28, R13, R0
SEH	R27, R4
ANDI	R26, R3, 65535
SEH	R25, R2
JAL	_Draw_Line_H+0
NOP	
LH	R25, 10(SP)
;ssd1963_8bit_library.h,742 :: 		Draw_Line_H(x1+i, x2+i, y2+i, colour);
ADDU	R4, R10, R14
ADDU	R3, R11, R14
ADDU	R2, R25, R14
SH	R25, 10(SP)
MOVZ	R28, R13, R0
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
SEH	R25, R2
JAL	_Draw_Line_H+0
NOP	
LH	R25, 10(SP)
LH	R26, 8(SP)
LH	R27, 6(SP)
LH	R28, 4(SP)
;ssd1963_8bit_library.h,738 :: 		for(i=0;i<size;i++){
ADDIU	R2, R14, 1
SEH	R14, R2
;ssd1963_8bit_library.h,744 :: 		}
; y2 end address is: 40 (R10)
; x2 end address is: 44 (R11)
; size end address is: 48 (R12)
; colour end address is: 52 (R13)
; i end address is: 56 (R14)
J	L_Draw_rectangle88
NOP	
L_Draw_rectangle89:
;ssd1963_8bit_library.h,746 :: 		}
L_end_Draw_rectangle:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Draw_rectangle
_img_load_raw_image_mem:
;ssd1963_8bit_library.h,748 :: 		void img_load_raw_image_mem(int x11, int y11, int imgX, int imgY, const unsigned char*img)  {
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
; img start address is: 24 (R6)
LW	R6, 16(SP)
;ssd1963_8bit_library.h,751 :: 		WindowSet(x11, (imgX + x11) -1, y11, (imgY + y11)-1);
ADDU	R2, R28, R26
ADDIU	R3, R2, -1
ADDU	R2, R27, R25
ADDIU	R2, R2, -1
SH	R28, 12(SP)
SH	R27, 14(SP)
SEH	R28, R3
SEH	R27, R26
SEH	R26, R2
JAL	_WindowSet+0
NOP	
LH	R27, 14(SP)
LH	R28, 12(SP)
;ssd1963_8bit_library.h,752 :: 		TFT_Set_Index(0x2c);
ORI	R25, R0, 44
JAL	_TFT_Set_Index+0
NOP	
;ssd1963_8bit_library.h,754 :: 		for ( y = 0; y < imgY; y++) {
; y start address is: 28 (R7)
MOVZ	R7, R0, R0
; img end address is: 24 (R6)
; y end address is: 28 (R7)
L_img_load_raw_image_mem91:
; y start address is: 28 (R7)
; img start address is: 24 (R6)
ANDI	R3, R7, 65535
SEH	R2, R28
SLTU	R2, R3, R2
BNE	R2, R0, L__img_load_raw_image_mem183
NOP	
J	L_img_load_raw_image_mem92
NOP	
L__img_load_raw_image_mem183:
;ssd1963_8bit_library.h,755 :: 		for (x = 0; x < imgX; x++){
; x start address is: 32 (R8)
MOVZ	R8, R0, R0
; img end address is: 24 (R6)
; x end address is: 32 (R8)
; y end address is: 28 (R7)
L_img_load_raw_image_mem94:
; x start address is: 32 (R8)
; img start address is: 24 (R6)
; y start address is: 28 (R7)
ANDI	R3, R8, 65535
SEH	R2, R27
SLTU	R2, R3, R2
BNE	R2, R0, L__img_load_raw_image_mem184
NOP	
J	L_img_load_raw_image_mem95
NOP	
L__img_load_raw_image_mem184:
;ssd1963_8bit_library.h,757 :: 		dataa = img[(imgX*2*y)+2*x] ;
SEH	R2, R27
SLL	R2, R2, 1
MULTU	R2, R7
MFLO	R5
ANDI	R2, R8, 65535
SLL	R4, R2, 1
ADDU	R2, R5, R4
ANDI	R2, R2, 65535
ADDU	R2, R6, R2
LBU	R2, 0(R2)
; dataa start address is: 12 (R3)
ANDI	R3, R2, 255
;ssd1963_8bit_library.h,758 :: 		dataa = dataa << 8 ;
ANDI	R2, R3, 65535
; dataa end address is: 12 (R3)
SLL	R3, R2, 8
;ssd1963_8bit_library.h,759 :: 		dataa = dataa + img[(imgX*2*y)+(2*x+1)] ;
ADDIU	R2, R4, 1
ADDU	R2, R5, R2
ANDI	R2, R2, 65535
ADDU	R2, R6, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDU	R2, R3, R2
;ssd1963_8bit_library.h,760 :: 		TFT_Write_Data(dataa);
SH	R25, 12(SP)
ANDI	R25, R2, 65535
JAL	_TFT_Write_Data+0
NOP	
LH	R25, 12(SP)
;ssd1963_8bit_library.h,755 :: 		for (x = 0; x < imgX; x++){
ADDIU	R2, R8, 1
ANDI	R8, R2, 65535
;ssd1963_8bit_library.h,762 :: 		}
; x end address is: 32 (R8)
J	L_img_load_raw_image_mem94
NOP	
L_img_load_raw_image_mem95:
;ssd1963_8bit_library.h,754 :: 		for ( y = 0; y < imgY; y++) {
ADDIU	R2, R7, 1
ANDI	R7, R2, 65535
;ssd1963_8bit_library.h,763 :: 		}
; img end address is: 24 (R6)
; y end address is: 28 (R7)
J	L_img_load_raw_image_mem91
NOP	
L_img_load_raw_image_mem92:
;ssd1963_8bit_library.h,764 :: 		}
L_end_img_load_raw_image_mem:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _img_load_raw_image_mem
MyProjectff_InitializeObjects:
;page_def.h,184 :: 		static void InitializeObjects() {
;page_def.h,185 :: 		Screen1.Color                     = 0x5AEB;
ORI	R2, R0, 23275
SH	R2, Offset(_Screen1+0)(GP)
;page_def.h,186 :: 		Screen1.Width                     = 800;
ORI	R2, R0, 800
SH	R2, Offset(_Screen1+2)(GP)
;page_def.h,187 :: 		Screen1.Height                    = 480;
ORI	R2, R0, 480
SH	R2, Offset(_Screen1+4)(GP)
;page_def.h,188 :: 		Screen1.BoxesCount                = 11;
ORI	R2, R0, 11
SH	R2, Offset(_Screen1+32)(GP)
;page_def.h,189 :: 		Screen1.Boxes                     = Screen1_Boxes;
LUI	R2, hi_addr(_Screen1_Boxes+0)
ORI	R2, R2, lo_addr(_Screen1_Boxes+0)
SW	R2, Offset(_Screen1+36)(GP)
;page_def.h,190 :: 		Screen1.ObjectsCount              = 11;
ORI	R2, R0, 11
SH	R2, Offset(_Screen1+6)(GP)
;page_def.h,193 :: 		Box34.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box34+0)(GP)
;page_def.h,194 :: 		Box34.Order           = 0;
SB	R0, Offset(_Box34+4)(GP)
;page_def.h,195 :: 		Box34.Left            = 379;
ORI	R2, R0, 379
SH	R2, Offset(_Box34+6)(GP)
;page_def.h,196 :: 		Box34.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Box34+8)(GP)
;page_def.h,197 :: 		Box34.Width           = 358;
ORI	R2, R0, 358
SH	R2, Offset(_Box34+10)(GP)
;page_def.h,198 :: 		Box34.Height          = 141;
ORI	R2, R0, 141
SH	R2, Offset(_Box34+12)(GP)
;page_def.h,199 :: 		Box34.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box34+14)(GP)
;page_def.h,200 :: 		Box34.Pen_Color       = 0x0000;
SH	R0, Offset(_Box34+16)(GP)
;page_def.h,201 :: 		Box34.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box34+18)(GP)
;page_def.h,202 :: 		Box34.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box34+19)(GP)
;page_def.h,203 :: 		Box34.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box34+20)(GP)
;page_def.h,204 :: 		Box34.Gradient        = 0;
SB	R0, Offset(_Box34+21)(GP)
;page_def.h,205 :: 		Box34.Gradient_Orientation = 0;
SB	R0, Offset(_Box34+22)(GP)
;page_def.h,206 :: 		Box34.Gradient_Start_Color = 0x001F;
ORI	R2, R0, 31
SH	R2, Offset(_Box34+24)(GP)
;page_def.h,207 :: 		Box34.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box34+26)(GP)
;page_def.h,208 :: 		Box34.Color           = 0x001F;
ORI	R2, R0, 31
SH	R2, Offset(_Box34+28)(GP)
;page_def.h,209 :: 		Box34.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box34+30)(GP)
;page_def.h,210 :: 		Box34.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box34+32)(GP)
;page_def.h,211 :: 		Box34.OnUpPtr         = 0;
SW	R0, Offset(_Box34+36)(GP)
;page_def.h,212 :: 		Box34.OnDownPtr       = 0;
SW	R0, Offset(_Box34+40)(GP)
;page_def.h,213 :: 		Box34.OnClickPtr      = 0;
SW	R0, Offset(_Box34+44)(GP)
;page_def.h,214 :: 		Box34.OnPressPtr      = 0;
SW	R0, Offset(_Box34+48)(GP)
;page_def.h,216 :: 		Box1.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box1+0)(GP)
;page_def.h,217 :: 		Box1.Order           = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box1+4)(GP)
;page_def.h,218 :: 		Box1.Left            = 116;
ORI	R2, R0, 116
SH	R2, Offset(_Box1+6)(GP)
;page_def.h,219 :: 		Box1.Top             = 112;
ORI	R2, R0, 112
SH	R2, Offset(_Box1+8)(GP)
;page_def.h,220 :: 		Box1.Width           = 253;
ORI	R2, R0, 253
SH	R2, Offset(_Box1+10)(GP)
;page_def.h,221 :: 		Box1.Height          = 58;
ORI	R2, R0, 58
SH	R2, Offset(_Box1+12)(GP)
;page_def.h,222 :: 		Box1.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box1+14)(GP)
;page_def.h,223 :: 		Box1.Pen_Color       = 0x0000;
SH	R0, Offset(_Box1+16)(GP)
;page_def.h,224 :: 		Box1.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box1+18)(GP)
;page_def.h,225 :: 		Box1.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box1+19)(GP)
;page_def.h,226 :: 		Box1.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box1+20)(GP)
;page_def.h,227 :: 		Box1.Gradient        = 0;
SB	R0, Offset(_Box1+21)(GP)
;page_def.h,228 :: 		Box1.Gradient_Orientation = 0;
SB	R0, Offset(_Box1+22)(GP)
;page_def.h,229 :: 		Box1.Gradient_Start_Color = 0x001F;
ORI	R2, R0, 31
SH	R2, Offset(_Box1+24)(GP)
;page_def.h,230 :: 		Box1.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box1+26)(GP)
;page_def.h,231 :: 		Box1.Color           = 0x001F;
ORI	R2, R0, 31
SH	R2, Offset(_Box1+28)(GP)
;page_def.h,232 :: 		Box1.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box1+30)(GP)
;page_def.h,233 :: 		Box1.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box1+32)(GP)
;page_def.h,234 :: 		Box1.OnUpPtr         = 0;
SW	R0, Offset(_Box1+36)(GP)
;page_def.h,235 :: 		Box1.OnDownPtr       = 0;
SW	R0, Offset(_Box1+40)(GP)
;page_def.h,237 :: 		Box1.OnPressPtr      = 0;
SW	R0, Offset(_Box1+48)(GP)
;page_def.h,239 :: 		Box35.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box35+0)(GP)
;page_def.h,240 :: 		Box35.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_Box35+4)(GP)
;page_def.h,241 :: 		Box35.Left            = 204;
ORI	R2, R0, 204
SH	R2, Offset(_Box35+6)(GP)
;page_def.h,242 :: 		Box35.Top             = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Box35+8)(GP)
;page_def.h,243 :: 		Box35.Width           = 188;
ORI	R2, R0, 188
SH	R2, Offset(_Box35+10)(GP)
;page_def.h,244 :: 		Box35.Height          = 88;
ORI	R2, R0, 88
SH	R2, Offset(_Box35+12)(GP)
;page_def.h,245 :: 		Box35.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box35+14)(GP)
;page_def.h,246 :: 		Box35.Pen_Color       = 0x0000;
SH	R0, Offset(_Box35+16)(GP)
;page_def.h,247 :: 		Box35.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box35+18)(GP)
;page_def.h,248 :: 		Box35.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box35+19)(GP)
;page_def.h,249 :: 		Box35.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box35+20)(GP)
;page_def.h,250 :: 		Box35.Gradient        = 0;
SB	R0, Offset(_Box35+21)(GP)
;page_def.h,251 :: 		Box35.Gradient_Orientation = 0;
SB	R0, Offset(_Box35+22)(GP)
;page_def.h,252 :: 		Box35.Gradient_Start_Color = 0x001F;
ORI	R2, R0, 31
SH	R2, Offset(_Box35+24)(GP)
;page_def.h,253 :: 		Box35.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box35+26)(GP)
;page_def.h,254 :: 		Box35.Color           = 0x001F;
ORI	R2, R0, 31
SH	R2, Offset(_Box35+28)(GP)
;page_def.h,255 :: 		Box35.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box35+30)(GP)
;page_def.h,256 :: 		Box35.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box35+32)(GP)
;page_def.h,257 :: 		Box35.OnUpPtr         = 0;
SW	R0, Offset(_Box35+36)(GP)
;page_def.h,258 :: 		Box35.OnDownPtr       = 0;
SW	R0, Offset(_Box35+40)(GP)
;page_def.h,260 :: 		Box35.OnPressPtr      = 0;
SW	R0, Offset(_Box35+48)(GP)
;page_def.h,262 :: 		Box16.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box16+0)(GP)
;page_def.h,263 :: 		Box16.Order           = 3;
ORI	R2, R0, 3
SB	R2, Offset(_Box16+4)(GP)
;page_def.h,264 :: 		Box16.Left            = 132;
ORI	R2, R0, 132
SH	R2, Offset(_Box16+6)(GP)
;page_def.h,265 :: 		Box16.Top             = 284;
ORI	R2, R0, 284
SH	R2, Offset(_Box16+8)(GP)
;page_def.h,266 :: 		Box16.Width           = 213;
ORI	R2, R0, 213
SH	R2, Offset(_Box16+10)(GP)
;page_def.h,267 :: 		Box16.Height          = 74;
ORI	R2, R0, 74
SH	R2, Offset(_Box16+12)(GP)
;page_def.h,268 :: 		Box16.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box16+14)(GP)
;page_def.h,269 :: 		Box16.Pen_Color       = 0x0000;
SH	R0, Offset(_Box16+16)(GP)
;page_def.h,270 :: 		Box16.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box16+18)(GP)
;page_def.h,271 :: 		Box16.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box16+19)(GP)
;page_def.h,272 :: 		Box16.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box16+20)(GP)
;page_def.h,273 :: 		Box16.Gradient        = 0;
SB	R0, Offset(_Box16+21)(GP)
;page_def.h,274 :: 		Box16.Gradient_Orientation = 0;
SB	R0, Offset(_Box16+22)(GP)
;page_def.h,275 :: 		Box16.Gradient_Start_Color = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box16+24)(GP)
;page_def.h,276 :: 		Box16.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box16+26)(GP)
;page_def.h,277 :: 		Box16.Color           = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box16+28)(GP)
;page_def.h,278 :: 		Box16.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box16+30)(GP)
;page_def.h,279 :: 		Box16.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box16+32)(GP)
;page_def.h,280 :: 		Box16.OnUpPtr         = 0;
SW	R0, Offset(_Box16+36)(GP)
;page_def.h,281 :: 		Box16.OnDownPtr       = 0;
SW	R0, Offset(_Box16+40)(GP)
;page_def.h,282 :: 		Box16.OnClickPtr      = 0;
SW	R0, Offset(_Box16+44)(GP)
;page_def.h,283 :: 		Box16.OnPressPtr      = 0;
SW	R0, Offset(_Box16+48)(GP)
;page_def.h,285 :: 		Box15.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box15+0)(GP)
;page_def.h,286 :: 		Box15.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_Box15+4)(GP)
;page_def.h,287 :: 		Box15.Left            = 368;
ORI	R2, R0, 368
SH	R2, Offset(_Box15+6)(GP)
;page_def.h,288 :: 		Box15.Top             = 361;
ORI	R2, R0, 361
SH	R2, Offset(_Box15+8)(GP)
;page_def.h,289 :: 		Box15.Width           = 376;
ORI	R2, R0, 376
SH	R2, Offset(_Box15+10)(GP)
;page_def.h,290 :: 		Box15.Height          = 73;
ORI	R2, R0, 73
SH	R2, Offset(_Box15+12)(GP)
;page_def.h,291 :: 		Box15.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box15+14)(GP)
;page_def.h,292 :: 		Box15.Pen_Color       = 0x0000;
SH	R0, Offset(_Box15+16)(GP)
;page_def.h,293 :: 		Box15.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box15+18)(GP)
;page_def.h,294 :: 		Box15.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box15+19)(GP)
;page_def.h,295 :: 		Box15.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box15+20)(GP)
;page_def.h,296 :: 		Box15.Gradient        = 0;
SB	R0, Offset(_Box15+21)(GP)
;page_def.h,297 :: 		Box15.Gradient_Orientation = 0;
SB	R0, Offset(_Box15+22)(GP)
;page_def.h,298 :: 		Box15.Gradient_Start_Color = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box15+24)(GP)
;page_def.h,299 :: 		Box15.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box15+26)(GP)
;page_def.h,300 :: 		Box15.Color           = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box15+28)(GP)
;page_def.h,301 :: 		Box15.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box15+30)(GP)
;page_def.h,302 :: 		Box15.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box15+32)(GP)
;page_def.h,303 :: 		Box15.OnUpPtr         = 0;
SW	R0, Offset(_Box15+36)(GP)
;page_def.h,304 :: 		Box15.OnDownPtr       = 0;
SW	R0, Offset(_Box15+40)(GP)
;page_def.h,305 :: 		Box15.OnClickPtr      = 0;
SW	R0, Offset(_Box15+44)(GP)
;page_def.h,306 :: 		Box15.OnPressPtr      = 0;
SW	R0, Offset(_Box15+48)(GP)
;page_def.h,308 :: 		Box14.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box14+0)(GP)
;page_def.h,309 :: 		Box14.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_Box14+4)(GP)
;page_def.h,310 :: 		Box14.Left            = 419;
ORI	R2, R0, 419
SH	R2, Offset(_Box14+6)(GP)
;page_def.h,311 :: 		Box14.Top             = 262;
ORI	R2, R0, 262
SH	R2, Offset(_Box14+8)(GP)
;page_def.h,312 :: 		Box14.Width           = 317;
ORI	R2, R0, 317
SH	R2, Offset(_Box14+10)(GP)
;page_def.h,313 :: 		Box14.Height          = 80;
ORI	R2, R0, 80
SH	R2, Offset(_Box14+12)(GP)
;page_def.h,314 :: 		Box14.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box14+14)(GP)
;page_def.h,315 :: 		Box14.Pen_Color       = 0x0000;
SH	R0, Offset(_Box14+16)(GP)
;page_def.h,316 :: 		Box14.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box14+18)(GP)
;page_def.h,317 :: 		Box14.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box14+19)(GP)
;page_def.h,318 :: 		Box14.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box14+20)(GP)
;page_def.h,319 :: 		Box14.Gradient        = 0;
SB	R0, Offset(_Box14+21)(GP)
;page_def.h,320 :: 		Box14.Gradient_Orientation = 0;
SB	R0, Offset(_Box14+22)(GP)
;page_def.h,321 :: 		Box14.Gradient_Start_Color = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box14+24)(GP)
;page_def.h,322 :: 		Box14.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box14+26)(GP)
;page_def.h,323 :: 		Box14.Color           = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box14+28)(GP)
;page_def.h,324 :: 		Box14.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box14+30)(GP)
;page_def.h,325 :: 		Box14.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box14+32)(GP)
;page_def.h,326 :: 		Box14.OnUpPtr         = 0;
SW	R0, Offset(_Box14+36)(GP)
;page_def.h,327 :: 		Box14.OnDownPtr       = 0;
SW	R0, Offset(_Box14+40)(GP)
;page_def.h,328 :: 		Box14.OnClickPtr      = 0;
SW	R0, Offset(_Box14+44)(GP)
;page_def.h,329 :: 		Box14.OnPressPtr      = 0;
SW	R0, Offset(_Box14+48)(GP)
;page_def.h,331 :: 		Box21.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box21+0)(GP)
;page_def.h,332 :: 		Box21.Order           = 6;
ORI	R2, R0, 6
SB	R2, Offset(_Box21+4)(GP)
;page_def.h,333 :: 		Box21.Left            = 795;
ORI	R2, R0, 795
SH	R2, Offset(_Box21+6)(GP)
;page_def.h,334 :: 		Box21.Top             = 139;
ORI	R2, R0, 139
SH	R2, Offset(_Box21+8)(GP)
;page_def.h,335 :: 		Box21.Width           = 195;
ORI	R2, R0, 195
SH	R2, Offset(_Box21+10)(GP)
;page_def.h,336 :: 		Box21.Height          = 87;
ORI	R2, R0, 87
SH	R2, Offset(_Box21+12)(GP)
;page_def.h,337 :: 		Box21.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box21+14)(GP)
;page_def.h,338 :: 		Box21.Pen_Color       = 0x0000;
SH	R0, Offset(_Box21+16)(GP)
;page_def.h,339 :: 		Box21.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box21+18)(GP)
;page_def.h,340 :: 		Box21.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box21+19)(GP)
;page_def.h,341 :: 		Box21.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box21+20)(GP)
;page_def.h,342 :: 		Box21.Gradient        = 0;
SB	R0, Offset(_Box21+21)(GP)
;page_def.h,343 :: 		Box21.Gradient_Orientation = 0;
SB	R0, Offset(_Box21+22)(GP)
;page_def.h,344 :: 		Box21.Gradient_Start_Color = 0x0408;
ORI	R2, R0, 1032
SH	R2, Offset(_Box21+24)(GP)
;page_def.h,345 :: 		Box21.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box21+26)(GP)
;page_def.h,346 :: 		Box21.Color           = 0x0408;
ORI	R2, R0, 1032
SH	R2, Offset(_Box21+28)(GP)
;page_def.h,347 :: 		Box21.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box21+30)(GP)
;page_def.h,348 :: 		Box21.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box21+32)(GP)
;page_def.h,349 :: 		Box21.OnUpPtr         = 0;
SW	R0, Offset(_Box21+36)(GP)
;page_def.h,350 :: 		Box21.OnDownPtr       = 0;
SW	R0, Offset(_Box21+40)(GP)
;page_def.h,351 :: 		Box21.OnClickPtr      = 1;
ORI	R2, R0, 1
SW	R2, Offset(_Box21+44)(GP)
;page_def.h,352 :: 		Box21.OnPressPtr      = 0;
SW	R0, Offset(_Box21+48)(GP)
;page_def.h,354 :: 		Box20.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box20+0)(GP)
;page_def.h,355 :: 		Box20.Order           = 7;
ORI	R2, R0, 7
SB	R2, Offset(_Box20+4)(GP)
;page_def.h,356 :: 		Box20.Left            = 70;
ORI	R2, R0, 70
SH	R2, Offset(_Box20+6)(GP)
;page_def.h,357 :: 		Box20.Top             = 187;
ORI	R2, R0, 187
SH	R2, Offset(_Box20+8)(GP)
;page_def.h,358 :: 		Box20.Width           = 116;
ORI	R2, R0, 116
SH	R2, Offset(_Box20+10)(GP)
;page_def.h,359 :: 		Box20.Height          = 87;
ORI	R2, R0, 87
SH	R2, Offset(_Box20+12)(GP)
;page_def.h,360 :: 		Box20.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box20+14)(GP)
;page_def.h,361 :: 		Box20.Pen_Color       = 0x0000;
SH	R0, Offset(_Box20+16)(GP)
;page_def.h,362 :: 		Box20.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box20+18)(GP)
;page_def.h,363 :: 		Box20.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box20+19)(GP)
;page_def.h,364 :: 		Box20.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box20+20)(GP)
;page_def.h,365 :: 		Box20.Gradient        = 0;
SB	R0, Offset(_Box20+21)(GP)
;page_def.h,366 :: 		Box20.Gradient_Orientation = 0;
SB	R0, Offset(_Box20+22)(GP)
;page_def.h,367 :: 		Box20.Gradient_Start_Color = 0xFC00;
ORI	R2, R0, 64512
SH	R2, Offset(_Box20+24)(GP)
;page_def.h,368 :: 		Box20.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box20+26)(GP)
;page_def.h,369 :: 		Box20.Color           = 0xFC00;
ORI	R2, R0, 64512
SH	R2, Offset(_Box20+28)(GP)
;page_def.h,370 :: 		Box20.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box20+30)(GP)
;page_def.h,371 :: 		Box20.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box20+32)(GP)
;page_def.h,372 :: 		Box20.OnUpPtr         = 0;
SW	R0, Offset(_Box20+36)(GP)
;page_def.h,373 :: 		Box20.OnDownPtr       = 0;
SW	R0, Offset(_Box20+40)(GP)
;page_def.h,374 :: 		Box20.OnClickPtr      = 1;
ORI	R2, R0, 1
SW	R2, Offset(_Box20+44)(GP)
;page_def.h,375 :: 		Box20.OnPressPtr      = 0;
SW	R0, Offset(_Box20+48)(GP)
;page_def.h,377 :: 		Box13.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box13+0)(GP)
;page_def.h,378 :: 		Box13.Order           = 8;
ORI	R2, R0, 8
SB	R2, Offset(_Box13+4)(GP)
;page_def.h,379 :: 		Box13.Left            = 89;
ORI	R2, R0, 89
SH	R2, Offset(_Box13+6)(GP)
;page_def.h,380 :: 		Box13.Top             = 10;
ORI	R2, R0, 10
SH	R2, Offset(_Box13+8)(GP)
;page_def.h,381 :: 		Box13.Width           = 120;
ORI	R2, R0, 120
SH	R2, Offset(_Box13+10)(GP)
;page_def.h,382 :: 		Box13.Height          = 87;
ORI	R2, R0, 87
SH	R2, Offset(_Box13+12)(GP)
;page_def.h,383 :: 		Box13.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box13+14)(GP)
;page_def.h,384 :: 		Box13.Pen_Color       = 0x0000;
SH	R0, Offset(_Box13+16)(GP)
;page_def.h,385 :: 		Box13.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box13+18)(GP)
;page_def.h,386 :: 		Box13.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box13+19)(GP)
;page_def.h,387 :: 		Box13.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box13+20)(GP)
;page_def.h,388 :: 		Box13.Gradient        = 0;
SB	R0, Offset(_Box13+21)(GP)
;page_def.h,389 :: 		Box13.Gradient_Orientation = 0;
SB	R0, Offset(_Box13+22)(GP)
;page_def.h,390 :: 		Box13.Gradient_Start_Color = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box13+24)(GP)
;page_def.h,391 :: 		Box13.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box13+26)(GP)
;page_def.h,392 :: 		Box13.Color           = 0x801F;
ORI	R2, R0, 32799
SH	R2, Offset(_Box13+28)(GP)
;page_def.h,393 :: 		Box13.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box13+30)(GP)
;page_def.h,394 :: 		Box13.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box13+32)(GP)
;page_def.h,395 :: 		Box13.OnUpPtr         = 0;
SW	R0, Offset(_Box13+36)(GP)
;page_def.h,396 :: 		Box13.OnDownPtr       = 0;
SW	R0, Offset(_Box13+40)(GP)
;page_def.h,397 :: 		Box13.OnClickPtr      = 1;
ORI	R2, R0, 1
SW	R2, Offset(_Box13+44)(GP)
;page_def.h,398 :: 		Box13.OnPressPtr      = 0;
SW	R0, Offset(_Box13+48)(GP)
;page_def.h,400 :: 		Box31.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box31+0)(GP)
;page_def.h,401 :: 		Box31.Order           = 9;
ORI	R2, R0, 9
SB	R2, Offset(_Box31+4)(GP)
;page_def.h,402 :: 		Box31.Left            = 450;
ORI	R2, R0, 450
SH	R2, Offset(_Box31+6)(GP)
;page_def.h,403 :: 		Box31.Top             = 166;
ORI	R2, R0, 166
SH	R2, Offset(_Box31+8)(GP)
;page_def.h,404 :: 		Box31.Width           = 286;
ORI	R2, R0, 286
SH	R2, Offset(_Box31+10)(GP)
;page_def.h,405 :: 		Box31.Height          = 82;
ORI	R2, R0, 82
SH	R2, Offset(_Box31+12)(GP)
;page_def.h,406 :: 		Box31.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box31+14)(GP)
;page_def.h,407 :: 		Box31.Pen_Color       = 0x0000;
SH	R0, Offset(_Box31+16)(GP)
;page_def.h,408 :: 		Box31.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box31+18)(GP)
;page_def.h,409 :: 		Box31.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box31+19)(GP)
;page_def.h,410 :: 		Box31.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box31+20)(GP)
;page_def.h,411 :: 		Box31.Gradient        = 0;
SB	R0, Offset(_Box31+21)(GP)
;page_def.h,412 :: 		Box31.Gradient_Orientation = 0;
SB	R0, Offset(_Box31+22)(GP)
;page_def.h,413 :: 		Box31.Gradient_Start_Color = 0x8408;
ORI	R2, R0, 33800
SH	R2, Offset(_Box31+24)(GP)
;page_def.h,414 :: 		Box31.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box31+26)(GP)
;page_def.h,415 :: 		Box31.Color           = 0x8408;
ORI	R2, R0, 33800
SH	R2, Offset(_Box31+28)(GP)
;page_def.h,416 :: 		Box31.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box31+30)(GP)
;page_def.h,417 :: 		Box31.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box31+32)(GP)
;page_def.h,418 :: 		Box31.OnUpPtr         = 0;
SW	R0, Offset(_Box31+36)(GP)
;page_def.h,419 :: 		Box31.OnDownPtr       = 0;
SW	R0, Offset(_Box31+40)(GP)
;page_def.h,420 :: 		Box31.OnClickPtr      = 1;
ORI	R2, R0, 1
SW	R2, Offset(_Box31+44)(GP)
;page_def.h,421 :: 		Box31.OnPressPtr      = 0;
SW	R0, Offset(_Box31+48)(GP)
;page_def.h,423 :: 		Box28.OwnerScreen     = &Screen1;
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box28+0)(GP)
;page_def.h,424 :: 		Box28.Order           = 10;
ORI	R2, R0, 10
SB	R2, Offset(_Box28+4)(GP)
;page_def.h,425 :: 		Box28.Left            = 228;
ORI	R2, R0, 228
SH	R2, Offset(_Box28+6)(GP)
;page_def.h,426 :: 		Box28.Top             = 11;
ORI	R2, R0, 11
SH	R2, Offset(_Box28+8)(GP)
;page_def.h,427 :: 		Box28.Width           = 116;
ORI	R2, R0, 116
SH	R2, Offset(_Box28+10)(GP)
;page_def.h,428 :: 		Box28.Height          = 87;
ORI	R2, R0, 87
SH	R2, Offset(_Box28+12)(GP)
;page_def.h,429 :: 		Box28.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box28+14)(GP)
;page_def.h,430 :: 		Box28.Pen_Color       = 0x0000;
SH	R0, Offset(_Box28+16)(GP)
;page_def.h,431 :: 		Box28.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box28+18)(GP)
;page_def.h,432 :: 		Box28.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box28+19)(GP)
;page_def.h,433 :: 		Box28.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box28+20)(GP)
;page_def.h,434 :: 		Box28.Gradient        = 0;
SB	R0, Offset(_Box28+21)(GP)
;page_def.h,435 :: 		Box28.Gradient_Orientation = 0;
SB	R0, Offset(_Box28+22)(GP)
;page_def.h,436 :: 		Box28.Gradient_Start_Color = 0xF800;
ORI	R2, R0, 63488
SH	R2, Offset(_Box28+24)(GP)
;page_def.h,437 :: 		Box28.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_Box28+26)(GP)
;page_def.h,438 :: 		Box28.Color           = 0xF800;
ORI	R2, R0, 63488
SH	R2, Offset(_Box28+28)(GP)
;page_def.h,439 :: 		Box28.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Box28+30)(GP)
;page_def.h,440 :: 		Box28.Press_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Box28+32)(GP)
;page_def.h,441 :: 		Box28.OnUpPtr         = 0;
SW	R0, Offset(_Box28+36)(GP)
;page_def.h,442 :: 		Box28.OnDownPtr       = 0;
SW	R0, Offset(_Box28+40)(GP)
;page_def.h,443 :: 		Box28.OnClickPtr      = 1;
ORI	R2, R0, 1
SW	R2, Offset(_Box28+44)(GP)
;page_def.h,444 :: 		Box28.OnPressPtr      = 0;
SW	R0, Offset(_Box28+48)(GP)
;page_def.h,445 :: 		}
L_end_InitializeObjects:
JR	RA
NOP	
; end of MyProjectff_InitializeObjects
_DrawBox:
;page_def.h,450 :: 		void DrawBox(int x,TBox *ABox){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;page_def.h,452 :: 		Back_Color= ABox->Color;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R26, 28
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SW	R2, Offset(_Back_Color+0)(GP)
;page_def.h,454 :: 		if(x==0){
SEH	R2, R25
BEQ	R2, R0, L__DrawBox187
NOP	
J	L_DrawBox97
NOP	
L__DrawBox187:
;page_def.h,455 :: 		Draw_rectangle(ABox->Left, ABox->Top,  ABox->Width,  ABox->Height,  ABox->Color,2 );
ADDIU	R2, R26, 28
LHU	R6, 0(R2)
ADDIU	R2, R26, 12
LHU	R5, 0(R2)
ADDIU	R2, R26, 10
LHU	R4, 0(R2)
ADDIU	R2, R26, 8
LHU	R3, 0(R2)
ADDIU	R2, R26, 6
LHU	R2, 0(R2)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
ORI	R2, R0, 2
ADDIU	SP, SP, -8
SH	R2, 4(SP)
ANDI	R2, R6, 65535
SW	R2, 0(SP)
JAL	_Draw_rectangle+0
NOP	
ADDIU	SP, SP, 8
;page_def.h,456 :: 		}
J	L_DrawBox98
NOP	
L_DrawBox97:
;page_def.h,458 :: 		TFT_Rectangle(ABox->Left, ABox->Top,  ABox->Width,  ABox->Height,  ABox->Color );
ADDIU	R2, R26, 28
LHU	R6, 0(R2)
ADDIU	R2, R26, 12
LHU	R5, 0(R2)
ADDIU	R2, R26, 10
LHU	R4, 0(R2)
ADDIU	R2, R26, 8
LHU	R3, 0(R2)
ADDIU	R2, R26, 6
LHU	R2, 0(R2)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
ANDI	R2, R6, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_TFT_Rectangle+0
NOP	
ADDIU	SP, SP, 4
;page_def.h,459 :: 		}
L_DrawBox98:
;page_def.h,460 :: 		}
L_end_DrawBox:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawBox
_DrawLine:
;page_def.h,462 :: 		void DrawLine(TLine *ALine  ){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;page_def.h,467 :: 		Draw_Line(ALine->First_Point_X, ALine->First_Point_Y,  ALine->Second_Point_X,  ALine->Second_Point_Y,  ALine->Color );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 16
LW	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R4, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
ADDIU	SP, SP, -4
SW	R6, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 4
;page_def.h,469 :: 		}
L_end_DrawLine:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawLine
_DrawCircle:
;page_def.h,471 :: 		void DrawCircle(int fill , TCircle *ACircle){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;page_def.h,476 :: 		Draw_Circle((ACircle->Left), (ACircle->Top)+12,  ACircle->Radius,  fill,  ACircle->Color );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R26, 26
LHU	R5, 0(R2)
ADDIU	R2, R26, 10
LHU	R4, 0(R2)
ADDIU	R2, R26, 8
LHU	R2, 0(R2)
ADDIU	R3, R2, 12
ADDIU	R2, R26, 6
LHU	R2, 0(R2)
SEH	R28, R25
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
ADDIU	SP, SP, -4
SH	R5, 0(SP)
JAL	_Draw_Circle+0
NOP	
ADDIU	SP, SP, 4
;page_def.h,479 :: 		}
L_end_DrawCircle:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawCircle
_DrawLabel:
;page_def.h,481 :: 		void DrawLabel(TLabel *ALabel) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;page_def.h,484 :: 		Back_Color=White;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R2, R0, 65535
SW	R2, Offset(_Back_Color+0)(GP)
;page_def.h,486 :: 		TFT_Set_Font(tahoma_24pt_Font, tahoma_24pt_FontDescriptors,ALabel-> Font_Color);
ADDIU	R2, R25, 24
LHU	R4, 0(R2)
LUI	R3, hi_addr(_tahoma_24pt_FontDescriptors+0)
ORI	R3, R3, lo_addr(_tahoma_24pt_FontDescriptors+0)
LUI	R2, hi_addr(_tahoma_24pt_Font+0)
ORI	R2, R2, lo_addr(_tahoma_24pt_Font+0)
SW	R25, 16(SP)
ANDI	R27, R4, 65535
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
;page_def.h,487 :: 		Display_String(ALabel->Caption, ALabel->Left,ALabel->Top );
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 16
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_Display_String+0
NOP	
;page_def.h,491 :: 		}
L_end_DrawLabel:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawLabel
_DrawImage:
;page_def.h,494 :: 		void DrawImage(TImage *AImage){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;page_def.h,496 :: 		img_load_raw_image_mem(AImage->Left, AImage->Top, AImage->Width, AImage->Height, AImage->Picture_Name);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 16
LW	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R4, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
ADDIU	SP, SP, -4
SW	R6, 0(SP)
JAL	_img_load_raw_image_mem+0
NOP	
ADDIU	SP, SP, 4
;page_def.h,502 :: 		}
L_end_DrawImage:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawImage
_display_page:
;page_def.h,505 :: 		void display_page(TScreen *Screen){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;page_def.h,506 :: 		int iii=0;
SW	R26, 4(SP)
;page_def.h,507 :: 		TFT_FULL_ON(Screen->Color);
SW	R25, 8(SP)
LHU	R25, 0(R25)
JAL	_TFT_FULL_ON+0
NOP	
LW	R25, 8(SP)
;page_def.h,512 :: 		while(Screen->BoxesCount != 0){
L_display_page99:
ADDIU	R2, R25, 32
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
BNE	R2, R0, L__display_page194
NOP	
J	L_display_page100
NOP	
L__display_page194:
;page_def.h,513 :: 		DrawBox(1 , *Screen->Boxes );
ADDIU	R2, R25, 36
LW	R2, 0(R2)
SW	R25, 8(SP)
LW	R26, 0(R2)
ORI	R25, R0, 1
JAL	_DrawBox+0
NOP	
LW	R25, 8(SP)
;page_def.h,514 :: 		*Screen->Boxes++;
ADDIU	R3, R25, 36
LW	R2, 0(R3)
ADDIU	R2, R2, 4
SW	R2, 0(R3)
;page_def.h,515 :: 		Screen->BoxesCount--;
ADDIU	R3, R25, 32
LHU	R2, 0(R3)
ADDIU	R2, R2, -1
SH	R2, 0(R3)
;page_def.h,516 :: 		}
J	L_display_page99
NOP	
L_display_page100:
;page_def.h,536 :: 		}
L_end_display_page:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _display_page
_rotary_b_click:
;page_def.h,537 :: 		void rotary_b_click(unsigned char count_rotary ){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;page_def.h,541 :: 		if(count_rotary==1){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__rotary_b_click196
NOP	
J	L_rotary_b_click101
NOP	
L__rotary_b_click196:
;page_def.h,542 :: 		TFT_Rectangle(Screen1_Boxes[1]->Left,Screen1_Boxes[1]->Top,  Screen1_Boxes[1]->Width,  Screen1_Boxes[1]->Height, White );
SB	R25, 20(SP)
LHU	R28, Offset(_Box1+12)(GP)
LHU	R27, Offset(_Box1+10)(GP)
LHU	R26, Offset(_Box1+8)(GP)
LHU	R25, Offset(_Box1+6)(GP)
ORI	R2, R0, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_TFT_Rectangle+0
NOP	
ADDIU	SP, SP, 4
LBU	R25, 20(SP)
;page_def.h,543 :: 		}
L_rotary_b_click101:
;page_def.h,545 :: 		if(count_rotary==2){
ANDI	R3, R25, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__rotary_b_click197
NOP	
J	L_rotary_b_click102
NOP	
L__rotary_b_click197:
;page_def.h,546 :: 		TFT_Rectangle(Screen1_Boxes[1]->Left,Screen1_Boxes[1]->Top,  Screen1_Boxes[1]->Width,  Screen1_Boxes[1]->Height, Blue );
LHU	R28, Offset(_Box1+12)(GP)
LHU	R27, Offset(_Box1+10)(GP)
LHU	R26, Offset(_Box1+8)(GP)
LHU	R25, Offset(_Box1+6)(GP)
ORI	R2, R0, 31
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_TFT_Rectangle+0
NOP	
ADDIU	SP, SP, 4
;page_def.h,547 :: 		TFT_Rectangle(Screen1_Boxes[2]->Left,Screen1_Boxes[2]->Top,  Screen1_Boxes[2]->Width,  Screen1_Boxes[2]->Height, White );
LHU	R28, Offset(_Box35+12)(GP)
LHU	R27, Offset(_Box35+10)(GP)
LHU	R26, Offset(_Box35+8)(GP)
LHU	R25, Offset(_Box35+6)(GP)
ORI	R2, R0, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_TFT_Rectangle+0
NOP	
ADDIU	SP, SP, 4
;page_def.h,548 :: 		count_rotary=0;}
MOVZ	R25, R0, R0
L_rotary_b_click102:
;page_def.h,561 :: 		}
L_end_rotary_b_click:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _rotary_b_click
_main:
;MyProjectff.c,8 :: 		void main() {
;MyProjectff.c,9 :: 		inti_ports_pIC32_HAL();
JAL	_inti_ports_pIC32_HAL+0
NOP	
;MyProjectff.c,10 :: 		TFT_Intialize_16bit();
JAL	_TFT_Intialize_16bit+0
NOP	
;MyProjectff.c,11 :: 		InitializeObjects();
JAL	MyProjectff_InitializeObjects+0
NOP	
;MyProjectff.c,12 :: 		Set_BackLight(0xFF);
ORI	R25, R0, 255
JAL	_Set_BackLight+0
NOP	
;MyProjectff.c,13 :: 		Back_Color=0xffff;
ORI	R2, R0, 65535
SW	R2, Offset(_Back_Color+0)(GP)
;MyProjectff.c,14 :: 		img_load_raw_image_mem(316,152 ,137 ,77 , gImage_MEGEG);
LUI	R2, hi_addr(_gImage_MEGEG+0)
ORI	R2, R2, lo_addr(_gImage_MEGEG+0)
ORI	R28, R0, 77
ORI	R27, R0, 137
ORI	R26, R0, 152
ORI	R25, R0, 316
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_img_load_raw_image_mem+0
NOP	
ADDIU	SP, SP, 4
;MyProjectff.c,15 :: 		delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main103:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main103
NOP	
;MyProjectff.c,16 :: 		display_page(&Screen1);
LUI	R25, hi_addr(_Screen1+0)
ORI	R25, R25, lo_addr(_Screen1+0)
JAL	_display_page+0
NOP	
;MyProjectff.c,18 :: 		while(1){
L_main105:
;MyProjectff.c,19 :: 		rotary_b_click(count_rotary);
LBU	R25, Offset(_count_rotary+0)(GP)
JAL	_rotary_b_click+0
NOP	
;MyProjectff.c,21 :: 		}
J	L_main105
NOP	
;MyProjectff.c,27 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
