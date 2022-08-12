module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = case n of
                  0 -> "zero"
                  1 -> "one"
                  2 -> "two"
                  3 -> "three"
                  4 -> "four"
                  5 -> "five"
                  6 -> "six"
                  7 -> "seven"
                  8 -> "eight"
                  9 -> "nine"
                  _ -> "Please input a digit from 0-9"

digits :: Int -> [Int]
digits n = case n <= 9 of
             True  -> [n]
             False ->  map (\x -> read [x] :: Int) (show n)

wordNumber :: Int -> String
wordNumber n = case n <= 9 of
                 True  -> digitToWord n 
                 False -> finalized
               where 
                 split         = digits n
                 listWords     = [digitToWord i | i <- split]
                 addDash       = [ i ++ "-" | i <- listWords]
                 finalized     = concat addDash

-- Helpers
-- div :: Integral a => a -> a -> a
-- mod :: Integral a => a -> a -> a
-- map :: (a -> b) -> [a] -> [b]
-- concat :: [[a]] -> [a]
-- intersperse :: a -> [a] -> [a]
-- (++) :: [a] -> [a] -> [a]
-- (:[]) :: a -> [a]

