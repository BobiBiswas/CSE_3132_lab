.MODEL SMALL 
.STACK 100H 
.DATA 
    INTRO DB 0AH, 0DH, 07H, 09H, "THIS PROGRAM PRINTS THE SUM OF SERIES$" 
    MSG DB 0AH, 0DH, "ENTER A NUMBER: $" 
    NEWLINE DB 0AH, 0DH, "$" 
    DOAGAIN DB 0AH, 0DH, "DO AGAIN? Y FOR YES ELSE FOR NO: $" 
.CODE 
 
    MAIN: 
        MOV AX, @DATA 
        MOV DS, AX 
 
        LEA DX, INTRO 
        MOV AH, 09H 
        INT 21H 
 
         
    NUMBER:     
        LEA DX, MSG 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        CMP AL, 09H 
        JG NUMBER 
         
         
        MOV BL, AL 
        MOV BH, AL 
        PUSH BX 
        CMP AL, 00H 
        JE RESULT 
   AGAIN: 
         
         
        DEC BL 
        ADD BH, BL 
        CMP BL, 00H 
        JG AGAIN 
         
        MOV AH, 00H 
        MOV AL, BH 
        MOV BL, 0AH 
        DIV BL 
        MOV BX, AX 
        POP CX 
  RESULT:       
        LEA DX, NEWLINE 
        MOV AH, 09H 
        INT 21H 
        MOV CH, 00H 
         
  DISPLAY: 
        MOV DL,CH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, '+' 
        MOV AH, 02H 
        INT 21H 
         
        INC CH 
        CMP CH, CL 
        JLE DISPLAY  
         
         
        MOV DL, 08H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, '=' 
        MOV AH, 02H 
        INT 21H 
         
         
         
        MOV DL,BL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H       
         
        MOV DL, BH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        LEA DX, DOAGAIN 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
        OR AL, 20H 
        CMP AL, 'y' 
        JE NUMBER 
         
         
        MOV AH, 4CH 
        INT 21H 
    END MAIN 