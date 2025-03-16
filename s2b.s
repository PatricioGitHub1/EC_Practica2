	.data
result: .word 0
num:	.byte ' '

	.text
	.globl main
main:

# COPIA EL TEU CODI AQUI
	la $t0, num		# Load global variables addreses
	la $t1, result
	
	lb $t0, 0($t0)		# load 'num' value in register
	
	# if_1_cond_1
	li $t7, 'a'
	bltu $t0, $t7, if_1_cond_2
	
	li $t7, 'z'
	bleu $t0, $t7, if_1_body
	
if_1_cond_2:
	li $t7, 'A'
	bltu $t0, $t7, else_1_body
	
	li $t7, 'Z'
	bgtu $t0, $t7, else_1_body
	
if_1_body:
	sw $t0, 0($t1)
	b end_else_1	
	
else_1_body:
	# if_2_cond_1
	li $t6, '0'
	bltu $t0, $t6, else_2_body
	
	li $t7, '9'
	bgtu $t0, $t7, else_2_body
	
	# if_2_body
	subu $t2, $t0, $t6
	sw $t2, 0($t1)
	b end_else_2
	
else_2_body:
	li $t2, -1
	sw $t2, 0($t1)
	
end_else_2:

end_else_1:
	
	jr $ra

