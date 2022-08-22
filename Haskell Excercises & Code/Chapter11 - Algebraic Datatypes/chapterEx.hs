module ChapterEx where 

import Data.Char
-- Chapter excercises multiple choice 11.18
-- Answers
-- 1. a
-- 2. c
-- 3. b
-- 4. c

-- Excercises with `as-patterns`
---------------------------------
doubleUp :: [a] -> [a]
doubleUp [] = []
doubleUp xs@(x:_) = x : xs

-- Ex 1.
-- True if (and only if ) all the values in
-- the first list appear in the second list
-- PS NOT COMPLETED
-- isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
-- isSubseqOf [] (x:_) = False
-- isSubseqOf (x:_) [] = False
-- isSubseqOf x@xs ys    = case x `elem` ys of
--                           True -> True
--                           _    -> False


-- 2. Split a sentence into words, then tuple each word with the
-- capitalized form of each.
-- COMPLETED
capitalizeWords :: String -> [(String, String)]
capitalizeWords "" = [("","")]
capitalizeWords senten = [ (x,upperFirst x) | x <- splitted]
  where
    splitted   = words senten
    upperFirst :: String -> String
    upperFirst oneWord = (toUpper $ head oneWord) : (tail oneWord)

-- Language Exercises
--1. Write a function that capitalizes a word
-- Completed

myCapital :: String -> String
myCapital ""    = ""
myCapital wordi =  (toUpper $ head wordi) : (tail wordi)


-- 2. Write a function that capitalizes sentences in a paragraph.
-- Recognize when a new sentence has begun by checking
-- for periods. Reuse the capitalizeWord function.
-- capitalizeParagraph :: String -> String
-- capitalizeParagraph par = (toUpper $ head par) ++ 
myList = ["nikos.","is","a","new","guy.","he","is","great."]
newList = [x | x <- myList,notElem '.' x]
-- The flow is as follows
-- We use list comprehension to identify which words contain

-- Pass a sentence
-- Capitalize head, always first
-- "nikos. is  a new guy. he is great."
-- ["nikos.","is","a","new","guy.","he","is","great."]
-- filter (\n -> tail n /= ".") 

-- This chapter exercises, where just toooo many.
-- I decide to move forward with next chapter, and come back to more excercises later if needed.
