;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
main:
	mov.w #1100h,R4;
	mov.w #2110h,R5;

	cmp R5,R4;
	jl LessThan;
	jge GreaterThan;
	jmp main;

GreaterThan:
	mov.w #0001h,&1001h;
	mov.w #0002h,&1002h;
	mov.w #0003h,&1003h;
	mov.w #0004h,&1004h;
	mov.w #0005h,&1005h;

	sub #0001h, R4;
	jmp main;

LessThan:
	mov.w #0006h,&2001h;
	mov.w #0007h,&2002h;
	mov.w #0008h,&2003h;
	mov.w #0009h,&2004h;
	mov.w #000Ah,&2005h;

	sub #0001h, R4;
	jmp main;



                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
