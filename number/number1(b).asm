.MODEL SMALL 
.STACK 100H 
.DATA 
    DIGIT1 DB 0AH, 0DH, "ENTER FIRST DIGIT: $" 
    DIGIT2 DB 0AH, 0DH, "ENTER SECOND DIGIT: $" 
    RESULT DB 0AH, 0DH, "RESULT IS: $" 
  
.CODE 
 
    MAIN: 
        MOV AX, @DATA 
        MOV DS, AX 
         
        LEA DX,DIGIT1 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
        SUB AL, 30H 
        MOV BH, AL 
         
        LEA DX,DIGIT2 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
        SUB AL, 30H 
        MOV BL, AL 
         
        CMP BH, BL 
         
        JL MINUS 
         
        SUB BH, BL 
         
        LEA DX,RESULT 
        MOV AH, 09H 
        INT 21H 
         
        MOV DL, BH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        JMP EXIT 
         
   MINUS: 
        SUB BL, BH 
         
        LEA DX,RESULT 
        MOV AH, 09H 
        INT 21H 
         
        MOV DL, '-' 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, BL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
   EXIT: 
        MOV AH, 04CH 
        INT 21H 
   END MAIN 