# Universidad Simon Bolivar
# Laboratorio de Lenguajes I 
# Ruby
# Daniela Socas 11-10979
# Sergio Teran  11-11020


# Modulo BFS y Recoger
module BFS
# bfs:
# 	Este método recibe un bloque de manera implícita, itera desde self ha-
# 	ciendo un recorrido BFS y en el camino va llamando al bloque con cada nodo
# 	de la iteración.
	def bfs
		cola = [self]
		#cola.push(node)

		while !cola.empty?
			nodoActual = cola.shift
			yield nodoActual if !nodoActual.valor.nil?		# Pasaje implicito del bloque
			nodoActual.each do |hijo|
				cola.push(hijo)
			end
		end
	end

# recoger:
# 	Este método recibe un predicado (bloque) de manera explícita, itera
# 	desde self haciendo un recorrido BFS y en el camino va recogiendo los nodos
# 	que cumplan con el predicado.
	def recoger(nodo, &bloque)
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