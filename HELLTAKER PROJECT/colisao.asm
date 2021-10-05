.data
#0 = buraco
#1 = chao
#2 = helltaker
MAPA: .word	0,1,1,0,
		1,2,1,1,
		1,1,1,1,
		0,0,0,0
		
.text

#.include "../gameloop.s"

		li s0,1	#y
		li s1,1 #x

GAME_LOOP:	li a7,12
		ecall
		jal INPUT
		j GAME_LOOP
	
INPUT:		li t0, 'a'
		beq a0, t0, INPUT_A
		li t0, 'w'
	
INPUT_A: 	addi t0, s1, -1
		la t1,MAPA
		add t1, t1, s1
		slli t2, s0, 2
		add t1, t1, t2
		
		addi t1,t1,-1
		



		addi s1,s1,-1
		ret		