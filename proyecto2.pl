/** Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog
*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*/


/* Predicado principal
	Revisa si no existe ya, si el arista es valido y agrega el Vn a la lista vertices
	In: 
		Vn= Valor del nodo, E= Etiqueta, 
		Dos listas vacias, como empiean los Lvn y Lva del out.
	Out:	
		Lvn = lista de vertices, Lva = lista de aristas
*/

bienEtiquetado(A) :- bienEtiquetado_aux(A,[],LvnOut,[],LvaOut), is_set(LvnOut), is_set(LvaOut),length(LvnOut,Tam), max_list(LvnOut,Tam).

/*   */

bienEtiquetado_aux(nodo(Vn,[]),Lvn,[Vn|Lvn],Lva,Lva).
bienEtiquetado_aux(nodo(Vn,E),Lvn,LvnOut,Lva,LvaOut) :- es_arista(Vn,E,[Vn|Lvn],LvnOut,Lva,LvaOut).

/*   */

es_arista(_,[],LvnOut,LvnOut,LvaOut,LvaOut).
es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es],Lvn,LvnOut,Lva,LvaOut) :- Va is abs(Vn0 - Vn1), bienEtiquetado_aux(nodo(Vn1,E),Lvn,LvnOut,[Va|Lva],LvaOut), es_arista(Vn0,Es,LvnOut,_,LvaOut,_).
