.data
  # Strings de comando
  string_comando_conta_cadastrar: .asciiz "conta_cadastar"
  string_comando_conta_format: .asciiz "conta_format"
  string_comando_debito_extrato: .asciiz "debito_extrato"
  string_comando_credito_extrato: .asciiz "credito_extrato"
  string_comando_transferir_debito: .asciiz "transferir_debito"
  string_comando_transferir_credito: .asciiz "transferir_credito"
  string_comando_pagar_fatura: .asciiz "pagar_fatura"
  string_comando_sacar: .asciiz "sacar"
  string_comando_depositar: .asciiz "depositar"
  string_comando_alterar_limite: .asciiz "alterar_limite"
  string_comando_conta_fechar: .asciiz "conta_fechar"
  string_comando_data_hora: .asciiz "data_hora" 
  string_comando_salvar: .asciiz "salvar"
  string_comando_recarregar: .asciiz "recarregar"
  string_comando_formatar: .asciiz "formatar"
  string_comando_help: .asciiz "help"
  string_comando_sair: .asciiz "sair"



 ################# STRINGS PARA INTERAÇÃO COM O USU�?RIO #################
 
  #erros genéricos 
  string_erro_cliente_n_existe: .asciiz "Falha: cliente inexistente" 		#usado por diversos comandos.
  string_erro_saldo_insuficiente: .asciiz "Falha: saldo insuficente"		#usando pelas transferencias, pgmento de fatura
  string_comando_invalido: .asciiz "Comando invalido" 				#usando quando o usuário entrar algo que não eh um comando válido.
  string_exit: .asciiz "Obigado e volte sempre!"				#bye bye
  string_separador: .asciiz " - "
  string_reais: .asciiz "R$ "
  string_virgula: .asciiz ","
  
  string_funcao_nao_desenvolvida: .ascizz "Essa funcao ainda nao foi desenvolvida"
  
  #erros do conta_cadastrar
  string_erro_sintaxe_conta_cadastrar: .asciiz "Erro de sintaxe: conta_cadastrar-<CPF>-<numero_da_conta>-<nome_do_cliente>" 	#Acho q talvez a gente não use
  string_erro_cpf_usado_conta_cadastrar: .asciiz "Já existe conta neste CPF"
  string_erro_numero_usado_conta_cadastrar: .asciiz "Número da conta já em uso"
  string_conta_cadastrar_sucesso: .asciiz "conta cadastrada :)"

  #mensagens do conta_format
  string_erro_invalida_conta_format: .asciiz "Numero de conta não existe"
  string_confirmacao_format: .asciiz "Tem certeza que quer formatar a conta? "
  
  #erros dos extratos
  string_erro_extrato_debito: .asciiz "Número de conta inválido"
  string_erro_extrato_credito: .asciiz "Número de conta inválido"  
  
  #mensagens das transferencias
  string_sucesso_transferencia: .asciiz "Pagamento realizado com sucesso"			#para os 2 tipos de transferencias
  string_erro_transferencia_limite_insuficiente: .asciiz "Falha: limite insuficente"		#para transferencia no crédito
  
  #erros pagar_fatura
  string_erro_pagar_fatura_conta_invalida: .asciiz "Falha: cliente inexistente"

  #erro sacar
  string_erro_sacar_saldo_insuficiente: .asciiz "Falha: saldo insuficiente"
  
  #erro conta_fechar
  string_erro_conta_fechar_cpf_n_existe: .asciiz "Falha: CPF não possui cadastro"
  string_erro_conta_fechar_saldo_n_0: .asciiz "Falha: saldo devedor ainda não quitado. Saldo da conta corrente R$ " 		#tem que colocar o QUANTO TA DEVENDO
  string_erro_conta_fechar_divida_n_0: .asciiz "Falha: saldo devedor ainda não quitado. Limite de crédito devido: R$ "		#tem que colocar o QUANTO TA DEVENDO
  
  #erro data_hora
  string_erro_data_hora: .asciiz "Falha: data e/ou horas inválidas"
  
  #String help
  string_help: .asciiz "Comandos disponíveis:\n\comando: conta_cadastrar-<option1>-<option2>-<option3>\n\descricao: Realiza o cadastro de um cliente. <option1> deve fornecer o CPF do cliente (XXXXXXXXX); <option2> deve fornecer o número da conta corrente do cliente (XXXXXX); <option3> deve fornecer o nome do cliente.\n\n\comando: conta_format-<option1>\n\descricao: Apaga todos os registros de transações do cliente. <option1> deve fornecer a conta do cliente no formato XXXXXX-X (com dígito verificador).\n\n\comando: debito_extrato-<option1>\n\descricao: Fornece um relatório das transações de débito do cliente, listando cada transação, seus respectivos nomes das contas, valores e datas. <option1> deve fornecer a conta do cliente no formato XXXXXX-X.\n\n\comando: credito_extrato-<option1>\n\descricao: Fornece um relatório das transações de cartão de crédito do cliente, listando cada transação, seus respectivos nomes das contas, valores e datas. <option1> deve fornecer a conta do cliente no formato XXXXXX-X.\n\n\comando: transferir_debito-<option1>-<option2>-<option3>\n\descricao: Realiza uma transferência (crédito em conta corrente) da conta do cliente 1 para a conta do cliente 2, do valor especificado pela <option3> em centavos, na data atual.\n\n\comando: transferir_credito-<option1>-<option2>-<option3>\n\descricao: Realiza uma transferência (crédito em conta corrente) do limite de crédito do cliente 2 para a conta do cliente 1, do valor especificado pela <option3> em centavos, na data atual.\n\n\comando: pagar_fatura-<option1>-<option2>-<option3>\n\descricao: Paga parcial ou totalmente a fatura do cliente especificado na conta <option1>, com o valor especificado pela <option2> em centavos, via saldo de conta corrente ('S') ou pagamento externo ('E').\n\n\comando: sacar-<option1>-<option2>\n\descricao: Decrementa o saldo da conta especificada pela <option1> no formato XXXXXX-X, pelo valor especificado pela <option2> em centavos no formato XXXXXX.\n\n\comando: depositar-<option1>-<option2>\n\descricao: Incrementa o saldo da conta especificada pela <option1> no formato XXXXXX-X, pelo valor especificado pela <option2> em centavos no formato XXXXXX.\n\n\comando: alterar_limite-<option1>-<option2>\n\descricao: Altera o limite do cliente especificado pela conta XXXXXX-X. <option1> fornece o número da conta e <option2> o novo limite em centavos (XXXXXX).\n\n\comando: conta_fechar-<option1>\n\descricao: Encerra a conta. Apenas permitido se o saldo da conta e o saldo devedor de crédito forem nulos. Retorna 'Conta fechada com sucesso' e apaga os registros de transações.\n\n\comando: data_hora-<option1>-<option2>\n\descricao: Configura a data e hora do sistema de acordo com <option1> (DDMMAAAA) e <option2> (HHMMSS).\n\n\comando: salvar\n\descricao: Salva todas as informações registradas em um arquivo externo.\n\n\comando: recarregar\n\descricao: Recarrega as informações salvas no arquivo externo na execução atual do programa. Modificações não salvas serão perdidas e as informações salvas anteriormente recuperadas.\n\n\comando: formatar\n\descricao: Apaga todas as informações da execução atual do programa, incluindo clientes e transações."

  string_nome_do_arquivo: .asciiz "./banco.txt"
  string_salvar_sucesso: .asciiz "Dados salvos com sucesso"
  string_recarregar_sucesso: .asciiz "Dados recarregados com sucesso"  
  string_formatar_sucesso: .asciiz "Dados formatados com sucesso"

  string_prompt: .asciiz "FzoLbank-shell>> "
  buffer_input: .space 320 # Buffer para leitura de strings

  buffer_comando: .space 80 # Buffer para armazenar o comando
  buffer_parametro_1: .space 80 # Buffer para armazenar a primeira opcao
  buffer_parametro_2: .space 80 # Buffer para armazenar a segunda opcao
  buffer_parametro_3: .space 80 # Buffer para armazenar a terceira opcao

  buffer_int_to_string: .space 6 # Buffer para conversao de inteiro para string

  .align 2
  contas: .space 2700 # Espaco reservado para guardar as contas

  .align 2
  transacoes: .space 62500 # Espaco reservado para guardar as os registros

