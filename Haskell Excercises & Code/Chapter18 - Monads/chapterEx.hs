module ExcrMonad where

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
    return NopeDotJpg >>= f = NopeDotJpg

-- instance Arbitrary a => Arbitrary (Nope a) where
--   arbitrary = return NopeDotJpg

-- instance Eq a => EqProp (Nope a) where (=-=) = eq

-- 2.
data PEither b a = Left a | Right b

instance Functor (PEither b) where
    fmap f (Left a)   = Left (f a)
    fmap f (Right b1) = Right b1 

instance Applicative (PEither b) where
    pure x = Left x
    (Left f) <*> (Left a)  = Left (f a)
    _        <*> (Right b) = Right b
    (Right f) <*> (Left b) = Right f

instance Monad (Peither b) where
    return = Left
    -- :: m a -> (a -> m b) -> m b
    (Left a) >>= f  = f a
    (Right b) >>= f = Right b
