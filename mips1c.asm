.text
main:
    # Load words (str1 = a0, str2 = a1)
    la $a0, str1        # Carrega o endereço de 'str1' em $a0
    la $a1, str2        # Carrega o endereço de 'str2' em $a1

    # Chama a função strcmp
    jal strcmp

    # Imprime o resultado
    move $a0, $v0       # Move o resultado para $a0 (para imprimir)
    li $v0, 1           # Código de syscall para imprimir inteiro
    syscall

    # Termina o programa
    li $v0, 10          # Código de syscall para encerrar
    syscall

# Implementação da função strcmp
strcmp:
    # Inicializa o registrador de retorno $v0
    li $v0, 0

    # Loop para comparar caracteres
    loop:
        # Carrega caracteres das strings
        lb $t0, 0($a0)   # Carrega o byte atual de str1 em $t0
        lb $t1, 0($a1)   # Carrega o byte atual de str2 em $t1

        # Compara caracteres
        beq $t0, $t1, check_null    # Se os caracteres forem iguais, vai para check_null
        j end_less_greater          # Se os caracteres forem diferentes, vai para end_less_greater

    check_null:
        # Se os caracteres forem iguais e o primeiro caractere for NULL, sai do loop
        beqz $t0, end

        # Move para o próximo caractere nas strings
        addi $a0, $a0, 1   # Incrementa o endereço de str1
        addi $a1, $a1, 1   # Incrementa o endereço de str2
        j loop             # Repete o loop

    end_less_greater:
        # Se os caracteres forem diferentes, define $v0 conforme necessário
        blt $t0, $t1, less_than    # Se $t0 < $t1, define $v0 como -1
        bgt $t0, $t1, greater_than # Se $t0 > $t1, define $v0 como 1
        j end_equal                # Se os caracteres forem iguais, vai para end_equal

    less_than:
        # Se $t0 < $t1, define $v0 como -1 e sai do loop
        li $v0, -1
        j end

    greater_than:
        # Se $t0 > $t1, define $v0 como 1 e sai do loop
        li $v0, 1
        j end

    end_equal:
        # Se os caracteres forem iguais, continua para os próximos caracteres
        addi $a0, $a0, 1   # Incrementa o endereço de str1
        addi $a1, $a1, 1   # Incrementa o endereço de str2
        j loop             # Repete o loop

    end:
        jr $ra             # Retorna para a função chamadora

# Strings para testar
.data
str1: .asciiz "aaa"       # String de teste 1
str2: .asciiz "aaab"      # String de teste 2