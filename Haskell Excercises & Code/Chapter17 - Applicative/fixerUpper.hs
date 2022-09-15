module FixerUpper where

import Control.Applicative
import Test.QuickCheck
-- 1.

-- funca1 :: (Show a, Show b) => f (a -> b) -> Maybe String -> Maybe String 
-- added pure and <*> and Just
funca1 = pure const <*> Just "Hello" <*> Just "World"


-- 2. 
-- 
funca2 = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]

-- Define identity laws and test their equality
law1 = id [1,2,3]

-- Functor
law2 = fmap id [1,2,3]

-- Applicative
law3 = pure id <*> [1,2,3]

checkIdent :: (Eq a, Show a, Num a) => [a] -> Bool
checkIdent xs = id xs == fmap id xs

runQuickCheck :: IO ()
runQuickCheck = quickCheck (checkIdent :: [Int] -> Bool)