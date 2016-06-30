# Universidad Simon Bolivar
# Laboratorio de Lenguajes I 
# Ruby
# Daniela Socas 11-10979
# Sergio Teran  11-11020

require_relative "BFS"

# Clases de Arboles
module Arboles

	# Clase Nodo binario:
	# 	Posee un atributo que guarda el valor
	# 	del nodo actual y este debe poder solicitarse o modificarse. Además, por 
	# 	definición de árbol binario, la clase posee una referencia al
	# 	hijo izquierdo y al hijo derecho
	class Nodo
		attr_accessor :valor 						# Atributos de lectura y escritura
		attr_reader :hijoD, :hijoI					# Atributos de solo lectura
		
		include BFS


		def initialize(valor = nil,hd = nil,hi = nil)					# Inicializador del arbol binario
			@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
			@HijoD = hd if hijoD.class == Nodo
			@HijoI = hi if hijoI.class == Nodo
		end

		# Iterador each (iterador arbol binario):
		# iterar sobre los hijos del nodo actual cuando los mismos estén definidos.
		def each 								
			yield hijoD if !hijoD.nil?
			yield hijoI if !hijoI.nil?
		end
	end

	class NodoRosa
		attr_accessor :valor						# Atributo de lectura y escritura
		attr_reader :hijos							# Atributo de solo lectura
		include BFS
		
		def initialize(valor = nil, hijos = [])		# Inicializador del arbol rosa
			@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
			@hijos  = hijos if hijos.each{|hijo| hijo.class == NodoRosa}
		end

		# Iterador each (iterador arbol rosa):
		# iterar sobre los hijos del nodo actual cuando los mismos estén definidos.	
		def each
			hijos.each do |hijo| 
				yield hijo if !hijo.nil?
			end
		end
	end
end