/** Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog
*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*/

/* Predicado principal
	In: 
		Vn= Valor del nodo, E= Etiqueta, 
		Dos listas vacias, como empiean los Lvn y Lva del out.
	Out:	
		Lvn = lista de vertices, Lva = lista de aristas
	
	Revisa si no existe ya, si el arista es valido y agrega el Vn a la lista vertices
*/

bienEtiquetado(nodo(1,[])).
bienEtiquetado(A) :- bienEtiquetado_aux(A,[],LvnOut,[],LvaOut), 
			is_set(LvnOut), 		
			is_set(LvaOut),
			length(LvnOut,Tam), 
			max_list(LvnOut,Tam).

/* Predicado auxiliar
	Vn
	Lvn
	Lva
	E
	LvnOut


	*/
	/* Caso Base */
	bienEtiquetado_aux(nodo(Vn,[]),Lvn,[Vn|Lvn],Lva,Lva).
	/* Caso Recursivo */
	bienEtiquetado_aux(nodo(Vn,E),Lvn,LvnOut,Lva,LvaOut) :- es_arista(Vn,E,[Vn|Lvn],LvnOut,Lva,LvaOut).

/* Predicado Es arista
	LvnOut
	LvaOut
	Vn1
	E
	Es
	Lvn
	Lva
	Va
	Vn0
	Vn1
	Lva2

	Verifica que una lista de aristas este bien construida
	*/

	es_arista(_,[],LvnOut,LvnOut,LvaOut,LvaOut).
	es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es],Lvn,LvnOut,Lva,LvaOut) :- Va is abs(Vn0 - Vn1), 
				bienEtiquetado_aux(nodo(Vn1,E),Lvn,Lvn2,[Va|Lva],Lva2), 
				es_arista(Vn0,Es,Lvn2,LvnOut,Lva2,LvaOut).
