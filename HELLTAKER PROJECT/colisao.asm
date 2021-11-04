.data
#0 = buraco
#1 = chao
#2 = helltaker
#3 = caixa
MAPA: .word	0,1,1,0,
		1,1,1,1,
		0,1,3,2,
		1,1,1,1,
		
.include "Mapa1.data"	

CHAR_POS:	.half 0,0			# x, y
OLD_CHAR_POS:	.half 0,0			# x, y

.include "sprites/tile.s"
.include "sprites/map.s"
.include "sprites/hero.data"	
.text


		li s0,8 #y
		li s1,12 #x	
		
	
GAME_LOOP:	jal SETUP

								
		
.include "movimento.asm"
.include "printmapa.asm"
