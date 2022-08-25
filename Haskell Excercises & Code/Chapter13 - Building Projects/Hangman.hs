module Main (main) where

import Control.Monad (forever) -- [1]
import Data.Char (toLower) -- [2]
import Data.Maybe (isJust) -- [3]
import Data.List (intersperse) -- [4]
import System.Exit (exitSuccess) -- [5]
import System.Random (randomRIO) -- [6]


main :: IO ()
main = do
  putStrLn "hello world"


-- Read the dict file and pick word

type WordList = [String]

allWords :: IO WordList
allWords = do 
     dict <- readFile "data/dict.txt"
     return (lines dict)

-- Defining limits on the words
minWordLength :: Int
minWordLength = 5
maxWordLength :: Int
maxWordLength = 9

-- Define game
gameWords :: IO WordList
gameWords = do
  aw <- allWords
  return (filter gameLength aw)
  where 
    gameLength w = let l = length (w :: String) in  l >= minWordLength && l < maxWordLength


-- Generate random number, use that number to index our word list, to randomly pick a word

randomWord :: WordList -> IO String
randomWord wl = do
         randomIndex <- randomRIO (0,(length wl) - 1 )
              -- fill this part in ^^^
         return $ wl !! randomIndex

-- Making sure the word is coming from out list with (>>=) bind method. Discuss later in Monad chapter.

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

-- Main Game from here
-- Datatype first

data Puzzle = Puzzle String [Maybe Char] [Char]
-- -- [1] [2] [3]
-- 1. the word we’re trying to guess
-- 2. the characters we’ve filled in so far
-- 3. the letters we’ve guessed so far

-- We want a custom way of displaying our data type to the console.
-- therefore we build our own show instance

instance Show Puzzle where 
  show (Puzzle _ discovered guessed) = 
    (intersperse ' ' $ fmap renderPuzzleChar discovered)
                       ++ " Guessed so far: " ++ guessed

freshPuzzle :: String -> Puzzle
freshPuzzle wor = Puzzle wor funca []
  where
    funca = [Nothing | x <- wor]

-- Check for character in puzzle word

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle wor _ _) lt = 
  if elemCheck == True then True else False
  where
    elemCheck = lt `elem` wor


-- Now check if that character exists in the guessed list not in the Puzzle String
alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guessed) lt = 
  if elemCheck == True then True else False
  where 
    elemCheck = lt `elem` guessed 

-- Return '_' if Nothing, else the 'characteritself'
renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar lt =
  case lt of
    Nothing -> '_'
    Just c  -> c