.data
	vetor: .word 6, 9, 2, 3, 8, 1, 0, 7

.text
	main:
	la $t0, vetor        # vetor
	 addi $t1, $zero, 1            # K do for
	addi $t2, $zero, 8            # N do for

	for_primeiro:
	 bge $t1, $t2, saida # finaliza primeiro for
 
	  addi $t3, $zero, 0            # zera o j

	for_segundo:
	bge $t3, $t2, condicacao_segundo  # if 
	sub $t4, $t2, $t1         # subtrair n - k

	 bge $t3, $t4, condicacao_segundo   # if

	 mul $t5, $t3, 4   
	 add $t5, $t0, $t5          

	 lw $t6, 0($t5)              
	 lw $t7, 4($t5)             

	 slt $t8, $t6, $t7          
	 bne $t8, $zero, soma_J

	 sw $t6, 4($t5)
	 sw $t7, 0($t5)             
	

	soma_J:
	 addi $t3, $t3, 1            # soma 1 J
	j for_segundo             

	condicacao_segundo:
	
	addi $t3, $zero, 0          # zera o j
	addi $t1, $t1, 1            # soma 1 k

	j for_primeiro               

	saida:
	li $v0, 10                   
	syscall
