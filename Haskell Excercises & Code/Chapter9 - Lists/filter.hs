module Filtering where


-- 9.11 Write a function that returns all 3 multiples of 1..30

myFunc1 = length . filter (\x -> x `mod` 3 == 0) $ [1..60]

-- Using `words` split a string into list of words and remove from a sentence the -> "the" "a" "an"
myFunc2 = filter (\x -> x `notElem` ["the", "a","an"]) . words $ "the brown dog a was not bad an good"