.macro print_int(%inteiro)
  li $v0, 1
  move $a0, %inteiro
  syscall 
.end_macro

.macro print_int_unsigned(%inteiro)
  li $v0, 36
  move $a0, %inteiro
  syscall 
.end_macro

.macro print_string_label(%string_label)
  li $v0, 4
  la $a0, %string_label
  syscall 
.end_macro

.macro break_line
  li $v0, 11
  li $a0, 10
  syscall
.end_macro

.macro print_string_address($string_address)
  li $v0, 4
  move $a0, $string_address
  syscall 
.end_macro

.text
  main:
    la $s0, contas # Carrega o endereco das contas
    la $s1, transacoes # Carrega o endereco das transacoes

    jal recarregar

    main_loop:
      print_string_label(string_prompt) # Imprime o prompt
      li $v0, 8 # Le a string
      la $a0, buffer_input # Carrega o endereco do buffer
      li $a1, 100 # Carrega o tamanho do buffer
      syscall

      la $a0, buffer_input # Carrega o endereco do buffer
      jal processar_comando # Chama a funcao processar_comando

      j main_loop


  # Funcao processar_comando, processa o comando digitado pelo usuario
  processar_comando:
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $ra, 0($sp) # Salva o endereco de retorno na pilha
    la $a0, buffer_input # Carrega o endereco do buffer de entrada
    la $a1, buffer_comando # Carrega o endereco do buffer de comando
    jal extrai_comando_ou_argumento # Chama a funcao extrai_comando_ou_argumento para extrair o comando digitado pelo usuario
    lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
    addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

    la $t0, buffer_comando # Carrega o endereco do buffer de comando
    lb $t0, 0($t0) # Carrega o primeiro byte do buffer de comando
    beq $t0, 0, comando_invalido # Se o primeiro byte for 0, o comando e invalido
    beq $v1, 1, detectar_comando

    addi $a0, $v0, 1 # Salva o endereco de onde comeca o argumento 1
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $ra, 0($sp) # Salva o endereco de retorno na pilha
    la $a1, buffer_parametro_1 # Carrega o endereco do buffer de opcao 1
    jal extrai_comando_ou_argumento # Chama a funcao extrai_comando_ou_argumento para extrair o argumento 1
    lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
    addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

    la $t0, buffer_parametro_1 # Carrega o endereco do buffer de opcao 1
    lb $t0, 0($t0) # Carrega o primeiro byte do buffer de opcao 1
    beq $v1, 1, detectar_comando

    addi $a0, $v0, 1 # Salva o endereco de onde comeca o argumento 2
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $ra, 0($sp) # Salva o endereco de retorno na pilha
    la $a1, buffer_parametro_2 # Carrega o endereco do buffer de opcao 2
    jal extrai_comando_ou_argumento # Chama a funcao extrai_comando_ou_argumento para extrair o argumento 2
    lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
    addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

    la $t0, buffer_parametro_2 # Carrega o endereco do buffer de opcao 2
    lb $t0, 0($t0) # Carrega o primeiro byte do buffer de opcao 2
    beq $v1, 1, detectar_comando

    addi $a0, $v0, 1 # Salva o endereco de onde comeca o argumento 3
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $ra, 0($sp) # Salva o endereco de retorno na pilha
    la $a1, buffer_parametro_3 # Carrega o endereco do buffer de opcao 3
    jal extrai_comando_ou_argumento # Chama a funcao extrai_comando_ou_argumento para extrair o argumento 3
    lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
    addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

    detectar_comando:
      # Compara o comando digitado pelo usuario com os comandos possiveis
      # Comando conta_cadastrar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_conta_cadastrar # Carrega o endereco da string com o comando conta_cadastrar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando conta_cadastrar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_conta_cadastrar # Se o comando digitado for igual ao comando conta_cadastrar, chama a funcao conta_cadastrar

      # Comando conta_format
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_conta_format # Carrega o endereco da string com o comando conta_format
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando conta_format
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha   
      beq $v0, $0, chama_conta_format # Se o comando digitado for igual ao comando conta_format, chama a funcao conta_format

      # Comando debito_extrato
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_debito_extrato # Carrega o endereco da string com o comando debito_extrato
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando debito_extrato
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_debito_extrato # Se o comando digitado for igual ao comando debito_extrato, chama a funcao debito_extrato

      # Comando credito_extrato
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_credito_extrato # Carrega o endereco da string com o comando credito_extrato
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando credito_extrato
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_credito_extrato # Se o comando digitado for igual ao comando credito_extrato, chama a funcao credito_extrato

      # Comando transferir_debito
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_transferir_debito # Carrega o endereco da string com o comando transferir_debito
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando transferir_debito
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_transferir_debito # Se o comando digitado for igual ao comando transferir_debito, chama a funcao transferir_debito

      # Comando transferir_credito
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_transferir_credito # Carrega o endereco da string com o comando transferir_credito
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando transferir_credito
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_transferir_credito # Se o comando digitado for igual ao comando transferir_credito, chama a funcao transferir_credito

      # Comando pagar_fatura
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_pagar_fatura # Carrega o endereco da string com o comando pagar_fatura
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando pagar_fatura
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_pagar_fatura # Se o comando digitado for igual ao comando pagar_fatura, chama a funcao pagar_fatura

      # Comando sacar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_sacar # Carrega o endereco da string com o comando sacar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando sacar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_sacar # Se o comando digitado for igual ao comando sacar, chama a funcao sacar

      # Comando depositar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_depositar # Carrega o endereco da string com o comando depositar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando depositar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_depositar # Se o comando digitado for igual ao comando depositar, chama a funcao depositar

      # Comando alterar_limite
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_alterar_limite # Carrega o endereco da string com o comando alterar_limite
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando alterar_limite
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_alterar_limite # Se o comando digitado for igual ao comando alterar_limite, chama a funcao alterar_limite

      # Comando conta_fechar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_conta_fechar # Carrega o endereco da string com o comando conta_fechar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando conta_fechar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_conta_fechar # Se o comando digitado for igual ao comando conta_fechar, chama a funcao conta_fechar
      
      # Comando data_hora
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_data_hora # Carrega o endereco da string com o comando data_hora
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando data_hora
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_data_hora # Se o comando digitado for igual ao comando data_hora, chama a funcao data_hora

      # Comando salvar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_salvar # Carrega o endereco da string com o comando salvar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando salvar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_salvar # Se o comando digitado for igual ao comando salvar, chama a funcao salvar

      # Comando recarregar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_recarregar # Carrega o endereco da string com o comando recarregar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando recarregar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_recarregar # Se o comando digitado for igual ao comando recarregar, chama a funcao recarregar

      # Comando formatar
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_formatar # Carrega o endereco da string com o comando formatar
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando formatar
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_formatar # Se o comando digitado for igual ao comando formatar, chama a funcao formatar

      # Comando help
      addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
      sw $ra, 0($sp) # Salva o endereco de retorno na pilha
      la $a0, buffer_comando # Carrega o endereco do buffer de comando
      la $a1, string_comando_help # Carrega o endereco da string com o comando help
      jal strcmp # Chama a funcao strcmp para comparar o comando digitado pelo usuario com o comando help
      lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
      addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
      beq $v0, $0, chama_help # Se o comando digitado for igual ao comando help, chama a funcao help

      comando_invalido:
        # Comando invalido
        print_string_label(string_comando_invalido) # Imprime a string comando invalido
        break_line
        jr $ra # Retorna para o endereco de retorno

      chama_conta_cadastrar:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com o cpf
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com o cpf
        beq $t1, $0, erro_sintaxe_conta_cadastrar # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com o cpf para o registrador a0

        la $t0, buffer_parametro_2 # Carrega o endereco da string com o numero da conta
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com o numeroda conta
        beq $t1, $0, erro_sintaxe_conta_cadastrar # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a1, $t0 # Move a string com o numero da conta para o registrador a1 

        la $t0, buffer_parametro_3 # Carrega o endereco da string com o nome
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com o nome
        beq $t1, $0, erro_sintaxe_conta_cadastrar # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a2, $t0 # Move a string como nome para o registrador a2

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal conta_cadastrar # Chama a funcao conta_cadastrar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_conta_cadastrar:
          print_string_label(string_erro_conta_fechar_cpf_n_existe) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_conta_format:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_conta_format # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal conta_format # Chama a funcao conta_format
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_conta_format:
          print_string_label(string_erro_invalida_conta_format) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_debito_extrato:
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal debito_extrato # Chama a funcao debito_extrato
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

      chama_credito_extrato:
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal credito_extrato # Chama a funcao credito_extrato
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

      chama_transferir_debito:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_transferir_debito # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        la $t0, buffer_parametro_2 # Carrega o endereco da string com a opcao 2
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 2
        beq $t1, $0, erro_sintaxe_transferir_debito # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a1, $t0 # Move a string com a opcao 2 para o registrador a1

        la $t0, buffer_parametro_3 # Carrega o endereco da string com a opcao 3
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 3
        beq $t1, $0, erro_sintaxe_transferir_debito # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a2, $t0 # Move a string com a opcao 3 para o registrador a2

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal transferir_debito # Chama a funcao transferir_debito
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_transferir_debito:
          print_string_label(string_erro_saldo_insuficiente) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_transferir_credito:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_transferir_credito # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        la $t0, buffer_parametro_2 # Carrega o endereco da string com a opcao 2
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 2
        beq $t1, $0, erro_sintaxe_transferir_credito # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a1, $t0 # Move a string com a opcao 2 para o registrador a1

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal transferir_credito # Chama a funcao transferir_credito
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_transferir_credito:
          print_string_label(string_erro_transferencia_limite_insuficiente) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_pagar_fatura:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_pagar_fatura # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        la $t0, buffer_parametro_2 # Carrega o endereco da string com a opcao 2
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 2
        beq $t1, $0, erro_sintaxe_pagar_fatura # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a1, $t0 # Move a string com a opcao 2 para o registrador a1

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal pagar_fatura # Chama a funcao pagar_fatura
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_pagar_fatura:
          print_string_label(string_erro_pagar_fatura_conta_invalida) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_sacar:
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal sacar # Chama a funcao sacar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

      chama_depositar:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_depositar # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal depositar # Chama a funcao depositar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_depositar:
          print_string_label(string_erro_cliente_n_existe) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_alterar_limite:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_alterar_limite # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        la $t0, buffer_parametro_2 # Carrega o endereco da string com a opcao 2
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 2
        beq $t1, $0, erro_sintaxe_alterar_limite # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a1, $t0 # Move a string com a opcao 2 para o registrador a1

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal alterar_limite # Chama a funcao alterar_limite
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_alterar_limite:
          print_string_label(string_erro_cliente_n_existe) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

      chama_conta_fechar:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_conta_fechar # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal conta_fechar # Chama a funcao conta_fechar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

        erro_sintaxe_conta_fechar:
          print_string_label(string_erro_conta_fechar_saldo_n_0) # Imprime a string de erro de sintaxe
          break_line
          j fim_interpretador

	
       chama_data_hora:
        la $t0, buffer_parametro_1 # Carrega o endereco da string com a opcao 1
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 1
        beq $t1, $0, erro_sintaxe_alterar_limite # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a0, $t0 # Move a string com a opcao 1 para o registrador a0

        la $t0, buffer_parametro_2 # Carrega o endereco da string com a opcao 2
        lb $t1, 0($t0) # Carrega o primeiro caractere da string com a opcao 2
        beq $t1, $0, erro_sintaxe_alterar_limite # Se o primeiro caractere for \0, imprime mensagem de erro
        move $a1, $t0 # Move a string com a opcao 2 para o registrador a1	
     
      chama_salvar:
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal salvar # Chama a funcao salvar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador
      
      chama_recarregar:
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal recarregar # Chama a funcao salvar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

      chama_formatar:
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal formatar # Chama a funcao formatar
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
        j fim_interpretador

      chama_help:
        print_string_label(string_help) # Imprime a string de ajuda
        break_line
        j fim_interpretador

      fim_interpretador:
        # Limpar os buffers de comando, opcao 1, opcao 2 e opcao 3
        la $a0, buffer_comando # Carrega o endereco do buffer de comando
        li $a1, 80 # Carrega o tamanho do buffer de comando
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal limpar_buffer # Chama a funcao limpar_buffer
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

        la $a0, buffer_parametro_1 # Carrega o endereco do buffer de opcao 1
        li $a1, 80 # Carrega o tamanho do buffer de opcao 1
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal limpar_buffer # Chama a funcao limpar_buffer
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

        la $a0, buffer_parametro_2 # Carrega o endereco do buffer de opcao 2
        li $a1, 80 # Carrega o tamanho do buffer de opcao 2
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal limpar_buffer # Chama a funcao limpar_buffer
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

        la $a0, buffer_parametro_3 # Carrega o endereco do buffer de opcao 3
        li $a1, 80 # Carrega o tamanho do buffer de opcao 3
        addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
        sw $ra, 0($sp) # Salva o endereco de retorno na pilha
        jal limpar_buffer # Chama a funcao limpar_buffer
        lw $ra, 0($sp) # Carrega o endereco de retorno da pilha
        addi $sp, $sp, 4 # Incrementa o ponteiro de pilha

        jr $ra # Retorna para o endereco de retorno

  # Funcao limpar_buffer, limpa o buffer de entrada
  # Argumentos:
  # $a0: endereco do buffer de entrada
  # $a1: tamanho do buffer de entrada
  limpar_buffer:
    move $t0, $a0 # Salva o endereco do buffer
    add $t1, $a0, $a1 # Soma o endereco do buffer com o tamanho do buffer
    limpar_buffer_loop:
      beq $t0, $t1, limpar_buffer_fim # Se o endereco do buffer for igual ao endereco final, termina o loop
      sb $0, 0($t0) # Limpa o byte do buffer
      addi $t0, $t0, 1 # Incrementa o endereco do buffer
      j limpar_buffer_loop # Volta para o inicio do loop

    limpar_buffer_fim:
      jr $ra # Retorna para o endereco de retorno

  # Funcao extrai_comando_ou_argumento, extrai o comando digitado pelo usuario
  # Argumentos:
  # $a0: endereco do buffer de entrada
  # $a1: endereco do buffer de saida
  # Retorna:
  # $v0: endereco de onde parou de ler o buffer de entrada
  # $v1: booleano, indicando se a string de entrada detectar_comando (\n ou \0) (1: detectar_comando, 0: nao detectar_comando)
  extrai_comando_ou_argumento:
    move $t0, $a0 # Salva o endereco do buffer de entrada em $t0
    move $t1, $a1 # Salva o endereco do buffer de saida em $t1
    li $v1, 0 # Inicializa o booleano com 0

    extrai_comando_ou_argumento_loop:
      lb $t2, 0($t0) # Carrega o byte do buffer de entrada
      beq $t2, 45, extrai_comando_ou_argumento_loop_fim # Se o byte for igual a '-', vai para o fim do loop
      beq $t2, 10, extrai_comando_ou_argumento_loop_fim_detectar_comando # Se o byte for igual a '\n', vai para o fim do loop
      beq $t2, $0, extrai_comando_ou_argumento_loop_fim_detectar_comando # Se o byte for igual a '\0', vai para o fim do loop
      sb $t2, 0($t1) # Salva o byte no buffer de comando
      addi $t0, $t0, 1 # Incrementa o endereco do buffer de entrada
      addi $t1, $t1, 1 # Incrementa o endereco do buffer de comando
      j extrai_comando_ou_argumento_loop # Volta para o inicio do loop
    extrai_comando_ou_argumento_loop_fim_detectar_comando:
      li $v1, 1 # Seta o booleano para 1
    
    extrai_comando_ou_argumento_loop_fim:
      sb $0, 0($t1) # Salva o byte '\0' no buffer de comando
      move $v0, $t0 # Salva o endereco de onde parou de ler o buffer de entrada em $v0
      jr $ra # Retorna para o endereco de retorno
    
