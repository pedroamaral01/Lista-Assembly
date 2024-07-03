.data
	print: .asciiz "Informe a expressao e coloque no final 'f' "
	print2: .asciiz "Resultado  "

	string: .space 20

.text

	main:

	li $v0, 4
	la $a0, print
	syscall

	li $v0, 8
	la $a0, string
	li $a1, 20
	syscall

	add $t2 $t2, $zero
	
	
	while:
	lb $t3, string($t2)
	beq $t3, 'f', resultado # vai pro resultado
		
	blt $t3, '0',identifica_operacao
	bgt $t3, '9', identifica_operacao
	addi $sp, $sp, -4
	sub $t3, $t3, 48
	sw $t3, 0($sp)
	j next
	
	identifica_operacao:
	beq $t3, '+', soma
	beq $t3, '-', subt
	beq $t3, '*', multi
	beq $t3, '/', divi

	next:
	addi $t2, $t2, 1 
	j while
	
	subt:
	lw $t0, 0($sp) # desempilha
	addi $sp, $sp, 4 # altera ponteiro
	lw $t1, 0($sp) # desempilha
	sub $t0, $t1, $t0 
	sw $t0, 0($sp) # Push resultado
	j next

	soma:
	lw $t0, 0($sp)
	addi $sp, $sp, 4 
	lw $t1, 0($sp) 
	add $t0, $t0, $t1
	sw $t0, 0($sp)
	j next
	
	
	divi:
	lw $t0, 0($sp)
   	addi $sp, $sp, 4 
    	lw $t1, 0($sp) 
    	div $t1, $t0 
    	mflo $t0
    	sw $t0, 0($sp) 
    	j next
	
	
	multi:
	lw $t0, 0($sp)
	addi $sp, $sp, 4 
	lw $t1, 0($sp) 
	mul $t0, $t1, $t0 
	sw $t0, 0($sp) 
	j next


	resultado:
    	li $v0, 4
    	la $a0, print2
    	syscall

    	lw $a0, 0($sp) # resultado
    	li $v0, 1
    	syscall
	
    	saida:
    	li $v0, 10
    	syscall