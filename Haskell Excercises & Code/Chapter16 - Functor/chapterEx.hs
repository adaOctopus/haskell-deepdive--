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

instance (Functor f, Functor g) => Functor (IgnoreOne f g a) where
    fmap func (IgnoringSomething f1 f2) = IgnoringSomething f1 $ (fmap func f2)

-- 8. 
data Notorious g o a t = Notorious (g o) (g a) (g t)

-- Epiphany : Always ammend the innermost
instance (Functor g) => Functor (Notorious g o a) where
    fmap func (Notorious f1 f2 f3) = Notorious f1 f2 $ (fmap func f3)

-- 9. You’ll need to use recursion.
-- Tried with both 1 and 2 arguments to test my understanding (List a & List a b)
data List a b = Nil b | Cons a (List a b)

instance Functor (List a) where
    fmap f (Nil b)               = Nil (f b)
    fmap f (Cons a lista) = Cons a $ (fmap f lista)


-- 10. Goatlord
data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
    fmap f NoGoat               = NoGoat
    fmap f (OneGoat a)          = OneGoat (f a)
    fmap f (MoreGoats g1 g2 g3) = MoreGoats (fmap f g1) (fmap f g2) (fmap f g3)


-- 11. Last one: 
data TalkToMe a = Halt | Print String a | Read (String -> a)

instance Functor TalkToMe where
    fmap f Halt = Halt
    fmap f (Print s a) = Print s (f a)
    fmap f (Read func) = Read $ fmap f func