#FUNCAO CRIAR CONTA
  # $a2: nome
  conta_cadastrar:
    addi $sp, $sp, -4 # Alocando espaco na pilha para salvar o endereco de retorno
    sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
    jal verifica_cpf_invalido # Chama funcao para verificar se o cpf eh valido
    lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
    addi $sp, $sp, 4 # Devolvendo o espaco da pilha
        
    move $t1, $v0 # Salva o boooleano se o cpf eh valido ou nao em $t1 (1: valido, 0: invalido)
    beq $t1, $0, conta_cadastrar_erro_cpf_invalido # Se o cpf for invalido, imprime a mensagem de erro e sai da funcao
    move $t0, $v1 # Salva o cpf em t0
    
    addi $sp, $sp, -4 # Alocando espaco na pilha para salvar o endereco de retorno
    sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
    jal verificar_numero_conta_invalido # Chama funcao para verificar se o cpf eh valido
    lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
    addi $sp, $sp, 4 # Devolvendo o espaco da pilha
    
    move $t1, $v0 # Salva o boooleano se o cpf eh valido ou nao em $t1 (1: valido, 0: invalido)
    beq $t1, $0, conta_cadastrar_erro_numero_invalido # Se o numero da conta for invalido, imprime a mensagem de erro e sai da funcao
    move $t1, $v1 # Salva o numero da conta em t1
    
    move $a0,$t0
    move $a1,$t1
    
    # Verificar se o cpf ja esta cadastrado
    move $t2, $s0 # Carrega o endereco das contas em $t2
    addi $t4, $s0, 2700 # Carrega o endereco do final do contas em $t4

    verifica_cpf_cadastrado_loop:
      beq $t2, $t4, conta_cadastrar_cpf_nao_cadastrado # Se o endereco atual for igual ao final de contas, o cpf nao esta cadastrado, continua a execucao

      lb $t3, 0($t2) # Carrega o valor do cpf em $t3

      beq $t3, $t0, conta_cadastrar_cpf_ja_cadastrado # Se o valor do cpf for igual ao cpf a ser cadastrado, o cpf ja esta cadastrado, imprime a mensagem de erro e sai da funcao
      beq $t3, $t1, conta_cadastrar_cpf_ja_cadastrado # Se o valor do cpf for igual ao numero da conta a ser cadastrado, o numero da conta ja esta cadastrado, imprime a mensagem de erro e sai da funcao

      addi $t2, $t2, 54 # Carrega o endereco do proximo cpf em $t1

      j verifica_cpf_cadastrado_loop # Reinicia o loop

    conta_cadastrar_cpf_nao_cadastrado:
      # Adicionar o cliente ao contas
      li $t5, 54 # Carrega o tamanho de uma $t5
      add $t9,$s0,$zero
      #loop_endereco:
        #beqz 0($t9), sair_loop_endereco
        #add $t9, $t9,$t5
        #j loop_endereco
      
      #sair_loop_endereco:
         #add $t2, $s0, $t9 # Carrega o endereco da conta em $t2
         #move $t7,$a1 #guarda o a1 numa temporaria
	 
	 #addi $sp, $sp, -8 # Alocando espaco na pilha para salvar o endereco de retorno
         #sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
         #sw $a1, 4($sp) # Salvando o preco na pilha
      	 ## Adiciona o nome do cliente em contas
      	 #addi $a1, $a2, 0 # Carrega o endereco do nome recebido em $a1
      	 #addi $a0, $t2, 12 # Carrega o endereco do nome em $a0
     	 
      	 #jal strcpy # Chama a funcao strcpy para copiar o nome para as contas

      	 #lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
      	 #lw $a1, 4($sp) # Recuperando o preco da pilha
      	 #addi $sp, $sp, 8 # Devolvendo o espaco da pilha	

      # Adiciona o preco do cliente em contas
      #addi $t1, $t1, 48 # Carrega o endereco do preco em $t1

      #addi $sp, $sp, -8 # Alocando espaco na pilha para salvar o endereco de retorno
      #sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
      #sw $t1, 4($sp) # Salvando o endereco do preco na pilha

      # Transformando o preco para inteiro
      #move $a0, $a1 # Carrega o preco em $a0
      #jal string_to_int # Chama a funcao string_to_int para converter o preco para inteiro

      #lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
      #lw $t1, 4($sp) # Recuperando o endereco do preco da pilha
      #addi $sp, $sp, 8 # Devolvendo o espaco da pilha

      #move $t4, $v0 # Salva o valor convertido em $t4
      #sw $t4, 0($t1) # Salva o preco em contas

      print_string_label(string_conta_cadastrar_sucesso) # Imprime a mensagem de sucesso
      break_line
      jr $ra # Sai da funcao

    conta_cadastrar_erro_cpf_invalido:
      print_string_label(string_erro_cpf_usado_conta_cadastrar)
      break_line
      jr $ra #sai da funcao

     
    conta_cadastrar_erro_numero_invalido:
      print_string_label(string_erro_numero_usado_conta_cadastrar)
      break_line
      jr $ra #sai da funcao
    
    conta_cadastrar_cpf_ja_cadastrado:
      print_string_label(string_erro_numero_usado_conta_cadastrar)
      break_line
      jr $ra #sai da funcao
      
  conta_format:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao
    
  debito_extrato:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao   
    
  credito_extrato:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  transferir_debito:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  transferir_credito:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  pagar_fatura:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  sacar:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  depositar:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  alterar_limite:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  conta_fechar:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao 
    
  data_hora:
    print_string_label(string_funcao_nao_desenvolvida)
    break_line
    jr $ra #sai da funcao                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  # Funcao salvar que salva um arquivo com os dados do sistema
  salvar:
    # Abre o arquivo para escrita
    li $v0, 13 # Carrega o cpf da funcao open em $v0
    la $a0, string_nome_do_arquivo # Carrega o endereco da string com o nome do arquivo em $a0
    li $a1, 1 # Carrega o modo de escrita do arquivo em $a1
    li $a2, 0 # Carrega as permissoes do arquivo em $a2
    syscall
    move $t0, $v0 # Salva o descritor do arquivo em $t0

    # Escreve os dados do sistema no arquivo
    li $v0, 15 # Carrega o cpf da funcao write em $v0
    move $a0, $t0 # Carrega o descritor do arquivo em $a0
    la $a1, contas # Carrega o endereco das contas em $a1
    li $a2, 2700 # Carrega o tamanho das contas em $a2
    syscall # Salva o arquivo

    # Fecha o arquivo
    li $v0, 16 # Carrega o cpf da funcao close em $v0
    move $a0, $t0 # Carrega o descritor do arquivo em $a0
    syscall # Fecha o arquivo

    print_string_label(string_salvar_sucesso)
    break_line

    jr $ra # Retorna para a funcao que chamou

  # Funcao recarregar que carrega os dados do sistema de um arquivo
  recarregar:
    # Abre o arquivo para leitura
    li $v0, 13 # Carrega o cpf da funcao open em $v0
    la $a0, string_nome_do_arquivo # Carrega o endereco da string com o nome do arquivo em $a0
    li $a1, 0 # Carrega o modo de leitura do arquivo em $a1
    syscall
    move $t0, $v0 # Salva o descritor do arquivo em $t0

    # Caso o arquivo nao exista, sai da funcao
    li $t1, 0xFFFFFFFF # Carrega o valor -1 em $t1
    beq $t0, $t1, recarregar_erro_arquivo_nao_encontrado # Se o descritor do arquivo for igual a -1 sai da funcao

    # Le os dados do arquivo
    li $v0, 14 # Carrega o cpf da funcao read em $v0
    move $a0, $t0 # Carrega o descritor do arquivo em $a0
    la $a1, contas # Carrega o endereco da conta em $a1
    li $a2, 2700 # Carrega o tamanho da conta em $a2
    syscall # Le o arquivo

    # Fecha o arquivo
    li $v0, 16 # Carrega o cpf da funcao close em $v0
    move $a0, $t0 # Carrega o descritor do arquivo em $a0
    syscall # Fecha o arquivo

    print_string_label(string_recarregar_sucesso)
    break_line

    jr $ra # Retorna para a funcao que chamou

    recarregar_erro_arquivo_nao_encontrado:
      jr $ra

  # Funcao formatar, formata o limpando todos os dados do sistema
  formatar:
    move $t1, $s0 # Carrega o endereco das contas em $t1
    addi $t2, $s0, 2420 # Carrega o endereco do final das contas em $t2

    formatar_loop:
      beq $t1, $t2, formatar_fim # Se o endereco atual for igual ao final das contas, termina a execucao

      sb $0, 0($t1) # Preenche o byte atual com 0

      addi $t1, $t1, 1 # Carrega o endereco do proximo byte

      j formatar_loop  # Reinicia o loop

    formatar_fim:
      print_string_label(string_formatar_sucesso)
      break_line
      jr $ra # Retorna para a funcao que chamou

  # Funcao que recebe uma string com um inteiro escrito e retorna o valor como inteiro
  # $a0: endereco de memoria da string
  # Retorna:
  # $v0: o numero inteiro
  string_to_int:
    addi $v0, $0, 0 # Iniciar o acumulador em 0
    addi $t1, $0, 10 # Carregando 10 ('\n') para comparar com o caractere 
    
    string_to_int_loop:
      lb $t0, 0($a0) # Carregando o caractere atual da string
      beq $t0, $0, string_to_int_loop_end # Se o caractere for '\0' sai do loop
      beq $t0, $t1, string_to_int_loop_end # Se o caractere for '\n' sai do loop

      mul $t2, $v0, $t1 # Multiplicando o acumulador por 10 (aproveitando que o valor de $t1 ja eh 10)
      subi $t3, $t0, 48 # Convertendo o caractere para inteiro
      add $v0, $t2, $t3 # Atualizando o valor do acumulador
      
      addi $a0, $a0, 1 # Incrementando o endereco da string
      j string_to_int_loop

    string_to_int_loop_end:
      jr $ra
  
  # Funcao int_to_string, que recebe um numero inteiro e transforma em uma string
  # Argumentos:
  # $a0: numero inteiro
  # Retorna:
  # $v0: endereco de memoria da string
  # $v1: tamanho da string
  int_to_string:
    li $t0, 5 # Carrega o tamanho maximo da string
    li $t1, 10000 # Carrega o divisor
    li $t2, 2 # Carrega o tamanho minimo da string
    move $t3, $a0 # Carrega o numero para $t3
    int_to_string_size_loop:
      beq $t0, $t2, int_to_string_size_loop_end # Se o tamanho da string for igual a 2, sai do loop
      div $a0, $t1 # Divide o numero pelo divisor
      mflo $t4 # Carrega o quociente para $t4
      mfhi $t3 # Carrega o resto para $t3

      bne $t4, $0, int_to_string_size_loop_end # Se o quociente for diferente de 0, sai do loop

      subi $t0, $t0, 1 # Decrementa o tamanho da string
      div $t1, $t1, 10 # Divide o divisor por 10

      j int_to_string_size_loop # Volta para o inicio do loop
    int_to_string_size_loop_end:
      move $v1, $t0 # Carrega o tamanho da string para $v1
      la $t3, buffer_int_to_string # Carrega o endereco do buffer para $t3
      move $t4, $a0 # Carrega o numero para $t4
      int_to_string_loop:
        beq $t1, $0, int_to_string_loop_end # Se o divisor for igual a 0, sai do loop
        div $t4, $t1 # Divide o numero pelo divisor
        mflo $t5 # Carrega o quociente para $t5
        mfhi $t4 # Carrega o resto para $t4
        addi $t5, $t5, 48 # Converte o quociente para o caractere correspondente
        sb $t5, 0($t3) # Salva o caractere no buffer
        addi $t3, $t3, 1 # Incrementa o endereco do buffer
        div $t1, $t1, 10 # Divide o divisor por 10
        j int_to_string_loop # Volta para o inicio do loop
      int_to_string_loop_end:
        sb $0, 0($t3) # Salva o caractere nulo no buffer
        la $v0, buffer_int_to_string # Carrega o endereco do buffer para $v0
        jr $ra # Retorna para a funcao que chamou

