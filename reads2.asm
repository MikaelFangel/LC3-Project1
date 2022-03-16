
;
;   READS
;   A routine that reads a two digit number from the console
;   Input: a two digit number read from the console
;   Output: the number read from the console in R0
;
                .ORIG       x4000
READS           LEA         R0,INPUT
                LD          R1,ASCII
                LD          R6,STACK
                PUTS                                                ; Prints the string labelled input to the console
                AND         R2,R2,#0
                ADD         R2,R2, #5
NEWIN           IN
                ADD         R3,R0,#-10                              ; Check if newline was pressed
                BRz         ENDLOOP
                
                ADD         R3,R0,R1                                ; Converts from ASCII to binary
                ADD         R6,R6,#-1
                STR         R3,R6,#0                                ; Stores in a simple stack
                
                ADD         R2,R2,#-1                               ; Ensures a maximum of five digits is entered
                BRz         ENDLOOP
                BRnzp       NEWIN
                
ENDLOOP         RET
                
                
RETURN          RET

INPUT           .STRINGZ    "Input a 2 digit decimal number (end with newline):"
ASCII           .FILL       xFFD0                                   ; To account for difference between ascii and 2's complement
EMPTY           .FILL       xC000
STACK           .FILL       x4000
                .END