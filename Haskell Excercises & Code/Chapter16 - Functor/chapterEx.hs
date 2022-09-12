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

-- data D = D (Array Word Word) Int Int
-- Nope it is concrete

-- Exer 2. Rearrange arguments so Functor instance works

-- Solution, switched b & a
data Sum b a = First a | Second b

instance Functor (Sum e) where
    fmap f (First a) = First (f a)
    fmap f (Second b) = Second b


-- Solution, switched b & c
data Company a c b = DeepBlue a c | Something b

instance Functor (Company e e') where 
    fmap f (Something b) = Something (f b)
    fmap _ (DeepBlue a c) = DeepBlue a c


-- Switched a & b
data More b a = L a b a | R b a b deriving (Eq, Show)

instance Functor (More x) where -- think like More a
    fmap f (L a b a') = L (f a) b (f a')
    fmap f (R b a b') = R b (f a) b'


-- Ex.3 Write Functor instances for the data types