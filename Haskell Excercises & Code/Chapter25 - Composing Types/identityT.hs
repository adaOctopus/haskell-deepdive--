module IdentityTT where

-- This is file to ensure that I have a good understanding of MT concepts
-- Starting with the simplest identityT monad

newtype IdentityT f a = IdentityT { runIdentityT :: f a} deriving (Eq, Show)

instance (Functor f) => Functor (IdentityT f) where
    fmap f (IdentityT fa) = IdentityT $ fmap f fa

instance (Applicative f) => Applicative (IdentityT f) where
    pure x = IdentityT $ pure x
    (IdentityT fab) <*> (IdentityT fa) = IdentityT (fab <*> fa) 
        -- f (a -> b)    f a