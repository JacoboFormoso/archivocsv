void detectarIntT1() org 0x001a  {
    LATBbits.LATB0 = !LATBbits.LATB0;
    IFS0bits.T1IF = 0;  // Borramos la bandera de interrupción T1
}

void detectarIntT3() org 0x0022  {
    LATBbits.LATB1 = !LATBbits.LATB1;
    IFS0bits.T3IF = 0;  // Borramos la bandera de interrupción T2
}

void main()  {
    TRISBbits.TRISB0 = 0;
    TRISBbits.TRISB1 = 0;
    LATBbits.LATB0 = 0;
    LATBbits.LATB1 = 0;

    // Modo de operación Timer1
    T1CON = 0x0000;
    T3CON = 0x0000;


    // Modo operación Timer1: reloj interno, escala 1:1, empieza cuenta en 0
    TMR1 = 0;
    TMR3 = 0;
    T1CONbits.TCKPS0 = 1;
    T1CONbits.TCKPS1 = 1;
    T2CONbits.T32 = 1;

    // Cuenta 500 ciclos
    PR1 = 29297;
    
    PR3 = 0b110100011;
    PR2 = 0b1001110111100000;
    
    

    // Interrupciones Timer1, borra Bandera de interrupción
    IFS0bits.T3IF = 0;
    IFS0bits.T1IF = 0;

    // Habilita interrupción
    IEC0bits.T3IE = 1;
    IEC0bits.T1IE = 1;

    // Arranca Timer1
    //T3CONbits.TON = 1;
    T2CONbits.TON = 1;
    T1CONbits.TON = 1;

    while( 1 )
       asm nop;
}