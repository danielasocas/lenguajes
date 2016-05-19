{- 	Universidad Simon Bolivar
	Laboratorio de Lenguajes I 
	Verificador de demostraciones logicas

	Daniela Socas 11-10979
	Sergio Teran  11-11020

	Terminos y operadores
-}

{- Convirtiendolo en un modulo para poder usarlo en otros modulos -}

module Term where

{------------ CONSTRUCTORES DE DATOS -----------}

{----------Funciones Dummy----------}
data Ignorar = Lambda | Using | With 

{---------------Term----------------}
data Term = Var Char
	| T 				{-  true  -}
	| F 				{- false  -}
	| Or Term Term 		{-   \/   -}
	| And Term Term 	{-   /\   -}
	| Impl Term Term 	{-  ==>   -}
	| Dimpl Term Term 	{-  <==>  -}
	| Ndimpl Term Term	{- !<==>  -}
	| Not Term			{- negado -}

{-------------Ecuacion--------------}
data Ecuacion = Equiv Term Term


{------------------ INSTANCIAS -----------------}

{---------------Term----------------}
instance Eq Term where
	T == T = True
	F == F = True
	(Var a) == (Var b) = a == b
	(Or a b) == (Or c d) = (a == c) && (b == d)
	(And a b) == (And c d) = (a == c) && (b == d)
	(Impl a b) == (Impl c d) = (a == c) && (b == d)
	(Dimpl a b) == (Dimpl c d) = (a == c) && (b == d)
	(Ndimpl a b) == (Ndimpl c d) = (a == c) && (b == d)
	(Not a ) == (Not b) = (a == b)
	_ == _ = False

	 


{------------------ OPERADORES -----------------}

{-------------Ecuacion--------------}
(===) :: Term -> Term -> Ecuacion
(===) = Equiv

{---------------Term----------------}

{- Constantes -}
true :: Term
true = T

false :: Term
false = F

{- operadores -}
(\/) :: Term -> Term -> Term
(\/) = Or

(/\) :: Term -> Term -> Term 
(/\) = And

(==>) :: Term -> Term -> Term
(==>) = Impl

(<==>) :: Term -> Term -> Term
(<==>) = Dimpl

(!<==>) :: Term -> Term -> Term
(!<==>) = Ndimpl

neg :: Term -> Term
neg = Not

{- Ordenar precendencia de operadores -}
						{- El negado tiene la precedencia maxima, asi que no se coloca aqui -}
infixl 4 \/, /\			{- Asociancion hacia izquierda -}
infixr 3 ==>			{-  Asociancion hacia DERECHA  -}
infixl 2 <==>, !<==>	{- Asociancion hacia izquierda -}
						{- El operador de sustitucion esta en otro modulo -}
infixl 0 ===

{- Caracteres -}
a :: Term
a = Var 'a'
b :: Term
b = Var 'b'
c :: Term
c = Var 'c'
d :: Term
d = Var 'd'
e :: Term
e = Var 'e'
f :: Term
f = Var 'f'
g :: Term
g = Var 'g'
h :: Term
h = Var 'h'
i :: Term
i = Var 'i'
j :: Term
j = Var 'j'
k :: Term
k = Var 'k'
l :: Term
l = Var 'l' 
m :: Term
m = Var 'm'
n :: Term
n = Var 'n'
o :: Term
o = Var 'o'
p :: Term
p = Var 'p'
q :: Term
q = Var 'q'
r :: Term
r = Var 'r'
s :: Term
s = Var 's'
t :: Term
t = Var 't'
u :: Term
u = Var 'u'
v :: Term
v = Var 'v'
w :: Term
w = Var 'w'
x :: Term
x = Var 'x'
y :: Term
y = Var 'y'
z :: Term
z = Var 'z'
