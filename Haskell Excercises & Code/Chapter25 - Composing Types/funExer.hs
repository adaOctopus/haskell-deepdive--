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
    bimap f g (Deux a b) = Deux (f a)  (g b)
    first f (Deux a b)   = Deux (f a) b 
    second f (Deux a b)  = Deux a (f b)
 
-- 2. 
data Const a b = Const a

instance Bifunctor Const where
    bimap f g (Const a) = Const (f a)
    first f (Const a)   = Const (f a)

--3.s
data Drei a b c = Drei a b c

instance Bifunctor (Drei a) where
    bimap f g (Drei a b c) = Drei a (f b) (g c)
    first f (Drei a b c)   = Drei a (f b) c
    second f (Drei a b c)  = Drei a b (f c)

-- 4
data SuperDrei a b c = SuperDrei a b

instance Bifunctor (SuperDrei a) where
    bimap f _ (SuperDrei a b) = SuperDrei a (f b)
