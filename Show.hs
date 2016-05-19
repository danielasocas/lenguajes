{- 	Universidad Simon Bolivar
	Laboratorio de Lenguajes I 
	Verificador de demostraciones logicas

	Daniela Socas 11-10979
	Sergio Teran  11-11020

	Show (No estoy muy clara donde poner esto pero fui adelantando)
-}
module Show where

import Term
import Theorems


instance Show Ecuacion where
	show (Equiv a b) = show a ++ " === " ++ show b

instance Show Term where
	show (Var a) = [a]

	show T  = "true"
	show F  = "false"

	show (Or (Var a) (Var b)) = show(Var a) ++ "\\/" ++ show(Var b)
	show (Or (Var a) t) = show(Var a) ++ "\\/ (" ++ show(t) ++ ")"
	show (Or t (Var a)) = "(" ++ show(t) ++ ")" ++ "\\/" ++ show(Var a)
	show (Or t1 t2) = "(" ++ show t1 ++ ") \\/ (" ++ show t2 ++ ")"

	show (And (Var a) (Var b)) = show(Var a) ++ "/\\" ++ show(Var b)
	show (And (Var a) t) = show(Var a) ++ "\\/ (" ++ show(t) ++ ")"
	show (And t (Var a)) = "(" ++ show(t) ++ ")" ++ " \\/ " ++ show(Var a)
	show (And t1 t2) = "(" ++ show t1 ++ ") \\/ (" ++ show t2 ++ ")"

	show (Impl (Var a) (Var b)) = show(Var a) ++ "==>" ++ show(Var b)
	show (Impl (Var a) t) = show(Var a) ++ " ==> (" ++ show(t) ++ ")"
	show (Impl t (Var a)) = "(" ++ show(t) ++ ")" ++ " ==> " ++ show(Var a)
	show (Impl t1 t2) = "(" ++ show t1 ++ ") ==> (" ++ show t2 ++ ")"

	show (Dimpl (Var a) (Var b)) = show(Var a) ++ "<==>" ++ show(Var b)
	show (Dimpl (Var a) t) = show(Var a) ++ " <==> (" ++ show(t) ++ ")"
	show (Dimpl t (Var a)) = "(" ++ show(t) ++ ")" ++ " <==> " ++ show(Var a)
	show (Dimpl t1 t2) = "(" ++ show t1 ++ ") <==> (" ++ show t2 ++ ")"

	show (Ndimpl (Var a) (Var b)) = show(Var a) ++ "!<==>" ++ show(Var b)
	show (Ndimpl (Var a) t) = show(Var a) ++ " !<==> (" ++ show(t) ++ ")"
	show (Ndimpl t (Var a)) = "(" ++ show(t) ++ ")" ++ " !<==> " ++ show(Var a)
	show (Ndimpl t1 t2) = "(" ++ show t1 ++ ") !<==> (" ++ show t2 ++ ")"

	show (Not (Var a)) = "!" ++ show(Var a) 
	show (Not t) = "!(" ++ show(t) ++ ")"
