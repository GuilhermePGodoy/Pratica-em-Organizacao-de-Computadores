msg_venceu: string "Voce venceu!"
msg_perdeu: string "Voce perdeu"
msg_jogarDeNovo: string "Jogar de novo?"
msg_SimOuNao: string "s/n"

cont : var #1 ;Contador de ciclos.

colunaPassaro : var #1 ;Coluna que o pássaro fica.
;Guardando o número da coluna na variável.

; Vetor de números "aleatórios" para a posição da abertura do obstáculo.
randR2 : var #25

static randR2 + #0, #799
static randR2 + #1, #439
static randR2 + #2, #279
static randR2 + #3, #239
static randR2 + #4, #559
static randR2 + #5, #759
static randR2 + #6, #479
static randR2 + #7, #399
static randR2 + #8, #879
static randR2 + #9, #519
static randR2 + #10, #839
static randR2 + #11, #679
static randR2 + #12, #359
static randR2 + #13, #79
static randR2 + #14, #959
static randR2 + #15, #159
static randR2 + #16, #199
static randR2 + #17, #319
static randR2 + #18, #39
static randR2 + #19, #599
static randR2 + #20, #639
static randR2 + #21, #719
static randR2 + #22, #999
static randR2 + #23, #919
static randR2 + #24, #119

randR3 : var #25

static randR3 + #0, #919
static randR3 + #1, #839
static randR3 + #2, #399
static randR3 + #3, #199
static randR3 + #4, #159
static randR3 + #5, #319
static randR3 + #6, #519
static randR3 + #7, #639
static randR3 + #8, #439
static randR3 + #9, #879
static randR3 + #10, #599
static randR3 + #11, #679
static randR3 + #12, #479
static randR3 + #13, #119
static randR3 + #14, #559
static randR3 + #15, #119
static randR3 + #16, #79
static randR3 + #17, #999
static randR3 + #18, #279
static randR3 + #19, #799
static randR3 + #20, #239
static randR3 + #21, #759
static randR3 + #22, #719
static randR3 + #23, #959
static randR3 + #24, #359

posRandR2 : var #1 ; Variável que armazena a próxima posição a ser lida de 'randR2'.


posRandR3 : var #1 ; Variável que armazena a próxima posição a ser lida de 'randR3'.

jmp main

apagaEsquerda:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	loadn r0, #0 ;Coluna.
	loadn r1, #1 ;Coluna.
	loadn r2, #30 ;Condição de parada.
	loadn r3, #0 ;Contador.
	loadn r4, #' ' ;Caractere a ser impresso.
	loadn r5, #40 ;Incremento na posição.


loopApagaEsquerda:
	outchar r4, r0
	outchar r4, r1

	inc r3 ;Incrementa contador.

	add r0, r0, r5
	add r1, r1, r5

	cmp r3, r2

	jne loopApagaEsquerda


	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts

imprimeColuna: ;r0 deve conter a coluna a ser impressa.
	push fr
	push r0 ;Posição inicial.
	push r1
	push r2
	push r3
	push r4
	push r5 ;Posição onde começa a abertura.

	loadn r1, #0 ;Contador.
	loadn r2, #'*' ;Caractere a ser impresso.
	loadn r3, #30 ;Condição de parada.
	loadn r4, #40 ;Incremento

loop_imprimeColuna1:
	outchar r2, r0
	add r0, r0, r4
	inc r1
	cmp r0, r5
	jne loop_imprimeColuna1

	;Incrementa o contador, verificando se chegou ao final da tela.
	inc r1
	cmp r1, r3
	jeq fim_imprimeColuna

	inc r1
	cmp r1, r3
	jeq fim_imprimeColuna

	inc r1
	cmp r1, r3
	jeq fim_imprimeColuna

	inc r1
	cmp r1, r3
	jeq fim_imprimeColuna

	inc r1
	cmp r1, r3
	jeq fim_imprimeColuna

	inc r1
	cmp r1, r3
	jeq fim_imprimeColuna

	loadn r4, #240
	add r0, r0, r4
	loadn r4, #40

loop_imprimeColuna2:
	outchar r2, r0
	add r0, r0, r4
	inc r1
	cmp r1, r3
	jne loop_imprimeColuna2

fim_imprimeColuna:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts


