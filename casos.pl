/*Casos de prueba*/
:- [proyecto2].
% Caso1: 
% Nodo raiz sin hijos
prueba1 :- bienEtiquetado(nodo(1,[])).

% Caso2:
% Nodo con un solo hijo
prueba2 :- bienEtiquetado(nodo(2,[arista(1,nodo(1,[]))])).

% Caso3:
% Nodo con un solo hijo, Y ese hijo tiene otro hijo
prueba3 :- bienEtiquetado(nodo(3,[arista(2,nodo(1,[arista(1,nodo(2,[]))]))])).

% Caso4:
% Nodo con dos hijos, Y esos hijos no tienen hijos
prueba4 :- bienEtiquetado(nodo(3,[arista(2,nodo(1,[])),arista(1,nodo(2,[]))])).

% Caso5:
% Nodo con dos hijos, Y el hijo izquierdo tiene un solo hijo
prueba5 :- bienEtiquetado(nodo(1,[arista(2,nodo(3,[arista(1,nodo(2,[]))])), arista(3,nodo(4,[]))])).

% Caso6:
% Nodo con dos hijos, Y el hijo derecho tiene un hijo
prueba6 :- bienEtiquetado(nodo(1,[arista(3,nodo(4,[])), arista(2,nodo(3,[arista(1, nodo(2,[]))]))])).

% Caso7:
% Nodo con tres hijos, esos hijos no tienen mas hijos
prueba7 :- bienEtiquetado(nodo(4,[arista(1,nodo(3,[])),arista(2,nodo(2,[])),arista(3,nodo(1,[]))])).

% Caso8:
% Nodo con tres hijos, tercer hijo tiene tres hijos mas, esos hijos no tienen mas hijos
prueba8 :- bienEtiquetado(nodo(4,[arista(1,nodo(3,[])),arista(2,nodo(2,[])),arista(3,nodo(1,[arista(6,nodo(7,[])), arista(5,nodo(6,[])), arista(4,nodo(5,[]))]))])).

% Caso9:
% Nodo con dos hijos, hijos tienen dos hijos cada uno, Y esos hijos no tienen mas hijos
prueba9 :- bienEtiquetado(nodo(7,[arista(6,nodo(1,[arista(5,nodo(6,[])), arista(4,nodo(5,[]))])), arista(3,nodo(4,[arista(2,nodo(2,[])), arista(1,nodo(3,[]))]))])).

prueba :- prueba9,prueba8,prueba7,prueba6,prueba5,prueba4,prueba3,prueba2,prueba1.