# Clases de Arboles
module Arboles
	class Nodo
		attr_accessor :valor 		# Atributos de lectura y escritura
		attr_reader :hijoD, :hijoI	# Atributos de solo lectura
		
		def initialize(raiz,hd,hi)
			@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
			@HijoD = hd if hijoD.class == Node
			@HijoI = hi if hijoI.class == Node
		end

		def each 					# Iterador del arbol
			yield hijoD if !hijoD.nil?
			yield hijoI if !hijoI.nil?
		end
	end

	class NodoRosa

		attr_accessor :valor		# Atributo de lectura y escritura
		attr_reader :hijos			# Atributo de solo lectura
		
		def initialize(valor = nil, hijos = [])
			@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
			@hijos  = hijos if hijos.each{|hijo| hijo.class == NodoRosa}
		end
		
		def each
			hijos.each do |hijo| 
				yield hijo if !hijo.nil?
			end
		end
	end
end