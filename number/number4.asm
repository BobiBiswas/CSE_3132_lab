.MODEL SMALL
.STACK 100H
.DATA
MSG DB "ENTER A NUMBER: $"
PRIMEMSG DB 0DH, 0AH, "NUMBER IS PRIME $" 
NOTPRIMEMSG DB 0DH, 0AH, "NUMBER IS NOT PRIME $"
TOTAL DB 0
VALUE DB 0
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    
    READ:
    MOV AH, 1
    INT 21H
    
    CMP AL, 13
    JE ENDOFNUMBER
    
    MOV VALUE, AL
    SUB VALUE, 48
    
    MOV AL, TOTAL
    MOV BL, 10
    MUL BL
    
    ADD AL, VALUE
    
    MOV TOTAL, AL
    
    JMP READ
    
    ENDOFNUMBER:
    MOV AH, 0
    MOV AL, TOTAL
    MOV BL, 2
    
    CHECK:
    
    CMP AL, BL
    JE PRIME
    
    DIV BL
    CMP AH, 0
    JE NOTPRIME
    
    INC BL
    MOV AL, TOTAL
    MOV AH, 0
    
    JMP CHECK
    
    PRIME:
    
    MOV AH, 9
    LEA DX, PRIMEMSG
    INT 21H
    
    JMP EXIT
    
    NOTPRIME:
    
    MOV AH, 9
    LEA DX, NOTPRIMEMSG
    INT 21H
    
    EXIT:   

MAIN ENDP