/** 	Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog

*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*/

 child(anne,bridget). 
   child(bridget,caroline). 
   child(caroline,donna). 
   child(donna,emily). 
    
   descend(X,Y)  :-  child(X,Y). 
    
   descend(X,Y)  :-  child(X,Z), 
                                     descend(Z,Y).

my_last(X,[X]).
my_last(X, [_|T]) :- my_last(X,T).
			
my_butone(X,[X,_]).
my_butone(X,[_|L]) :- my_butone(X,L).

element(X,[X|_],1).
element(X,[_|L],Y) :- Y > 1, Y1 is Y-1, element(X,L,Y1).

lengths([],0).
lengths([_|L],N) :- lengths(L,N1), N is N1 +1.

my_reverse(L1,L2) :- my_rev(L1,L2,[]).

my_rev([],L2,L2) :- !.
my_rev([X|Xs],L2,Acc) :- my_rev(Xs,L2,[X|Acc]).

is_palin(L1) :- my_reverse(L1,L1).




bienEtiquetado(nodo(_,E)) :- es_arista(E).

es_arista([]).
es_arista(arista(_,N)|Es) :-  bienEtiquetado(N), es_arista(Es).


----------------------------
bienEtiquetado(A) :- bienEtiquetado_aux(A,[],LvnOut,[],LvaOut), is_set(LvnOut), is_set(LvaOut),length(LvnOut,Tam), max_list(LvnOut,Tam).

/*   */

bienEtiquetado_aux(nodo(Vn,[]),Lvn,[Vn|Lvn],Lva,Lva).
bienEtiquetado_aux(nodo(Vn,E),Lvn,LvnOut,Lva,LvaOut) :- es_arista(Vn,E,[Vn|Lvn],LvnOut,Lva,LvaOut).

/*   */

es_arista(_,[],LvnOut,LvnOut,LvaOut,LvaOut).
es_arista(Vn0,[arista(Va,nodo(Vn1,E))|Es],Lvn,LvnOut,Lva,LvaOut) :- Va is abs(Vn0 - Vn1), bienEtiquetado_aux(nodo(Vn1,E),Lvn,LvnOut,[Va|Lva],LvaOut), es_arista(Vn0,Es,LvnOut,_,LvaOut,_).



