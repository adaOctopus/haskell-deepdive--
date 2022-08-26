module ChapterEx where


import Control.Monad
import Data.Char



-- Modifying Code Ex 3 mysSolution
-----------------------------------
capitals = ['A'..'Z']
lows     = ['a'..'z']
vowels   = "aeiou"

badChar :: String -> String
badChar wordi   = [x | x <- wordi, x `notElem` vowels, x `notElem` capitals, x `notElem` lows]

cleanChar :: String -> String
cleanChar wordi = filter (\x -> x `notElem` badList) wordi
  where
    badList = badChar wordi

-----------------------------------
-----------------------------------

palindrome :: IO ()
palindrome = do
  line1 <- getLine
  let cleanOne = cleanChar line1
  case (cleanOne == reverse cleanOne) of
   True -> do 
            putStrLn "It's a palindrome!"
            palindrome      
   False -> do 
             putStrLn "Nope!"
             return ()

