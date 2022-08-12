module PointFree where

--f :: Int -> [Int] -> Int
--f z xs = foldr (+) z xs
f :: Int -> [Int] -> Int
f = foldr (+) 