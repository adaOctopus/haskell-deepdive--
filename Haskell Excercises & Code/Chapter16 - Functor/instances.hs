module FuncInstance where 


-- 1. 

newtype Identity a = Identity a

instance Functor Identity where 
    fmap f (Identity a)  = Identity (f a)


-- 2. 
data Pair a = Pair a a

instance Functor Pair where
    fmap f (Pair a a') = Pair (f a) (f a')

-- 3. 
data Two a b = Two a b

instance Functor (Two a) where 
    fmap f (Two alpha beta) = Two alpha (f beta)

-- 4. 
data Three a b c = Three a b c

instance Functor (Three a b) where
    fmap f (Three al be ci) = Three al be (f ci)

-- 5. 
data Three' a b = Three' a b b

instance Functor (Three' a) where
    fmap f (Three' a1 b1 b2) = Three' a1 (f b1) (f b2)