# Clase Nodo
class Nodo
	attr_accessor :valor, :hijos

	def initialize(valor,hijos)
		@valor = valor
		@hijos = hijos
	end
end

un_nodo = Nodo.new("Soy un nodo",[])
puts un_nodo.valor