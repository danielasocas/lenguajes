/** Universidad Simon Bolivar
*	Laboratorio de Lenguajes I 
*	Prolog
*	Daniela Socas 11-10979
*	Sergio Teran  11-11020
*
*	Parte 2: Esqueleto
*/

% Cargando Archivos
:- [casos].

/* Predicado describirEtiquetamiento 
	Etiqueta = Etiqueta del nodo
	Aristas = Lista de Aristas del nodo
	
	Recorre el arbol en DFS e imprime sus valores con el formato 
		Valor Arista : Valor Nodo
	A excepcion de la raiz, donde solo dice raiz, en lugar de Valor Arista.
	*/
	describirEtiquetamiento(nodo(Etiqueta,Aristas)) :- 	writeln('\nRecorre el arbol en DFS e imprime sus valores con el formato Valor Arista : Valor Nodo'),
														writeln('A excepcion de la raiz, donde solo dice Raiz, en lugar de Valor Arista'),
														writeln('-------------------------'),
														writeln('Valor Arista : Valor Nodo'),
														writeln('-------------------------'),
								  		  				tab(8),
								  		  				/* Imprime el nodo raiz */
								  		  				write('Raiz : '),
								  		  				writeln(Etiqueta),
								  		  				/* Imprime los hijos del nodo */
										  				describir_aux(nodo(Etiqueta,Aristas)),
														writeln('-------------------------').

/* Predicado describir auxiliar
	Etiqueta = Etiqueta de un nodo
	_Arista = Arista del nodo
	RestoA = Cola de la lista de aristas
	ValArista = Etiqueta de la arista
	ValNodo = Etiquetda del nodo

	Toma un nodo, extrae los datos de su arista, los imprime y continua con la 
	cola de aristas
	*/
	/* Caso Base */
	describir_aux(nodo(_Etiqueta,[])).
	/* Caso Recursivo */
	describir_aux(nodo(_,[Arista|RestoA])) :-	extraer(Arista, ValArista, ValNodo),
						  		  				/* Luego de extraer los valores de la estructura arista, los imprime */
						  		  				tab(11),
					  							write(ValArista),						     	   
					  							write(' : '),
								  				writeln(ValNodo),
								  				/* Verifica si hay mas aristas en el nodo */
					     		  				describir_aux(nodo(_, RestoA)).	
/* Predicado describir auxiliar
	_ValArista = Valor de la arista
	_ValNodo = valor de nodo
	SubArbol = lista de aristas del nodo

	Toma una arista y extrae sus datos
	*/
	extraer(arista(ValArista, nodo(ValNodo, SubArbol)), ValArista, ValNodo) :- describir_aux(nodo(ValNodo,SubArbol)).