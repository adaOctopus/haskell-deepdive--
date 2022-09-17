module ExerChapter where
-- Write Instances for the following data types

-- 1
data Pair a = Pair a a deriving Show

instance Functor Pair where
    fmap f (Pair a1 a2) = Pair (f a1) (f a2)

instance Applicative Pair where
    pure x = Pair x x
    (Pair f1 a1) <*> (Pair f2 a2) = Pair (f1 a1) (f2 a2)

--2 
data Two a b = Two a b

