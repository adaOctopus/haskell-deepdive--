module ChapterEx where


import Control.Monad
import Data.Char

capitals = ['A'..'Z']
lows     = ['a'..'z']
vowels   = "aeiou"


palindrome :: IO ()
palindrome = do
  line1 <- getLine
  case (line1 == reverse line1) of
   True -> do 
            putStrLn "It's a palindrome!"
            palindrome      
   False -> do 
             putStrLn "Nope!"
             return ()

returnChar :: String -> [Char]
returnChar wordi = [x | x <- wordi, x `notElem` vowels, x `notElem` capitals, x `notElem` lows]