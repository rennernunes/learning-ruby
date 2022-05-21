=begin
 Toda interface do usuário fica na classe ui  
=end
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

def cabecalho_de_tentativa(erros, chutes)
    puts "\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
end

def pede_um_chute
    printf "Entre com uma letra ou uma palavra: " 
    chute = gets.strip
    puts "\n" 
    puts "Você chutou #{chute}"
    chute
end

def avisa_chute_efetuado(chute)
    puts "Você já chutou #{chute}"
end

def avisa_letra_nao_encontrada
    puts "Letra não encontrada."
end

def avisa_letra_encontrada (total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes."
end

def avisa_acertou_palavra
    puts "Parabéns, acertou!!!"
end

def avisa_errou_palavra
    puts "Errou... tente novamente!"
end

def avisa_pontos(pontos_ate_agora)
    puts "Você ganhou #{pontos_ate_agora} pontos."
end