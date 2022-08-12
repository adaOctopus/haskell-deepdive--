module TypeInference1 where


f :: (Num a, Ord a) => a -> a -> a
f x y = x + y + 3

-- General function
-- (*) :: Num a => a -> a -> a
-- Applied to a value
myMult x = (x / 3) * 5