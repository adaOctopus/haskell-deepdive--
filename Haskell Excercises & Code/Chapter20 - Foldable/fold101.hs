module Folda where

-- class Foldable (t :: * -> *) where 
--     fold :: Monoid m => t m -> m
--     foldMap :: Monoid m => (a -> m) -> t a -> m

-- Pay attention that Foldable structure also takes higher-kinded
-- But it also requires a monoidal inside it, because it does not accept a function
--i.e
-- foldr (+) 0 [1,2,3]
-- returns 6
-- fold (+) [1,2,3]
-- des not work

-- ghci> let xs = map Sum [1..5]
-- ghci> fold xs
-- Sum {getSum = 15}
-- ghci> xs
-- [Sum {getSum = 1},Sum {getSum = 2},Sum {getSum = 3},Sum {getSum = 4},Sum {getSum = 5}]

-- If you reason about the above u see that when fold runs
-- the function that gets applied to the monoidal value is basically the default monoidal operation that can be applied
-- Sum is addition
-- Product is multiplication
-- String or [Char] it is concatenation etc etc