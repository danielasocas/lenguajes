# Clase de Arbol
class Arbol
	attr_accessor :raiz

	def initialize(raiz)
		@raiz = raiz
	end
end

class ArbBin < Arbol
	attr_accessor :hijoD , :hijoI
	def initialize(raiz,hi,hd)
	 	@raiz  = raiz
	 	@hijoI = hi
	 	@hijoD = hd
	end

end

class ArbRosa < Arbol
	attr_accessor listHijos
	 
	def initialize(raiz,listHijos)
	 	@raiz = raiz
	 	@listHijos = listHijos
	end
end