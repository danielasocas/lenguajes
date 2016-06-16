/*Casos de prueba*/

% Cargando Archivos
:- [proyecto2].

/*---------------------- Casos validos ----------------------*/
% Caso1: 
% Nodo raiz sin hijos
prueba1 :- 	bienEtiquetado(nodo(1,[])),
			write('Caso 1: ACEPTADO \n').

% Caso2:
% Nodo con un solo hijo
prueba2 :- 	bienEtiquetado(nodo(2,[arista(1,nodo(1,[]))])),
			write('Caso 2: ACEPTADO \n').

% Caso3:
% Nodo con un solo hijo, Y ese hijo tiene otro hijo
prueba3 :- 	bienEtiquetado(nodo(3,[arista(2,nodo(1,[arista(1,nodo(2,[]))]))])),
			write('Caso 3: ACEPTADO \n').

% Caso4:
% Nodo con dos hijos, Y esos hijos no tienen hijos
prueba4 :- 	bienEtiquetado(nodo(3,[arista(2,nodo(1,[])),arista(1,nodo(2,[]))])),
			write('Caso 4: ACEPTADO \n').

% Caso5:
% Nodo con dos hijos, Y el hijo izquierdo tiene un solo hijo
prueba5 :- 	bienEtiquetado(nodo(1,[	arista(2,nodo(3,[arista(1,nodo(2,[]))])), 
									arista(3,nodo(4,[]))])),
			write('Caso 5: ACEPTADO \n').

% Caso6:
% Nodo con dos hijos, Y el hijo derecho tiene un hijo
prueba6 :- 	bienEtiquetado(nodo(1,[	arista(3,nodo(4,[])), 
									arista(2,nodo(3,[arista(1, nodo(2,[]))]))])),
			write('Caso 6: ACEPTADO \n').

% Caso7:
% Nodo con tres hijos, esos hijos no tienen mas hijos (ejemplo proyecto)
prueba7 :- 	bienEtiquetado(nodo(4,[	arista(1,nodo(3,[])),
									arista(2,nodo(2,[])),
									arista(3,nodo(1,[]))])),
			write('Caso 7: ACEPTADO \n').

% Caso8:
% Nodo con tres hijos, tercer hijo tiene tres hijos mas, esos hijos no tienen 
% mas hijos
prueba8 :- 	bienEtiquetado(nodo(4,[	arista(1,nodo(3,[])),
									arista(2,nodo(2,[])),
									arista(3,nodo(1,[	arista(6,nodo(7,[])), 
														arista(5,nodo(6,[])), 
														arista(4,nodo(5,[]))]))])),
			write('Caso 8: ACEPTADO \n').

% Caso9:
% Nodo con dos hijos, hijos tienen dos hijos cada uno, Y esos hijos no tienen 
% mas hijos
prueba9 :- 	bienEtiquetado(nodo(7,[	arista(6,nodo(1,[	arista(5,nodo(6,[])), 
														arista(4,nodo(5,[]))])), 
									arista(3,nodo(4,[	arista(2,nodo(2,[])), 
														arista(1,nodo(3,[]))]))])),
			write('Caso 9: ACEPTADO \n').

% Caso10:
% Nodo con dos hijos, estos hijos tienen a su vez dos hijos mas, y el hijo 
% derecho del hijo izquierdo tiene un hijo
prueba10 :- bienEtiquetado(nodo(8,[	arista(7,nodo(1,[	arista(6,nodo(7,[])),
														arista(5,nodo(6,[arista(4,nodo(2,[]))]))])),
									arista(3,nodo(5,[	arista(2,nodo(3,[])),
														arista(1,nodo(4,[]))]))])),
			write('Caso 10: ACEPTADO \n').

pruebaV :- 	prueba1,
			prueba2,
			prueba3,
			prueba4,
			prueba5,
			prueba6,
			prueba7,
			prueba8,
			prueba9,
			prueba10.


/*---------------------- Casos invalidos ----------------------*/
% Caso11: 
% Nodo raiz sin hijos,con V != {1}
prueba11 :- \+ bienEtiquetado(nodo(2,[])),
			write('Caso 11: RECHAZADO \n').

