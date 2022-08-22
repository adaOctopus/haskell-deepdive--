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



