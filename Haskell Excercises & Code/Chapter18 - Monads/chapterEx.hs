module ExcrMonad where

import Control.Monad
import Control.Applicative
-- Write Monad instances for each data type
-- 1.
data Nope a = NopeDotJpg

instance Functor Nope where
    fmap f NopeDotJpg = NopeDotJpg

instance Applicative Nope where
    pure x = NopeDotJpg
    _ <*> NopeDotJpg = NopeDotJpg

instance Monad Nope where 
    return x = NopeDotJpg
    _ >>= f = NopeDotJpg

-- instance Arbitrary a => Arbitrary (Nope a) where
--   arbitrary = return NopeDotJpg

-- instance Eq a => EqProp (Nope a) where (=-=) = eq

-- 2.
data PEither b a = PLeft a | PRight b

instance Functor (PEither b) where
    fmap f (PLeft a)   = PLeft (f a)
    fmap f (PRight b1) = PRight b1 

instance Applicative (PEither b) where
    pure x = PLeft x
    (PLeft f) <*> (PLeft a)  = PLeft (f a)
    _        <*> (PRight b) = PRight b
    (PRight f) <*> (PLeft b) = PRight f

instance Monad (PEither b) where
    return = PLeft
    -- :: m a -> (a -> m b) -> m b
    (PLeft a) >>= f  = f a
    (PRight b) >>= f = PRight b

-- 3. Identity
newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity (f a)

instance Applicative Identity where
    pure = Identity
    (Identity f) <*> (Identity a) = Identity (f a)

instance Monad Identity where 
    return = pure
    -- :: m a -> (a -> m b) -> m b
    (Identity a) >>= f = f a

-- data List a = Neil | NoEmpty a
-- 4. List
-- List
data List a = Nil | Cons a (List a) deriving (Eq, Show)

take' :: Int -> List a -> List a
take' n Nil         = Nil
take' 1 (Cons x _)  = Cons x Nil
take' n (Cons x xs) = Cons x $ take' (n - 1) xs

instance Functor List where
    fmap f Nil = Nil
    fmap f (Cons x Nil) = Cons (f x) Nil
    fmap f (Cons x xs)  = Cons (f x) (fmap f xs)

instance Applicative List where
    pure x = Cons x Nil
    _ <*> Nil = Nil
    Nil <*> _ = Nil
    -- :: (<*>) :: f (a -> b) -> f a -> f b
    --Cons f x <*> y = (f <$> y) <> (x <*> y)

instance Monad List where
    return = pure
    Nil >>= _ = Nil
    (Cons x Nil) >>= f = f x
    --(Cons x xs)  >>= f = join (Cons x (f <$> xs))
    -- Alternative of line 83
    -- (Cons x xs) >>= f = f x <> (xs >>= f)

-- Ex.2 Write functions using methods from Monads and functors
--1.
j :: Monad m => m (m a) -> m a
j = join

-- 2. 
l1 :: Monad m => (a -> b) -> m a -> m b
-- the pattern looks like fmap (a-> b) -> f a -> f b
l1 f m = f <$> m

-- 3.
-- looks like liftA2
l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 =  liftA2

--4. I dont get that
-- a :: Monad m => m a -> m (a -> b) -> m b
-- flip <*>

-- 5. use recursion
--meh :: Monad m => [a] -> (a -> m b) -> m [b]
-- m a -> (a -> m b) -> m (m b)
-- Take a list of items of type a
-- Apply a function f to each of those items of type a and return b wrapped in monadic context
-- Return Monadic context List(b)
-- Which means u need to rerun the f to the list
meh lista f = sequence $ lista >>= (\i -> return $ f i)
    -- return . (fmap f lista)
    -- fmap f lista => [f a1, f a2, f a3 etc]
    -- that would result => [[b1], [b2], [b3]]