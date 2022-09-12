{-# LANGUAGE FlexibleInstances #-}

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

-- 1. 
data Quant a b = Finance | Desk a | Bloor b deriving (Eq,Show)

-- Functor instance
instance Functor (Quant a) where
    fmap f Finance = Finance
    fmap f (Desk alpha) = Desk alpha
    fmap f (Bloor beta) = Bloor (f beta)

-- 2.
data K a b = K a

-- Functor instance
instance Functor (K a) where
    fmap f (K alpha) = K alpha


-- 3. 
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)
--newtype K a b = K a

-- should remind you of an
-- -- instance you've written before

-- instance Functor (Flip K a) where
--   fmap f (Flip (K a)) = Flip $ K (f a)

-- 4.
data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst a) = GoatyConst (f a)

-- 5. Will that work?
data LiftItOut f a = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f) where 
    fmap func (LiftItOut x) = LiftItOut $ fmap func x


-- 6.
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap func (DaWrappa f1 f2) = DaWrappa (fmap func f1) (fmap func f2)

-- 7.
data IgnoreOne f g a b = IgnoringSomething (f a) (g b)
