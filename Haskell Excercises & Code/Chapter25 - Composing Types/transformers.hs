module MonadT where

newtype Identity a =
    Identity { runIdentity :: a }
    deriving (Eq, Show)

-- newtype IdentityN a = IdentityN a deriving (Eq, Show)

-- Monad Transformer
-- The identity monad transformer, what changed here is that we added one extra type argument
newtype IdentityT f a =
    IdentityT { runIdentityT :: f a }
    deriving (Eq, Show)

instance Functor Identity where 
    fmap f (Identity a) = Identity (f a)

instance (Functor m) => Functor (IdentityT m) where
    fmap f (IdentityT fa) = IdentityT (fmap f fa)

instance Applicative Identity where
    pure = Identity
    (Identity f) <*> (Identity a) = Identity (f a)

instance (Applicative m) => Applicative (IdentityT m) where
    pure x = IdentityT (pure x)
    (IdentityT fab) <*> (IdentityT fa) = IdentityT (fab <*> fa)

instance Monad Identity where
    return = pure
    (Identity a) >>= f = f a

instance (Monad m) => Monad (IdentityT m) where
    return = pure
    (IdentityT ma) >>= f = IdentityT $ ma >>= runIdentityT . f
-- breakdown the types
--f :: a -> m b
-- ma :: Monadic a
-- runIdentityT :: IdentityT m a -> m a
-- f :: a -> f a