# Arquitetura, Primeira VA, 2023.1
# Grupo: Gabriela Rodrigues, Hudo Leonardo, Lucas Chagas, Louise d'Athayde
# Questão: 1, letra E

# Resumo: Este código implementa a função 'strcat' em assembly MIPS para concatenar duas strings.
# Na função 'main', os endereços das strings 'destination' e 'source' são carregados nos registradores $a0 e $a1, respectivamente.
# A função 'strcat' começa verificando se há sobreposição de memória entre as strings de destino e origem.
# Se não houver sobreposição, a concatenação das strings é realizada.
# O código percorre a string de destino até encontrar o seu final, e então copia a string de origem para a posição após o fim da string de destino.
# A concatenação é interrompida quando o caractere nulo ('\0') da string de origem é encontrado e o resultado final é retornado.
# Se houver sobreposição, é exibida uma mensagem de erro indicando um comportamento indefinido e o programa é encerrado.

.text
main:

    # Carregar os endereços em a0 (destination) e a1 (source)
    la $a0, destination
    la $a1, source

    # Começar o processo de concatenação
    jal strcat
    
    # Imprimir a string resultante (conteúdo de destination)
    move $a0, $v0
    li $v0, 4        # Syscall for print integer
    syscall
    # Sair do programa
    li $v0, 10       # Syscall para sair
    syscall

strcat:
   li $v0, 0          # Inicializa $v0 com 0 (retorno inicial)

   # Verificar sobreposição de memória
   sub $t0, $a1, $a0   # Calcula a diferença entre os endereços
   bltz $t0, undefined_behavior  # Se $t0 < 0, há sobreposição

   # Se não houver sobreposição, continuar com a concatenação
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
      move $v0, $a0    # Retorna o endereço de destination em $v0
      jr $ra           # Retorna para a função chamadora

   # Comportamento indefinido em caso de sobreposição
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
