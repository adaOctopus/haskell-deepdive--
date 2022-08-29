-- Addition.hs
module Addition where


import Test.Hspec
import Test.QuickCheck

-- Practicing hspec with division
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)

main :: IO ()
main = hspec $ do 
    describe "Addition" $ do 
        it "15 divided by 3 is 5" $ do
          dividedBy 15 3 `shouldBe` (5, 0)
        it "22 divided by 5 is\
          \ 4 remainder 2" $ do
          dividedBy 22 5 `shouldBe` (4, 2)
        it "x + 1 is always\
          \ greater than x" $ do
          property $ \x -> x + 1 > (x :: Int)

-- Multiplication with recursive summation
myFunc ::  (Eq a, Num a) => a -> a -> a
myFunc _ 0   = 0
myFunc 0 _   = 0
myFunc n1 n2 = n2 + (myFunc (n1-1) n2)

mainTwo :: IO ()
mainTwo = hspec $ do
    describe "Multiplication recursive summation" $ do
        it "9 & 4 should return 36" $ do
            myFunc 8 4 `shouldBe` 32

trivialInt :: Gen Int
trivialInt = return 1

oneThroughThree :: Gen Int
oneThroughThree = elements [1, 2, 3]

oneThroughThree2 :: Gen Int
oneThroughThree2 = elements [1, 2, 2, 2, 2, 3]

-- Using choose & elements from QuickCheck library
-- as generators of value
genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

-- More complicated exampl4es

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

-- equal probability
genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
    a <- arbitrary
    elements [Nothing, Just a]
