#extraindo funções
def boas_vindas
    puts "Bem vindo ao jogo"
    puts "Qual é o seu nome?"
    #strip limpa caracteres vazios
    nome = gets.strip
    puts "Já vamos começar o jogo, #{nome}"
    puts "Já vamos começar o jogo, " + nome
end

def sorteia_numero
puts "Estamos escolhendo um numero entre 0 e 200..."
#sorteado = 175
# rand devolve um número aleatório entre 0 e 200
sorteado = rand(200)
puts "\n"
puts "Sua vez, advinhe o numero!"
# return sorteado, ultima instrução sempre será retornada
sorteado
end

def pede_um_numero(chutes, tentativa, limite_tentativas)
    puts "\n"
    puts "Tentativa #{tentativa.to_s}/#{limite_tentativas.to_s}"
    puts "Tentativa " + tentativa.to_s + "/" + limite_tentativas.to_s
    puts "Chutes até agora: " + chutes.to_s
    puts "Insira seu palpite: "
    chute = gets.strip
    puts "Seu chute: " + chute
    #Converte String para Inteiro .to_i
    #puts chute.to_i == numero_secreto
    puts "\n"
    chute.to_i
end

def verifica_chute(numero_secreto, chute)
    #if numero_secreto == chute.to_i
    acertou = numero_secreto == chute
    if acertou
        puts "Acertou!!!"
        puts "\n"
        #break
        return true
    else 
        puts "Errou!"
        maior = numero_secreto > chute
        if maior
            puts "O número é maior!"
        else
            puts "O número é menor!" 
        end
    end
    false
end

#invocando metodos
boas_vindas
# variavel global acessar valores do metodo
numero_secreto = sorteia_numero

pontos_ate_agora = 1000 

limite_tentativas = 5
#array
chutes = []
#total_chutes = 0

for tentativa in 1..limite_tentativas
    chute = pede_um_numero chutes, tentativa, limite_tentativas
    #chutes[total_chutes] = chute
    #chutes[chutes.size] = chute
    chutes << chute #<< coloca elemento na ultima posiçao do array
    #total_chutes += 1

    #primeiro executa o que está em parenteses
    #.0 variavel passa a ser tipo float
    #.abs retorna o valor absoluto, sem o sinal
    pontos_a_perder = (chute - numero_secreto).abs / 2.0
     
    pontos_ate_agora -= pontos_a_perder


    break if verifica_chute numero_secreto, chute
    #if verifica_chute numero_secreto, chute
     #   break
    #end
end

puts "Você ganhou #{pontos_ate_agora} pontos."
puts "Numero sorteado #{numero_secreto}."