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
