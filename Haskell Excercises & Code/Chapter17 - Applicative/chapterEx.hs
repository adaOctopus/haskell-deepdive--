module ExerChapter where
-- Write Instances for the following data types

import Control.Applicative (liftA3)
-- 1
data Pair a = Pair a a deriving Show

instance Functor Pair where
    fmap f (Pair a1 a2) = Pair (f a1) (f a2)

instance Applicative Pair where
    pure x = Pair x x
    (Pair f1 a1) <*> (Pair f2 a2) = Pair (f1 a1) (f2 a2)

--2 
data Two a b = Two a b

instance Functor (Two a) where
    fmap f (Two a1 b1) = Two a1 (f b1)


instance Monoid a => Applicative (Two a) where
    pure x = Two mempty x
    (Two x f) <*> (Two x' y) = Two (x <> x') (f y)


-- 3
data Three a b c = Three a b c

instance Functor (Three a b) where
    fmap f (Three a1 b1 c1) = Three a1 b1 (f c1)

-- Pay attention, the parameters we leave untouched, are replaced by mempty in pure instance

instance (Monoid a, Monoid b) => Applicative (Three a b) where
    pure x = Three mempty mempty x
    (Three a1 b1 f) <*> (Three a1' b1' y) = Three ( a1 <> a1') (b1 <> b1') (f y)

-- 4. 
data Three' a b = Three' a b b

instance Functor (Three' a) where
    fmap f (Three' a1 b1 b2) = Three' a1 (f b1) (f b2)

instance Monoid a => Applicative (Three' a) where
    pure x = Three' mempty x x
    (Three' a1 f1 f2) <*> (Three' a1' f1' f2') = Three' (a1 <> a1') (f1 f1') (f2 f2')

-- 5
data Four a b c d = Four a b c d

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure x = Four mempty mempty mempty x
    (Four a b c f) <*> (Four a' b' c' d) = Four (a <> a') (b <> b') (c <> c') (f d)    

-- 6. 
data Four' a b = Four' a a a b

instance Functor (Four' a) where
    fmap f (Four a1 a2 a3 b1) = Four' a1 a2 a3 (f b1)

instance (Monoid a) => Applicative (Four' a) where
    pure x = Four' mempty mempty mempty x
    (Four' a1 a2 a3 f) <*> (Four' a1' a2' a3' b) = Four (a1 <> a1') (a2 <> a2') (a3 <> a3') (f b)

stops :: String
stops = "pbtdkg"
vowels :: String
vowels = "aeiou"
combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = undefined