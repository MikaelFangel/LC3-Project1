;
;   READS2
;   A routine that reads a five digit number from the console
;   Input: a five digit number read from the console
;   Output: the number read from the console in R0
;
                .ORIG       x4000
READS           ST          R1,Save1                                ; Save registers that are need by routine
                ST          R2,Save2
                ST          R3,Save3
                ST          R4,Save4
                ST          R5,Save5
                ST          R7,Save7
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
                BRn         ERROR                                   ; Checks if ASCII value is below 0
                ADD         R4,R3,#-10
                BRzp        ERROR                                   ; Check if above 9
                ADD         R6,R6,#-1
                STR         R3,R6,#0                                ; Stores in a simple stack
;                
                ADD         R2,R2,#-1                               ; Ensures a maximum of five digits is entered
                BRz         ENDLOOP
                BRnzp       NEWIN
ERROR           LEA         R0,ERRORMSG
                PUTS
                BRnzp       NEWIN
;
ENDLOOP         AND         R0,R0,#0
                LEA         R5,MULTIPLIERS
MULT            LD          R2,EMPTY
                ADD         R2,R2,R6                                ; Check if empty
                BRz         RETURN
                LDR         R1,R6,#0                                ; Get top of stack
                ADD         R6,R6,#1                                ; Pop element
;               
                ADD         R4,R1,#0
                LDR         R3,R5,#0                                ; Get number of run throughs
                ADD         R5,R5,#1                                ; Prepare next
                ADD         R3,R3,#0                                ; If first element from stack skip multiplication
                BRz         SKIP
                ADD         R1,R1,#0
                BRnp        AGAIN                                   ; If R1 is a number den start multiplication
                BRz         MULT                                    ; If zero look at  next element in the stack
;
AGAIN           ADD         R1,R1,R4                                ; The actual muliplication
                ADD         R3,R3,#-1
                BRp         AGAIN
;
SKIP            ADD         R0,R0,R1                                ; The running sum
                BRnzp       MULT
;
RETURN          LD          R5,Save5                                ; Restore original register values
                LD          R4,Save4
                LD          R3,Save3
                LD          R2,Save2
                LD          R1,Save1
                LD          R7,Save7
                RET
;
INPUT           .STRINGZ    "Input a decimal number (end with newline):"
ERRORMSG        .STRINGZ    "Error not a number. Try again!"
ASCII           .FILL       xFFD0                                   ; To account for difference between ascii and 2's complement
EMPTY           .FILL       xC000
STACK           .FILL       x4000
MULTIPLIERS     .FILL       #0
                .FILL       #9
                .FILL       #99
                .FILL       #999
                .FILL       #9999
Save1           .FILL       x0000
Save2           .FILL       x0000
Save3           .FILL       x0000
Save4           .FILL       x0000
Save5           .FILL       x0000
Save7           .FILL       x0000
                .END