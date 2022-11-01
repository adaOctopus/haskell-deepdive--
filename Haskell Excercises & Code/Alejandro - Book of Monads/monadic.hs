{-# LANGUAGE FlexibleContexts #-}
module MonadicCode where

import Control.Monad.State as CMS


-- implement `ap` yourself

ap'' :: Monad m => m (a -> b) -> m a -> m b
ap'' mf mx = do
    f <- mf
    x <- mx
    return (f x)


-- Another exercise. Write fmap with ap & pure

-- fmap'' :: Functor f => (a -> b) -> f a -> f b
fmap'' f a = pure f `ap` a

-- Ex 3.3 Write ZipList functor instancce

newtype ZipList a = ZipList { getZipList :: [a] } deriving (Eq, Show)
-- so getZipList type :: ZipList a -> [a]

instance Functor ZipList where
    fmap f (ZipList gz) = ZipList $ fmap f gz 