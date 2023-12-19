# Arquitetura, Primeira VA, 2023.1
# Grupo: Gabriela Rodrigues, Hudo Leonardo, Lucas Chagas, Louise d'Athayde
# Questão: 1, letra B

# Resumo: Esse código implementa a função 'memcpy' em assembly MIPS.
# A função 'memcpy' copia um número específico de bytes da origem para o destino.
# No 'main', são carregados os endereços da string de origem ('source') e da string de destino ('dest')
# nos registradores $a1 e $a0, respectivamente, e o número de bytes a serem copiados em $a2.
# A função 'memcpy' usa os registradores $t0, $t1 e $t2 para manipular os ponteiros de origem e destino
# e controlar a quantidade de bytes a serem copiados.
# O loop 'memcpy_loop' copia byte a byte da origem para o destino até atingir o número de bytes especificado.
# Após a cópia, o código retorna o endereço de destino em $v0 e retorna para a função chamadora ('main').

.data
source: .asciiz "Hello, World!"  # Origem (sequência de caracteres)
dest:   .space 20                # Destino (buffer vazio com espaço para 20 bytes)

.text
.globl main

main:
    # Carregar o endereço do source em $a1
    la $a1, source

    # Carregar o endereço do destino em $a0
    la $a0, dest

    # Carregar o número de bytes a serem copiados em $a2 (tamanho da origem)
    # Isso poderia ser calculado dinamicamente, mas vamos usar um valor fixo neste exemplo
    li $a2, 5  # Vamos copiar os primeiros 5 bytes

    # Chamar a função memcpy
    jal memcpy
    
    # Imprimir a string de destino após a cópia
    li $v0, 4
    la $a0, dest
    syscall
    
    # Fim do programa
    li $v0, 10      # Código do syscall para sair do programa
    syscall
    
# Argumentos:
# $a0: destination
# $a1: source
# $a2: num (número de bytes a serem copiados)
memcpy:
    move $t0, $a0           # $t0 = destination (ponteiro de destino)
    move $t1, $a1           # $t1 = source (ponteiro de origem)
    move $t2, $a2           # $t2 = num (número de bytes a serem copiados)

    # Loop para copiar os bytes da origem para o destino
    memcpy_loop:
        lb $t3, ($t1)      # Carregar o byte atual de source em $t3
        sb $t3, ($t0)      # Armazenar o byte atual em destination
        addi $t0, $t0, 1   # Avançar o ponteiro destination em 1 byte
        addi $t1, $t1, 1   # Avançar o ponteiro source em 1 byte
        addi $t2, $t2, -1  # Decrementar o contador de bytes restantes

        bnez $t2, memcpy_loop   # Se ainda houver bytes restantes para copiar, volte ao início do loop

    move $v0, $a0      # Retornar o endereço de destino em $v0
    jr $ra             # Retornar à função chamadora
