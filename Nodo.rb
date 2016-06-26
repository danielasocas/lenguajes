# Clase Nodo
class Nodo
	attr_accessor :valor

	def initialize(valor)
		@valor = valor
	end
end

un_nodo = Nodo.new("Soy un nodo")
