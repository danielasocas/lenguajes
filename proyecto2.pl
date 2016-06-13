/** Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog
*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*/

/* Predicado principal
 	Vn= Valor del nodo, E= Expresion, 
 	Lvn = lista de vertices, Lva = lista de aristas
  	Revisa si no existe ya, si el arista es valido y agrega el Vn a la lista vertices
 */
 
/*Predicado que recorre un arbol y regresa la cantidad de nodos que tiene*/

/*Caso Base*/
cantNodos([],0).
/*Caso recursivo*/
cantNodos(nodo(_,Resto),N) :- cantNodos(Resto,M),N is M+1 .

cantNodos([arista(_,SubArbol)|RestoA],N) :- cantNodos(SubArbol,M1), cantNodos(RestoA,M2), N is M1 + M2.


 bienEtiquetado(A) :- bienEtiquetado_aux(A,[],[]).
 
 bienEtiquetado_aux(nodo(Vn,E),Lvn,Lva) :- \+ member((Vn),Lvn) , es_arista(Vn,E,Lvn,Lva).										
 es_arista(_,[],_,_).
 es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es],Lvn,Lva) :- Va is abs(Vn0 - Vn1), \+ member((Va),Lva), bienEtiquetado_aux(nodo(Vn1,E),Vn0|Lvn,Va|Lva), es_arista(Vn0,Es,Vn0|Lvn,Va|Lva).	