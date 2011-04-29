module Database.MySQL.Simple.QueryParams
    (
      QueryParams(..)
    ) where

import Database.MySQL.Simple.Param (Action(..), Param(..))
import Database.MySQL.Simple.Types (Only(..))

class QueryParams a where
    renderParams :: a -> [Action]

instance QueryParams () where
    renderParams _ = []

instance (Param a) => QueryParams (Only a) where
    renderParams (Only v) = [render v]

instance (Param a, Param b) => QueryParams (a,b) where
    renderParams (a,b) = [render a, render b]

instance (Param a, Param b, Param c) => QueryParams (a,b,c) where
    renderParams (a,b,c) = [render a, render b, render c]

instance (Param a, Param b, Param c, Param d) => QueryParams (a,b,c,d) where
    renderParams (a,b,c,d) = [render a, render b, render c, render d]

instance (Param a, Param b, Param c, Param d, Param e)
    => QueryParams (a,b,c,d,e) where
    renderParams (a,b,c,d,e) =
        [render a, render b, render c, render d, render e]

instance (Param a, Param b, Param c, Param d, Param e, Param f)
    => QueryParams (a,b,c,d,e,f) where
    renderParams (a,b,c,d,e,f) =
        [render a, render b, render c, render d, render e, render f]

instance (Param a, Param b, Param c, Param d, Param e, Param f, Param g)
    => QueryParams (a,b,c,d,e,f,g) where
    renderParams (a,b,c,d,e,f,g) =
        [render a, render b, render c, render d, render e, render f, render g]

instance (Param a, Param b, Param c, Param d, Param e, Param f, Param g,
          Param h)
    => QueryParams (a,b,c,d,e,f,g,h) where
    renderParams (a,b,c,d,e,f,g,h) =
        [render a, render b, render c, render d, render e, render f, render g,
         render h]

instance (Param a, Param b, Param c, Param d, Param e, Param f, Param g,
          Param h, Param i)
    => QueryParams (a,b,c,d,e,f,g,h,i) where
    renderParams (a,b,c,d,e,f,g,h,i) =
        [render a, render b, render c, render d, render e, render f, render g,
         render h, render i]

instance (Param a, Param b, Param c, Param d, Param e, Param f, Param g,
          Param h, Param i, Param j)
    => QueryParams (a,b,c,d,e,f,g,h,i,j) where
    renderParams (a,b,c,d,e,f,g,h,i,j) =
        [render a, render b, render c, render d, render e, render f, render g,
         render h, render i, render j]

instance (Param a) => QueryParams [a] where
    renderParams = map render
