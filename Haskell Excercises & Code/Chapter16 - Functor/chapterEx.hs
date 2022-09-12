module ChapterEx where

data Option = Death | Life deriving (Show, Eq)

-- Ex 1. Valid functor or not?

-- 1. 
data Bool = False | True
-- Nope, cause there is no structure. is type of * not * -> *

data BoolAndSomethingElse a = False' a | True' a
-- Yes it is a functor

data BoolAndMaybeSomethingElse a = Falsish | Truish a
-- Yes it has a functor instance

newtype Mu f = InF { outF :: f (Mu f) }
-- Yes it can be

data D = D (Array Word Word) Int Int
-- Nope it is concrete

-- Exer 2. Rearrange arguments so Functor instance works

data Sum a b = First a | Second b

instance Functor (Sum e) where
    fmap f (First a) = First (f a)
    fmap f (Second b) = Second b
