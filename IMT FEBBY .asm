.MODEL SMALL
.STACK 100H
.DATA 
  MSA DB ' ================ WELCOME TO OUR PROJECT ================$' 
  MSB DB ' ******************* KALKULATOR IMT ********************$'
  MSD DB ' Masukkan tinggi anda dalam cm:$'
  MSE DB ' Masukkan berat anda dalam kg:$'
  MSF DB ' "Berat kamu termasuk:OVER WEIGHT"$'
  MSG DB ' "Berat kamu termasuk:PERFECT"$'
  MSH DB ' "Berat kamu termasuk:UNDER WEIGHT"$' 
  MSI DB ' "Berat kamu termasuk:OBESE"$' 
  
  
  MSM3 DB '      *******THANK YOU*******$'
  MSM4 DB ' " Press any key to continue...."$'
  
  SUM DW ?
  SUM2 DW ? 
.CODE
   MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSA
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSB
    MOV AH,9
    INT 21H 
    
    
    
START:
    
    CALL NL
    CALL NL
    
    LEA DX,MSD
    MOV AH,9
    INT 21H 
           
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0
    MOV SUM,0
    
 
         
 INPUT:
 
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE PRINT
    
   
    JMP INPUT
    
    
PRINT: 
    
    CALL NL
    
    LEA DX,MSE
    MOV AH,9
    INT 21H  
    
    MOV AX, BX
    MUL BX
    
    MOV BX, 100
    DIV BX
    
    
    MOV SUM,AX
    MOV BX,0
    MOV AX,0
     
    INPUT2:
     
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE CONVERT
    
    JMP INPUT2
     
CONVERT:     
          
    MOV AX, 100      
    MUL BX  
    MOV BX, SUM
    MOV DX,0
    
    DIV BX  
    
    CMP AX, 19
    JL UNDER
     
    CMP AX,19
    JE UNDER
    
    CMP AX,20
    JE PERFECT
    
    CMP AX,21
    JE PERFECT
    
    CMP AX,22
    JE PERFECT  
    
    CMP AX,23
    JE PERFECT
    
    CMP AX,24
    JE PERFECT
    
    CMP AX,25
    JE PERFECT
    
    CMP AX,30
    JE OBESE
    
    CMP AX, 29
    JG OBESE
    
    
OVER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSF
    MOV AH,9
    INT 21H 
    
    JMP PRESS
    
PERFECT:
     
    CALL NL
    CALL NL
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
   
     
    JMP PRESS
     
UNDER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSH
    MOV AH,9
    INT 21H 
    
    JMP PRESS     
    
    
OBESE:  

    CMP AX, 29
    JL OVER
    
    CALL NL
    CALL NL
    
    LEA DX,MSI
    MOV AH,9
    INT 21H 
    
    JMP PRESS  
    
              
 PRESS:
    
    MOV AX,0 
    
    CALL NL
    CALL NL
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    
    
    CMP AL,'2'
    
    
    JMP EXIT2
    
    NL:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    RET
    
    EXIT2:  
    CALL NL
    
    LEA DX,MSM3
    MOV AH,9
    INT 21H
     
    MOV AH,4CH
    INT 21H
             
    MAIN ENDP 
    END MAIN