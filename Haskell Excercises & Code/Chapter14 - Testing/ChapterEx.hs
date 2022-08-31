module ChapterEx where

import Test.Hspec
import Test.QuickCheck
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

 -- for a function
half x = x / 2
-- this property should hold
halfIdentity = (*2) . half

randomGenList :: Arbitrary a => Gen [a]
randomGenList = do
    a <- arbitrary
    return a


randomList = sample' (randomGenList :: Gen [Int])

-- for any list you apply sort to
-- this property should hold
listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t) = (Just y, x >= y)


myFunca :: Int -> Bool
myFunca x = x + 1 > x

mainTwo :: IO ()
mainTwo = quickCheck myFunca