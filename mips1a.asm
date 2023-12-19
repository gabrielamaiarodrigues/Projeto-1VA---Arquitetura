# Arquitetura, Primeira VA, 2023.1
# Grupo: Gabriela Rodrigues, Hudo Leonardo, Lucas Chagas, Louise d'Athayde
# Questão: 1, letra A

# Resumo: Esse código implementa a função 'strcpy' em assembly MIPS, que copia uma string de origem para uma string de destino,
# incluindo o caractere de terminação NULL ('\0').
# O código começa na função 'main', que carrega os endereços da string de origem ('source') e da string de destino ('target') nos 
# registradores $a1 e $a0, e chama a função 'strcpy' usando 'jal strcpy'.
# A função 'strcpy' inicia inicializando o registrador $v0 com o endereço de destino.
# Em seguida, um loop copia byte a byte da string de origem para a string de destino, parando quando encontra o caractere nulo ('\0').
# Após a cópia, o código retorna para a função chamadora ('main').



    .data
source: .asciiz "Hello, world!"  # A string de origem
target: .space 50                # Espaço reservado para a string de destino

    .text
    .globl main

main:
    la $a0, target               # Carrega o endereço de 'target' em $a0
    la $a1, source               # Carrega o endereço de 'source' em $a1
    jal strcpy                   # Chama a função 'strcpy'
    li $v0, 10                   # Código de saída do programa
    syscall                      # Termina o programa

strcpy:
    addu $v0, $zero, $a0         # Inicializa $v0 com o endereço de destino

loop:
    lbu $t0, 0($a1)              # Carrega o byte atual da string de origem em $t0
    sb $t0, 0($a0)               # Armazena o byte atual na string de destino
    beqz $t0, end                # Se o byte atual for NULL, termina o loop
    addiu $a0, $a0, 1            # Incrementa o endereço de destino
    addiu $a1, $a1, 1            # Incrementa o endereço de origem
    j loop                       # Volta para o início do loop

end:
    jr $ra                       # Retorna para a função chamadora
