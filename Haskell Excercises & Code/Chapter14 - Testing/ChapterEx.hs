module ChapterEx where

import Test.Hspec
--import WordNumber (digitToWord, digits, wordNumber)

-- From recursion functions
import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = case n of
                  0 -> "zero"
                  1 -> "one"
                  2 -> "two"
                  3 -> "three"
                  4 -> "four"
                  5 -> "five"
                  6 -> "six"
                  7 -> "seven"
                  8 -> "eight"
                  9 -> "nine"
                  _ -> "Please input a digit from 0-9"

digits :: Int -> [Int]
digits n = case n <= 9 of
             True  -> [n]
             False ->  map (\x -> read [x] :: Int) (show n)

wordNumber :: Int -> String
wordNumber n = case n <= 9 of
                 True  -> digitToWord n 
                 False -> finalized
               where 
                 split         = digits n
                 listWords     = [digitToWord i | i <- split]
                 addDash       = [ i ++ "-" | i <- listWords]
                 finalized     = concat addDash


main :: IO ()
main = hspec $ do 
    describe "digitToWord" $ do
      it "returns zero for 0" $ do
         digitToWord 0 `shouldBe` "zero"
      it "returns one for 1" $ do
         digitToWord 1 `shouldBe` "one"
    describe "digits" $ do
      it "returns [1] for 1" $ do
         digits 1 `shouldBe` [1]
      it "returns [1, 0, 0] for 100" $ do
         digits 100 `shouldBe` [1,0,0]
    describe "wordNumber" $ do
      it "one-zero-zero given 100" $ do
         wordNumber 100 `shouldBe` "one-zero-zero-"
      it "nine-zero-zero-one for 9001" $ do
         wordNumber 9001 `shouldBe` "nine-zero-zero-one-"