.data
	print: .asciiz "Escreva a string: "
 	print2: .asciiz "Informe o tamanho da string: "
 	nao: .asciiz "nao e palindromo"
 	sim: .asciiz "sim e palindromo"
	palavra: .space 20

.text

	main:

	li $v0, 4
	la $a0, print
	syscall

	
	li $v0, 8
	la $a0, palavra
	li $a1, 20
	syscall
	
	la $a0, palavra 
	li $v0,4 
	syscall
	
	li $v0, 4
	la $a0, print2
	syscall
	
	li $v0 , 5
	syscall
	
	add $t4, $t4, $v0
	sub $t4, $t4, 1
	add $t3, $t3, $zero
	
	while:
	lb $t1, palavra($t3) #carrega o byte de palavra
	lb $t2, palavra($t4)
	bne $t1, $t2, nao_palindromo #comparacao
	sub $t0, $t4, $t3
	blt $t0, 2, e_palindromo
	add $t3, $t3, 1 #incrementa endereco
	sub $t4, $t4, 1 #decrementa endereco
	j while

	nao_palindromo:
	li $v0, 4
	la $a0, nao
	syscall
	j saida

	e_palindromo:
	li $v0, 4
	la $a0, sim
	syscall
	
	saida:
	li $v0, 10
	syscall