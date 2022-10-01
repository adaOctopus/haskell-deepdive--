module T101 where

-- class (Functor t, Foldable t) => Traversable t where
-- traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
-- traverse f = sequenceA . fmap f

-- Two main operations

-- 1. sequenceA which basically flips the structures
-- sequenceA :: Applicative f => t (f a) -> f (t a)
-- sequenceA [Just 1, Just 2, Just 3]
-- returns Just [1,2,3]

-- catMaybes is also useful from Data.Maybe
-- removes the Maybe context
-- catMaybes [Just 1, Just 2, Nothing]
-- returns [1,2]

-- 2. Traverse

-- traverse
-- :: (Applicative f, Traversable t)
-- => (a -> f b) -> t a -> f (t b)
