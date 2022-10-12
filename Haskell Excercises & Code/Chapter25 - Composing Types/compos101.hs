{-# LANGUAGE InstanceSigs #-}

module Composa where

import Control.Applicative

newtype Compose f g a =
    Compose { getCompose :: f (g a) }
    deriving (Eq, Show)

newtype One f a = One (f a) deriving (Eq, Show)

instance Functor f => Functor (One f) where
    fmap f (One fa) = One $ fmap f fa

newtype Three f g h a =
        Three (f (g (h a)))
        deriving (Eq, Show)

instance (Functor f, Functor g, Functor h) => Functor (Three f g h) where
    fmap f (Three fgha) = Three $ (fmap . fmap . fmap) f fgha

-- instance types provided as
-- they may help.

instance (Functor f, Functor g) => Functor (Compose f g) where
    fmap f (Compose fga) = Compose $ (fmap . fmap) f fga

instance (Applicative f, Applicative g) => Applicative (Compose f g) where
    pure :: a -> Compose f g a
    -- identity law
    -- pure id <*> v = v
    pure = Compose $ (pure . pure)
    --(<*>) :: Compose f g (a -> b) -> Compose f g a -> Compose f g b
    -- this is wrong
    -- (Compose f) <*> (Compose a) = Compose $ (fmap <*> f) <*> a

instance (Foldable f, Foldable g) => Foldable (Compose f g) where
    foldMap f (Compose fga) = (foldMap . foldMap) f fga
    -- a -> m
    --        t a (t = Compose f g)
