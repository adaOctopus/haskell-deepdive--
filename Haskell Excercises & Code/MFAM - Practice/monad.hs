module MonadicStuff where

-- Checking udnerstanding of Monad instance for Maybe
-- To write Monad. we need to write ApplICATIVE
-- To write applicative we need Functor
--import Data.Maybe

instance Functor Maybe where
    fmap f Nothing  = Nothing
    fmap f (Just x) = Just (f x)

instance Applicative Maybe where
    pure x = Just x
    -- pure id <*> v = v
    -- pure should not change the underlying values
    Nothing <*> _ = Nothing
    _ <*> Nothing = Nothing
    Just f <*> Just n = Just (f n)

instance Monad Maybe where
    return = Just
    Nothing >>= f = Nothing
    (Just n) >>= f = f n
