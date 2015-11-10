
class FileHash

	attr_reader :hsh

	def convertHash
		file='preguntas.txt'
		@hsh = Hash[*File.read(file).split(/[\n]+/)] #Pasa el archivo al Hash
	end

end


class Game

	attr_reader :game

	def initialize(file)
		@game = file.convertHash		
	end


	def doGame

		puts puts
		puts "		  ---"
		puts "		 | "
		puts "		 | "
		puts "		  ---"
		puts "		     | "
		puts "		     | "
		puts "		  ---"
		
		puts "Bienvenido a reto   , Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
		puts
		input = ""
		@game.each do |key, answers|
	  		puts "#{key}"
	  		print "Adivinar: "
	  		input = gets.chomp.strip
	  		if input == "#{answers}"
	  			puts "Correcto!"
	  			puts
	  		else  			
	  			while input != "#{answers}"
		  			puts "Incorrecto!, Trata de nuevo"
			  		puts "#{key}"
			  		print "Adivinar: "
			  		input = gets.chomp.strip  			  				
	  			end
	  		end
		end
		puts
		puts "Gracias por participar. Te esperamos pronto."

	end
	
end	

file = FileHash.new
game = Game.new(file)
file.convertHash
game.doGame