testaDerrota:
	push fr
	push r0 ;Posição do pássaro.
	push r1 ;Posição do obstáculo.
	push r2
	push r3
	push r4 ;Posição anterior do pássaro.
	push r5
	push r6
	push r7

	loadn r2, #40
	loadn r3, #0

	add r1, r1, r2 ;Coloca r1 na primeira posição da abertura.

	cmp r0, r1
	jeq naoDerrota

	add r1, r1, r2
	cmp r0, r1
	jeq naoDerrota

	add r1, r1, r2
	cmp r0, r1
	jeq naoDerrota

	add r1, r1, r2
	cmp r0, r1
	jeq naoDerrota

	add r1, r1, r2
	cmp r0, r1
	jeq naoDerrota

	add r1, r1, r2
	cmp r0, r1
	jeq naoDerrota

	;Se chegou até aqui, é porque bateu no obstáculo.

	jmp bateuNaColuna


naoDerrota:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts


bateuNaColuna:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	jmp perdeu


apagaColuna:
	push fr
	push r0
	push r1 ;Posição inicial.
	push r2
	push r3
	push r4

	loadn r0, #0 ;Contador.
	loadn r2, #' ' ;Caractere a ser impresso.
	loadn r3, #30 ;Condição de parada.
	loadn r4, #40 ;Incremento

loop_apagaColuna:
	outchar r2, r1
	add r1, r1, r4
	inc r0
	cmp r0, r3
	jne loop_apagaColuna

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts


;Redesenha a coluna referenciada por r1, movendo-a para a esquerda.
moveColuna:
	push fr
	push r0 ;Posição do pássaro.
	push r1 ;Ponteiro para a primeira posição da coluna.
	push r2
	push r3
	push r4
	push r5 ;Primeira posição da abertura da coluna.
	push r6
	push r7

	;Impressão da coluna da tela imediatamente à esquerda da coluna do jogo:
	loadn r2, #0
	cmp r1, r2 ;Verifica se existe espaço à esquerda na tela.
	jeq printColunaDireita
	mov r0, r1
	dec r0

	call imprimeColuna

printColunaDireita:
	loadn r0, #39
	cmp r0, r1 ;Verifica se há espaco à direita na tela.
	jeq fim_moveColuna
	inc r1
	call apagaColuna

fim_moveColuna:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts


imprimestr:
	push fr
	push r0 ; posição de escrita na tela.
	push r1 ; endereço da string a ser impressa.
	push r2 ; cor da string.
	push r3
	push r4

	loadn r4, #'\0'

loop_imprimestr:
	loadi r3, r1
	cmp r3, r4 ; verifica se o caractere é '\0'
	jeq fim_imprimestr
	add r3, r3, r2 ; soma a cor ao caractere.
	outchar r3, r0 ; imprime o caractere na tela.
	inc r0 ; avança para a próxima posição na tela.
	inc r1 ; avança para o próximo caractere da string.
	jmp loop_imprimestr

fim_imprimestr:
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts



Delay:
	;Utiliza Push e Pop para nao afetar os registradores do programa principal
	push r0
	push r1
	push r2

	loadn r2, #0
	
	loadn r1, #1500
   	Delay_volta2:
	loadn r0, #4000
   	Delay_volta: 
	dec r0
	cmp r0, r2
	jne Delay_volta	
	dec r1
	cmp r1, r2
	jne Delay_volta2
	
	pop r2
	pop r1
	pop r0
	
	rts		; return


desenhaPassaro: ;Posição deve estar em r0
	push r7
	push r6
	push r0

	loadn r7, #'%'
	loadn r6, #2816 ;Cor amarela
	add r7, r7, r6
	outchar r7, r0

	dec r0

	loadn r7, #'&'
	loadn r6, #2816 ;Cor amarela
	add r7, r7, r6
	outchar r7, r0

	pop r0
	pop r6
	pop r7

	rts


apagaPassaro: ;Posição deve estar em r4
	push r0
	push r4

	loadn r0, #' '

	outchar r0, r4

	dec r4

	outchar r0, r4

	pop r4
	pop r0

	rts


ImprimeTela: 	
	;  rotina de Impresao de Cenario na Tela Inteira
	;  r1 = endereco onde comeca a primeira linha do Cenario
	;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn r0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn r3, #40  	; Incremento da posicao da tela!
	loadn r4, #41  	; incremento do ponteiro das linhas da tela
	loadn r5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call imprimestr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = r0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 por causa do /0)
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	; resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5	
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;Limpa a tela (imprime espaço em todas as posições).
limpaTela:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push fr

	loadn r0, #0 ;Posição da tela.
	loadn r1, #1200 ;Condição de parada.
	loadn r2, #' ' ;Caractere a ser impresso.

