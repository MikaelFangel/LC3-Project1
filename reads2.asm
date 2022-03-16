
;
;   READS
;   A routine that reads a two digit number from the console
;   Input: a two digit number read from the console
;   Output: the number read from the console in R0
;
                .ORIG       x4000
READS           LEA         R0,INPUT
                LD          R1,ASCII
                PUTS                                                ; Prints the string labelled input to the console
NEWIN           IN
                ADD         R2,R0,#-10                              ; Check if newline was pressed
                BRnp        NEWIN
                
                
RETURN          RET

INPUT           .STRINGZ    "Input a 2 digit decimal number (end with newline):"
ASCII           .FILL       xFFD0                                   ; To account for difference between ascii and 2's complement
                .END