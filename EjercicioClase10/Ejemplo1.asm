
_detectarIntT1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Ejemplo1.c,1 :: 		void detectarIntT1() org 0x001a  {
;Ejemplo1.c,2 :: 		LATBbits.LATB0 = !LATBbits.LATB0;
	BTG	LATBbits, #0
;Ejemplo1.c,3 :: 		IFS0bits.T1IF = 0;  // Borramos la bandera de interrupción T1
	BCLR.B	IFS0bits, #3
;Ejemplo1.c,4 :: 		}
L_end_detectarIntT1:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _detectarIntT1

_detectarIntT3:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Ejemplo1.c,6 :: 		void detectarIntT3() org 0x0022  {
;Ejemplo1.c,7 :: 		LATBbits.LATB1 = !LATBbits.LATB1;
	BTG	LATBbits, #1
;Ejemplo1.c,8 :: 		IFS0bits.T3IF = 0;  // Borramos la bandera de interrupción T2
	BCLR.B	IFS0bits, #7
;Ejemplo1.c,9 :: 		}
L_end_detectarIntT3:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _detectarIntT3

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Ejemplo1.c,11 :: 		void main()  {
;Ejemplo1.c,12 :: 		TRISBbits.TRISB0 = 0;
	BCLR.B	TRISBbits, #0
;Ejemplo1.c,13 :: 		TRISBbits.TRISB1 = 0;
	BCLR.B	TRISBbits, #1
;Ejemplo1.c,14 :: 		LATBbits.LATB0 = 0;
	BCLR.B	LATBbits, #0
;Ejemplo1.c,15 :: 		LATBbits.LATB1 = 0;
	BCLR.B	LATBbits, #1
;Ejemplo1.c,18 :: 		T1CON = 0x0000;
	CLR	T1CON
;Ejemplo1.c,19 :: 		T3CON = 0x0000;
	CLR	T3CON
;Ejemplo1.c,23 :: 		TMR1 = 0;
	CLR	TMR1
;Ejemplo1.c,24 :: 		TMR3 = 0;
	CLR	TMR3
;Ejemplo1.c,25 :: 		T1CONbits.TCKPS0 = 1;
	BSET.B	T1CONbits, #4
;Ejemplo1.c,26 :: 		T1CONbits.TCKPS1 = 1;
	BSET.B	T1CONbits, #5
;Ejemplo1.c,27 :: 		T2CONbits.T32 = 1;
	BSET.B	T2CONbits, #3
;Ejemplo1.c,30 :: 		PR1 = 29297;
	MOV	#29297, W0
	MOV	WREG, PR1
;Ejemplo1.c,32 :: 		PR3 = 0b110100011;
	MOV	#419, W0
	MOV	WREG, PR3
;Ejemplo1.c,33 :: 		PR2 = 0b1001110111100000;
	MOV	#40416, W0
	MOV	WREG, PR2
;Ejemplo1.c,38 :: 		IFS0bits.T3IF = 0;
	BCLR.B	IFS0bits, #7
;Ejemplo1.c,39 :: 		IFS0bits.T1IF = 0;
	BCLR.B	IFS0bits, #3
;Ejemplo1.c,42 :: 		IEC0bits.T3IE = 1;
	BSET.B	IEC0bits, #7
;Ejemplo1.c,43 :: 		IEC0bits.T1IE = 1;
	BSET.B	IEC0bits, #3
;Ejemplo1.c,47 :: 		T2CONbits.TON = 1;
	BSET	T2CONbits, #15
;Ejemplo1.c,48 :: 		T1CONbits.TON = 1;
	BSET	T1CONbits, #15
;Ejemplo1.c,50 :: 		while( 1 )
L_main0:
;Ejemplo1.c,51 :: 		asm nop;
	NOP
	GOTO	L_main0
;Ejemplo1.c,52 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
