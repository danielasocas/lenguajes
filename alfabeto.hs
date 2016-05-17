{- Data constructor Term -}
data Term = Var Char
	| T
	| F
	| Or Term Term
	| And Term Term
{- AQUI VAN LOS CASOS DE EQUIVALENCIA, NEGACION, Y OTRAS COSAS LOGICAS -}

{- Funciones para booleanos -}
true :: Term; True = T
false :: Term; False = F

{- Funciones de casos de Char-}
a :: Term; a = Var 'a'
b :: Term; b = Var 'b'
c :: Term; c = Var 'c'
d :: Term; d = Var 'd'
e :: Term; e = Var 'e'
f :: Term; f = Var 'f'
g :: Term; g = Var 'g'
h :: Term; h = Var 'h'
i :: Term; i = Var 'i'
j :: Term; j = Var 'j'
k :: Term; k = Var 'k'
l :: Term; l = Var 'l' 
m :: Term; m = Var 'm'
n :: Term; n = Var 'n'
o :: Term; o = Var 'o'
p :: Term; p = Var 'p'
q :: Term; q = Var 'q'
r :: Term; r = Var 'r'
s :: Term; s = Var 's'
t :: Term; t = Var 't'
u :: Term; u = Var 'u'
v :: Term; v = Var 'v'
w :: Term; w = Var 'w'
x :: Term; x = Var 'x'
y :: Term; y = Var 'y'
z :: Term; z = Var 'z'

{- Funciones de operadores -}
(\/) :: Term -> Term -> Term ; (\/) a b = Or a b
(/\) :: Term -> Term -> Term ; (/\) a b = And a b
{-

(<==>) :: Term -> Term -> Term ; (<==>) a b = And a b 		* Aqui va la declaracion del equivalente y su negado, que creo	*
(!<==>) :: Term -> Term -> Term ; (!<==>) a b = And a b 	*  que tenemos que hacer una funcion aparte para eso			* 

-}

{- Ordenar precendencia de operadores -}
infixl 3 (\/) 
infixl 3 (/\) 
infixl 2 (==>) 
infixl 1 (<==>) 
infixl 1 (!<==>) 
infixl 0 (===) 