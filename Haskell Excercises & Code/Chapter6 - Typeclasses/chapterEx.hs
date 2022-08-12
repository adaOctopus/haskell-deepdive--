module Exe6 where

import Data.List

--freud :: Ord a => a -> a
freud x = x

--jung :: Ord a => [a] -> a
jung :: [Int] -> Int
jung xs = head (sort xs)

-- Type Kwon Do Two
arith :: Num b => (a -> b) -> Integer -> a -> b
arith n alf = (/) n (fromIntegral alf)

-- chk :: Eq b => (a -> b) -> a -> b -> Bool
-- chk grt x y = (>) x y 
