{- Convirtiendolo en un modulo para poder usarlo en otros modulos -}

module Term where

{- Data constructor Term -}
data Term = Var Char
	| T 				{-  true  -}
	| F 				{- false  -}
	| Or Term Term 		{-   \/   -}
	| And Term Term 	{-   /\   -}
	| Impl Term Term 	{-  ==>   -}
	| Dimpl Term Term 	{-  <==>  -}
	| Ndimp Term Term	{- !<==>  -}
	| Not Term			{- negado -}
	{-!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-}
	{-                                        -}
	{- Equivalencia no esto seguro si va aqui -}
	{-                                        -}
	{-!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-}

{- Funciones para booleanos -}
true :: Term
true = T
false :: Term
false = F

{- Funciones de operadores -}
(\/) :: Term -> Term -> Term
(\/) a b = Or a b

(/\) :: Term -> Term -> Term 
(/\) a b = And a b

(==>) :: Term -> Term -> Term
(==>) a b = Impl a b

(<==>) :: Term -> Term -> Term
(<==>) a b = Dimpl a b

(!<==>) :: Term -> Term -> Term
(!<==>) a b = Ndimp a b

{- Funcion para la negacion -}
neg :: Term -> Term
neg a = Not a

{- Ordenar precendencia de operadores -}
infixl 4 \/
infixl 4 /\
infixl 3 ==>
infixl 2 <==>
infixl 2 !<==>

{- Funciones de casos de Char-}
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

showTerm :: Term -> String
showTerm T = "true"
showTerm F = "false"
showTerm (Var a) = [a]

{- Agregando el tipo Term a la clase Show y que su funcion show sea showTerm -}
instance Show Term where
	show = showTerm