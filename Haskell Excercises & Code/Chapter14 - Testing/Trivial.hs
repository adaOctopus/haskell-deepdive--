{-# LANGUAGE ScopedTypeVariables #-}
module Trivial where

import Test.QuickCheck
import Test.QuickCheck.Gen (oneof)

data Trivial = Trivial deriving (Eq, Show)


trivialGen :: Gen Trivial
trivialGen = return Trivial

instance Arbitrary Trivial where 
    arbitrary = trivialGen

data Identity a = Identity a deriving (Eq, Show)

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do 
    a <- arbitrary
    return (Identity a)

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = identityGen

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen

data Pair a b = Pair a b deriving (Eq, Show)

pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do 
    a :: Int <- arbitrary
    b :: Int <- arbitrary
    return (Pair a b :: Pair Int Int)