strcmp:
    # Inicializa o registrador de retorno $v0
    li $v0, 0

    # Loop para comparar caracteres
    strcmp_loop:
        # Carrega caracteres das strings
        lb $t0, 0($a0)   # Carrega o byte atual de str1 em $t0
        lb $t1, 0($a1)   # Carrega o byte atual de str2 em $t1

        # Compara caracteres
        beq $t0, $t1, check_null    # Se os caracteres forem iguais, vai para check_null
        j end_less_greater          # Se os caracteres forem diferentes, vai para end_less_greater

    check_null:
        # Se os caracteres forem iguais e o primeiro caractere for NULL, sai do loop
        beqz $t0, end

        # Move para o pr�ximo caractere nas strings
        addi $a0, $a0, 1   # Incrementa o endere�o de str1
        addi $a1, $a1, 1   # Incrementa o endere�o de str2
        j strcmp_loop             # Repete o loop

    end_less_greater:
        # Se os caracteres forem diferentes, define $v0 conforme necess�rio
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
        # Se os caracteres forem iguais, continua para os pr�ximos caracteres
        addi $a0, $a0, 1   # Incrementa o endere�o de str1
        addi $a1, $a1, 1   # Incrementa o endere�o de str2
        j loop             # Repete o loop

    end:
        jr $ra             # Retorna para a fun��o chamadora

  # Funcao que recebe um endereco de string e retorna o tamanho da string
  # Argumentos:
  # $a0: endereco da string
  # Retorna:
  # $v0: tamanho da string
  strlen:
    move $v0, $a0 # Carrega o endereco inicial da string para $v0
    strlen_loop:
      lb $t0, 0($a0) # Carregar o byte da string
      beq $t0, $0, strlen_loop_end # Se o caractere em $t0 for 0, terminar a funcao
      addi $a0, $a0, 1 # Incrementar o endereco da string
      j strlen_loop # Voltar para o inicio do loop
    strlen_loop_end:
      sub $v0, $a0, $v0 # Subtrair os enderecos para saber o tamanho
      jr $ra
  
  # Argumentos:
