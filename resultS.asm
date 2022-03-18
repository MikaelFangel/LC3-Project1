;
;   resultS
;   A routine that prints if it is a prime based on the value in R0
;   Input: a integer in R0
;   Output: String to the console
;
                .ORIG       x4300
                ST          R0,Save1
                ADD         R0, R0, #0
                BRp         TRUE
                LEA         R0,RESULT0
                BRnzp       RETURN
;
TRUE            LEA         R0,RESULT1
RETURN          PUTS
                LD          R0, Save1
                RET
;
RESULT1         .STRINGZ    "The number is prime"
RESULT0         .STRINGZ    "The number is not prime"
Save1           .FILL       x0000
                .END