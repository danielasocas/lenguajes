$LOAD_PATH << '.'
require "Arboles"

module BFS
	include Arboles

	def BFS.bfs(nodo)
		cola = []
		cola.push(nodo)

		while (cola.size != 0)
			nodoActual = cola.shift
			yield nodoActual if !nodoActual.valor.nil?		# Pasaje implicito del bloque
			nodoActual.each do |hijo|
				cola.push(hijo)
			end
		end
	end

=begin
	def BFS.bfs(inicio)
		cola = []
		visitado = []
  		cola.push(inicio)

 		while !cola.empty?
    		nodoActual = cola.shift
    		if !visitado.include? nodoActual
				nodoActual.each
				yield nodoActual
				visitado.push(nodoActual)
  			end
  		end
	end
=end


	def BFS.recoger(nodo, &bloque)
		cola = []
		cola.push(nodo)

		while (cola.size != 0)
			nodoActual = cola.shift
			bloque.call(nodoActual) if !nodoActual.valor.nil? 	# Pasaje explicito del bloque
			nodoActual.each do |hijo|
				cola.push(hijo)
			end
		end
	end
end