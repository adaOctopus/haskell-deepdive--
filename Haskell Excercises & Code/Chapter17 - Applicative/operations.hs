module Operations where

import Control.Applicative
import Data.List (elemIndex)

f x = lookup x [ (3, "hello"), (4, "julie"), (5, "kbai")]

g y = lookup y [ (7, "sup?")
                   , (8, "chris")
                   , (9, "aloha")]

h z = lookup z [(2, 3), (5, 6), (7, 8)]
m x = lookup x [(4, 10), (8, 13), (1, 9001)]

-- You have Just "julie"
-- how can u get length of julie?
-- Well done I did it!
-- pure length <*> liftA2 (++) (g 9) (f 4)

-- Lookup Exer
-- Make the following expressions typecheck.
-- 1. SOL: Added pure before +3 and <*>
added :: Maybe Integer
added = pure (+3) <*> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])

--2. Changed the tupled type from Maybe (Integer, Integer) to (Maybe Integer, Maybe Integer)
y :: Maybe Integer
y = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z :: Maybe Integer
z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

tupled ::  (Maybe Integer, Maybe Integer)
tupled = (,) y z

-- 3. Added pure max' <*> <*>
-- Basically for the applicative to make sense we need functions in a STRUCTURE
-- If the functions are not in a structure, pure dem up!

x :: Maybe Int
x = elemIndex 5 [1, 2, 3, 4, 5]

n :: Maybe Int
n = elemIndex 2 [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = pure max' <*> x <*> n

-- 4.
xs = [1, 2, 3]
ys = [4, 5, 6]

x' :: Maybe Integer
x' = lookup 3 $ zip xs ys
-- this results to
-- Step 1: [(1,4),(2,5),(3,6)]
-- Step 2: [(3,6)]
-- -> Just 6

y' :: Maybe Integer
y' = lookup 2 $ zip xs ys
-- this results to
-- Step 1: [(1,4),(2,5),(3,6)]
-- Step 2: [(2,5)]
-- -> Just 5
-- Super weird i dont gget
-- summed :: Maybe Integer
summed = sum <$> (,) x' y'



