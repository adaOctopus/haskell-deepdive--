module Madness where
import Data.Monoid
import Test.QuickCheck

type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String 

-- instance Monoid [Char] where
--     mempty         = []
--     mappend (x:xs) = x `mappend` xs
--     mconcat (x:xs) = foldr mappend mempty

madlibbin' :: Exclamation -> Adverb -> Noun -> Adjective -> String
madlibbin' e adv noun adj = 
    e <> "! he said " <>
    adv <> " as he jumped into his car " <>
    noun <> " and drove off with his " <>
    adj <> " wife."

madlibbinBetter' :: Exclamation -> Adverb -> Noun -> Adjective -> String
madlibbinBetter' e adv noun adj =
    mconcat [e, "! he said ", adv, " as he jumped into his car ", noun,
             " and drove off with his ", adj, " wife."]


-- Using QuickCheck to test associativity
monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)
-- We have to declare the types for the function in order to
-- run the tests, so that QuickCheck knows what types of data to
-- generate.

-- Using quickcheck to test identity