loopLimpaTela:
	outchar r2, r0
	inc r0
	cmp r0, r1
	jne loopLimpaTela

	pop fr
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

;Incrementa o contador e verifica se chegou ao fim.
incCont:
	push r0
	push r1
	push r2
	push fr

	load r0, cont
	inc r0
	store cont, r0
	loadn r1, #26 ;Máximo de iterações até a vitória.
	cmp r0, r1

	jne naoAcabou

	pop fr
	pop r2
	pop r1
	pop r0

	jmp parteFinal

naoAcabou:
	pop fr
	pop r2
	pop r1
	pop r0

	rts

imprimeFaixaVitoria: ;Imprime a faixa azul que representa a vitória.
	push r0
	push r1
	push r2
	push r3 ;Posição da faixa
	push r4
	push r5
	push r6
	push r7

	;Apagando a faixa antiga.
	mov r1, r3
	inc r1
	loadn r0, #40 ;Verifica se há espaço à esquerda da posição atual da faixa.
	cmp r0, r1
	jeq naoApagaFaixa

	call apagaColuna

naoApagaFaixa:
	loadn r1, #11
	loadn r2, #0
	loadn r4, #'*'
	loadn r5, #1024 ;Cor azul
	add r4, r4, r5

loopImprimeFaixa1:
	outchar r4, r3
	add r3, r3, r0
	inc r2
	cmp r1, r2
	jne loopImprimeFaixa1

	loadn r4, #'v'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0

	loadn r4, #'i'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0

	loadn r4, #'t'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0

	loadn r4, #'o'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0

	loadn r4, #'r'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0

	loadn r4, #'i'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0
	loadn r4, #'a'
	add r4, r4, r5
	outchar r4, r3
	add r3, r3, r0


	loadn r0, #40
	loadn r1, #30
	loadn r2, #18
	loadn r4, #'*'
	loadn r5, #1024
	add r4, r4, r5

loopImprimeFaixa2:
	outchar r4, r3
	add r3, r3, r0
	inc r2
	cmp r1, r2
	jne loopImprimeFaixa2

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

main:
	call limpaTela

	;Inicialização de variáveis
	;Contador do programa.
	loadn r0, #0
	store cont, r0
	;Coluna do pássaro.
	loadn r0, #3
	store colunaPassaro, r0
	;Posições nos vetores de números "aleatórios".
	loadn r0, #0
	store posRandR2, r0
	store posRandR3, r0

	;Impressão da tela inicial.
	loadn r1, #telaInicioLinha0 ;Posição de memória da primeira linha da tela inicial.
	loadn r2, #2816 ;Cor da tela inicial.
	call ImprimeTela

esperaEspaco: ;Loop para esperar o jogador apertar espaço para iniciar o jogo.
	loadn r6, #' '
	inchar r7
	cmp r6, r7
	jne esperaEspaco

	call limpaTela

	;Valores para teste
	loadn r1, #39 ;Coluna para desenhar o obstáculo.
	loadn r0, #39
	loadn r5, #799 ;Início da abertura do obstáculo.

	call imprimeColuna


	loadn r0, #603
	loadn r2, #randR2
	loadi r2, r2
	loadn r3, #posRandR2
	loadi r3, r3
	inc r3
	store posRandR2, r3
	;loadn r2, #599
	loadn r3, #79
	loadn r4, #603
	loadn r5, #' '
	loadn r6, #1203 ; "Chão"
	loadn r7, #0

; r0: posição atual do pássaro.
; r1: posição para desenhar obstáculo (parâmetro para moveColuna).
; r2 e r3: ponteiros para obstáculos.
; r4: posição anterior do pássaro.

call desenhaPassaro


loopInicial:
	; Lê entrada do usuário
	inchar r7

	; Verifica se espaço foi apertado.
	loadn r5, #' '
	cmp r5, r7

	jne naumSobe
	; Se sim, sobe o pássaro, verificando se chegou no topo da tela.
	load r5, colunaPassaro ; Última posição vertical possível para o pássaro.
	loadn r6, #40 ; Incremento.
	; Sobe o pássaro uma posição por vez, checando se a posição é válida.
	sub r0, r0, r6
	cmp r0, r5
	jeq naumSobe

	sub r0, r0, r6
	cmp r0, r5
	jeq naumSobe

	sub r0, r0, r6
	cmp r0, r5
	jeq naumSobe

	sub r0, r0, r6
	cmp r0, r5
	jeq naumSobe

