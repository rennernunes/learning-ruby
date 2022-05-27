
   puts "Entre com sua nota parcial: "
   nota_parcial = gets.strip.to_f

   puts "Entre com o peso da prova parcial: "
   peso_parcial = gets.strip.to_f

   puts "Entre com o peso da prova final: "
   peso_final = gets.strip.to_f

   puts "Entre com a média: "
   media = gets.strip.to_f

    
   nota_final = ((media*10)-(nota_parcial*peso_parcial))/peso_final
 
   puts "\n O Aluno precisa tirar no exame: #{nota_final.round(2)}"
   puts