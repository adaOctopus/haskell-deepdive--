module MonadOne where

import Control.Monad (join)


-- Monad
-- fmap :: Functor f
-- => (a -> b) -> f a -> f b
-- <*> :: Applicative f
-- => f (a -> b) -> f a -> f b
-- >>= :: Monad f
-- => f a -> (a -> f b) -> f

------------------------------------------------
------------------------------------------------

-- (>>=) :: m a -> (a -> m b) -> m b
-- (>>) :: m a -> m b -> m b
-- return :: a -> m a


-- keep in mind this is (>>=) flipped
bind :: Monad m => (a -> m b) -> m a -> m b
bind f x = join $ fmap f x