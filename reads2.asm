
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
                ST          R5,Save5
;
                LEA         R0,INPUT
                LD          R1,ASCII
                LD          R6,STACK
                PUTS                                                ; Prints the string labelled input to the console
;
                AND         R2,R2,#0
                ADD         R2,R2,#5
NEWIN           IN
                ADD         R3,R0,#-10                              ; Check if newline was pressed
                BRz         ENDLOOP
;                
                ADD         R3,R0,R1                                ; Converts from ASCII to binary
                ADD         R6,R6,#-1
                STR         R3,R6,#0                                ; Stores in a simple stack
;                
                ADD         R2,R2,#-1                               ; Ensures a maximum of five digits is entered
                BRz         ENDLOOP
                BRnzp       NEWIN

ENDLOOP         AND         R0,R0,#0
                ADD         R0,R0,#0
                LEA         R5,MULTIPLIERS
MULT            LD          R2,EMPTY
                ADD         R2,R2,R6                                ; Check if empty
                BRz         RETURN
                LDR         R1,R6,#0                                ; Get top of stack
                ADD         R6,R6,#1
                ADD         R0,R0,#0
                BRz         SKIP
;               
                ADD         R4,R1,#0
                LDR         R3,R5,#0
                ADD         R5,R5,#1
                ADD         R1,R1,#0
                BRnp        AGAIN
                ADD         R3,R3,#1
                ADD         R3,R0,R3
                BRnzp       MULT
;
AGAIN           ADD         R1,R1,R4
                ADD         R3,R3,#-1
                BRp         AGAIN
;
SKIP            ADD         R0,R0,R1
                BRnzp       MULT
                
RETURN          LD          R5,Save5                                ; Restore original register values
                LD          R4,Save4
                LD          R3,Save3
                LD          R2,Save2
                LD          R1,Save1
                RET
;
INPUT           .STRINGZ    "Input a 2 digit decimal number (end with newline):"
ASCII           .FILL       xFFD0                                   ; To account for difference between ascii and 2's complement
EMPTY           .FILL       xC000
STACK           .FILL       x4000
MULTIPLIERS     .FILL       #9
                .FILL       #99
                .FILL       #999
                .FILL       #9999
Save1           .FILL       x0000
Save2           .FILL       x0000
Save3           .FILL       x0000
Save4           .FILL       x0000
Save5           .FILL       x0000
                .END