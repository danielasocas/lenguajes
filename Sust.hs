{- 	Universidad Simon Bolivar
	Laboratorio de Lenguajes I 
	Verificador de demostraciones logicas

	Daniela Socas 11-10979
	Sergio Teran  11-11020

	Sustitucion 
-}

{-# LANGUAGE FlexibleInstances #-}

module Sust where

import Term
import Theorems

-- Clase de tipo para la sustitucion
data Sust = St Term Term -- St significando sustitucion textual

-- Clase Sustitucion y funcion sust.
class Sustituir s where
	sust :: Term -> s -> Term
	
	sust (Or a b) su = Or (sust a su) (sust b su)  
	sust (And a b) su = And (sust a su) (sust b su)
	sust (Impl a b) su = Impl (sust a su) (sust b su)
	sust (Dimpl a b) su = Dimpl (sust a su) (sust b su)
	sust (Ndimpl a b) su = Ndimpl (sust a su) (sust b su)
	sust (Not a) su = Not (sust a su) 

  	sust T _ = T 
	sust F _ = F


{- Instancia simple de sustitucion
	a, b 	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1	 	= terminos por los que voy a sustituir
	p 	 	= terminos que quiero sustituir
-}
instance Sustituir Sust where
	sust Var a (St t1 (Var p))	| a == p 	= t1 -- Caso base 
								| otherwise = Var a  

{- Instancia doble de sustitucion
	a, b	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1, t2 	= terminos por los que voy a sustituir
	p, q 	= terminos que quiero sustituir
-}
instance Sustituir (Term,Sust,Term) where
	sust Var a (t2, St t1 (Var p), Var q)	
		| a == p 	= t1 -- Caso base 
		| a == q 	= t2
		| otherwise = Var a  

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

-- Precedencia Izquierda 
infixl 1 =: 
(=:) :: Term -> Term -> Sust 
(=:) = St  

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
infer :: Float -> sus -> Term -> Term -> Ecuacion
infer n t1 sus t2 e =  (leibniz (instantiate (prop n) sus) e t2)

{- Funcion step
	
-}
step :: sustituir sus =>  Term -> Float -> sus -> Term -> Term -> Term 
step t1 n sus (Var z) e	| t1 == mostrarI (infer n sus (Var z) e) = mostrarI (infer n sus (Var z) e)
						| t1 == mostrarD (infer n sus (Var z) e) = mostrarD (infer n sus (Var z) e)
						| otherwise = error "falla"
						where
							(Equiv li ld) = (infer n sus (Var z) e)

mostrarI :: Ecuacion -> Term
mostrarI Equiv t1 t2 = t1

mostrarD :: Ecuacion -> Term
mostrarD Equiv t1 t2 = t2

{- Funciones dummys -}

statment :: Float -> Ignorar -> Sust -> Ignorar -> Ignorar -> Term -> Term -> Term -> IO Term
statment f _ s _ _ (Var z) tE t1 = return t1 

with :: Ignorar
with = With

lambda :: Ignorar
lambda = Lambda

using :: Ignorar
using = Using
