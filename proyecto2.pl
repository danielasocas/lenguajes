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

/* Predicado principal
	A  = Arbol

	Verifica si un arbol esta bien etiquetado
 */
 bienEtiquetado(A) :- bienEtiquetado_aux(A,[],[]).
 
 /* Predicado auxiliar
	Vn = Valor del nodo, 
	E = Expresion, 
	Lvn = lista de vertices, 
	Lva = lista de aristas

	Revisa si no existe ya, si el arista es valido y agrega el Vn a la lista vertices
 */
 bienEtiquetado_aux(nodo(Vn,E),Lvn,Lva) :- 	\+ member((Vn),Lvn) , 
 											es_arista(Vn,E,Lvn,Lva),
 											cantNodos(nodo(Vn,E),N), 
 											Vn >= 1,
 											Vn =< N.									
 
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