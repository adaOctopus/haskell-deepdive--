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
-- ================================= IMPORTANT NOTES REASON ============
-- =====================================================================
-- fmap :: (a -> b) -> f a -> f b
-- (=<<) :: (a -> m b) -> m a -> m b
-- traverse :: (a -> f b) -> t a -> f (t b)
-- =================================================================

-- In fact, as we saw in the typeclass definition, traverse is fmap
-- composed with sequenceA:
-- traverse f = sequenceA . fmap 
-- i.e
-- fmap Just [1,2,3]
-- ==> [Just 1, Just 2,Just 3]

-- sequenceA [Just 1, Just 2,Just 3]
-- ==> Just [1,2,3]

-- so traverse is
-- traverse Just [1,2,3] == sequenceA . fmap Just $ [1,2,3]

-- =================================================================

-- We’re still mapping a function over some embedded value(s), like
-- fmap, but similar to flip bind, that function is itself generating
-- more structure. However, unlike flip bind, that structure can
-- be of a different type than the structure we lifted over to apply
-- the function. And at the end, it will flip the two structures
-- around, as sequenceA did.
-- In fact, as we saw in the typeclass definition, traverse is fmap
-- composed with sequenceA:
-- traverse f = sequenceA . fmap 