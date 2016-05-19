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
import Show

{------------- CONSTRUCTOR DE DATOS ------------}

{--------------- Sust ----------------}
data Sust = St Term Term -- St significando sustitucion textual

{------------ COMPORTAMIENTO DE SUST -----------}

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


{--------- Instancia simple ----------}
{-	a, b 	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1	 	= terminos por los que voy a sustituir
	p 	 	= terminos que quiero sustituir
-}
instance Sustituir Sust where
	sust (Var a) (St t1 (Var p))| a == p 	= t1 -- Caso base 
								| otherwise = Var a  

{--------- Instancia Doble ----------}
{-	a, b	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1, t2 	= terminos por los que voy a sustituir
	p, q 	= terminos que quiero sustituir
-}
instance Sustituir (Term,Sust,Term) where
	sust (Var a) (t2, St t1 (Var p), Var q)	
		| a == p 	= t1 -- Caso base 
		| a == q 	= t2
		| otherwise = Var a  

{--------- Instancia Triple ----------}
{-	a, b 	 	= parte de la ecuacion a la que voy a aplicar la sustitucion
	t1, t2, t3	= terminos por los que voy a sustituir
	p, q, r 	= terminos que quiero sustituir
-}
instance Sustituir (Term,Term,Sust,Term,Term) where
	sust (Var a) (t3, t2, (St t1 (Var p)), Var q , Var r)	
		| a == p 	= t1 -- Caso base 
		| a == q 	= t2
		| a == r 	= t3
		| otherwise = Var a  

{------------------- OPERADOR ------------------}
infixl 1 =:				{- Asociacion Izquierda -}
(=:) :: Term -> Term -> Sust  	
(=:) = St 