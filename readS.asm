;
;   READS
;   A routine that reads a two digit number from the console
;   Input: a two digit number read from the console
;   Output: the number read from the console in R0
;
                .ORIG       x4000
READS           ST          R1,Save1                                ; Save registers that are need by routine
                ST          R2,Save2
                ST          R3,Save3
                ST          R4,Save4
                ST          R7,Save7
                LEA         R0,INPUT
                PUTS                                                ; Prints the string labelled input to the console
                AND         R1,R1,#0
                AND         R2,R2,#0
                LD          R3,ASCII
                IN
                ADD         R1,R0,R3                                ; Moves the ASCII value to R1 and converts to bin
                LEA         R4,MULT10
                JSRR        R4
                IN
                ADD         R2,R0,R3                                ; Moves the ASCII value to R2 and converts to bin
;
                AND         R0,R0,#0                                ; Prepares R0 to store the result
                ADD         R0,R1,R2                                ; Stores the result to R0 
;                
                LD          R4,Save4                                ; Restore original register values 
                LD          R3,Save3
                LD          R2,Save2
                LD          R1,Save1
                LD          R7,Save7
                RET
;
MULT10          AND         R0,R0,#0                                ; Multiplies the value in R1 with 10
                AND         R4,R4,#0
                ADD         R4,R1,#0
                ADD         R0,R0,#9
AGAIN           ADD         R1,R1,R4
                ADD         R0,R0,#-1
                BRp         AGAIN
                RET       
;
INPUT           .STRINGZ    "Input a 2 digit decimal number:"
ASCII           .FILL       xFFD0                                   ; To account for difference between ascii and 2's complement
Save1           .FILL       x0000
Save2           .FILL       x0000
Save3           .FILL       x0000
Save4           .FILL       x0000
Save7           .FILL       x3000
                .END