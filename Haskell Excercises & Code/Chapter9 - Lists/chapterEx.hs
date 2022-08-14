module ChapterEx where

import Data.Char

-- 9.12 Chapter excercises

-- Write a function that filters out all the upper case letters

takeUpper :: String -> String 
takeUpper word = filter (\x -> isUpper x) word

-- Write a function that will capitalize the first letter of a string and return the entire string.
makeItUpper :: String -> String
makeItUpper word = (toUpper . head $ word) : (tail word)


-- Write a function that will capitalize alll letters of a word
-- allUpper :: String -> String
allUpper ""   = ""
allUpper (x:xs) = (toUpper x) : allUpper xs

-- nikos
-- n   ikos :: get the head
-- N   ikos :: capitalize head
-- N   I   kos :: head + head of tail + new_tail
-- N   I   K   os :: head + head of tail + head of new tail + new new tail
-- N   I   K   O   s
-- N   I   K   O   S
-- NIKOS