require_relative 'ui' #procura no mesmo diretorio
require_relative 'rank'
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

def escolhe_palavra_secreta
    avisa_escolhendo_palavra
    texto = File.read("C:/workspace/alura/ruby/jogo-da-forca/dicionario.txt")
    todas_as_palavras = texto.split "\n" #separa todas as palavras pela quebra de linha
    numero_escolhido = rand(todas_as_palavras.size)
    palavra_secreta = todas_as_palavras[numero_escolhido].downcase # transforma tudo em minusculo
    avisa_palavra_escolhida palavra_secreta
end

#na primeira linha informamos a quantidade de palavras
def escolhe_palavra_secreta_sem_consumir_muita_memoria
    avisa_escolhendo_palavra
    arquivo = File.new("C:/workspace/alura/ruby/jogo-da-forca/dicionario_numero_de_dados.txt")
    quantidade_de_palavras = arquivo.gets.to_i
    numero_escolhido = rand(quantidade_de_palavras)
    for linha in 1..(numero_escolhido-1)
        arquivo.gets
    end
    palavra_secreta = arquivo.gets.strip.downcase # transforma tudo em minusculo e tira quebra de lunha com .strip
    arquivo.close
    avisa_palavra_escolhida palavra_secreta
end

def palavra_mascarada(chutes, palavra_secreta)
    mascara = ""
    #para cada letra dentro da palavra secreta
    for letra in palavra_secreta.chars
        if chutes.include? letra #chute contem letra?
            mascara << letra
        else
            mascara << "_"
        end
    end
    mascara
end

def pede_um_chute_valido(erros, chutes, mascara)
    cabecalho_de_tentativa erros, chutes, mascara
    loop do
        chute = pede_um_chute
        if chutes.include? chute #include semelhante ã contais
            avisa_chute_efetuado chute
            #next #pula direto para próxima interaçao do laço
        else
            return chute
        end
    end
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        mascara = palavra_mascarada chutes, palavra_secreta
        chute = pede_um_chute_valido erros, chutes, mascara
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
    pontos_ate_agora
end

def jogo_da_forca
    nome = boas_vindas
    #armazena os jogadores e pontos
    pontos_totais = 0


    avisa_campeao_atual le_rank

    loop do
        pontos_totais += joga nome
        avisa_pontos_totais pontos_totais
        
        # le_rank[1] se os pontos do campeao forem menor que os pontos atuais
        if le_rank[1].to_i < pontos_totais
            salva_rank nome, pontos_totais
        end
        
        if nao_quer_jogar?
            break
        end
    end
end
