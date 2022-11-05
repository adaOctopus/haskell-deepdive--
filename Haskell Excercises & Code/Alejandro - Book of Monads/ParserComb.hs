module ParserComb where

import Control.Applicative
import Control.Monad
import Data.Char

newtype ParserX a = P (String -> [(a, String)])

-- resultX :: a -> ParserX a
-- resultX v = \inp -> [(v, inp)]

-- zeroX :: ParserX a
-- zeroX = \inp -> []

-- itemX :: ParserX Char
-- itemX = \inp -> case inp of
--                     [] -> []
--                     (x:xs) -> [(x,xs)]

-- sat :: (Char -> Bool) -> ParserX Char
-- sat p = itemX `bind` \x -> if p x then resultX x else zeroX

parse :: ParserX a -> String -> [(a, String)]
parse (P p) s = p s

instance Functor ParserX where
    fmap f pa = P $ \input -> case parse pa input of
                               []        -> []
                               [(v,out)] -> [(f v, out)]


instance Applicative ParserX where
    pure x = P $ \v -> [(x, v)]
    fa <*> ga = P $ \input -> case parse fa input of
                               [] -> []
                               [(f, out)] -> parse (fmap f ga) out

instance Monad ParserX where
    return x = P $ \input -> [(x, input)]
    p >>= f = P $ \input -> case parse p input of
                             [] -> []
                             [(x, out)] -> parse (f x) out


-- sat :: (Char -> Bool) -> ParserX Char 
-- sat p = do x <- item
--            if px then return x else empty


