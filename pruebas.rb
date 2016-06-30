require_relative 'Arboles'

# pruebaBin = Arboles::Nodo.new(1,Arboles::Nodo.new(2,Arboles::Nodo.new(4,Arboles::Nodo.new(8)),Arboles::Nodo.new(5,nil,Arboles::Nodo.new(9))),Arboles::Nodo.new(3,Arboles::Nodo.new(6),Arboles::Nodo.new(7,nil,Arboles::Nodo.new(10))))


hd = Arboles::Nodo.new(2,Arboles::Nodo.new(4),Arboles::Nodo.new('2'))
hi = Arboles::Nodo.new(1,Arboles::Nodo.new(3),Arboles::Nodo.new('1'))
pruebaBin = Arboles::Nodo.new('0',hd,hi)
puts "\n Prueba Binario"
pruebaBin.bfs {|nodo| puts nodo.valor}


# Probando FUNCIONA
=begin
n1 = Arboles::NodoRosa.new( 9, [Arboles::NodoRosa.new(15, [Arboles::NodoRosa.new(20)]), Arboles::NodoRosa.new(16)])
n2 = Arboles::NodoRosa.new(10)
n3 = Arboles::NodoRosa.new(11, [Arboles::NodoRosa.new(17),Arboles::NodoRosa.new(18),Arboles::NodoRosa.new(19)])
n4 = Arboles::NodoRosa.new(12)
n5 = Arboles::NodoRosa.new(13, [Arboles::NodoRosa.new(14)])

pruebaRosa = Arboles::NodoRosa.new(4, [n1,n2,n3,n4,n5])
puts "\n Prueba Rosa"
pruebaRosa.bfs {|nodo| puts nodo.valor}
=end

