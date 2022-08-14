module ChapterEx where

import Data.Char

-- 9.12 Chapter excercises

-- Write a function that filters out all the upper case letters

takeUpper :: String -> String 
takeUpper word = filter (\x -> isUpper x) word

-- Write a function that will capitalize the first letter of a string and return the entire string.
makeItUpper :: String -> String
makeItUpper word = (toUpper . head $ word) : (tail word)