.include "m328Pdef.inc"

LDI R16,low(RAMEND)
OUT SPl,R16
LDI R16,HIGH(RAMEND)
OUT SPH,R16

LDI R16, 0b11111111
OUT DDRD, R16

qq:

LDI R17, 0
OUT PORTD, R17

RCALL wait

LDI R17, $FF
OUT PORTD, R17


RJMP qq
wait:
LDI R21 ,255
a2:
LDI R22 ,255
a1:

DEC R22
BRNE a1
DEC R21
BRNE a2

RET