naumSobe:
	call apagaPassaro
	call desenhaPassaro

	; Guarda em r4 a posição anterior do pássaro.
	loadn r7, #0
	add r4, r0, r7

	; Calcula a nova posição do pássaro - faz ele descer uma posição.
	loadn r7, #40
	add r0, r0, r7

	; Verifica se o pássaro bateu no chão.
	loadn r6, #1203
	cmp r0, r6
	jeq perdeu

	call Delay

	; Move a coluna e decrementa o ponteiro para a coluna.
	mov r1, r2
	loadn r5, #40 
	mod r1, r1, r5 ;Calcula o número da coluna.
	mov r5, r2 ;Passa o começo da abertura do obstáculo para r5, para ser usado como parâmetro.
	dec r5
	call moveColuna
	dec r2

	load r7, cont
	inc r7
	loadn r6, #cont
	storei r6, r7
	loadn r6, #20 ;Condição de parada.
	cmp r6, r7
	jne loopInicial


loop_main:

	call apagaEsquerda

	; Lê entrada do usuário
	inchar r7

	; Verifica se espaço foi apertado.
	loadn r5, #' '
	cmp r5, r7

	jne naoSobe
	; Se sim, sobe o pássaro, verificando se chegou no topo da tela.
	load r5, colunaPassaro ; Última posição vertical possível para o pássaro.
	loadn r6, #40 ; Incremento.
	; Sobe o pássaro uma posição por vez, checando se a posição é válida.
	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobe

	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobe

	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobe

	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobe

naoSobe:
	;Imprime o pássaro na nova posição.
	call apagaPassaro
	call desenhaPassaro

	; Guarda em r4 a posição anterior do pássaro.
	loadn r7, #0
	add r4, r0, r7

	; Calcula a nova posição do pássaro - faz ele descer uma posição.
	loadn r7, #40
	add r0, r0, r7

	; Verifica se o pássaro bateu no chão.
	loadn r6, #1203
	cmp r0, r6
	jeq perdeu

	call Delay


	load r7, colunaPassaro
	mov r6, r2
	loadn r5, #40
	mod r6, r6, r5 ; Calcula a coluna do obstáculo.
	dec r6
	cmp r6, r7 ; Testa se o obstáculo está na coluna do pássaro.
	jne testaR2_1

	mov r1, r2
	dec r1
	call testaDerrota
	jmp naoPrecisaTestar

testaR2_1:
	inc r6
	cmp r6, r7
	jne testaR2_2

	mov r1, r2
	call testaDerrota
	jmp naoPrecisaTestar

testaR2_2:
	inc r6
	cmp r6, r7
	jne testaR2_3

	mov r1, r2
	inc r1
	call testaDerrota
	jmp naoPrecisaTestar

testaR2_3:
	inc r6
	cmp r6, r7
	jne testaR3

	mov r1, r2
	inc r1
	inc r1
	call testaDerrota
	jmp naoPrecisaTestar

testaR3:
	load r7, colunaPassaro
	mov r6, r3
	loadn r5, #40
	mod r6, r6, r5 ; Calcula a coluna do obstáculo.
	dec r6
	cmp r6, r7 ; Testa se o obstáculo está na coluna do pássaro.
	jne testaR3_1

	mov r1, r3
	dec r1
	call testaDerrota
	jmp naoPrecisaTestar

testaR3_1:
	inc r6
	cmp r6, r7
	jne testaR3_2

	mov r1, r3
	call testaDerrota
	jmp naoPrecisaTestar

testaR3_2:
	inc r6
	cmp r6, r7
	jne testaR3_3

	mov r1, r3
	inc r1
	call testaDerrota
	jmp naoPrecisaTestar

testaR3_3:
	inc r6
	cmp r6, r7
	jmp naoPrecisaTestar

	mov r1, r3
	inc r1
	inc r1
	call testaDerrota