% Caso12:
% Nodo con un solo hijo, con E != {1}
prueba12 :- \+bienEtiquetado(nodo(2,[arista(3,nodo(1,[]))])),
			write('Caso 12: RECHAZADO \n').

% Caso13:
% Nodo con un solo hijo, Y ese hijo tiene otro hijo, con nodos repetidos y 
% V != {1,2,3}
prueba13 :- \+ bienEtiquetado(nodo(3,[arista(2,nodo(1,[arista(1,nodo(1,[]))]))])),
			write('Caso 13: RECHAZADO \n').

% Caso14:
% Nodo con dos hijos, Y esos hijos no tienen hijos, con E = {5,1} != {2,1}
prueba14 :- \+ bienEtiquetado(nodo(3,[	arista(5,nodo(1,[])),
										arista(1,nodo(2,[]))])),
			write('Caso 14: RECHAZADO \n').

% Caso15:
% Nodo con dos hijos, Y el hijo izquierdo tiene un solo hijo, que es mayor que N
prueba15 :- \+ bienEtiquetado(nodo(1,[	arista(2,nodo(3,[arista(1,nodo(2,[]))])), 
										arista(3,nodo(100,[]))])),
			write('Caso 15: RECHAZADO \n').

% Caso16:
% Nodo con dos hijos, Y el hijo derecho tiene un hijo, el hijo izquierdo mayor 
% que N
prueba16 :- \+ bienEtiquetado(nodo(1,[	arista(3,nodo(90,[])), 
										arista(2,nodo(3,[arista(1, nodo(2,[]))]))])),
			write('Caso 16: RECHAZADO \n').

% Caso17:
% Nodo con tres hijos, esos hijos no tienen mas hijos (ejemplo proyecto), con 
% raiz 80
prueba17 :- \+ bienEtiquetado(nodo(80,[	arista(1,nodo(3,[])),
										arista(2,nodo(2,[])),
										arista(3,nodo(1,[]))])),
			write('Caso 17: RECHAZADO \n').

% Caso18:
% Nodo con tres hijos, tercer hijo tiene tres hijos mas, esos hijos no tienen 
% mas hijos, con etiquetas de aristas 1 y 5 intercambiadas
prueba18 :- \+ bienEtiquetado(nodo(4,[	arista(5,nodo(3,[])),
										arista(2,nodo(2,[])),
										arista(3,nodo(1,[	arista(6,nodo(7,[])), 
															arista(1,nodo(6,[])), 
															arista(4,nodo(5,[]))]))])),
			write('Caso 18: RECHAZADO \n').

% Caso19:
% Nodo con dos hijos, hijos tienen dos hijos cada uno, Y esos hijos no tienen 
% mas hijos, tiene n un nodo con valor 9
prueba19 :- \+ bienEtiquetado(nodo(7,[	arista(6,nodo(1,[	arista(5,nodo(6,[])), 
															arista(4,nodo(5,[]))])), 
										arista(3,nodo(4,[	arista(2,nodo(9,[])), 
															arista(1,nodo(3,[]))]))])),
			write('Caso 19: RECHAZADO \n').

% Caso20:
% Nodo con dos hijos, estos hijos tienen a su vez dos hijos mas, y el hijo 
% derecho del hijo izquierdo tiene un hijo, una arista vale 9
prueba20 :- \+ bienEtiquetado(nodo(8,[	arista(7,nodo(1,[	arista(9,nodo(7,[])),
															arista(5,nodo(6,[arista(4,nodo(2,[]))]))])),
										arista(3,nodo(5,[	arista(2,nodo(3,[])),
															arista(1,nodo(4,[]))]))])),
			write('Caso 20: RECHAZADO \n').


pruebaF :- 	prueba11,
			prueba12,
			prueba13,
			prueba14,
			prueba15,
			prueba16,
			prueba17,
			prueba18,
			prueba19,
			prueba20.

/*---------------------- Todos los Casos ----------------------*/
prueba :- 	pruebaV,pruebaF,
			write('Todos los casos son evaluados').