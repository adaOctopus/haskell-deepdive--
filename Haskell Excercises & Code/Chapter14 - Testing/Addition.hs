-- Addition.hs
module Addition where


import Test.Hspec

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
        it "25 divided by 5 is\
          \ 4 remainder 2" $ do
          dividedBy 25 5 `shouldBe` (4, 2)

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

