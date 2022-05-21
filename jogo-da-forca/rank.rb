def salva_rank( nome, pontos_totais)
    conteudo = "#{nome}\n#{pontos_totais}"
    #File.write "rank.txt", conteudo #salva na pasta raiz
    File.write "C:/workspace/alura/ruby/jogo-da-forca/rank.txt", conteudo 
end

def le_rank
    conteudo = File.read "C:/workspace/alura/ruby/jogo-da-forca/rank.txt" 
    conteudo.split "\n" # "nome = dados[0]",  "pontos" = = dados[1] na ui.rb
end