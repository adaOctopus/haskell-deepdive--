module Excer where 

-- Excercise 1. String processing
-- Completed

notThe :: String -> Maybe String
notThe wordi
  | wordi == "the" = Just wordi
  | otherwise      = Nothing

-- replaceThe -> splits sentence into words
-- search for "the"
-- if u find it, replace it with "a"
    -- if not leave the word as it is

replaceThe :: String -> String
replaceThe senten = unwords checkForThe
  where
    listOfWords = words senten
    checkForThe = [if i == "the" then "a" else i | i <- listOfWords ]


-- 2. Write a recursive function that takes a text/string, breaks
-- it into words, and counts the number of instances of ”the”
-- followed by a vowel-initial word.

countTheBeforeVowel :: String -> Int
countTheBeforeVowel sentence = findThe
  where
    listOfWords = words sentence
    findThe     = length $ filter (=="the") listOfWords


-- 3. Count vowels in a word
-- COMPLETED!

vowels = "aeiou"

countVowels :: String -> Int
countVowels wordi = numbrOfVowels
  where
    checkVowels = [ x | x <- wordi, x `elem` vowels]
    numbrOfVowels = length checkVowels


-- Validate the word excercise
-- COMPLETED!
-- Count vowels and consonants, if vowels > consonants then return Nothing

newtype Word' = Word' String deriving (Eq, Show)
--vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord wordi = case numVowels >= numConson of
    True -> Nothing
    _    -> Just (Word' wordi)

    where
        vowelsWord     = [i | i <- wordi, i `elem` vowels]
        consonantsWord = [i | i <- wordi, i `notElem` vowels]
        numVowels = length vowelsWord
        numConson = length consonantsWord

-- Exer It’s only Natural




