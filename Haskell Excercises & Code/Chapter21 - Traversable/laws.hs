module Lawss where

------------------------------------
-- =================================


-- 1. Naturality
-- ================
-- t . traverse f = traverse (t . f)
-- ================================

-- This law tells us that function composition behaves in
-- unsurprising ways with respect to a traversed function.
-- Since a traversed function 𝑓 is generating the structure
-- that appears on the “outside” of the traverse operation,
-- there’s no reason we shouldn’t be able to float a function
-- over the structure into the traversal itself.

-- 2. Identity
-- -- ================
-- traverse Identity = Identity
-- -- ================================

-- This law says that traversing the data constructor of the
-- Identity type over a value will produce the same result
-- as just putting the value in Identity. This tells us Identity
-- represents a structural identity for traversing data. This is
-- another way of saying that a Traversable instance cannot
-- add or inject any structure or effects.

-- 3. Composition
-- traverse (Compose . fmap g . f) =
-- Compose . fmap (traverse g) . traverse f

--- sequenceA laws, similar to traverse
-- The sequenceA function must satisfy the following laws:

-- 1. Naturality
-- t . sequenceA = sequenceA . fmap t

-- 2. Identity
-- sequenceA . fmap Identity = Identity

-- 3. Composition
-- sequenceA . fmap Compose = Compose . fmap sequenceA . sequenceA