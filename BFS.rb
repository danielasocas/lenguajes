require "arboles"

module 
	include Arboles

	def Bfs.bfs(nodo)
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


	def Bfs.recoger(nodo, &bloque)
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