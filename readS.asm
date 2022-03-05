;
;   READS
;   A routine that reads a two digit number from the console
;   Input: a two digit number read from the console
;   Output: the number read from the console in R0
;
                .ORIG       x4000
READS           LEA         R1,INPUT
                ST          R2,Save1                                ; Save registers that are need by routine
                ST          R2,Save2
                ST          R2,Save3
                AND         R1,R1,#0
                AND         R2,R2,#0
                LD          R3,ASCII
                PUTS                                                ; Prints the string labelled input to the console
                IN
                ADD         R1,R0,R3                                ; Moves the ASCII value to R1 and converts to bin
                LEA         R6,MULTR1
                JSRR        R6
                IN
                ADD         R2,R0,R3                                ; Moves the ASCII value to R2 and converts to bin
;
                AND         R0,R0,#0                                ; Prepares R0 to store the result
                ADD         R0,R1,R2                                ; Stores the result to R0 
                
                LD          R2,Save3                                ; Restore original register values 
                LD          R2,Save2
                LD          R1,Save1
                HALT
;
MULTR1          AND         R0,R0,#0                                ; Multiplies the value in R1 with 10
                AND         R6,R6,#0
                ADD         R6,R1,#0
                ADD         R0,R0,#9
AGAIN           ADD         R1,R1,R6
                ADD         R0,R0,#-1
                BRp         AGAIN
                RET       
;
INPUT           .STRINGZ    "Input a 2 digit decimal number:"
ASCII           .FILL       xFFD0                                   ; To account for difference between ascii and 2's complement
Save1           .FILL       x0000
Save2           .FILL       x0000
Save3           .FILL       x0000
                .END