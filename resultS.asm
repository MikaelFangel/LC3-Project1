;
;   resultS
;   A routine that prints if it is a prime based on the value in R0
;   Input: a integer in R0
;   Output: String to the console
;
                .ORIG       x4300
                ADD         R0,R0,#0
                BRp         PRINT1
PRINT0          LEA         R0,RESULT0
                PUTS
                BRnzp       RETURN
PRINT1          
                LEA         R0,RESULT1
                PUTS
RETURN          RET
;
RESULT1         .STRINGZ    "The number is prime"
RESULT0         .STRINGZ    "The number is not prime"
                .END