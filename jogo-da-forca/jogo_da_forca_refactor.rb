require_relative 'ui' #procura no mesmo diretorio
=begin
já existe uma funçao para contar caracteres em ruby .count exemplo como fazer manualmente 

def conta(texto, letra)
    total_encontrado = 0
    #for i in 0..(texto.size-1) # -1 começa na posiçao 0
    #.chars devolve o texto em um array de caracteres
    for caractere in texto.chars #para cada caracter que tiver dentro do texto
        #if texto[i] == letra
        if caractere == letra
            total_encontrado += 1
        end
    end
    total_encontrado 
end
=end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        chute = pede_um_chute erros, chutes
        if chutes.include? chute
            avisa_chute_efetuado chute
            next #pula direto para próxima interaçao do laço
        end
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            
            #total_encontrado = conta palavra_secreta, letra_procurada #refatorado
            total_encontrado = palavra_secreta.count letra_procurada

           if total_encontrado == 0
            avisa_letra_nao_encontrada
            erros += 1
           else
            avisa_letra_encontrada total_encontrado
           end
        else
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_palavra
                pontos_ate_agora += 100
                break                 
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    avisa_pontos pontos_ate_agora
end

nome = boas_vindas

loop do
    joga nome
    if nao_quer_jogar?
        break
    end
end


