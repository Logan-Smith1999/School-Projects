;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author : Logan Smith 
; Date : ; 27/01/2019
; Version: ; 1.0
; Title: ; 'Moving LED'
; ;
; Description: ; This programme is designed to have LED's light up in a row while one always remains one at a time
; ; In this I use the Functions; Calls, Clear and BTG to get these LED's to light up. 
; ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

list p=18f4550, r=DEC
	#include <p18f4550.inc>

	CONFIG WDT = OFF
	CONFIG LVP = OFF
	CONFIG MCLRE = OFF
	CONFIG FOSC = INTOSCIO_EC
;--------------------------------------------------------------------------
; Main Program
;--------------------------------------------------------------------------

	org 0
	cblock 0
	Delay1:1
	Delay2:1
	endc
Start:
	CLRF PORTD
	CLRF TRISD
	CLRF Delay1
	CLRF Delay2
	
MainLoop:  ; MainLoop, this is where the programme actually uses my functions below and puts them to use
	CALL LED1
	CALL Delay
	CALL LED2
	CALL Delay
	CALL LED3
	CALL Delay
	CALL LED4
	CALL Delay
	CALL LED5
	CALL Delay
	CALL LED6
	CALL Delay
	CALL LED7
	CALL Delay
	CALL LED8
	CALL Delay
	CALL LED7
	CALL Delay
	CALL LED6
	CALL Delay
	CALL LED5
	CALL Delay
	CALL LED4
	CALL Delay
	CALL LED3
	CALL Delay
	CALL LED2
	CALL Delay
	GOTO MainLoop
	
; the LED's below are assigned as a port, so it will light up only certain ports
LED1:
	BTG PORTD, RD0
	RETURN
LED2:
	BTG PORTD, RD1
	RETURN
LED3:
	BTG PORTD, RD2
	RETURN
LED4:
	BTG PORTD, RD3
	RETURN
LED5:
	BTG PORTD, RD4
	RETURN
LED6:
	BTG PORTD, RD5
	RETURN
LED7:
	BTG PORTD, RD6
	RETURN
LED8:
	BTG PORTD, RD7
	RETURN
;This is the Delay Function so we see the LED's light up slowly (not slow enough), at the end i clear the PORTD so that after every LED that lights up it will not stay lit after the LED function is done. 
Delay: 
	DECFSZ Delay1,1
	GOTO Delay
	DECFSZ Delay2,1
	GOTO Delay
	CLRF PORTD
	RETURN
	end



