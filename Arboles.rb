# Clases de Arboles
module Arboles
	class Nodo
		attr_accessor :valor 						# Atributos de lectura y escritura
		attr_reader :hijoD, :hijoI					# Atributos de solo lectura
		
		def initialize(valor = nil,hd = nil,hi = nil)					# Inicializador del arbol binario
			@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
			@HijoD = hd if hijoD.class == Nodo
			@HijoI = hi if hijoI.class == Nodo
		end

		def each 								
			# Iterador del arbol binario
			yield hijoD if !hijoD.nil?
			yield hijoI if !hijoI.nil?
		end
	end

	class NodoRosa
		attr_accessor :valor						# Atributo de lectura y escritura
		attr_reader :hijos							# Atributo de solo lectura
		
		def initialize(valor = nil, hijos = [])		# Inicializador del arbol rosa
			@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
			@hijos  = hijos if hijos.each{|hijo| hijo.class == NodoRosa}
		end
		
		def each 									# Iterador del arbol rosa
			hijos.each do |hijo| 
				yield hijo if !hijo.nil?
			end
		end
	end
end