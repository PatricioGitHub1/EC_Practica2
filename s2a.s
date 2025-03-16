	.data

	.text
	.globl main
main:
	# li $s1, 0xABCDABCD# Y
	# li $s0, 28  # X
	
	# li $s1, 0xAAAAAAAA# Y
	# li $s0, 4  # 
	
	# li $s1, -1# Y
	# li $s0, 4  # 

# COPIA EL TEU CODI AQUI
	li $t0, 1
	sllv $t0, $t0, $s0
	addiu $t0, $t0, -1
	xor $s1, $s1, $t0

	jr $ra
