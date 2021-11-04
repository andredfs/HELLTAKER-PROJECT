INICIA_MENU:	li s0,0xFF200604
		sw zero,0(s0)
	
		li s0,0xFF000000
		li s1,0xFF100000
		la t0,Menu
		lw t1,0(t0)
		lw t2,4(t0)
		li t3,0
		mul t4,t1,t2
		addi t0,t0,8
LOOP1: 	beq t3,t4,MSG_P
	lw t5,0(t0)
	sw t5,0(s0)
	sw t5,0(s1)	
	addi t0,t0,4
	addi s0,s0,4
	addi s1,s1,4
	addi t3,t3,1
	j LOOP1
	
	li t2,0
	
MSG_P:	li a7,104
	la a0,msg
	li a1,80
	li a2,100
	li a3,0x00FF
	li a4,0
	ecall
	li a7,104
	la a0,msg
	li a1,80
	li a2,100
	li a3,0x00FF
	li a4,1
	ecall
	j MUSICA_LOOP

LOOP2:	li s0,0xFF200604
	sw t2,0(s0)
	xori t2,t2,0x001
	li a0,50
	li a7,32
	ecall
	j LOOP

MUSICA_LOOP:
	la s0,NUM		
	lw s1,0(s0)		
	la s0,NOTAS		
	li t0,0			
	li a2,1			
	li a3,127		

LOOP:	beq t0,s1,MUSICA_LOOP	
	lw a0,0(s0)		
	lw a1,4(s0)		
	li a7,31		
	ecall			
	mv a0,a1		
	li a7,32		 
	ecall			
	addi s0,s0,8		
	addi t0,t0,1		
	
	li t1,0xFF200000	
	lw t3,0(t1)		
   	andi t3,t3,0x0001		
   	lw t4,4(t1)	
	li t5,'f'
	beq t5,t4,APAGAR
	j LOOP			
	
APAGAR:	
	li s0,0xFF000000
	li s1,0xFF100000
	la t0,Fundo_Preto
	lw t1,0(t0)
	lw t2,4(t0)
	li t3,0	
	mul t4,t1,t2
	addi t0,t0,8
LOOP3: 	beq t3,t4,FIM_1
	lw t5,0(t0)
	sw t5,0(s0)
	sw t5,0(s1)	
	addi t0,t0,4
	addi s0,s0,4
	addi s1,s1,4
	addi t3,t3,1
	j LOOP3
	
FIM_1:	ret			

.include "SYSTEMv21.s"
