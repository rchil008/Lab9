;=================================================
; Name: Ritish Chilkepalli
; Email: rchil008
;
; Lab: lab 8, ex 1
; Lab section: 023
; TA: James Luo
;
;=================================================


.orig x3000

ADD R1, R1, #0 
Add R1, R1, #0
ADD R1, R1, #4          ; Value being pushed in
LD R2, Stack_Start      ; Current address of the stack
LD R6, push_val
JSRR R6

AND R1, R1, #0


;push_val(3) pushes the value 3 onto the stack [4,3]

ADD R1, R1, #3         ; Value being pushed in

;=================================================
LD R6, push_val
JSRR R6
;=================================================

AND R1, R1, #0


;push_val(2) pushes the value 2 onto the stack [4,3,2]

ADD R1, R1, #2         ; Value being pushed in

;=================================================
LD R6, push_val
JSRR R6
;=================================================

AND R1, R1, #0


;add_val() pop 3,2 AND push the result of 3+2 onto the stack [4,5]

;=================================================
LD R6, add_val()
JSRR R6
;=================================================

;add_val() pop 4,5 AND push the result of 4+5 onto the stack[9]

;=================================================
LD R6, add_val()
JSRR R6
;=================================================


;move the top value of the stack into r4

LD R4, Stack_Start
ADD R4, R4, #-1

LDR R4, R4, #0

HALT


Stack_Start         .FILL       x3201
push_val            .FILL       x3400
add_val()           .FILL       x3800
.end



;---------------------------------------------------------------------------------
; push_val(int val) - implement your push function that will push a value onto the stack
;
; parameter: R1 - number to be pushed in
;            R2 - current address in stack
;
; RETurns: R2 - Current address of stack pointer
;---------------------------------------------------------------------------------
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack EXCEPT for RETurn Value(s)
;========================
; Subroutine Instructions
;========================
ST R1, BACKUP_R1_3400
ST R3, BACKUP_R3_3400
ST R4, BACKUP_R4_3400
ST R5, BACKUP_R5_3400
ST R6, BACKUP_R6_3400
ST R7, BACKUP_R7_3400


ADD R2, R2, #-1
STR R1, R2, #0




LD R1, BACKUP_R1_3400
LD R3, BACKUP_R3_3400
LD R4, BACKUP_R4_3400
LD R5, BACKUP_R5_3400
LD R6, BACKUP_R6_3400
LD R7, BACKUP_R7_3400
RET

;========================
; Subroutine Data
;========================
BACKUP_R1_3400 .BLKW #1
BACKUP_R3_3400 .BLKW #1
BACKUP_R4_3400 .BLKW #1
BACKUP_R5_3400 .BLKW #1
BACKUP_R6_3400 .BLKW #1
BACKUP_R7_3400 .BLKW #1 ; ... EXCEPT for RETurn Value(s)

.end
;---------------------------------------------------------------------------------
; add_val()  - pops two values from the top of the stack AND pushes the result of adding the poppped value into the stack
;
; parameter: R2 - current address in stack
;
; RETurns: R2 - current address in stack
;---------------------------------------------------------------------------------
.orig x3800 ;; add_val() pops two values from the top of the stack AND pushes the result of adding the poppped value into the stack
;========================
; Subroutine Instructions
;========================
ST R1, BACKUP_R1_3800
ST R3, BACKUP_R3_3800
ST R4, BACKUP_R4_3800
ST R5, BACKUP_R5_3800
ST R6, BACKUP_R6_3800
ST R7, BACKUP_R7_3800


LDR R3, R2, #0
STR R0, R2, #0
ADD R2, R2, #1

LDR R4, R2, #0

ADD R0, R3, R4
STR R0, R2, #0

AND R0, R0, #0


LD R1, BACKUP_R1_3800
LD R3, BACKUP_R3_3800
LD R4, BACKUP_R4_3800
LD R5, BACKUP_R5_3800
LD R6, BACKUP_R6_3800
LD R7, BACKUP_R7_3800
RET

;========================
; Subroutine Data
;========================
BACKUP_R1_3800 .BLKW #1
BACKUP_R3_3800 .BLKW #1
BACKUP_R4_3800 .BLKW #1
BACKUP_R5_3800 .BLKW #1
BACKUP_R6_3800 .BLKW #1
BACKUP_R7_3800 .BLKW #1

.end

.orig x4200 ;

.end
