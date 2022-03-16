;
;   resultS
;   A routine that prints if it is a prime based on the value in R0
;   Input: a integer in R0
;   Output: String to the console
;
                .ORIG       x4300
                ADD         R0,R0,#0
                BRp         TRUE
                LEA         R0,RESULT0
                BRnzp       RETURN
;
TRUE            LEA         R0,RESULT1
RETURN          PUTS
                RET
;
RESULT1         .STRINGZ    "The number is prime"
RESULT0         .STRINGZ    "The number is not prime"
                .END