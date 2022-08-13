module MapEnd where

-- Random practices of my own, just to practice map

-- Multiply an item with 3
myFunc1 = map (\x -> if x `mod` 3 == 0 then x^2 else 0) [1,3..20]

-- Check if item exists in
myFunc2 = map (\x -> if x `elem` ['A'..'Z'] then x else '0') "Rico peDSdeJHo vLajero"

-- return only capitals
myFunc3 = map (filter (\x -> x `elem` ['A'..'Z'])) ["Hold On for Dear Life"]