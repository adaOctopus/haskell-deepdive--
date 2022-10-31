{-# LANGUAGE FlexibleContexts #-}
module MonadicCode where

import Control.Monad.State as CMS


-- implement `ap` yourself

ap :: Monad m => m (a -> b) -> m a -> m b
ap mf mx = do
    f <- mf
    x <- mx
    return (f x) 