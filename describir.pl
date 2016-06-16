%Describir Etiquetamiento 

describirEtiquetamiento(nodo(Vn,E)) :- describirEtiquetamiento(nodo(Vn,E),0).
describirEtiquetamiento(nodo(Vn,E),Iden) :- 
			%tab(Iden),
			write('('),write(Vn),write(')'),
			nl,
			etiquetado(E,Iden).

etiquetado([],_).
etiquetado([arista(Va,nodo(Vn1,E))|Es],Iden) :- 	
			tab(Iden),
			write(Va),write('->'),
			Iden2 is Iden +3,
			describirEtiquetamiento(nodo(Vn1,E),Iden2),
			etiquetado(Es,Iden).