/** Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog
*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*/

bienEtiquetado(nodo(Vn,E)) :- es_arista(Vn,E).

es_arista(_,[]).
es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es]) :- Va is abs(Vn0 - Vn1),bienEtiquetado(nodo(Vn1,E)), es_arista(Vn0,Es).	