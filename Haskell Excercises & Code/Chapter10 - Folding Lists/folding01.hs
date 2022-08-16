module Folding where

-- mySum :: Num a => a -> a

mySum []  = 0
mySum (x:xs) = x + sum xs

xs = map show [1..5]
y = foldr (\x y -> concat ["(",x,"+",y,")"]) "0" xs


let x = map (+1) [1..10], length x, :sprint x

-- foldr (^) 2 [1..3]

(^) 2 (1 (^) 2 (^) 3 (^) [])

-- foldl (flip (*)) 1 [1..3]

-- (1 (f) 1) : 

-- 5. The following are simple folds very similar to what you’ve
-- already seen, but each has at least one error. Please fix
-- them and test in your REPL:

-- foldr (++) ["woot", "WOOT", "woot"]