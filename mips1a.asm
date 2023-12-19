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
