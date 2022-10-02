{-# LANGUAGE FlexibleContexts    #-}
{-# LANGUAGE UndecidableInstances    #-}


---------------------------------------------------------------------
-- ================================================================================
    -- Traversable allows you to transform elements inside the
    -- structure like a functor, producing applicative effects along the
    -- way, and lift those potentially multiple instances of applicative
    -- structure outside of the traversable structure. It is commonly
    -- described as a way to traverse a data structure, mapping a
    -- function inside a structure while accumulating the applicative
    -- contexts along the way.
--------------------------------------------------------------------------------------------
-- ================================================================================

module ChapExer where

-- 1. Write a Traversable instance for Identity.

newtype Identity a = Identity a deriving (Eq, Ord, Show)


instance (Functor Identity, Foldable Identity) => Traversable Identity where
  traverse f (Identity x) = fmap Identity (f x)


-- 2. Write a Traversable instance for Constant
-- I cannot reason about this
newtype Constant a b = Constant { getConstant :: a }

instance (Functor (Constant a), Foldable (Constant a)) => Traversable (Constant a) where
  traverse f (Constant x) = pure $ Constant x


-- 3. Write a Traversable instance for Maybe style
-- I did this correctly
data Optional a = Nada | Yep a

instance (Functor Optional, Foldable Optional) => Traversable Optional where
    traverse f Nada = pure Nada
    traverse f (Yep x) = fmap Yep (f x)

-- 4.  Write a Traversable instance for List
data List a = Nil | Cons a (List a)

instance (Functor List, Foldable List) => Traversable List where
    traverse _ Nil = pure $ Nil
    -- Remember lists always recursion
    traverse f (Cons x xs) = Cons <$> f x <*> traverse f xs

-- 5.traversable instance for Three
data Three a b c = Three a b c

instance (Functor (Three a b), Foldable (Three a b)) => Traversable (Three a b) where
    traverse f (Three a b c) = Three a b <$> (f c)

-- 6. Pair instance Traversable
data Pair a b = Pair a b

instance (Functor (Pair a), Foldable (Pair a)) => Traversable (Pair a) where
    traverse f (Pair a b) = Pair a <$> (f b)

-- 7. BIG instance
-- u thought of it correctly, but didnt trust yourself.
data Big a b = Big a b b

instance (Functor (Big a), Foldable (Big a)) => Traversable (Big a) where
    traverse f (Big a b1 b2) = Big a <$> f b1 <*> f b2

-- 8. Bigger instance

-- -- Same as for Big.
data Bigger a b = Bigger a b b b

instance (Functor (Bigger a), Foldable (Bigger a)) => Traversable (Bigger a) where
    traverse f (Bigger a b1 b2 b3) = Bigger a <$> f b1 <*> f b2 <*> f b3

-- 9. Just the instance for S, fuck the Quickcheck

data S n a = S (n a) a deriving (Eq, Show)

instance (Functor (S n), Foldable (S n)) => Traversable (S n) where
    traverse f (S (n1 a) a') = S (n (f a)) <$> f a'

    --- Tomorrow do Tree instances and read the S one before
    ---- Read the article for traversable & foldable, and then tuesday move to Reader Monad