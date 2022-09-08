module FuncInstance where 


-- 1. newtype Identity a = Identity a

instance Functor Identity where 
    fmap id (Identity a) = Identity a
    fmap f (Identity a)  = Identity (f a)


-- 2. data Pair a = Pair a a

instance Functor Pair where
    fmap f (Pair a a') = Pair (f a) (f a')

-- 3. data Two a b = Two a b
-- 4. data Three a b c = Three a b c
-- 5. data Three' a b = Three' a b b