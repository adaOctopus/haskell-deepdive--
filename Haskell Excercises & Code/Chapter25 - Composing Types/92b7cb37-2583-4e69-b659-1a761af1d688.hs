module Bifa where

class Bifunctor p where
    bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
    bimap f g = first f . second g

    first :: (a -> b) -> p a c -> p b c
    first f = bimap f id

    second :: (b -> c) -> p a b -> p a c
    second = bimap id

class Functor f where
    fmap :: (a->b) -> f a -> f b

-- Write BiFunctor instances
-- 1.
data Deux a b = Deux a b

instance Bifunctor Deux where
    bimap f g (Deux a b) = Deux $ (f a) . (g b)

