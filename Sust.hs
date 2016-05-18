{- 	Universidad Simon Bolivar
	Laboratorio de Lenguajes I 
	Verificador de demostraciones logicas

	Daniela Socas 11-10979
	Sergio Teran  11-11020

	Sustitucion 
-}

module Sust where

import Term

-- Clase de tipo para la sustitucion
data Sust = St Term Term -- St significando sustitucion textual

-- Clase Sustitucion y funcion sust.
class Sustituir s where
	sust :: Term -> s -> Term

{- Instancia simple de sustitucion
	a, b 	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1	 	= terminos por los que voy a sustituir
	p 	 	= terminos que quiero sustituir
-}
instance Sustituir Sust where
	sust Var a (St t1 (Var p))	| a == p 	= t1 -- Caso base 
								| otherwise = Var a  
  	sust T (St t1 (Var p)) = T 
	sust F (St t1 (Var p)) = F
	
	sust Or a b (St t1 (Var p)) = Or (sust a (St t1 p)) (sust b (St t1 p))  
	sust And a b (St t1 (Var p)) = And (sust a (St t1 p)) (sust b (St t1 p))
	
	sust Impl a b (St t1 (Var p)) = Impl (sust a (St t1 p)) (sust b (St t1 p))
	sust Dimpl a b (St t1 (Var p)) = Dimpl (sust a (St t1 p)) (sust b (St t1 p))
	sust Ndimpl a b (St t1 (Var p)) = Ndimpl (sust a (St t1 p)) (sust b (St t1 p))
	
	sust Not a (St t1 (Var p)) = Not (sust a (St t1 p)) 

{- Instancia doble de sustitucion
	a, b	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1, t2 	= terminos por los que voy a sustituir
	p, q 	= terminos que quiero sustituir
-}
instance Sustituir (Term,Sust,Term) where
	sust Var a (t2, (St t1 (Var p)), Var q)	| a == p 	= t1 -- Caso base 
											| a == q 	= t2
											| otherwise = Var a  
  	sust T (t2, (St t1 (Var p)), Var q) = T 
	sust F (t2, (St t1 (Var p)), Var q) = F
	
	sust Or a b (t2, (St t1 (Var p)), Var q) = Or (sust a (t2, (St t1 (Var p)), Var q)) (sust b (t2, (St t1 (Var p)), Var q))  
	sust And a b (t2, (St t1 (Var p)), Var q) = And (sust a (t2, (St t1 (Var p)), Var q)) (sust b (t2, (St t1 (Var p)), Var q))
	
	sust Impl a b (t2, (St t1 (Var p)), Var q) = Impl (sust a (t2, (St t1 (Var p)), Var q)) (sust b (t2, (St t1 (Var p)), Var q))
	sust Dimpl a b (t2, (St t1 (Var p)), Var q) = Dimpl (sust a (t2, (St t1 (Var p)), Var q)) (sust b (t2, (St t1 (Var p)), Var q))
	sust Ndimpl a b (t2, (St t1 (Var p)), Var q) = Ndimpl (sust a (t2, (St t1 (Var p)), Var q)) (sust b (t2, (St t1 (Var p)), Var q))
	
	sust Not a (t2, (St t1 (Var p)), Var q) = Not (sust a (t2, (St t1 (Var p)), Var q)) 

{- Instancia doble de sustitucion
	a, b 	 	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1, t2, t3	= terminos por los que voy a sustituir
	p, q, r 	= terminos que quiero sustituir
-}
-- Instancia triple de sustitucion
instance Sustituir (Term,Term,Sust,Term,Term) where
	sust Var a (t3,(t2, (St t1 (Var p)), Var q), Var r)	| a == p 	= t1 -- Caso base 
														| a == q 	= t2
														| a == r 	= t3
														| otherwise = Var a  
   	sust T (t3,(t2, (St t1 (Var p)), Var q), Var r) = T 
	sust F (t3,(t2, (St t1 (Var p)), Var q), Var r) = F
	
	sust Or a b (t3,(t2, (St t1 (Var p)), Var q), Var r) = Or (sust a (t3,(t2, (St t1 (Var p)), Var q), Var r)) (sust b (t3,(t2, (St t1 (Var p)), Var q), Var r))  
	sust And a b (t3,(t2, (St t1 (Var p)), Var q), Var r) = And (sust a (t3,(t2, (St t1 (Var p)), Var q), Var r)) (sust b (t3,(t2, (St t1 (Var p)), Var q), Var r))
	
	sust Impl a b (t3,(t2, (St t1 (Var p)), Var q), Var r) = Impl (sust a (t3,(t2, (St t1 (Var p)), Var q), Var r)) (sust b (t3,(t2, (St t1 (Var p)), Var q), Var r))
	sust Dimpl a b (t3,(t2, (St t1 (Var p)), Var q), Var r) = Dimpl (sust a (t3,(t2, (St t1 (Var p)), Var q), Var r)) (sust b (t3,(t2, (St t1 (Var p)), Var q), Var r))
	sust Ndimpl a b (t3,(t2, (St t1 (Var p)), Var q), Var r) = Ndimpl (sust a (t3,(t2, (St t1 (Var p)), Var q), Var r)) (sust b (t3,(t2, (St t1 (Var p)), Var q), Var r))
	
	sust Not a (t3,(t2, (St t1 (Var p)), Var q), Var r) = Not (sust a (t3,(t2, (St t1 (Var p)), Var q), Var r)) 

-- Precedencia Izquierda 
infixl 1 =: 
(=:) :: Term -> Term -> Sust 
(=:) t1 (Var p)  = St t1 (Var p)  

{- Funcion instantiate
	izq, der 	= lado izquierdo y derecho de la ecuacion a instanciar (el Teorema).
	s 			= es la sustitucion.
-}
instantiate :: (sustituir s) => Ecuacion -> s -> Ecuacion
instantiate Equiv izq der s = Equiv (sust (izq s)) (sust (der s)) 


{- Funcion Leibniz
	izq, der 	= lado izquierdo y derecho de la ecuacion instanciada.
	e			= Expresion a aplicar Leibniz.
	z 			= Variable de la Expresion a la cual se va a sustituir con la ecuacion.
-}
leibniz :: Ecuacion -> Term -> Term -> Ecuacion
leibniz Equiv izq der e Var z = Equiv (sust e (St izq (Var z))) (sust e (St der (Var z)))  

{- Funcion inferrencia
	
-}
infer :: sustituir sus => Float -> sus -> Term -> Term -> Ecuacion
infer n sus Var z e =  (leibniz (instantiate prop(n) sus) e (Var z))

{- Funcion step
	
-}
step :: sustituir sus =>  Term -> Float -> sus -> Term -> Term -> Term 
step t1 n sus (Var z) e	| t1 == mostrarI (infer n sus (Var z) e) = mostrarI (infer n sus (Var z) e)
						| t1 == mostrarD (infer n sus (Var z) e) = mostrarD (infer n sus (Var z) e)
						| otherwise = Error "Vas a clavar logica"

mostrarI :: Ecuacion -> Term
mostrarI Equiv t1 t2 = t1

mostrarD :: Ecuacion -> Term
mostrarD Equiv t1 t2 = t2



