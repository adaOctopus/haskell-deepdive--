module Madness where

import Control.Monad
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
monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

data Bull = Fools | Twoo deriving (Eq, Show)

instance Arbitrary Bull where 
    arbitrary = frequency [ (1, return Fools) , (1, return Twoo) ]

instance Monoid Bull where 
    mempty = Fools
    mappend _ _ = Fools
type BullMappend = Bull -> Bull -> Bull -> Bool

main :: IO ()
main = do 
    let ma = monoidAssoc
        mli = monoidLeftIdentity
        mlr = monoidRightIdentity
        quickCheck (ma :: BullMappend) 
        quickCheck (mli :: Bull -> Bool) 
        quickCheck (mlr :: Bull -> Bool)

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
   mempty = Nada