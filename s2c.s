	.data
w:       .asciiz "8754830094826456674949263746929"
		    
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
# ESCRIU AQUI EL TEU CODI
	
	# EPILOG
	addiu $sp, $sp, -60
	sw $s0, 40($sp)
	sw $s1, 44($sp)
	sw $s2, 48($sp)
	sw $s3, 52($sp)
	sw $ra, 56($sp)
	
	# saving arguments in safe registers
	move $s0, $a0
	move $s1, $a1
	
	# preparing forloop constants
	li $s2, 0
	li $t0, 10
	
for1:
	sll $t1, $s2, 2
	addu $t1, $t1, $sp
	
	sw $zero, 0($t1)
	
	addiu $s2, $s2, 1
	blt $s2, $t0, for1
	
	# preparing for next forloop
	li $s3 ,'0'
	li $s2, 0

for2:
	bge $s2, $s1, endfor2
	
	# preparing arguments for function calling
	move $a0, $sp
	li $t0, '0'
	subu $t0, $zero, $t0
	
	addu $t3, $s0, $s2
	lb $t3, 0($t3)
	addu $a1, $t3, $t0
	
	addu $a2, $s3 , $t0
	
	jal update
	
	# reasign return value to char max
	move $s3, $v0
	addiu $s3, $s3, '0'
	
	# ++k
	addiu $s2, $s2, 1
	b for2
endfor2:
	# set function return value
	move $v0, $s3
	# PROLEG
	lw $s0, 40($sp)
	lw $s1, 44($sp)
	lw $s2, 48($sp)
	lw $s3, 52($sp)
	lw $ra, 56($sp)
	addiu $sp, $sp, 60
	
	
	jr $ra

update:
# ESCRIU AQUI EL TEU CODI

	# EPILOG
	addiu $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	# save arguments
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	
	# call pointless function
	jal nofares
	
	# load h[i] address
	sll $t0, $s1, 2
	addu $t0, $s0, $t0
	
	# h[++i] and saving
	lw $t3, 0($t0)
	addiu $t3, $t3, 1
	sw $t3, 0($t0)
	
	# load h[imax]
	sll $t1, $s2, 2
	addu $t1, $s0, $t1
	lw $t1, 0($t1)
	
	# if sentence
	
	ble $t3, $t1, upd_else
	# set function return value
	move $v0, $s1
	b upd_endif
upd_else:
	# set function return value
	move $v0, $s2
upd_endif:
	# PROLEG
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	
	# go back
	jr $ra


