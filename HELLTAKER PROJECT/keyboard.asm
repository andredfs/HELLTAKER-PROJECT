.data
#0 = buraco
#1 = chao
#2 = helltaker
#3 = caixa
MAPA: .word	0,1,1,0,
		1,1,1,1,
		0,1,3,2,
		1,1,1,1,
		
.text	

		li s0,8 #y
		li s1,12 #x	
		
GAME_LOOP:	li t1,0xFF200000		# carrega o endereco de controle do KDMMIO
		lw t0,0(t1)			# Le bit de Controle Teclado
		andi t0,t0,0x0001		# mascara o bit menos significativo
   		beq t0,zero,GAME_LOOP   	   	# Se nao ha tecla pressionada entao vai para FIM
  		lw t2,4(t1)  			# le o valor da tecla tecla
		
		li t0,'w'
		beq t2,t0,INPUT_W		# se tecla pressionada for 'w', chama CHAR_CIMA
		
		li t0,'a'
		beq t2,t0,INPUT_A		# se tecla pressionada for 'a', chama CHAR_CIMA
		
		li t0,'s'
		beq t2,t0,INPUT_S		# se tecla pressionada for 's', chama CHAR_CIMA
		
		li t0,'d'
		beq t2,t0,INPUT_D		# se tecla pressionada for 'd', chama CHAR_CIMA
		
																																							

	
INPUT_A: 	la t1,MAPA
		add t1, t1, s1
		slli t2, s0, 2
		add t1, t1, t2
		
		addi t1,t1,-4
		lw t0, 0(t1)
		beqz t0, END_INPUT_A
		li t2, 3
		beq t0, t2, MOVE_A	#MOVE A CAIXA
		addi s1, s1, -4
		li t2, 2
		sw t2, 0(t1)
		sw t0, 4(t1)
		
END_INPUT_A:	j GAME_LOOP
		
		
MOVE_A:		addi t1,t1,-4
		lw t0, 0(t1)
		beqz t0, END_INPUT_A
		li t2, 3
		sw t2, 0(t1)
		li t2, 1
		sw t2, 4(t1)
		j END_INPUT_A


INPUT_W: 	la t1,MAPA
		add t1, t1, s1
		slli t2, s0, 2
		add t1, t1, t2
		
		addi t1,t1,-16
		lw t0, 0(t1)
		beqz t0, END_INPUT_W
		li t2, 3
		beq t0, t2, MOVE_W	#MOVE A CAIXA
		addi s0, s0, -4
		li t2, 2
		sw t2, 0(t1)
		li t2, 1
		sw  t2, 16(t1)

END_INPUT_W:	j GAME_LOOP

				
MOVE_W:		addi t1,t1,-16
		lw t0, 0(t1)
		beqz t0, END_INPUT_A
		li t2, 3
		sw t2, 0(t1)
		li t2, 1
		sw t2, 16(t1)
		j END_INPUT_W


INPUT_D: 	la t1,MAPA
		add t1, t1, s1
		slli t2, s0, 2
		add t1, t1, t2
		
		addi t1,t1,4
		lw t0, 0(t1)
		beqz t0, END_INPUT_A
		li t2, 3
		beq t0, t2, MOVE_A	#MOVE A CAIXA
		addi s1, s1, 4
		li t2, 2
		sw t2, 0(t1)
		sw t0, -4(t1)

END_INPUT_D:	j GAME_LOOP
		
		
MOVE_D:		addi t1,t1,4
		lw t0, 0(t1)
		beqz t0, END_INPUT_A
		li t2, 3
		sw t2, 0(t1)
		li t2, 1
		sw t2, -4(t1)
		j END_INPUT_A
		
		
INPUT_S: 	la t1,MAPA
		add t1, t1, s1
		slli t2, s0, 2
		add t1, t1, t2
		
		addi t1,t1,16
		lw t0, 0(t1)
		beqz t0, END_INPUT_W
		li t2, 3
		beq t0, t2, MOVE_W	#MOVE A CAIXA
		addi s0, s0, 4
		li t2, 2
		sw t2, 0(t1)
		li t2, 1
		sw  t2, -16(t1)

END_INPUT_S:	j GAME_LOOP

				
MOVE_S:		addi t1,t1,16
		lw t0, 0(t1)
		beqz t0, END_INPUT_A
		li t2, 3
		sw t2, 0(t1)
		li t2, 1
		sw t2, 16(t1)
		j END_INPUT_W

