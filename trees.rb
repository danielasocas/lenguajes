# Universidad Simon Bolivar
# Laboratorio de Lenguajes I 
# Ruby
# Daniela Socas 11-10979
# Sergio Teran  11-11020


require_relative 'mod_bfs'
#require_relative 'nodos'

# Clase Arbol binario:
# 	Posee un atributo que guarda el valor
# 	del nodo actual y este debe poder solicitarse o modificarse. Además, por 
# 	definición de árbol binario, la clase posee una referencia al
# 	hijo izquierdo y al hijo derecho
class ArbolBinario

	# su valor y sus hijos como atributo solo lectura.
	attr_accessor :valor 		# Atributos de lectura y escritura
	attr_reader :hijoI, :hijoD 	# Atributos de solo lectura

	include BFS

	def initialize(valor, hi = nil, hd = nil) 		# Inicializador del arbol binario
		@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
		@hijoI = hi if hi.class == ArbolBinario
		@hijoD = hd if hd.class == ArbolBinario
	end

	# Iterador each:
	# iterar sobre los hijos del nodo actual cuando los mismos estén definidos.
	# (iterador arbol binario)
	def each
		yield hijoI if !hijoI.nil?
		yield hijoD if !hijoD.nil?
	end
end

# Clase Arbol binario:
# 	Similar a la clase anterior, y cumpliendo las mismas condiciones,
# 	pero la única diferencia radica en la cantidad de hijos que puede poseer cada
# 	nodo de un árbol rosa; dicha cantidad no tiene límite.
class ArbolRosa

	attr_accessor :valor		# Atributo de lectura y escritura
	attr_reader :hijos			# Atributo de solo lectura

	include BFS

	def initialize(valor, *hijos) # Inicializador del arbol binario
		@valor = valor if valor.class == Fixnum || valor.class == Array || valor.class == String
		@hijos = hijos if hijos.each {|hijo| hijo.class == ArbolRosa}
	end
	
	# Iterador each:
	# iterar sobre los hijos del nodo actual cuando los mismos estén definidos.
	# (iterador arbol binario)
	def each
		hijos.each do |hijo|
			yield hijo  if !hijo.nil?
		end
	end
end
