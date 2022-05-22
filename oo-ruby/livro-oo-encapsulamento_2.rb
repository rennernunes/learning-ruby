#permitir descontos para cada faixa de ano dos livros
class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    
    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao
        @preco = calcula_preco(preco)
    end

    def possui_reimpressao?
        @possui_reimpressao
    end
    
    def to_csv
        "#{@titulo},#{@ano_lancamento},#{@preco}"
    end

    private

    def calcula_preco(base)
        if @ano_lancamento < 2006
            if @possui_reimpressao
                base * 0.9
            else
                base * 0.95
            end
        elsif @ano_lancamento <=2010
            base * 0.96
        else
            base
        end
    end
    
end

class Estoque
    #attr_reader :livros
  
    def initialize
      @livros = []
    end
  
    def exporta_csv
      @livros.each do |livro|
        puts livro.to_csv
      end
    end

    def mais_barato_que(valor)
        @livros.select do |livro|
          livro.preco <= valor
        end
    end

    def total
        @livros.size
    end

    def adiciona(livro)
        @livros << livro if livro
    end

end

=begin
Adiciona o método direto na classe Estoque
def exporta_csv(estoque)
    estoque.each do |livro|
      puts "#{livro.titulo},#{livro.ano_lancamento}"
    end
  end
=end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
       puts "Newsletter/Liquidacao"
       puts livro.titulo
       puts livro.preco
       puts livro.possui_reimpressao?
    end
end

=begin
Adiciona o método direto na classe Estoque
def mais_barato_que(estoque, valor)

.select Conhecido como o filter em outras linguagens, 
o select executa a expressão passada para cada elemento do 
array, se a expressão retornar true, ela e adicionada ao array de output.

    estoque.select do |livro|
      livro.preco <= valor
    end
  end
=end

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)

#estoque = [algoritmos, arquitetura]

#estoque << Livro.new("The Pragmatic Programmer", 100, 1999, true)
#estoque << Livro.new("Programming Ruby", 100, 2004, true)


=begin
altra a forma de adicionar livros ao estoque, chamar o método adiciona
estoque = Estoque.new
estoque.livros << algoritmos << arquitetura
estoque.livros << Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.livros << Livro.new("Programming Ruby", 100, 2004, true)
estoque.adiciona livro
=end

#utilizando o método adiciona da classe Estoque
estoque = Estoque.new
estoque.adiciona  algoritmos
estoque.adiciona  arquitetura
estoque.adiciona  Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.adiciona  Livro.new("Programming Ruby", 100, 2004, true)
estoque.adiciona nil

#exporta_csv(estoque)
estoque.exporta_csv

=begin
baratos = mais_barato_que(estoque, 80)
baratos.each do |livro|
  puts livro.titulo
end
=end

baratos = estoque.mais_barato_que 80
baratos.each do |livro|
  puts livro.titulo
end

estoque.total