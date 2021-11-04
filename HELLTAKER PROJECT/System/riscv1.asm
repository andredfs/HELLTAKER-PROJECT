.data
STR1: .string "Digite um Numero: "
STR2: .string "Metade: "
STR3: .string "Dobro: "

PULAR: .string "\n" 


.text
MAIN:	li a7, 4
	la a0, STR1
	ecall
	
	li a7,5
	ecall
	mv t0,a0
	
	li a7,4
	la a0,STR3
	ecall
	
	li a7, 1
	li t2, 2
	mul t1, t0, t2 
	mv a0,t1
	ecall
	
	li a7,4
	la a0,PULAR
	ecall
	
	li a7,4
	la a0,STR2
	ecall
	
	li a7, 1
	li  t2, 2
	div t1, t0, t2 
	mv a0,t1
	ecall
	
	li a7,10
	ecall 