# $a1: endereco de memoria da string com o numero da conta
# Retorna:
# $v0: 1 se o cpf for valido, 0 se nao for
# $v1: numero da conta
  verificar_numero_conta_invalido:
	
    li $t1, 0 #inicia nosso contador
    move $v1, $a1 # carregando o numero da conta em t9
    li $v0, 1 #cria por default um retorno positivo
    
    verificar_numero_conta_loop:
      lb $t2, 0($a1)        # Carrega o caractere da string em $t2
      beqz $t2, verificar_numero_conta_end     # Se o caractere for zero (fim da string), saia do loop
      addi $t1, $t1, 1       # Incrementa o contador t1
      addi $a1, $a1, 1       # Avan�a para o pr�ximo caractere da string
      j verificar_numero_conta_loop 
        
    verificar_numero_conta_end:
      li $t3,6
      bne $t1, $t3, verifica_numero_conta_invalido_erro # Se for, imprime a mensagem de erro e sai da funcao
    
    j verifica_numero_conta_invalido_endTRUE
        
    verifica_numero_conta_invalido_erro:
      li $v0, 0 # Atualiza o retorno para 0

    verifica_numero_conta_invalido_endTRUE:
      #move $a0,$t9
      #addi $sp, $sp, -4 # Alocando espaco na pilha para salvar o endereco de retorno
      #sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
      #jal calcdigitosete # Chama funcao para verificar se o cpf eh valido
      #lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
      #addi $sp, $sp, 4 # Devolvendo o espaco da pilha
      
      #addi $sp, $sp, -4 # Alocando espaco na pilha para salvar o endereco de retorno
      #sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
      #move $a0,$t9
      #la $a1,hifen
      #jal strcat # Chama funcao para verificar se o cpf eh valido
      #lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
      #addi $sp, $sp, 4 # Devolvendo o espaco da pilha
      
      #addi $sp, $sp, -4 # Alocando espaco na pilha para salvar o endereco de retorno
      #sw $ra, 0($sp) # Salvando o endereco de retorno na pilha
      #move $a0,$v0
      #move $a1,$v1
      #jal strcat # Chama funcao para verificar se o cpf eh valido
      #lw $ra, 0($sp) # Recuperando o endereco de retorno da pilha
      #addi $sp, $sp, 4 # Devolvendo o espaco da pilha
      li $v0,1
      jr $ra # Retorna para a funcao que chamou
  
