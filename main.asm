.ORIG x3000

MAIN	    AND R0, R0, #0
            AND R1, R1, #0
            AND R2, R2, #0
            AND R3, R3, #0
            AND R4, R4, #0

            LD R4, READS
            JSRR R4
            
            ADD R1, R0, #0 ; Save input number in R1
            
            LD R4, ISPRIME
            JSRR R4
            
            LD R4, RESULTS
            JSRR R4
            BRnzp MAIN
    
READS       .FILL x4000
ISPRIME     .FILL x4200
RESULTS     .FILL x4300
.END