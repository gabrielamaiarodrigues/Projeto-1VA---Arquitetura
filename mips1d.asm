# Arquitetura, Primeira VA, 2023.1
# Grupo: Gabriela Rodrigues, Hudo Leonardo, Lucas Chagas, Louise d'Athayde
# Questão: 1, letra D

# Resumo: Esse código implementa a função 'strncmp' em assembly MIPS para comparar os primeiros 'num' caracteres de duas strings.
# As strings 'str1' e 'str2' são definidas no segmento de dados.
# Na função 'main', são carregados os endereços das strings 'str1' e 'str2' nos registradores $a0 e $a1, respectivamente,
# e o valor de 'num' é carregado em $a2 para especificar quantos caracteres serão comparados.
# O código utiliza um loop para comparar caractere por caractere das strings até atingir a quantidade 'num' especificada.
# Se os caracteres forem iguais, o loop continua até comparar 'num' caracteres.
# Se os caracteres forem diferentes, o resultado é determinado pela diferença entre os caracteres encontrados.
# O resultado da comparação é armazenado em $v0 e é impresso no final do programa.


# Strings para testes
.data
str1: .asciiz "abc"   # String de teste 1
str2: .asciiz "aba"   # String de teste 2
num: .word 4          # Quantos caracteres vamos comparar

.text
main:
    # Carrega palavras (str1 = a0, str2 = a1, num = 2)
    la $a0, str1       # Carrega o endereço de 'str1' em $a0
    la $a1, str2       # Carrega o endereço de 'str2' em $a1
    lw $a2, num       # Carrega o valor de 'num' em $a2
    # Inicializa o contador
    li $t2, 0         # Inicializa o contador de caracteres

    # Chama a função strncmp
    jal strncmp

    # Imprime o resultado
    move $a0, $v0     # Move o resultado para $a0 (para imprimir)
    li $v0, 1         # Código de syscall para imprimir um inteiro
    syscall

    # Encerra o programa
    li $v0, 10        # Código de syscall para encerrar
    syscall

# Implementação da função strncmp
strncmp:
    # Inicializa o registrador de retorno $v0
    li $v0, 0

    # Loop para comparar caracteres
    loop:
        # Carrega caracteres das strings
        lb $t0, 0($a0)  # Carrega o byte atual de str1 em $t0
        lb $t1, 0($a1)  # Carrega o byte atual de str2 em $t1

        # Compara o contador com num
        beq $a2, $t2, end  # Se o contador for igual a num, vai para o final

        # Compara os caracteres
        beq $t0, $t1, check_null    # Se os caracteres forem iguais, vai para check_null
        j end_less_greater          # Se os caracteres forem diferentes, vai para end_less_greater

    check_null:
        # Se os caracteres forem iguais e o primeiro caractere for NULL, sai do loop
        beqz $t0, end

        # Move para o próximo caractere nas strings
        addi $a0, $a0, 1   # Incrementa o endereço de str1
        addi $a1, $a1, 1   # Incrementa o endereço de str2
        # Atualiza o contador
        addi $t2, $t2, 1   # Incrementa o contador de caracteres
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