# Argumentos:
# $a0: endereco de memoria da string com o cpf do cliente
# Retorna:
# $v0: 1 se o cpf for valido, 0 se nao for
# $v1: cpf do cliente
  verifica_cpf_invalido:
	
    li $t1, 0 #inicia nosso contador
    move $v1, $a0 # carregando o cpf em v1
    li $v0, 1 #cria por default um retorno positivo
    
    verificar_cpf_loop:
      lb $t2, 0($a0)        # Carrega o caractere da string em $t2
      beqz $t2, verificar_cpf_end     # Se o caractere for zero (fim da string), saia do loop
      addi $t1, $t1, 1       # Incrementa o contador t1
      addi $a0, $a0, 1       # Avan�a para o pr�ximo caractere da string
      j verificar_cpf_loop 
    
    
    verificar_cpf_end:
      li $t3,11
      bne $t1, $t3, verifica_cpf_invalido_erro # Se for, imprime a mensagem de erro e sai da funcao
    
    j verifica_cpf_invalido_endTRUE
        
    verifica_cpf_invalido_erro:
      li $v0, 0 # Atualiza o retorno para 0

    verifica_cpf_invalido_endTRUE:
      jr $ra # Retorna para a funcao que chamou
  
#recebe em a0 uma string de #conta
#retorna em v1 uma string de DV
#calcdigitosete:
    #li $t1, 2            # Set $t1 to 2 for the multiplier

    #calcdigitosete_loop:
        #lb $t2, 0($a0)      # Load the byte from the string
        #beqz $t2, calcdigitosete_done  # If null terminator is reached, exit loop
        #sub $t2, $t2, 48     # Convert ASCII to integer ('0' has ASCII value 48)
        #mul $t2, $t2, $t1   # Multiply the current digit by the multiplier
        #add $v1, $v1, $t2   # Add to the result
        #addi $a0, $a0, 1    # Move to the next character in the string
        #addi $t1, $t1, 1    # Increment the multiplier
        #j calcdigitosete_loop

    #calcdigitosete_done:
        #remu $v1, $v1, 11    # Calculate the result after mod 11, store it in $t3
        #beq $v1, 10, calcdigitosete_convert  # If remainder is 10, jump to calcdigitosete_convert
        #addi $v1,$v1,48
        #jr $ra               # Jump to the address stored in $ra

#calcdigitosete_convert:
    #li $v1, 88            # seta v1 para 88 q e x em ascii
    #jr $ra               # Jump to the address stored in $ra

strcpy:
    addu $v0, $zero, $a0         # Inicializa $v0 com o endere�o de destino

    loop:
     lbu $t0, 0($a1)              # Carrega o byte atual da string de origem em $t0
     sb $t0, 0($a0)               # Armazena o byte atual na string de destino
     beqz $t0, strcpy_end                # Se o byte atual for NULL, termina o loop
     addiu $a0, $a0, 1            # Incrementa o endere�o de destino
     addiu $a1, $a1, 1            # Incrementa o endere�o de origem
     j loop                       # Volta para o in�cio do loop

    strcpy_end:
     jr $ra 
     
  exit:
    print_string_label(string_exit) # Imprime "exit"
    li $v0, 10 # Escolher a funcao do syscall (exit)
    syscall # Encerrar o programa
