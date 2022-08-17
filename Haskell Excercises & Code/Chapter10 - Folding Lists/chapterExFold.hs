module FoldingEx where

-- The goal here is to write functions point free and with foldr
-- Optimal case.

-- 1. myOr returns True if any value is True
myOr :: [Bool] -> Bool
myOr = foldr (||) False

--  2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
-- myAny :: (a -> Bool) -> [a] -> Bool
-- myAny f [] = False
myAny f xs =  foldr f False xs
-- Reasoning 
-- iterate through a list
-- apply a function on each item
-- if that function returns true
    -- return true
myFunc = map (>3) [2,3,4]
-- foldr f False [1,2,3]
-- 1 f (foldr f False [1,2])
-- 1 f (2 f (foldr f False [3]))
-- 1 f (2 f (3 f (foldr f False [])))
-- 1 f (2 f (3 f) False)
-- Unfortunately this excercise I could not solve with fold, I had to look online
-- i only managed to solve it with pattern matching and guards i.e | f x == True = True
                                                        --         | f x /= True = False
                                                        --         | otherwise   = False
                                                        -- but this is out of the scope of this exerc.


-- 3. Write two versions of myElem. One version should use folding and the other should use any.
-- Prelude> myElem 1 [1..10]
-- True
-- Prelude> myElem 1 [2..10]
-- False
-- Solution One fast, came naturally to code it like this.
myElem :: Eq a => a -> [a] -> Bool
myElem x [] = False
myElem x (y:ys) = if x == y then True else go
  where
    go = myElem x ys

-- Solution using any
myElem1 :: Eq a => a -> [a] -> Bool
myElem1 x [] = False
myElem1 x ys = any (==x) ys

-- Solution using foldr 
myElem2 ::  Eq a => a -> [a] -> Bool
myElem2 x [] = False
myElem2 x ys = foldr (\k -> (==) True) False listOfTruth
  where
    listOfTruth = [if k == x then True else False | k <- ys]


-- 4. myReverse, in any way u want.

myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ x : [] 

-- 5. Implement myMap with foldr and it should have exact behavior with map
myMap :: (a -> b) -> [a] -> [b]
-- myMap f []     = []
-- myMap f (x:xs) = (\v vs -> f v : vs) x (map f xs)
myMap f = foldr (\v vs -> f v : vs) []
-- map (+1) [1,2,3]

-- 6. My filter as filter with foldr
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\v vs -> if (f v) == True then v : vs else vs) []