naoPrecisaTestar:
	; Move a coluna e decrementa o ponteiro para a coluna.
	mov r1, r2
	loadn r5, #40 
	mod r1, r1, r5 ;Calcula o número da coluna.
	mov r5, r2 ;Passa o começo da abertura do obstáculo para r5, para ser usado como parâmetro.
	dec r5
	call moveColuna

	; Move a coluna e decrementa o ponteiro para a coluna.
	mov r1, r3
	loadn r5, #40 
	mod r1, r1, r5 ;Calcula o número da coluna.
	mov r5, r3 ;Passa o começo da abertura do obstáculo para r5, para ser usado como parâmetro.
	dec r5
	call moveColuna

	dec r2 ;Ajusta o ponteiro para a nova posição do obstáculo.
	dec r3 ;Ajusta o ponteiro para a nova posição do obstáculo.


	; Verifica se a primeira coluna chegou ao fim da tela.
	loadn r7, #0
	loadn r6, #40
	mod r6, r2, r6
	cmp r7, r6

	jne verificaR3

	; Se a coluna chegou ao fim da tela, "sorteia" um novo valor para r2.
	load r7, posRandR2
	loadn r2, #25
	cmp r7, r2 ; Verifica se chegou ao fim de 'randR2'.
	jne naoTaNoFimDoRandR2

	loadn r2, #1
	loadn r7, #posRandR2
	storei r7, r2
	loadn r2, #799

	jmp loop_main

naoTaNoFimDoRandR2:
	loadn r2, #randR2
	add r2, r7, r2
	loadi r2, r2

	; Avança posRandR2 para a próxima posição.
	inc r7
	loadn r6, #posRandR2
	storei r6, r7

	jmp loop_main


verificaR3:
	; Verifica se a segunda coluna chegou ao fim da tela.
	loadn r7, #0
	loadn r6, #40
	mod r6, r3, r6
	cmp r7, r6

	jne loop_main


	; Se a coluna chegou ao fim da tela, "sorteia" um novo valor para r3.
	load r7, posRandR3
	loadn r3, #25
	cmp r7, r3 ; Verifica se chegou ao fim de 'randR3'.
	jne naoTaNoFimDoRandR3

	loadn r3, #1
	loadn r7, #posRandR3
	storei r7, r3
	loadn r3, #919

	call incCont

	jmp loop_main

naoTaNoFimDoRandR3:
	loadn r3, #randR3
	add r3, r7, r3
	loadi r3, r3

	; Avança posRandR3 para a próxima posição.
	inc r7
	loadn r6, #posRandR3
	storei r6, r7

	call incCont

	jmp loop_main


parteFinal:
	loadn r7, #0
	store cont, r7 ;Zera o contador.
	loadn r3, #39 ;Última coluna

loopFinal: ;Loop quando o jogador está perto da vitória.
	load r7, cont
	inc r7
	store cont, r7
	loadn r6, #37 ;Contador final.
	cmp r6, r7

	jeq venceu

	call imprimeFaixaVitoria
	dec r3

	call apagaEsquerda

	; Lê entrada do usuário
	inchar r7

	; Verifica se espaço foi apertado.
	loadn r5, #' '
	cmp r5, r7

	jne naoSobeFinal
	; Se sim, sobe o pássaro, verificando se chegou no topo da tela.
	load r5, colunaPassaro ; Última posição vertical possível para o pássaro.
	loadn r6, #40 ; Incremento.
	; Sobe o pássaro uma posição por vez, checando se a posição é válida.
	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobeFinal

	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobeFinal

	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobeFinal

	sub r0, r0, r6
	cmp r0, r5
	jeq naoSobeFinal

naoSobeFinal:
	call apagaPassaro
	call desenhaPassaro

	; Guarda em r4 a posição anterior do pássaro.
	loadn r7, #0
	add r4, r0, r7

	; Calcula a nova posição do pássaro - faz ele descer uma posição.
	loadn r7, #40
	add r0, r0, r7

	; Verifica se o pássaro bateu no chão.
	loadn r6, #1203
	cmp r0, r6
	jeq perdeu

	call Delay

	load r7, colunaPassaro
	mov r6, r2
	loadn r5, #40
	mod r6, r6, r5 ; Calcula a coluna do obstáculo.
	dec r6
	cmp r6, r7 ; Testa se o obstáculo está na coluna do pássaro.
	jne testaR2_1_Final

	mov r1, r2
	dec r1
	call testaDerrota
	jmp naoPrecisaTestarFinal

