require_relative "trees.rb"
require_relative "nodos.rb"
require_relative "mod_bfs.rb"

puts "\nPrueba Bin"
pruebaBin = ArbolBinario.new(1,ArbolBinario.new(2,ArbolBinario.new(4,ArbolBinario.new(8)),ArbolBinario.new(5,nil,ArbolBinario.new(9))),ArbolBinario.new(3,ArbolBinario.new(6),ArbolBinario.new(7,nil,ArbolBinario.new(10))))

pruebaBin.bfs { |x| puts x.valor }
a = pruebaBin.recoger(lambda { |x| x.valor.even? })

for x in a
    print x.valor
    print ' '
end
puts ''

pruebaRosa = ArbolRosa.new("animal",
                ArbolRosa.new("lana"),
                ArbolRosa.new("losa"),
                ArbolRosa.new("lima"),
                ArbolRosa.new("trebol"),
                ArbolRosa.new("lamina"),
                ArbolRosa.new("ala"),
                ArbolRosa.new("avellana"),
                ArbolRosa.new("mani")
            )

puts "\nPrueba Rosa"
pruebaRosa.bfs {|nodo| puts nodo.valor}