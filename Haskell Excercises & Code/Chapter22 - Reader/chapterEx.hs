{-# LANGUAGE TupleSections #-}

module ChaXer where

import Control.Applicative
import Data.Maybe


x = [1, 2, 3]
y = [4, 5, 6]
z = [7, 8, 9]

-- Ex. 1

-- lookup :: Eq a => a -> [(a, b)] -> Maybe b
-- zip x and y using 3 as the lookup key
xs :: Maybe Integer
xs = lookup 3 . zip x $ y

-- zip y and z using 6 as the lookup key
ys :: Maybe Integer
ys = lookup 6 . zip y $ z

-- it's also nice to have one that
-- will return Nothing, like this one
-- zip x and y using 4 as the lookup key
zs :: Maybe Integer
zs = lookup 4 $ zip x y

-- Dynamix
-- now zip x and z using a
-- variable lookup key
z' :: Integer -> Maybe Integer
z' n = lookup n . zip x $ z

x1 :: Maybe (Integer, Integer)
x1 = liftA2 (,) xs ys
x2 :: Maybe (Integer, Integer)
x2 = liftA2 (,) xs ys
x3 :: Integer -> (Maybe Integer, Maybe Integer)
x3 n = (z' n, z' n)

-- uncurry :: (a -> b -> c) -> (a, b) -> c
-- that first argument is a function
-- in this case, we want it to be addition
-- summed is uncurry with addition as
-- the first argument
summed :: Num c => (c, c) -> c
summed tup = uncurry (\n1 n2 -> n1 + n2) tup

bolt :: Integer -> Bool
-- use &&, >3, <8
bolt n = (n > 3) && (n < 8) -- alternative: liftA2 (&&) (>3) (<8)


data TestDatum = TestDatum {
    adaValue :: Integer,
    scriptState:: String
} deriving (Eq,Show)

sequA :: Integral a => a -> [Bool]
sequA m = sequenceA [(>3), (<8), even] m

main :: IO ()
main = do
    print $
        sequenceA [Just 3, Just 2, Just 1]
    print $ sequenceA [x, y]
    print $ sequenceA [xs, ys]
    print $ summed <$> ((,) <$> xs <*> ys)
    print $ fmap summed ((,) <$> xs <*> zs)
    print $ bolt 7
    print $ fmap bolt z
    print $ sequenceA [(>3), (<8), even] 7
    -- Page Before Rewriting Shawty
    -- Solution to 1.
    print $ all (==True) . sequA $ 5
    -- Solution to 2.
    -- Solution to 3.