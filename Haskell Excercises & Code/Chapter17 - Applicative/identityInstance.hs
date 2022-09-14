module IDInstance where

-- Ex . Applicative instance for identity

newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where 
    fmap f (Identity a) = Identity (f a)

instance Applicative Identity where 
    pure = Identity
    (Identity a1) <*> (Identity a2) = Identity (a1 a2)
