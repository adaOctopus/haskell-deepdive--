module GuessType where


funco :: [a] -> a
funco (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False

-- functionS (x,y) = y
-- r :: [a] -> [a]
-- r xs = (*1) xs