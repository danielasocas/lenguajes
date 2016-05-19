import Term
import Theorems
import Show
import Sust
import Funciones
-----------------------------------------
-- Coloque los imports necesarios aqui --
-----------------------------------------

verify = let theorem = ( neg false === true ) in
         proof theorem
         >>=
         statement 3.8 with (p =: p) using lambda z (neg z)
         >>=
         statement 3.12 with (true =: p) using lambda z (z)
         >>=
         done theorem
