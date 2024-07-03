.data

.text
	j main
	
	soma:
        add $s0, $a1, $a2
        jr $ra

	sub:
        sub $s0, $a1, $a2
        jr $ra

	func:
        beq $a0,1, verdadeiro
        jal sub
        j saida

	verdadeiro:
        jal soma

	 saida:
        syscall

	main:
        addi $a0, $a0, 1  
        addi $a1, $a1, 4
        addi $a2, $a2, 5
        jal func

       


    
