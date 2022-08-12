module RecursionEx where


-- 2. Write a function that recursively sums all numbers from
-- 1 to n, n being the argument. So that if n was 5, you’d add
-- 1 + 2 + 3 + 4 + 5 to get 15. The type should be (Eq a, Num a)
-- => a -> a.

addEn :: (Eq a, Num a) => a -> a 
addEn 0 = 0
addEn n = n + (addEn (n - 1))
-- addEn 5 = 1 + 2 + 3 + 4 + 5
-- addEn 4 = 1 + 2 + 3 + 4
-- addEn 3 = 1 + 2 + 3
--sum [1..n]

mc91 :: [Int] -> Int
mc91 [1::n]
  | n > 100   = n - 10
  | otherwise = 91