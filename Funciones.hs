{- 	Universidad Simon Bolivar
	Laboratorio de Lenguajes I 
	Verificador de demostraciones logicas

	Daniela Socas 11-10979
	Sergio Teran  11-11020

	Codigo principal Ayudante logico
-}

module Funciones where

import Sust
import Term
import Theorems
import Show

{- Funciones dummys -}
with :: Ignorar
with = With

lambda :: Ignorar
lambda = Lambda

using :: Ignorar
using = Using

{--------Funcion instantiate--------}
{- 	izq, der 	= lado izquierdo y derecho de la ecuacion a instanciar (el Teorema).
	s 			= es la sustitucion.
-}
instantiate :: (Sustituir s) => Ecuacion -> s -> Ecuacion
instantiate (Equiv izq der) sus = Equiv (sust izq sus) (sust der sus) 

{----------Funcion Leibniz----------}
{-	izq, der 	= lado izquierdo y derecho de la ecuacion instanciada.
	e			= Expresion a aplicar Leibniz.
	z 			= Variable de la Expresion a la cual se va a sustituir con la ecuacion.
-}
leibniz :: Ecuacion -> Term -> Term -> Ecuacion
leibniz (Equiv izq der) e (Var z) = Equiv (sust e (St izq (Var z))) (sust e (St der (Var z)))  

{---------Funcion inferencia--------}
infer :: (Sustituir s) => Float -> s -> Term -> Term -> Ecuacion
infer n sus t1 e =  (leibniz (instantiate (prop n) sus) e t1)

{----------- Funcion step ----------}
{-	t1			= termino que compara en la inferencia
	n,s,z,e 	= parametros de la funcion infer	
	li,ld 		= termino que regresa si coincide con t1
-}
step :: (Sustituir s) =>  Term -> Float -> s -> Term -> Term -> Term 
step t1 n sus (Var z) e	| t1 == li = li
						| t1 == ld = ld
						| otherwise = error "Regla de Inferencia no aplicable"
						where
							(Equiv li ld) = (infer n sus (Var z) e)

{--------- Funcion statement -------}
statement :: (Sustituir s, Show s) => Float -> Ignorar -> s -> Ignorar -> Ignorar -> Term -> Term -> Term -> IO Term
statement f _ s _ _ (Var z) e t1 = do
							{-putStrLn $ id "=== < statement " ++ show f ++ " with " ++ show s ++ " using lambda "++[z]++"("++show e ++ ") >"-}
							let x = step t1 f s (Var z) e
							putStrLn $ id show x
							return (x)

{----------- Funcion proof ---------}
{-	a,b 		= terminos de la ecuacion a demostrar
-}
proof :: Ecuacion -> IO Term
proof (Equiv a b) = do
					putStrLn $ id "Probando " ++ (show a) ++ "==="++ (show b)
					putStrLn $ id show a
					return (a)

{------------ Funcion done ---------}
