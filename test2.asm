.include "m328Pdef.inc"
LDI R16,low(RAMEND)
OUT SPL, R16
LDI R16,high(RAMEND)
OUT SPH, R16

LDI R16, 0b11111111
LDI R17, 0b01010101

OUT DDRD, R16 // nó¿ki portu d s¹ wyjœciem

loop:
	OUT PORTD, R16
	RCALL delay
	OUT PORTD, R17 // breakpoint
	RCALL delay
RJMP loop // 20.75 us drugi breakpoint

delay:
	LDI R18, 10  // 11.25us  stop watch dla 4.0 MHz (na makiecie jest to 1.0 MHz!)
	do_delay:
	DEC R18
	BRNE do_delay
RET
