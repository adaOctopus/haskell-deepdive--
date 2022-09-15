module FixerUpper where

-- THIS ALSO INCLUDES APPLICATIVE LAWS

import Control.Applicative
import Test.QuickCheck
-- 1.

-- funca1 :: (Show a, Show b) => f (a -> b) -> Maybe String -> Maybe String 
-- added pure and <*> and Just
funca1 = pure const <*> Just "Hello" <*> Just "World"


-- 2. 
-- 
funca2 = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]

-- APPLICATIVE LAWS

-- Define 1. IDENTITY laws and test their equality
law1 = id [1,2,3]

-- Functor
law2 = fmap id [1,2,3]

-- Applicative
law3 = pure id <*> [1,2,3]

checkIdent :: (Eq a, Show a, Num a) => [a] -> Bool
checkIdent xs = id xs == fmap id xs

runQuickCheck :: IO ()
runQuickCheck = quickCheck (checkIdent :: [Int] -> Bool)

-- 2. COMPOSITION LAW

pure (.) <*> u <*> v <*> w = u <*> (v <*> w)

-- This law is meant to ensure that there are no surprises
-- resulting from composing your function applications.
-- I.E
-- pure (.)
-- <*> [(+1)]
-- <*> [(*2)]
-- <*> [1, 2, 3]
-- [(+1)] <*> ([(*2)] <*> [1, 2, 3])

-- 3. HOMOMORPHISM

-- A homomorphism is a structure-preserving map between two algebraic structures.
-- The effect of applying a function that is embedded in some structure to a value that is
-- embedded in some structure should be the same as applying a function to a value without affecting any outside
-- structure:

-- Law statement in code
-- pure f <*> pure x = pure (f x)

-- The general idea of the homomorphism law is that applying the function doesn’t 
-- change the structure around the values.


-- 4. INTERCHANGE LAW
-- We begin again by looking at the definition of the interchange law:
-- u <*> pure y = pure ($ y) <*> u

-- HINT: This is what I was thinking of , if it is possible :)
-- According to the interchange law, this should be true:
-- (Just (+2) <*> pure 2)
-- == (pure ($ 2) <*> Just (+2))
