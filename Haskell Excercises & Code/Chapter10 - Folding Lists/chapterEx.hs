module ChapterEx where 

-- 10.10 Excercises


-- Function of triple tuples with combinations of vowels and consonants
stops = "pbtdkg"
vowels = "aeiou"

-- Part A. Reasoning of the functionality
-- p -- btdkg
-- a -- eiou
-- b -- tdkg
     -- t -- dkg
          -- d -- kg
               -- k -- g
-- Basically start with head of `stops`
-- Start with the first vowel of `vowels`
-- Keep the head of stops fixed and try all combinations with the rest of the letters

-- tripleTuple :: [(a,a,a)]
tripleTuple = [ (cn, vw, gn) | cn <- stops, vw <- vowels, gn <- reverse stops]

-- Part B. Only return those starting with `p` 
-- Basically we only added a guard 
tripleTupleP = [ (cn, vw, gn) | cn <- stops, vw <- vowels, gn <- reverse stops, cn == 'p']

-- Part C was redundant, and decided to not code it. Code long and prosper.

-- Ex.2 What does the secret function do? What is its type?
seekritFunc x = div (sum (map length (words x))) (length (words x))
----------------(A)  (B)  (C)  (D)      (E)(F)    (D)      (E)(F)
-- Explain components
-- E+F :: words splits a sentence into a list of words (splits by space)
-- D :: calculates the length of the list of words , basically how many words
-- C :: maps length over each word to see how many chars are in the word
-- A divides the two.
-- i.e seekritFunc "Niko came back"
 -- D E F returns number 3 , as 3 words exist in the sentence
 -- C D E F returns a list of the length of each word :: [4,4,4]
 -- B (C D E F)::  sums the above so, 4+4+4 = 12
 -- A :: div 12 3 = 4 run it in your repl and see
 -- seekritFunc "Niko came back"