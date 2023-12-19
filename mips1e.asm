.text
main:

    # Carregar os endere�os em a0 (destination) e a1 (source)
    la $a0, destination
    la $a1, source

    # Come�ar o processo de concatena��o
    jal strcat
    
    # Imprimir a string resultante (conte�do de destination)
    move $a0, $v0
    li $v0, 4        # Syscall for print integer
    syscall
    # Sair do programa
    li $v0, 10       # Syscall para sair
    syscall

strcat:
   li $v0, 0          # Inicializa $v0 com 0 (retorno inicial)

   # Verificar sobreposi��o de mem�ria
   sub $t0, $a1, $a0   # Calcula a diferen�a entre os endere�os
   bltz $t0, undefined_behavior  # Se $t0 < 0, h� sobreposi��o

   # Se n�o houver sobreposi��o, continuar com a concatena��o
   concatenate_strings:
      move $t5, $a0    # $t5 <- $a0 (destination)
      move $t6, $a1    # $t6 <- $a1 (source)

   find_end_dest:
      lb $t7, 0($t5)
      beqz $t7, copy_loop
      addi $t5, $t5, 1
      j find_end_dest

   copy_loop:
      lb $t9, 0($t6)
      sb $t9, 0($t5)
      beqz $t9, end_concatenation
      addi $t5, $t5, 1
      addi $t6, $t6, 1
      j copy_loop

   end_concatenation:
      move $v0, $a0    # Retorna o endere�o de destination em $v0
      jr $ra           # Retorna para a fun��o chamadora

   # Comportamento indefinido em caso de sobreposi��o
   undefined_behavior:
      li $v0, 4        # Syscall para imprimir string
      la $a0, error_message
      syscall

      li $v0, 10       # Syscall para sair
      syscall

.data	
    destination: .asciiz "tudo junto mesmo"  # String de destino
    source:      .asciiz "string2"  # String de origem
    error_message: .asciiz "ERRO: Tem overlap\n"