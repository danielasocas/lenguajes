/** Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog
*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*/
 
/* Predicado CantNodos
	Resto, RestoA = Lista de aristas
	SubArbol = Subarbol de un nodo

	Recorre el arbol y cuenta cuantos nodos tiene
	*/
	/* Caso Base */
	cantNodos([],0).
	/* Caso Recursivo */
	cantNodos(nodo(_,Resto),N) :- 	cantNodos(Resto,M),
									N is M+1.
	cantNodos([arista(_,SubArbol)|RestoA],N) :- cantNodos(SubArbol,M1), 
												cantNodos(RestoA,M2), 
												N is M1 + M2.

/* Predicado auxiliar
	Vn = Valor del nodo, 
	E = Expresion, 
	Lvn = lista de vertices, 
	Lva = lista de aristas

	Revisa si no existe ya, si el arista es valido y agrega el Vn a la lista vertices
	*/
	 bienEtiquetado_aux(nodo(Vn,E),Lvn,Lva) :- 	\+ member((Vn),Lvn) , 
	 											es_arista(Vn,E,Lvn,Lva).								
	 
/* Predicado es_arista
	Vn0 = Valor de nodo padre,
	Va = Valor arista,
	Vn1 = Valor nodo hijo,
	E = SubArbol del nodo hijo,
	Es = Resto de hijos del nodo,
	Lvn = Lista de valores de nodos (Etiquetado(V)),
	Lva = Lista de valores de aristas (Etiquetado(E))

	Revisa si Va es una etiqueta valida, es decir, Va = |Vn0 - Vn1| y no esta repetida, a demas 
	revisa si el subArbol esta bien etiquetado
	*/
 	/* Caso base */
	es_arista(_,[],_,_).
	/* Caso Recursivo */
	es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es],Lvn,Lva) :- 	Va is abs(Vn0 - Vn1),
	 														\+ member((Va),Lva), 
	 														bienEtiquetado_aux(nodo(Vn1,E),Vn0|Lvn,Va|Lva), 
	 														es_arista(Vn0,Es,Vn0|Lvn,Va|Lva).

/* Predicado principal
<<<<<<< HEAD
	Revisa si no existe ya, si el arista es valido y agrega el Vn a la lista vertices
	In: 
		Vn= Valor del nodo, E= Etiqueta, 
		Dos listas vacias, como empiean los Lvn y Lva del out.
	Out:	
		Lvn = lista de vertices, Lva = lista de aristas
*/

bienEtiquetado(nodo(1,[])).
bienEtiquetado(A) :- bienEtiquetado_aux(A,[],LvnOut,[],LvaOut), 
			is_set(LvnOut), 		
			is_set(LvaOut),
			length(LvnOut,Tam), 
			max_list(LvnOut,Tam).

/*   */

bienEtiquetado_aux(nodo(Vn,[]),Lvn,[Vn|Lvn],Lva,Lva).
bienEtiquetado_aux(nodo(Vn,E),Lvn,LvnOut,Lva,LvaOut) :- es_arista(Vn,E,[Vn|Lvn],LvnOut,Lva,LvaOut).

/*   */

es_arista(_,[],LvnOut,LvnOut,LvaOut,LvaOut).
es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es],Lvn,LvnOut,Lva,LvaOut) :- Va is abs(Vn0 - Vn1), 
			bienEtiquetado_aux(nodo(Vn1,E),Lvn,Lvn2,[Va|Lva],Lva2), 
			es_arista(Vn0,Es,Lvn2,LvnOut,Lva2,LvaOut).
