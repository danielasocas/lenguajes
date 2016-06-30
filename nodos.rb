class Fixnum

	def mutar(mutador)
		return mutador.mutarFixnum(self)
	end

end


class String

	def mutar(mutador)
		return mutador.mutarString(self)
	end

end

class Array

	def mutar(mutador)
		return mutador.mutarArray(self)
	end

end