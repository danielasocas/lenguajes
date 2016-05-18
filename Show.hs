{- 	Universidad Simon Bolivar
	Laboratorio de Lenguajes I 
	Verificador de demostraciones logicas

	Daniela Socas 11-10979
	Sergio Teran  11-11020

	Show (No estoy muy clara donde poner esto pero fui adelantando)
-}


showTerm :: Term -> String
showTerm (Var a) = (show a)

showTerm T  = "true"
showTerm F  = "false"

showTerm (Or (Var a) (Var b)) = showTerm(Var a) ++ "\\/" ++ showTerm(Var b)
showTerm (Or (Var a) t) = showTerm(Var a) ++ "\\/ (" ++ showTerm(t) ++ ")"
showTerm (Or t (Var a)) = "(" ++ showTerm(t) ++ ")" ++ "\\/" ++ showTerm(Var a)
showTerm (Or t1 t2) = "(" ++ showTerm t1 ++ ") \\/ (" ++ showTerm t2 ++ ")"

showTerm (And (Var a) (Var b)) = showTerm(Var a) ++ "/\\" ++ showTerm(Var b)
showTerm (And (Var a) t) = showTerm(Var a) ++ "\\/ (" ++ showTerm(t) ++ ")"
showTerm (And t (Var a)) = "(" ++ showTerm(t) ++ ")" ++ " \\/ " ++ showTerm(Var a)
showTerm (And t1 t2) = "(" ++ showTerm t1 ++ ") \\/ (" ++ showTerm t2 ++ ")"

showTerm (Impl (Var a) (Var b)) = showTerm(Var a) ++ "==>" ++ showTerm(Var b)
showTerm (Impl (Var a) t) = showTerm(Var a) ++ " ==> (" ++ showTerm(t) ++ ")"
showTerm (Impl t (Var a)) = "(" ++ showTerm(t) ++ ")" ++ " ==> " ++ showTerm(Var a)
showTerm (Impl t1 t2) = "(" ++ showTerm t1 ++ ") ==> (" ++ showTerm t2 ++ ")"

showTerm (Dimpl (Var a) (Var b)) = showTerm(Var a) ++ "<==>" ++ showTerm(Var b)
showTerm (Dimpl (Var a) t) = showTerm(Var a) ++ " <==> (" ++ showTerm(t) ++ ")"
showTerm (Dimpl t (Var a)) = "(" ++ showTerm(t) ++ ")" ++ " <==> " ++ showTerm(Var a)
showTerm (Dimpl t1 t2) = "(" ++ showTerm t1 ++ ") <==> (" ++ showTerm t2 ++ ")"

showTerm (Ndimpl (Var a) (Var b)) = showTerm(Var a) ++ "!<==>" ++ showTerm(Var b)
showTerm (Ndimpl (Var a) t) = showTerm(Var a) ++ " !<==> (" ++ showTerm(t) ++ ")"
showTerm (Ndimpl t (Var a)) = "(" ++ showTerm(t) ++ ")" ++ " !<==> " ++ showTerm(Var a)
showTerm (Ndimpl t1 t2) = "(" ++ showTerm t1 ++ ") !<==> (" ++ showTerm t2 ++ ")"

showTerm (Not (Var a)) = "!" ++ showTerm(Var a) 
showTerm (Not t) = "!(" ++ showTerm(t) ++ ")"