testaR2_1_Final:
	inc r6
	cmp r6, r7
	jne testaR2_2_Final

	mov r1, r2
	call testaDerrota
	jmp naoPrecisaTestarFinal

testaR2_2_Final:
	inc r6
	cmp r6, r7
	jne testaR2_3_Final

	mov r1, r2
	inc r1
	call testaDerrota
	jmp naoPrecisaTestarFinal

testaR2_3_Final:
	inc r6
	cmp r6, r7
	jmp naoPrecisaTestarFinal

	mov r1, r2
	inc r1
	inc r1
	call testaDerrota

naoPrecisaTestarFinal:
	; Move a coluna e decrementa o ponteiro para a coluna.
	mov r1, r2
	loadn r5, #40 
	mod r1, r1, r5 ;Calcula o número da coluna.
	mov r5, r2 ;Passa o começo da abertura do obstáculo para r5, para ser usado como parâmetro.
	dec r5
	call moveColuna
	dec r2 ;Ajusta o ponteiro para a nova posição do obstáculo.

	jmp loopFinal


perdeu:
	;Impressão das mensagens de fim de jogo.
	loadn r0, #574
	loadn r1, #msg_perdeu
	loadn r2, #2304

	call imprimestr

	loadn r0, #613
	loadn r1, #msg_jogarDeNovo
	loadn r2, #2304

	call imprimestr

	loadn r0, #658
	loadn r1, #msg_SimOuNao
	loadn r2, #2304

	call imprimestr

	loadn r6, #255

	jmp esperaJogarDeNovo

venceu:
	;Impressão das mensagens de fim de jogo.
	loadn r0, #574
	loadn r1, #msg_venceu
	loadn r2, #2816

	call imprimestr

	loadn r0, #613
	loadn r1, #msg_jogarDeNovo
	loadn r2, #2816

	call imprimestr

	loadn r0, #658
	loadn r1, #msg_SimOuNao
	loadn r2, #2816

	call imprimestr

esperaJogarDeNovo: ;Loop para esperar se o jogador quer jogar de novo.
	loadn r6, #255
	inchar r7
	cmp r6, r7
	jeq esperaJogarDeNovo

	;Se o jogador quiser jogar de novo, volta para a main.
	loadn r6, #'s'
	cmp r6, r7
	jeq main

	loadn r6, #'n'
	cmp r6, r7

	jne esperaJogarDeNovo ;Se o jogador digitou qualquer outra coisa que não 's' ou 'n', volta para o loop.

	;Se não quiser jogar de novo, apenas limpa a tela.
	call limpaTela

	halt

; --------------------------------------------- TELA INICIAL ---------------------------------------------
telaInicioLinha0:  string "                                        "          
telaInicioLinha1:  string "                                        "    
telaInicioLinha2:  string "                                        "          
telaInicioLinha3:  string "     **** *     **  ***  ***  *   *     "             
telaInicioLinha4:  string "     *    *    *  * *  * *  * *   *     "          
telaInicioLinha5:  string "     ***  *    **** *  * *  *  * *      "         
telaInicioLinha6:  string "     *    *    *  * ***  ***    *       "         
telaInicioLinha7:  string "     *    **** *  * *    *      *       "
telaInicioLinha8:  string "                                        "       
telaInicioLinha9:  string "           ***  * ***  **$              "
telaInicioLinha10: string "           *  * * *  * *  $             "
telaInicioLinha11: string "           ***  * *  * *  *             "
telaInicioLinha12: string "           *  * * ***  *  #             "
telaInicioLinha13: string "           ***  * *  * **#              "
telaInicioLinha14: string "                                        "
telaInicioLinha15: string "                                        "
telaInicioLinha16: string "       APERTE ESPACO PARA FAZER O       "
telaInicioLinha17: string "                                        "
telaInicioLinha18: string "             PASSARO SUBIR              "
telaInicioLinha19: string "                                        "
telaInicioLinha20: string "   NAO BATA NOS OBSTACULOS E NO CHAO    "
telaInicioLinha21: string "                                        "
telaInicioLinha22: string "                                        "
telaInicioLinha23: string "      APERTE ESPACO PARA INICIAR!       "
telaInicioLinha24: string "                                        "
telaInicioLinha25: string "                                        "
telaInicioLinha26: string "                                        "
telaInicioLinha27: string "                                        "
telaInicioLinha28: string "                                        "
telaInicioLinha29: string "                                        "