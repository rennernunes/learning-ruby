class Livro
    #criando acesso direto para os valores
    #attr_accessor :titulo, :preco, :ano_lancamento
    
    #permite apenas leitura dos métodos
    attr_reader :titulo, :preco, :ano_lancamento
    
    #attr_reader :titulo, :ano_lancamento
    #attr_accessor :preco libera se tiver método aplica_promocoes(livro)
    #construtor
    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        #@preco = preco
        @ano_lancamento = ano_lancamento
        #refatorando
        @preco = calcula_preco(preco)
        # ou @preco *= 0.7 if ano_lancamento < 2000
        #if ano_lancamento < 2000
        #    @preco *= 0.7
        #end       
    end

    private

    def calcula_preco(base)
       if @ano_lancamento < 2000
         base * 0.7
       else
         base
       end
     end
end

=begin
#attr_accessor acesso direto os métodos
livros_rails = Livro.new
livros_rails.preco = 70
livros_rails.titulo = "Agile Web Development with Rails"
livros_rails.ano_lancamento = 2011

livros_ruby = Livro.new
livros_ruby.preco = 60
livros_ruby.titulo = "Programming Ruby 1.9"
livros_ruby.ano_lancamento = 2010
=end

=begin
#attr_reader encapsulo minhas variáveis
#inicializo as variáveis no construtor
livros_rails = Livro.new(70, "Agile Web Development with Rails", 2011)

livros_ruby = Livro.new(60, "Programming Ruby 1.9", 2010)

def imprime_nota_fiscal(livros)
    #para cada livro 
    livros.each do |livro|
        puts "Titulo: #{livro.titulo} - #{livro.preco}"
    end
end

livros = [livros_rails, livros_ruby]
imprime_nota_fiscal livros
=end
def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
       puts "Newsletter/Liquidacao"
       puts livro.titulo
       puts livro.preco
    end
end

=begin
#Coloca dentro do construtor para forçar o desconto
def aplica_promocoes(livro)
    if livro.ano_lancamento < 2000
       livro.preco *= 0.7
    end
end
=end

algoritmos = Livro.new("Algoritmos", 100, 1998)
livro_para_newsletter algoritmos

