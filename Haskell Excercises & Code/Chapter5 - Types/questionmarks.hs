module PlayGame where

-- Ex 1 pg 286
-- f :: Int -> String
-- f = undefined

-- g :: String -> Char
-- g = undefined

-- h :: Int -> Char
-- h x = g $ (f x)

-- Ex 2
-- data A
-- data B
-- data C

-- q :: A -> B
-- q = undefined
-- w :: B -> C
-- w = undefined
-- e :: A -> C
-- e x = w (q x)

munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge xToy yToWz _ = (yToWz (xToy x))
