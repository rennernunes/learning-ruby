def boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n"
    puts "Estamos inicializando o jogo, #{nome}"
    nome
end

def escolhe_palavra_secreta
    puts "Escolhendo uma palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"
    palavra_secreta
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"    
end

def pede_um_chute(erros, chutes)
    puts "\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    printf "Entre com uma letra ou uma palavra: " 
    chute = gets.strip    
    puts "Você chutou #{chute}"
    chute
end

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
            puts "Você já chutou #{chute}"
            next #pula direto para próxima interaçao do laço
        end
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            
            #total_encontrado = conta palavra_secreta, letra_procurada #refatorado
            total_encontrado = palavra_secreta.count letra_procurada

           if total_encontrado == 0
               puts "Letra não encontrada."
               erros += 1
           else 
                puts "Letra encontrada #{total_encontrado} vezes."
           end
        else
            acertou = chute == palavra_secreta
            if acertou
                puts "Parabéns, acertou!!!"
                pontos_ate_agora += 100
                break                 
            else
                puts "Errou... tente novamente!"
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

nome = boas_vindas

loop do
    joga nome
    if nao_quer_jogar?
        break
    end
end


