$LOAD_PATH << '.'
require "BFS"

#PRUEBAS
na = Arboles::Nodo.new(2, Arboles::Nodo.new(4, Arboles::Nodo.new(8)))
nb = Arboles::Nodo.new(3, Arboles::Nodo.new(5, Arboles::Nodo.new(7)), Arboles::Nodo.new(6))
nr = Arboles::Nodo.new(1, na, nb)	

n1 = Arboles::NodoRosa.new( 9, [Arboles::NodoRosa.new(15, [Arboles::NodoRosa.new(20)]), Arboles::NodoRosa.new(16)])
n2 = Arboles::NodoRosa.new(10)
n3 = Arboles::NodoRosa.new(11, [Arboles::NodoRosa.new(17),Arboles::NodoRosa.new(18),Arboles::NodoRosa.new(19)])
n4 = Arboles::NodoRosa.new(12)
n5 = Arboles::NodoRosa.new(13, [Arboles::NodoRosa.new(14)])

rootsa = Arboles::NodoRosa.new(4, [n1,n2,n3,n4,n5])
puts "\nPRUEBA NODOS ROSA"
BFS::bfs(rootsa) {|nodo| puts nodo.valor}


nc = Arboles::Nodo.new("hola Nivel 1", Arboles::Nodo.new(2, Arboles::Nodo.new(["Nivel 3",89,9]), Arboles::Nodo.new("Nivel 3 jajajja")))
nr1 = Arboles::Nodo.new("soy root Nivel 0", nc, Arboles::Nodo.new("soy right root Nivel 1"))

puts "\nPRUEBA BFS CON NODOS"
BFS::bfs(nr1) {|nodo| puts nodo.valor}
