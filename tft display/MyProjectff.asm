_TFT_Set_Index:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
JAL	_Delay_1us+0
NOP	
JAL	_Delay_1us+0
NOP	
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
LUI	R2, BitMask(LATC13_bit+0)
ORI	R2, R2, BitMask(LATC13_bit+0)
_SX	
LHU	R2, 4(SP)
SH	R2, Offset(LATB+0)(GP)
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
L_end_TFT_Set_Index:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Set_Index
_TFT_Write_Command:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
LUI	R2, BitMask(LATC13_bit+0)
ORI	R2, R2, BitMask(LATC13_bit+0)
_SX	
LHU	R2, 4(SP)
SH	R2, Offset(LATB+0)(GP)
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
LUI	R2, BitMask(LATC14_bit+0)
ORI	R2, R2, BitMask(LATC14_bit+0)
_SX	
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
JAL	_Delay_1us+0
NOP	
L_end_TFT_Write_Command:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Write_Command
_RGB565_converter:
LBU	R2, 0(SP)
ADDIU	R3, R2, 4
ORI	R2, R0, 31
MUL	R3, R2, R3
ORI	R2, R0, 255
DIV	R3, R2
MFLO	R2
SEH	R2, R2
SLL	R4, R2, 11
LBU	R2, 1(SP)
ADDIU	R3, R2, 2
ORI	R2, R0, 63
MUL	R3, R2, R3
ORI	R2, R0, 255
DIV	R3, R2
MFLO	R2
SEH	R2, R2
SLL	R2, R2, 5
OR	R4, R4, R2
LBU	R2, 2(SP)
ADDIU	R3, R2, 4
ORI	R2, R0, 31
MUL	R3, R2, R3
ORI	R2, R0, 255
DIV	R3, R2
MFLO	R2
OR	R2, R4, R2
L_end_RGB565_converter:
JR	RA
NOP	
; end of _RGB565_converter
_TFT_Write_Data:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LHU	R2, 4(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
L_end_TFT_Write_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Write_Data
_TFT_Intialize_16bit:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
LUI	R24, 2
ORI	R24, R24, 2260
L_TFT_Intialize_16bit0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TFT_Intialize_16bit0
NOP	
NOP	
NOP	
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LUI	R24, 0
ORI	R24, R24, 26666
L_TFT_Intialize_16bit2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TFT_Intialize_16bit2
NOP	
ORI	R2, R0, 10
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 28
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 226
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 60
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 5
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 84
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 224
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
JAL	_Delay_50us+0
NOP	
JAL	_Delay_50us+0
NOP	
ORI	R2, R0, 224
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 3
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 176
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 96
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 3
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 31
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 223
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 3
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 240
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 3
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 230
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 4
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 112
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 169
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 180
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 32
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 175
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 163
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 7
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 182
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 239
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 4
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 54
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 42
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 3
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 31
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 43
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 223
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 58
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 80
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 41
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LUI	R2, BitMask(LATE2_bit+0)
ORI	R2, R2, BitMask(LATE2_bit+0)
_SX	
L_end_TFT_Intialize_16bit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TFT_Intialize_16bit
_Set_BackLight:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 190
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 6
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LBU	R2, 4(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 1
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 240
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ADDIU	SP, SP, -4
SH	R0, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
L_end_Set_BackLight:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Set_BackLight
_WindowSet:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 42
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 4(SP)
SRL	R2, R2, 8
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 4(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 6(SP)
SRL	R2, R2, 8
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 6(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 43
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 8(SP)
SRL	R2, R2, 8
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 8(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 10(SP)
SRL	R2, R2, 8
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 10(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Command+0
NOP	
ADDIU	SP, SP, 4
L_end_WindowSet:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _WindowSet
_TFT_FULL_ON:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
ORI	R2, R0, 479
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R0, 4(SP)
ORI	R2, R0, 799
SH	R2, 2(SP)
SH	R0, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
SH	R0, 4(SP)
L_TFT_FULL_ON4:
LHU	R2, 4(SP)
SLTIU	R2, R2, 480
BNE	R2, R0, L__TFT_FULL_ON113
NOP	
J	L_TFT_FULL_ON5
NOP	
L__TFT_FULL_ON113:
SH	R0, 6(SP)
L_TFT_FULL_ON7:
LHU	R2, 6(SP)
SLTIU	R2, R2, 800
BNE	R2, R0, L__TFT_FULL_ON114
NOP	
J	L_TFT_FULL_ON8
NOP	
L__TFT_FULL_ON114:
LW	R2, 8(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 6(SP)
ADDIU	R2, R2, 1
SH	R2, 6(SP)
J	L_TFT_FULL_ON7
NOP	
L_TFT_FULL_ON8:
LHU	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
J	L_TFT_FULL_ON4
NOP	
L_TFT_FULL_ON5:
L_end_TFT_FULL_ON:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TFT_FULL_ON
_TFT_Rectangle:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
LHU	R3, 14(SP)
LHU	R2, 10(SP)
ADDU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LHU	R2, 18(SP)
SH	R2, 4(SP)
LHU	R3, 20(SP)
LHU	R2, 16(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
LHU	R2, 16(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
SH	R0, 4(SP)
L_TFT_Rectangle10:
LHU	R3, 14(SP)
LHU	R2, 4(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__TFT_Rectangle116
NOP	
J	L_TFT_Rectangle11
NOP	
L__TFT_Rectangle116:
SH	R0, 6(SP)
L_TFT_Rectangle13:
LHU	R3, 12(SP)
LHU	R2, 6(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__TFT_Rectangle117
NOP	
J	L_TFT_Rectangle14
NOP	
L__TFT_Rectangle117:
LW	R2, 16(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 6(SP)
ADDIU	R2, R2, 1
SH	R2, 6(SP)
J	L_TFT_Rectangle13
NOP	
L_TFT_Rectangle14:
LHU	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
J	L_TFT_Rectangle10
NOP	
L_TFT_Rectangle11:
L_end_TFT_Rectangle:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TFT_Rectangle
_TFT_Set_Font:
LW	R2, 0(SP)
SW	R2, Offset(_Font_Pointer+0)(GP)
LW	R2, 4(SP)
SW	R2, Offset(_Font_Description_Pointer+0)(GP)
LW	R2, 8(SP)
SW	R2, Offset(_Font_Color+0)(GP)
L_end_TFT_Set_Font:
JR	RA
NOP	
; end of _TFT_Set_Font
_Display_number:
ADDIU	SP, SP, -24
SW	RA, 0(SP)
LBU	R2, 24(SP)
ADDIU	R3, R2, -46
SH	R3, 10(SP)
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
LHU	R2, 0(R2)
SH	R2, 16(SP)
ANDI	R2, R3, 65535
BEQ	R2, R0, L__Display_number120
NOP	
J	L_Display_number16
NOP	
L__Display_number120:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
SH	R2, 14(SP)
J	L_Display_number17
NOP	
L_Display_number16:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SH	R2, 14(SP)
L_Display_number17:
LHU	R2, 10(SP)
SLL	R2, R2, 1
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 12(SP)
LHU	R2, 14(SP)
SRL	R2, R2, 3
ADDIU	R2, R2, 1
SH	R2, 18(SP)
LHU	R3, 16(SP)
LHU	R2, 28(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, -1
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LHU	R2, 36(SP)
SH	R2, 4(SP)
LHU	R3, 22(SP)
LHU	R2, 34(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, -1
SH	R2, 2(SP)
LHU	R2, 34(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
SB	R0, 4(SP)
L_Display_number18:
LHU	R3, 16(SP)
LBU	R2, 4(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Display_number121
NOP	
J	L_Display_number19
NOP	
L__Display_number121:
SB	R0, 5(SP)
L_Display_number21:
LHU	R3, 18(SP)
LBU	R2, 5(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Display_number122
NOP	
J	L_Display_number22
NOP	
L__Display_number122:
LBU	R3, 5(SP)
LHU	R2, 12(SP)
ADDU	R2, R2, R3
ANDI	R3, R2, 65535
LW	R2, Offset(_Font_Pointer+0)(GP)
ADDU	R4, R2, R3
LHU	R3, 18(SP)
LBU	R2, 4(SP)
MULTU	R2, R3
MFLO	R2
ANDI	R2, R2, 65535
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, 20(SP)
ORI	R2, R0, 128
SB	R2, 8(SP)
LHU	R2, 18(SP)
ADDIU	R3, R2, -1
LBU	R2, 5(SP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Display_number123
NOP	
J	L_Display_number24
NOP	
L__Display_number123:
ORI	R2, R0, 8
SB	R2, 7(SP)
J	L_Display_number25
NOP	
L_Display_number24:
LHU	R2, 18(SP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
SLL	R3, R2, 3
LHU	R2, 14(SP)
SUBU	R2, R2, R3
SB	R2, 7(SP)
L_Display_number25:
ORI	R2, R0, 1
SB	R2, 6(SP)
L_Display_number26:
LBU	R3, 7(SP)
LBU	R2, 6(SP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__Display_number124
NOP	
J	L_Display_number27
NOP	
L__Display_number124:
LBU	R3, 8(SP)
LHU	R2, 20(SP)
AND	R3, R2, R3
LBU	R2, 8(SP)
SRL	R2, R2, 1
SB	R2, 8(SP)
ANDI	R2, R3, 255
BEQ	R2, R0, L__Display_number125
NOP	
J	L_Display_number29
NOP	
L__Display_number125:
LW	R2, Offset(_Back_Color+0)(GP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
J	L_Display_number30
NOP	
L_Display_number29:
LW	R2, Offset(_Font_Color+0)(GP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
L_Display_number30:
LBU	R2, 6(SP)
ADDIU	R2, R2, 1
SB	R2, 6(SP)
J	L_Display_number26
NOP	
L_Display_number27:
LBU	R2, 5(SP)
ADDIU	R2, R2, 1
SB	R2, 5(SP)
J	L_Display_number21
NOP	
L_Display_number22:
LBU	R2, 4(SP)
ADDIU	R2, R2, 1
SB	R2, 4(SP)
J	L_Display_number18
NOP	
L_Display_number19:
L_end_Display_number:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Display_number
_Display_numbers:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
LW	R2, 12(SP)
SW	R2, 4(SP)
L_Display_numbers31:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L__Display_numbers128
NOP	
J	L_Display_numbers33
NOP	
L__Display_numbers128:
LHU	R2, 18(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
LHU	R2, 24(SP)
SH	R2, 2(SP)
LW	R2, 12(SP)
LBU	R2, 0(R2)
SB	R2, 0(SP)
JAL	_Display_number+0
NOP	
ADDIU	SP, SP, 8
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -46
SEH	R2, R2
BEQ	R2, R0, L__Display_numbers129
NOP	
J	L_Display_numbers34
NOP	
L__Display_numbers129:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
SH	R2, 8(SP)
J	L_Display_numbers35
NOP	
L_Display_numbers34:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SH	R2, 8(SP)
L_Display_numbers35:
LH	R3, 8(SP)
LHU	R2, 16(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SH	R2, 16(SP)
L_Display_numbers33:
LW	R2, 4(SP)
ADDIU	R2, R2, 1
SW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Display_numbers130
NOP	
J	L_Display_numbers36
NOP	
L__Display_numbers130:
J	L_Display_numbers32
NOP	
L_Display_numbers36:
J	L_Display_numbers31
NOP	
L_Display_numbers32:
L_end_Display_numbers:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Display_numbers
_Display_char:
ADDIU	SP, SP, -24
SW	RA, 0(SP)
LBU	R2, 24(SP)
SLTIU	R2, R2, 92
BNE	R2, R0, L__Display_char132
NOP	
J	L_Display_char37
NOP	
L__Display_char132:
LBU	R2, 24(SP)
ADDIU	R2, R2, -33
SH	R2, 10(SP)
J	L_Display_char38
NOP	
L_Display_char37:
LBU	R2, 24(SP)
ADDIU	R2, R2, -34
SH	R2, 10(SP)
L_Display_char38:
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
LHU	R5, 0(R2)
SH	R5, 16(SP)
LHU	R2, 10(SP)
SLL	R2, R2, 1
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R4, R2, R3
ADDIU	R2, R4, 2
LHU	R3, 0(R2)
SH	R3, 14(SP)
ADDIU	R2, R4, 4
LHU	R2, 0(R2)
SH	R2, 12(SP)
ANDI	R2, R3, 65535
SRL	R2, R2, 3
ADDIU	R2, R2, 1
SH	R2, 18(SP)
LHU	R2, 28(SP)
ADDU	R2, R2, R5
ADDIU	R2, R2, -1
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LHU	R2, 36(SP)
SH	R2, 4(SP)
LHU	R2, 34(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, -1
SH	R2, 2(SP)
LHU	R2, 34(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
SB	R0, 4(SP)
L_Display_char39:
LHU	R3, 16(SP)
LBU	R2, 4(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Display_char133
NOP	
J	L_Display_char40
NOP	
L__Display_char133:
SB	R0, 5(SP)
L_Display_char42:
LHU	R3, 18(SP)
LBU	R2, 5(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Display_char134
NOP	
J	L_Display_char43
NOP	
L__Display_char134:
LBU	R3, 5(SP)
LHU	R2, 12(SP)
ADDU	R2, R2, R3
ANDI	R3, R2, 65535
LW	R2, Offset(_Font_Pointer+0)(GP)
ADDU	R4, R2, R3
LHU	R3, 18(SP)
LBU	R2, 4(SP)
MULTU	R2, R3
MFLO	R2
ANDI	R2, R2, 65535
ADDU	R2, R4, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, 20(SP)
ORI	R2, R0, 128
SB	R2, 8(SP)
LHU	R2, 18(SP)
ADDIU	R3, R2, -1
LBU	R2, 5(SP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1
BEQ	R2, R0, L__Display_char135
NOP	
J	L_Display_char45
NOP	
L__Display_char135:
ORI	R2, R0, 8
SB	R2, 7(SP)
J	L_Display_char46
NOP	
L_Display_char45:
LHU	R2, 18(SP)
ADDIU	R2, R2, -1
ANDI	R2, R2, 255
SLL	R3, R2, 3
LHU	R2, 14(SP)
SUBU	R2, R2, R3
SB	R2, 7(SP)
L_Display_char46:
ORI	R2, R0, 1
SB	R2, 6(SP)
L_Display_char47:
LBU	R3, 7(SP)
LBU	R2, 6(SP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__Display_char136
NOP	
J	L_Display_char48
NOP	
L__Display_char136:
LBU	R3, 8(SP)
LHU	R2, 20(SP)
AND	R3, R2, R3
LBU	R2, 8(SP)
SRL	R2, R2, 1
SB	R2, 8(SP)
ANDI	R2, R3, 255
BEQ	R2, R0, L__Display_char137
NOP	
J	L_Display_char50
NOP	
L__Display_char137:
LW	R2, Offset(_Back_Color+0)(GP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
J	L_Display_char51
NOP	
L_Display_char50:
LW	R2, Offset(_Font_Color+0)(GP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
L_Display_char51:
LBU	R2, 6(SP)
ADDIU	R2, R2, 1
SB	R2, 6(SP)
J	L_Display_char47
NOP	
L_Display_char48:
LBU	R2, 5(SP)
ADDIU	R2, R2, 1
SB	R2, 5(SP)
J	L_Display_char42
NOP	
L_Display_char43:
LBU	R2, 4(SP)
ADDIU	R2, R2, 1
SB	R2, 4(SP)
J	L_Display_char39
NOP	
L_Display_char40:
L_end_Display_char:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Display_char
_Display_String:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
LW	R2, 12(SP)
SW	R2, 4(SP)
L_Display_String52:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L__Display_String140
NOP	
J	L_Display_String54
NOP	
L__Display_String140:
LHU	R2, 18(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
LHU	R2, 24(SP)
SH	R2, 2(SP)
LW	R2, 12(SP)
LBU	R2, 0(R2)
SB	R2, 0(SP)
JAL	_Display_char+0
NOP	
ADDIU	SP, SP, 8
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 92
BNE	R2, R0, L__Display_String141
NOP	
J	L_Display_String55
NOP	
L__Display_String141:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -33
SH	R2, 8(SP)
J	L_Display_String56
NOP	
L_Display_String55:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -34
SH	R2, 8(SP)
L_Display_String56:
LH	R2, 8(SP)
SLL	R2, R2, 1
ADDIU	R2, R2, 1
SH	R2, 8(SP)
SEH	R2, R2
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R2, R2, R3
LHU	R3, 0(R2)
LHU	R2, 16(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R2, 16(SP)
L_Display_String54:
LW	R2, 4(SP)
ADDIU	R2, R2, 1
SW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Display_String142
NOP	
J	L_Display_String57
NOP	
L__Display_String142:
J	L_Display_String53
NOP	
L_Display_String57:
J	L_Display_String52
NOP	
L_Display_String53:
L_end_Display_String:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Display_String
_Display1_String:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
LW	R2, 12(SP)
SW	R2, 4(SP)
L_Display1_String58:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BNE	R3, R2, L__Display1_String145
NOP	
J	L_Display1_String60
NOP	
L__Display1_String145:
LHU	R2, 18(SP)
ADDIU	SP, SP, -8
SH	R2, 4(SP)
LHU	R2, 24(SP)
SH	R2, 2(SP)
LW	R2, 12(SP)
LBU	R2, 0(R2)
SB	R2, 0(SP)
JAL	_Display_char+0
NOP	
ADDIU	SP, SP, 8
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 92
BNE	R2, R0, L__Display1_String146
NOP	
J	L_Display1_String61
NOP	
L__Display1_String146:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -33
SH	R2, 8(SP)
J	L_Display1_String62
NOP	
L_Display1_String61:
LW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDIU	R2, R2, -34
SH	R2, 8(SP)
L_Display1_String62:
LH	R2, 8(SP)
SLL	R2, R2, 1
ADDIU	R2, R2, 1
SH	R2, 8(SP)
SEH	R2, R2
SLL	R3, R2, 1
LW	R2, Offset(_Font_Description_Pointer+0)(GP)
ADDU	R2, R2, R3
LHU	R3, 0(R2)
LHU	R2, 16(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 3
SH	R2, 16(SP)
L_Display1_String60:
LW	R2, 4(SP)
ADDIU	R2, R2, 1
SW	R2, 4(SP)
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Display1_String147
NOP	
J	L_Display1_String63
NOP	
L__Display1_String147:
J	L_Display1_String59
NOP	
L_Display1_String63:
J	L_Display1_String58
NOP	
L_Display1_String59:
L_end_Display1_String:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Display1_String
_Draw_Line:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
ADDIU	R23, SP, 4
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICSDraw_Line_dx_L0+0)
ORI	R24, R24, lo_addr(?ICSDraw_Line_dx_L0+0)
JAL	___CC2DW+0
NOP	
LH	R3, 18(SP)
LH	R2, 22(SP)
SUBU	R4, R2, R3
SH	R4, 6(SP)
LH	R3, 16(SP)
LH	R2, 20(SP)
SUBU	R2, R2, R3
SH	R2, 4(SP)
SEH	R2, R4
SLTI	R2, R2, 0
BNE	R2, R0, L__Draw_Line149
NOP	
J	L_Draw_Line64
NOP	
L__Draw_Line149:
LH	R3, 6(SP)
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SH	R2, 6(SP)
ORI	R2, R0, 65535
SH	R2, 10(SP)
J	L_Draw_Line65
NOP	
L_Draw_Line64:
ORI	R2, R0, 1
SH	R2, 10(SP)
L_Draw_Line65:
LH	R2, 4(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Draw_Line150
NOP	
J	L_Draw_Line66
NOP	
L__Draw_Line150:
LH	R3, 4(SP)
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SH	R2, 4(SP)
ORI	R2, R0, 65535
SH	R2, 8(SP)
J	L_Draw_Line67
NOP	
L_Draw_Line66:
ORI	R2, R0, 1
SH	R2, 8(SP)
L_Draw_Line67:
LH	R2, 4(SP)
SLL	R2, R2, 1
SH	R2, 4(SP)
LH	R2, 6(SP)
SLL	R2, R2, 1
SH	R2, 6(SP)
LH	R2, 22(SP)
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LH	R2, 26(SP)
SH	R2, 4(SP)
LH	R2, 28(SP)
SH	R2, 2(SP)
LH	R2, 24(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LW	R2, 24(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 6(SP)
LH	R2, 4(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__Draw_Line151
NOP	
J	L_Draw_Line68
NOP	
L__Draw_Line151:
LH	R2, 4(SP)
SRA	R3, R2, 1
LH	R2, 6(SP)
SUBU	R2, R2, R3
SH	R2, 12(SP)
L_Draw_Line69:
LH	R3, 20(SP)
LH	R2, 16(SP)
BNE	R2, R3, L__Draw_Line153
NOP	
J	L_Draw_Line70
NOP	
L__Draw_Line153:
LH	R2, 12(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Draw_Line154
NOP	
J	L_Draw_Line71
NOP	
L__Draw_Line154:
LH	R3, 10(SP)
LH	R2, 18(SP)
ADDU	R2, R2, R3
SH	R2, 18(SP)
LH	R3, 4(SP)
LH	R2, 12(SP)
SUBU	R2, R2, R3
SH	R2, 12(SP)
L_Draw_Line71:
LH	R3, 8(SP)
LH	R2, 16(SP)
ADDU	R4, R2, R3
SH	R4, 16(SP)
LH	R3, 6(SP)
LH	R2, 12(SP)
ADDU	R2, R2, R3
SH	R2, 12(SP)
LH	R2, 22(SP)
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LH	R2, 26(SP)
SH	R2, 4(SP)
LH	R2, 28(SP)
SH	R2, 2(SP)
SH	R4, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LW	R2, 24(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
J	L_Draw_Line69
NOP	
L_Draw_Line70:
J	L_Draw_Line72
NOP	
L_Draw_Line68:
LH	R2, 6(SP)
SRA	R3, R2, 1
LH	R2, 4(SP)
SUBU	R2, R2, R3
SH	R2, 12(SP)
L_Draw_Line73:
LH	R3, 22(SP)
LH	R2, 18(SP)
BNE	R2, R3, L__Draw_Line156
NOP	
J	L_Draw_Line74
NOP	
L__Draw_Line156:
LH	R2, 12(SP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Draw_Line157
NOP	
J	L_Draw_Line75
NOP	
L__Draw_Line157:
LH	R3, 8(SP)
LH	R2, 16(SP)
ADDU	R2, R2, R3
SH	R2, 16(SP)
LH	R3, 6(SP)
LH	R2, 12(SP)
SUBU	R2, R2, R3
SH	R2, 12(SP)
L_Draw_Line75:
LH	R3, 10(SP)
LH	R2, 18(SP)
ADDU	R4, R2, R3
SH	R4, 18(SP)
LH	R3, 4(SP)
LH	R2, 12(SP)
ADDU	R2, R2, R3
SH	R2, 12(SP)
LH	R2, 22(SP)
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R4, 4(SP)
LH	R2, 28(SP)
SH	R2, 2(SP)
LH	R2, 24(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
LW	R2, 24(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
J	L_Draw_Line73
NOP	
L_Draw_Line74:
L_Draw_Line72:
L_end_Draw_Line:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Draw_Line
_Draw_Circle:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
MOVZ	R30, R0, R0
SH	R30, 4(SP)
MOVZ	R30, R0, R0
SH	R30, 6(SP)
MOVZ	R30, R0, R0
SH	R30, 8(SP)
LH	R2, 16(SP)
SH	R2, 6(SP)
LH	R3, 16(SP)
ORI	R2, R0, 1
SUBU	R2, R2, R3
SH	R2, 8(SP)
L_Draw_Circle76:
J	L_Draw_Circle79
NOP	
L_Draw_Circle81:
LHU	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 18(SP)
LH	R2, 26(SP)
ADDU	R4, R2, R3
SH	R4, 6(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
SH	R4, 2(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
SUBU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
LHU	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 18(SP)
LH	R2, 26(SP)
SUBU	R4, R2, R3
SH	R4, 6(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
SH	R4, 2(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
SUBU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
LHU	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 16(SP)
LH	R2, 26(SP)
ADDU	R4, R2, R3
SH	R4, 6(SP)
LH	R3, 18(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
SH	R4, 2(SP)
LH	R3, 18(SP)
LH	R2, 24(SP)
SUBU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
LHU	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 16(SP)
LH	R2, 26(SP)
SUBU	R4, R2, R3
SH	R4, 6(SP)
LH	R3, 18(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
SH	R4, 2(SP)
LH	R3, 18(SP)
LH	R2, 24(SP)
SUBU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
J	L_Draw_Circle80
NOP	
L_Draw_Circle82:
LH	R3, 6(SP)
LH	R2, 14(SP)
ADDU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 12(SP)
LH	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 4(SP)
LH	R2, 14(SP)
ADDU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 14(SP)
LH	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 6(SP)
LH	R2, 14(SP)
ADDU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 12(SP)
LH	R2, 20(SP)
SUBU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 4(SP)
LH	R2, 14(SP)
ADDU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 14(SP)
LH	R2, 20(SP)
SUBU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 4(SP)
LH	R2, 14(SP)
SUBU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 14(SP)
LH	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 6(SP)
LH	R2, 14(SP)
SUBU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 12(SP)
LH	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 6(SP)
LH	R2, 14(SP)
SUBU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 12(SP)
LH	R2, 20(SP)
SUBU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LH	R3, 4(SP)
LH	R2, 14(SP)
SUBU	R2, R2, R3
ADDIU	SP, SP, -8
SH	R2, 6(SP)
SH	R2, 4(SP)
LH	R3, 14(SP)
LH	R2, 20(SP)
SUBU	R2, R2, R3
SH	R2, 2(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
LHU	R2, 20(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
J	L_Draw_Circle80
NOP	
L_Draw_Circle79:
LBU	R3, 18(SP)
ORI	R2, R0, 1
BNE	R3, R2, L__Draw_Circle160
NOP	
J	L_Draw_Circle81
NOP	
L__Draw_Circle160:
J	L_Draw_Circle82
NOP	
L_Draw_Circle80:
LH	R2, 8(SP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Draw_Circle161
NOP	
J	L_Draw_Circle83
NOP	
L__Draw_Circle161:
LH	R2, 4(SP)
SLL	R2, R2, 1
ADDIU	R3, R2, 3
LH	R2, 8(SP)
ADDU	R2, R2, R3
SH	R2, 8(SP)
LH	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
J	L_Draw_Circle84
NOP	
L_Draw_Circle83:
LH	R3, 6(SP)
LH	R2, 4(SP)
SUBU	R2, R2, R3
SEH	R2, R2
SLL	R2, R2, 1
ADDIU	R3, R2, 5
LH	R2, 8(SP)
ADDU	R2, R2, R3
SH	R2, 8(SP)
LH	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
LH	R2, 6(SP)
ADDIU	R2, R2, -1
SH	R2, 6(SP)
L_Draw_Circle84:
LH	R3, 6(SP)
LH	R2, 4(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__Draw_Circle162
NOP	
J	L_Draw_Circle76
NOP	
L__Draw_Circle162:
L_end_Draw_Circle:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Draw_Circle
_Draw_Line_H:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R2, 20(SP)
SH	R2, 6(SP)
LH	R2, 18(SP)
SH	R2, 4(SP)
LH	R2, 20(SP)
SH	R2, 2(SP)
LH	R2, 16(SP)
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
L_end_Draw_Line_H:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Draw_Line_H
_Draw_Line_V:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R2, 20(SP)
SH	R2, 6(SP)
LH	R2, 16(SP)
SH	R2, 4(SP)
LH	R2, 18(SP)
SH	R2, 2(SP)
LH	R2, 16(SP)
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
L_end_Draw_Line_V:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Draw_Line_V
_Draw_rectangle:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
LH	R3, 16(SP)
LH	R2, 12(SP)
ADDU	R2, R2, R3
SH	R2, 6(SP)
LH	R3, 18(SP)
LH	R2, 14(SP)
ADDU	R2, R2, R3
SH	R2, 8(SP)
SH	R0, 4(SP)
L_Draw_rectangle85:
LHU	R3, 24(SP)
LH	R2, 4(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Draw_rectangle166
NOP	
J	L_Draw_rectangle86
NOP	
L__Draw_rectangle166:
LW	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 16(SP)
LHU	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
LH	R3, 16(SP)
LH	R2, 26(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line_V+0
NOP	
ADDIU	SP, SP, 12
LW	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 16(SP)
LHU	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
LH	R3, 16(SP)
LH	R2, 26(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
LH	R3, 16(SP)
LHU	R2, 18(SP)
ADDU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line_V+0
NOP	
ADDIU	SP, SP, 12
LW	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 16(SP)
LH	R2, 26(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
LH	R3, 16(SP)
LHU	R2, 18(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line_H+0
NOP	
ADDIU	SP, SP, 12
LW	R2, 20(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LH	R3, 16(SP)
LHU	R2, 20(SP)
ADDU	R2, R2, R3
SH	R2, 4(SP)
LH	R3, 16(SP)
LHU	R2, 18(SP)
ADDU	R2, R2, R3
SH	R2, 2(SP)
LH	R3, 16(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
SH	R2, 0(SP)
JAL	_Draw_Line_H+0
NOP	
ADDIU	SP, SP, 12
LH	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
J	L_Draw_rectangle85
NOP	
L_Draw_rectangle86:
L_end_Draw_rectangle:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Draw_rectangle
_img_load_raw_image_mem:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
LH	R3, 14(SP)
LH	R2, 18(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, -1
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LH	R2, 22(SP)
SH	R2, 4(SP)
LH	R3, 20(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, -1
SH	R2, 2(SP)
LH	R2, 20(SP)
SH	R2, 0(SP)
JAL	_WindowSet+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 44
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Set_Index+0
NOP	
ADDIU	SP, SP, 4
SH	R0, 4(SP)
L_img_load_raw_image_mem88:
LH	R3, 18(SP)
LHU	R2, 4(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__img_load_raw_image_mem168
NOP	
J	L_img_load_raw_image_mem89
NOP	
L__img_load_raw_image_mem168:
SH	R0, 6(SP)
L_img_load_raw_image_mem91:
LH	R3, 16(SP)
LHU	R2, 6(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__img_load_raw_image_mem169
NOP	
J	L_img_load_raw_image_mem92
NOP	
L__img_load_raw_image_mem169:
LH	R2, 16(SP)
SLL	R3, R2, 1
LHU	R2, 4(SP)
MULTU	R3, R2
MFLO	R6
LHU	R2, 6(SP)
SLL	R5, R2, 1
ADDU	R2, R6, R5
ANDI	R3, R2, 65535
LW	R2, 20(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, 8(SP)
LHU	R2, 8(SP)
SLL	R4, R2, 8
SH	R4, 8(SP)
ADDIU	R2, R5, 1
ADDU	R2, R6, R2
ANDI	R3, R2, 65535
LW	R2, 20(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDU	R2, R4, R2
SH	R2, 8(SP)
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Write_Data+0
NOP	
ADDIU	SP, SP, 4
LHU	R2, 6(SP)
ADDIU	R2, R2, 1
SH	R2, 6(SP)
J	L_img_load_raw_image_mem91
NOP	
L_img_load_raw_image_mem92:
LHU	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
J	L_img_load_raw_image_mem88
NOP	
L_img_load_raw_image_mem89:
L_end_img_load_raw_image_mem:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _img_load_raw_image_mem
MyProjectff_InitializeObjects:
ORI	R2, R0, 23275
SH	R2, Offset(_Screen1+0)(GP)
ORI	R2, R0, 800
SH	R2, Offset(_Screen1+2)(GP)
ORI	R2, R0, 480
SH	R2, Offset(_Screen1+4)(GP)
ORI	R2, R0, 11
SH	R2, Offset(_Screen1+32)(GP)
LUI	R2, hi_addr(_Screen1_Boxes+0)
ORI	R2, R2, lo_addr(_Screen1_Boxes+0)
SW	R2, Offset(_Screen1+36)(GP)
ORI	R2, R0, 11
SH	R2, Offset(_Screen1+6)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box34+0)(GP)
SB	R0, Offset(_Box34+4)(GP)
ORI	R2, R0, 379
SH	R2, Offset(_Box34+6)(GP)
ORI	R2, R0, 2
SH	R2, Offset(_Box34+8)(GP)
ORI	R2, R0, 358
SH	R2, Offset(_Box34+10)(GP)
ORI	R2, R0, 141
SH	R2, Offset(_Box34+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box34+14)(GP)
SH	R0, Offset(_Box34+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box34+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box34+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box34+20)(GP)
SB	R0, Offset(_Box34+21)(GP)
SB	R0, Offset(_Box34+22)(GP)
ORI	R2, R0, 31
SH	R2, Offset(_Box34+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box34+26)(GP)
ORI	R2, R0, 31
SH	R2, Offset(_Box34+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box34+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box34+32)(GP)
SW	R0, Offset(_Box34+36)(GP)
SW	R0, Offset(_Box34+40)(GP)
SW	R0, Offset(_Box34+44)(GP)
SW	R0, Offset(_Box34+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box1+0)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box1+4)(GP)
ORI	R2, R0, 116
SH	R2, Offset(_Box1+6)(GP)
ORI	R2, R0, 112
SH	R2, Offset(_Box1+8)(GP)
ORI	R2, R0, 253
SH	R2, Offset(_Box1+10)(GP)
ORI	R2, R0, 58
SH	R2, Offset(_Box1+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box1+14)(GP)
SH	R0, Offset(_Box1+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box1+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box1+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box1+20)(GP)
SB	R0, Offset(_Box1+21)(GP)
SB	R0, Offset(_Box1+22)(GP)
ORI	R2, R0, 31
SH	R2, Offset(_Box1+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box1+26)(GP)
ORI	R2, R0, 31
SH	R2, Offset(_Box1+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box1+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box1+32)(GP)
SW	R0, Offset(_Box1+36)(GP)
SW	R0, Offset(_Box1+40)(GP)
SW	R0, Offset(_Box1+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box35+0)(GP)
ORI	R2, R0, 2
SB	R2, Offset(_Box35+4)(GP)
ORI	R2, R0, 204
SH	R2, Offset(_Box35+6)(GP)
ORI	R2, R0, 185
SH	R2, Offset(_Box35+8)(GP)
ORI	R2, R0, 188
SH	R2, Offset(_Box35+10)(GP)
ORI	R2, R0, 88
SH	R2, Offset(_Box35+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box35+14)(GP)
SH	R0, Offset(_Box35+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box35+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box35+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box35+20)(GP)
SB	R0, Offset(_Box35+21)(GP)
SB	R0, Offset(_Box35+22)(GP)
ORI	R2, R0, 31
SH	R2, Offset(_Box35+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box35+26)(GP)
ORI	R2, R0, 31
SH	R2, Offset(_Box35+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box35+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box35+32)(GP)
SW	R0, Offset(_Box35+36)(GP)
SW	R0, Offset(_Box35+40)(GP)
SW	R0, Offset(_Box35+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box16+0)(GP)
ORI	R2, R0, 3
SB	R2, Offset(_Box16+4)(GP)
ORI	R2, R0, 132
SH	R2, Offset(_Box16+6)(GP)
ORI	R2, R0, 284
SH	R2, Offset(_Box16+8)(GP)
ORI	R2, R0, 213
SH	R2, Offset(_Box16+10)(GP)
ORI	R2, R0, 74
SH	R2, Offset(_Box16+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box16+14)(GP)
SH	R0, Offset(_Box16+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box16+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box16+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box16+20)(GP)
SB	R0, Offset(_Box16+21)(GP)
SB	R0, Offset(_Box16+22)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box16+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box16+26)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box16+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box16+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box16+32)(GP)
SW	R0, Offset(_Box16+36)(GP)
SW	R0, Offset(_Box16+40)(GP)
SW	R0, Offset(_Box16+44)(GP)
SW	R0, Offset(_Box16+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box15+0)(GP)
ORI	R2, R0, 4
SB	R2, Offset(_Box15+4)(GP)
ORI	R2, R0, 368
SH	R2, Offset(_Box15+6)(GP)
ORI	R2, R0, 361
SH	R2, Offset(_Box15+8)(GP)
ORI	R2, R0, 376
SH	R2, Offset(_Box15+10)(GP)
ORI	R2, R0, 73
SH	R2, Offset(_Box15+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box15+14)(GP)
SH	R0, Offset(_Box15+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box15+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box15+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box15+20)(GP)
SB	R0, Offset(_Box15+21)(GP)
SB	R0, Offset(_Box15+22)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box15+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box15+26)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box15+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box15+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box15+32)(GP)
SW	R0, Offset(_Box15+36)(GP)
SW	R0, Offset(_Box15+40)(GP)
SW	R0, Offset(_Box15+44)(GP)
SW	R0, Offset(_Box15+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box14+0)(GP)
ORI	R2, R0, 5
SB	R2, Offset(_Box14+4)(GP)
ORI	R2, R0, 419
SH	R2, Offset(_Box14+6)(GP)
ORI	R2, R0, 262
SH	R2, Offset(_Box14+8)(GP)
ORI	R2, R0, 317
SH	R2, Offset(_Box14+10)(GP)
ORI	R2, R0, 80
SH	R2, Offset(_Box14+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box14+14)(GP)
SH	R0, Offset(_Box14+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box14+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box14+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box14+20)(GP)
SB	R0, Offset(_Box14+21)(GP)
SB	R0, Offset(_Box14+22)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box14+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box14+26)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box14+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box14+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box14+32)(GP)
SW	R0, Offset(_Box14+36)(GP)
SW	R0, Offset(_Box14+40)(GP)
SW	R0, Offset(_Box14+44)(GP)
SW	R0, Offset(_Box14+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box21+0)(GP)
ORI	R2, R0, 6
SB	R2, Offset(_Box21+4)(GP)
ORI	R2, R0, 795
SH	R2, Offset(_Box21+6)(GP)
ORI	R2, R0, 139
SH	R2, Offset(_Box21+8)(GP)
ORI	R2, R0, 195
SH	R2, Offset(_Box21+10)(GP)
ORI	R2, R0, 87
SH	R2, Offset(_Box21+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box21+14)(GP)
SH	R0, Offset(_Box21+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box21+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box21+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box21+20)(GP)
SB	R0, Offset(_Box21+21)(GP)
SB	R0, Offset(_Box21+22)(GP)
ORI	R2, R0, 1032
SH	R2, Offset(_Box21+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box21+26)(GP)
ORI	R2, R0, 1032
SH	R2, Offset(_Box21+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box21+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box21+32)(GP)
SW	R0, Offset(_Box21+36)(GP)
SW	R0, Offset(_Box21+40)(GP)
ORI	R2, R0, 1
SW	R2, Offset(_Box21+44)(GP)
SW	R0, Offset(_Box21+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box20+0)(GP)
ORI	R2, R0, 7
SB	R2, Offset(_Box20+4)(GP)
ORI	R2, R0, 70
SH	R2, Offset(_Box20+6)(GP)
ORI	R2, R0, 187
SH	R2, Offset(_Box20+8)(GP)
ORI	R2, R0, 116
SH	R2, Offset(_Box20+10)(GP)
ORI	R2, R0, 87
SH	R2, Offset(_Box20+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box20+14)(GP)
SH	R0, Offset(_Box20+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box20+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box20+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box20+20)(GP)
SB	R0, Offset(_Box20+21)(GP)
SB	R0, Offset(_Box20+22)(GP)
ORI	R2, R0, 64512
SH	R2, Offset(_Box20+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box20+26)(GP)
ORI	R2, R0, 64512
SH	R2, Offset(_Box20+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box20+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box20+32)(GP)
SW	R0, Offset(_Box20+36)(GP)
SW	R0, Offset(_Box20+40)(GP)
ORI	R2, R0, 1
SW	R2, Offset(_Box20+44)(GP)
SW	R0, Offset(_Box20+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box13+0)(GP)
ORI	R2, R0, 8
SB	R2, Offset(_Box13+4)(GP)
ORI	R2, R0, 89
SH	R2, Offset(_Box13+6)(GP)
ORI	R2, R0, 10
SH	R2, Offset(_Box13+8)(GP)
ORI	R2, R0, 120
SH	R2, Offset(_Box13+10)(GP)
ORI	R2, R0, 87
SH	R2, Offset(_Box13+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box13+14)(GP)
SH	R0, Offset(_Box13+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box13+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box13+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box13+20)(GP)
SB	R0, Offset(_Box13+21)(GP)
SB	R0, Offset(_Box13+22)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box13+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box13+26)(GP)
ORI	R2, R0, 32799
SH	R2, Offset(_Box13+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box13+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box13+32)(GP)
SW	R0, Offset(_Box13+36)(GP)
SW	R0, Offset(_Box13+40)(GP)
ORI	R2, R0, 1
SW	R2, Offset(_Box13+44)(GP)
SW	R0, Offset(_Box13+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box31+0)(GP)
ORI	R2, R0, 9
SB	R2, Offset(_Box31+4)(GP)
ORI	R2, R0, 450
SH	R2, Offset(_Box31+6)(GP)
ORI	R2, R0, 166
SH	R2, Offset(_Box31+8)(GP)
ORI	R2, R0, 286
SH	R2, Offset(_Box31+10)(GP)
ORI	R2, R0, 82
SH	R2, Offset(_Box31+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box31+14)(GP)
SH	R0, Offset(_Box31+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box31+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box31+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box31+20)(GP)
SB	R0, Offset(_Box31+21)(GP)
SB	R0, Offset(_Box31+22)(GP)
ORI	R2, R0, 33800
SH	R2, Offset(_Box31+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box31+26)(GP)
ORI	R2, R0, 33800
SH	R2, Offset(_Box31+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box31+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box31+32)(GP)
SW	R0, Offset(_Box31+36)(GP)
SW	R0, Offset(_Box31+40)(GP)
ORI	R2, R0, 1
SW	R2, Offset(_Box31+44)(GP)
SW	R0, Offset(_Box31+48)(GP)
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
SW	R2, Offset(_Box28+0)(GP)
ORI	R2, R0, 10
SB	R2, Offset(_Box28+4)(GP)
ORI	R2, R0, 228
SH	R2, Offset(_Box28+6)(GP)
ORI	R2, R0, 11
SH	R2, Offset(_Box28+8)(GP)
ORI	R2, R0, 116
SH	R2, Offset(_Box28+10)(GP)
ORI	R2, R0, 87
SH	R2, Offset(_Box28+12)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box28+14)(GP)
SH	R0, Offset(_Box28+16)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box28+18)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box28+19)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box28+20)(GP)
SB	R0, Offset(_Box28+21)(GP)
SB	R0, Offset(_Box28+22)(GP)
ORI	R2, R0, 63488
SH	R2, Offset(_Box28+24)(GP)
ORI	R2, R0, 50712
SH	R2, Offset(_Box28+26)(GP)
ORI	R2, R0, 63488
SH	R2, Offset(_Box28+28)(GP)
ORI	R2, R0, 1
SB	R2, Offset(_Box28+30)(GP)
ORI	R2, R0, 65535
SH	R2, Offset(_Box28+32)(GP)
SW	R0, Offset(_Box28+36)(GP)
SW	R0, Offset(_Box28+40)(GP)
ORI	R2, R0, 1
SW	R2, Offset(_Box28+44)(GP)
SW	R0, Offset(_Box28+48)(GP)
L_end_InitializeObjects:
JR	RA
NOP	
; end of MyProjectff_InitializeObjects
_DrawBox:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 8(SP)
ADDIU	R2, R2, 28
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SW	R2, Offset(_Back_Color+0)(GP)
LH	R2, 4(SP)
BEQ	R2, R0, L__DrawBox172
NOP	
J	L_DrawBox94
NOP	
L__DrawBox172:
ORI	R2, R0, 2
ADDIU	SP, SP, -16
SH	R2, 12(SP)
LW	R2, 24(SP)
ADDIU	R2, R2, 28
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SW	R2, 8(SP)
LW	R2, 24(SP)
ADDIU	R2, R2, 12
LHU	R2, 0(R2)
SH	R2, 6(SP)
LW	R2, 24(SP)
ADDIU	R2, R2, 10
LHU	R2, 0(R2)
SH	R2, 4(SP)
LW	R2, 24(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
SH	R2, 2(SP)
LW	R2, 24(SP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 0(SP)
JAL	_Draw_rectangle+0
NOP	
ADDIU	SP, SP, 16
J	L_DrawBox95
NOP	
L_DrawBox94:
LW	R2, 8(SP)
ADDIU	R2, R2, 28
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 12
LHU	R2, 0(R2)
SH	R2, 6(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 10
LHU	R2, 0(R2)
SH	R2, 4(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
SH	R2, 2(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 0(SP)
JAL	_TFT_Rectangle+0
NOP	
ADDIU	SP, SP, 12
L_DrawBox95:
L_end_DrawBox:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DrawBox
_DrawLine:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 4(SP)
ADDIU	R2, R2, 16
LW	R2, 0(R2)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 12
LHU	R2, 0(R2)
SH	R2, 6(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 10
LHU	R2, 0(R2)
SH	R2, 4(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
SH	R2, 2(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 0(SP)
JAL	_Draw_Line+0
NOP	
ADDIU	SP, SP, 12
L_end_DrawLine:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DrawLine
_DrawCircle:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 8(SP)
ADDIU	R2, R2, 26
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LH	R2, 16(SP)
SB	R2, 6(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 10
LHU	R2, 0(R2)
SH	R2, 4(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ADDIU	R2, R2, 12
SH	R2, 2(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 0(SP)
JAL	_Draw_Circle+0
NOP	
ADDIU	SP, SP, 12
L_end_DrawCircle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DrawCircle
_DrawLabel:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 65535
SW	R2, Offset(_Back_Color+0)(GP)
LW	R2, 4(SP)
ADDIU	R2, R2, 24
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(_tahoma_24pt_FontDescriptors+0)
ORI	R2, R2, lo_addr(_tahoma_24pt_FontDescriptors+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_tahoma_24pt_Font+0)
ORI	R2, R2, lo_addr(_tahoma_24pt_Font+0)
SW	R2, 0(SP)
JAL	_TFT_Set_Font+0
NOP	
ADDIU	SP, SP, 12
LW	R2, 4(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LW	R2, 12(SP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 4(SP)
LW	R2, 12(SP)
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(SP)
JAL	_Display_String+0
NOP	
ADDIU	SP, SP, 8
L_end_DrawLabel:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DrawLabel
_DrawImage:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 4(SP)
ADDIU	R2, R2, 16
LW	R2, 0(R2)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 12
LHU	R2, 0(R2)
SH	R2, 6(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 10
LHU	R2, 0(R2)
SH	R2, 4(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
SH	R2, 2(SP)
LW	R2, 16(SP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
SH	R2, 0(SP)
JAL	_img_load_raw_image_mem+0
NOP	
ADDIU	SP, SP, 12
L_end_DrawImage:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DrawImage
_display_page:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 4(SP)
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_TFT_FULL_ON+0
NOP	
ADDIU	SP, SP, 4
L_display_page96:
LW	R2, 4(SP)
ADDIU	R2, R2, 32
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
BNE	R2, R0, L__display_page179
NOP	
J	L_display_page97
NOP	
L__display_page179:
LW	R2, 4(SP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
LW	R2, 0(R2)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
ORI	R2, R0, 1
SH	R2, 0(SP)
JAL	_DrawBox+0
NOP	
ADDIU	SP, SP, 8
LW	R2, 4(SP)
ADDIU	R3, R2, 36
LW	R2, 0(R3)
ADDIU	R2, R2, 4
SW	R2, 0(R3)
LW	R2, 4(SP)
ADDIU	R3, R2, 32
LHU	R2, 0(R3)
ADDIU	R2, R2, -1
SH	R2, 0(R3)
J	L_display_page96
NOP	
L_display_page97:
L_display_page98:
LW	R2, 4(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
BNE	R2, R0, L__display_page181
NOP	
J	L_display_page99
NOP	
L__display_page181:
LW	R2, 4(SP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ORI	R2, R0, 3
BEQ	R3, R2, L__display_page182
NOP	
J	L_display_page100
NOP	
L__display_page182:
ORI	R2, R0, 31
SW	R2, Offset(_Back_Color+0)(GP)
L_display_page100:
LW	R2, 4(SP)
ADDIU	R2, R2, 12
LW	R2, 0(R2)
LW	R2, 0(R2)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_DrawLabel+0
NOP	
ADDIU	SP, SP, 4
LW	R2, 4(SP)
ADDIU	R3, R2, 12
LW	R2, 0(R3)
ADDIU	R2, R2, 4
SW	R2, 0(R3)
LW	R2, 4(SP)
ADDIU	R3, R2, 8
LHU	R2, 0(R3)
ADDIU	R2, R2, -1
SH	R2, 0(R3)
J	L_display_page98
NOP	
L_display_page99:
L_end_display_page:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _display_page
_main:
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
SW	R0, Offset(TRISB+0)(GP)
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
LUI	R2, BitMask(TRISE2_bit+0)
ORI	R2, R2, BitMask(TRISE2_bit+0)
_SX	
LUI	R2, BitMask(TRISC13_bit+0)
ORI	R2, R2, BitMask(TRISC13_bit+0)
_SX	
LUI	R2, BitMask(TRISE1_bit+0)
ORI	R2, R2, BitMask(TRISE1_bit+0)
_SX	
LUI	R2, BitMask(TRISC14_bit+0)
ORI	R2, R2, BitMask(TRISC14_bit+0)
_SX	
JAL	_TFT_Intialize_16bit+0
NOP	
JAL	MyProjectff_InitializeObjects+0
NOP	
ORI	R2, R0, 255
ADDIU	SP, SP, -4
SB	R2, 0(SP)
JAL	_Set_BackLight+0
NOP	
ADDIU	SP, SP, 4
ORI	R2, R0, 65535
SW	R2, Offset(_Back_Color+0)(GP)
LUI	R2, hi_addr(_gImage_MEGEG+0)
ORI	R2, R2, lo_addr(_gImage_MEGEG+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
ORI	R2, R0, 77
SH	R2, 6(SP)
ORI	R2, R0, 137
SH	R2, 4(SP)
ORI	R2, R0, 152
SH	R2, 2(SP)
ORI	R2, R0, 316
SH	R2, 0(SP)
JAL	_img_load_raw_image_mem+0
NOP	
ADDIU	SP, SP, 12
LUI	R24, 813
ORI	R24, R24, 52564
L_main101:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main101
NOP	
NOP	
NOP	
LUI	R2, hi_addr(_Screen1+0)
ORI	R2, R2, lo_addr(_Screen1+0)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_display_page+0
NOP	
ADDIU	SP, SP, 4
L_main103:
J	L_main103
NOP	
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
