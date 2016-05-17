module Sust where

Import Term

data Sust  =  Term Term

class Sustitucion s where
	sust :: Term -> s -> Term

instance sustitucion Sust where
sust a Sust 

instance sust (Term,Sust,Term) where

instance sust (Term,Term,Sust,Term,Term) where


infixl 1 =: 
(=:) :: Term -> Term -> Sust 
(=:) a b  =   a b 