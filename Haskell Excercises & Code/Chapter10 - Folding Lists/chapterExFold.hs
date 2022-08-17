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

