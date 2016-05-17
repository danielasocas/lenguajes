module Sust where

Import Term

data Sust  = sust Term Term

class sust s where
	:: Term -> s -> Term

infixl 1 =: 
(=:) :: Term -> Term -> Sust 
(=:) a b  =  sust a b 