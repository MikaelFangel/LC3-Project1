;
;   isPrime
;   A routine that checks if a number is prime
;   Input: a integer in R0
;   Output: R0 is 1 if prime and R0 is 0 if not prime
;
                .ORIG       x4200
ISPRIME         ST          R1,Save1
                ST          R2,Save2
                ST          R3,Save3
                ADD         R2,R0,#-1               ; Check if R0 is 1 to avoid infinity loop
                BRz         NOTAPRIME
                AND         R2,R2,#0
;
DIVIDE          ADD         R2,R2,#-1
NEXT            AND         R1,R1,#0
                ADD         R1,R0,#0                ; Moves divident to R1
                ADD         R2,R2,#-1
                ADD         R3,R0,R2
                BRz         APRIME                  ; Ends routine if divident is equal to divisor
;                
SUBTRACT        ADD         R1,R1,R2                ; Substract divisor from divident
                BRp         SUBTRACT
                BRz         NOTAPRIME               ; If zero then it is not a prime
                ADD         R1,R1,#0
                BRn         NEXT
APRIME          AND         R0,R0,#0
                ADD         R0,R0,#1
                BRnzp       STOP
NOTAPRIME       AND         R0,R0,#0
STOP            LD          R3,Save3
                LD          R2,Save2
                LD          R1,Save1
                RET
;
Save1           .FILL       x0000
Save2           .FILL       x0000
Save3           .FILL       x0000
                .END