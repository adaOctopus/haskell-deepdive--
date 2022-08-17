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