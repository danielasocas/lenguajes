pruebaTab(0) :- tab(0),
				writeln('.>').

pruebaTab(N) :- 
				pruebaTab(M),
				tab(M),
				N is M+1,
				writeln('>').

