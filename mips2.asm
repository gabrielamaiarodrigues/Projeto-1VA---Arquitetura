# Arquitetura, Primeira VA, 2023.1
# Grupo: Gabriela Rodrigues, Hudo Leonardo, Lucas Chagas, Louise d'Athayde
# Questão: 2

# Resumo: # Esse código implementa a interação entre um receptor e um transmissor simulados.
# Na função 'main', o programa espera pela disponibilidade de uma tecla pressionada lendo o registrador de controle do receptor.
# Quando uma tecla está disponível, ela é lida do registrador de dados do receptor (RDR) e armazenada em $a0.
# Em seguida, o código aguarda a disponibilidade para exibição, lendo o registrador de controle do transmissor.
# Quando o transmissor está pronto para exibir, a tecla armazenada em $a0 é enviada para o registrador de dados do transmissor (TDR).
# Após isso, ocorre uma chamada de sistema para exibir a tecla pressionada.
# O programa continua esse ciclo, esperando pela próxima tecla pressionada e exibindo-a, enquanto houver interação do usuário.
# Os endereços dos registradores (RCR, RDR, TCR, TDR) são definidos como constantes no segmento de dados.

.data
    # Constantes para endereços de registradores
    # Receiver Control Register (Ready Bit)
    .eqv    RCR         0xffff0000

    # Receiver Data Register (Key Pressed - ASCII)
    .eqv    RDR         0xffff0004

    # Transmitter Control Register (Ready Bit)
    .eqv    TCR         0xffff0008

    # Transmitter Data Register (Key Displayed- ASCII)
    .eqv    TDR         0xffff000c

.text
.globl main

main:
keyWait:
    lw      $t0, RCR               # Obtém o registro de controle
    andi    $t0, $t0, 1            # Isola o bit de prontidão
    beq     $t0, $zero, keyWait    # Existe uma tecla disponível? Se não, loop

    lbu     $a0, RDR               # Obtém o valor da tecla pressionada

displayWait:
    lw      $t1, TCR               # Obtém o registro de controle
    andi    $t1, $t1, 1            # Isola o bit de prontidão
    beq     $t1, $zero, displayWait  # Está pronto para exibir? Se não, loop

    sb      $a0, TDR               # Envia a tecla para exibição

    li      $v0, 11                # Código de syscall para exibição
    syscall                        # Chama a syscall de exibição

    j       keyWait                 # Volta para esperar a próxima tecla
