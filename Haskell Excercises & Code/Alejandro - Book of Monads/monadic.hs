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

newtype State'' s a = State { runState' :: s -> (a,s) }

-- runState :: State s a -> s -> (a,s)

instance Functor (State'' s) where
    fmap f (State rs) = State $ \s -> let (a,s') = rs s in (f a, s')

instance Applicative (State'' s) where
    -- pure :: x -> State s x
    pure x = State $ \n -> (x, n)
    State fz <*> State xz = State $ \s -> let a =  fst $ xz s
                                              ab = fst $ fz s
                                          in (ab a, s)

instance Monad (State'' s) where
    return x = State $ \s -> (x, s) 
    rsa >>= f = State $ \input -> let (a, input')   = runState' rsa input
                                      (a', input'') = runState' (f a) input'
                                  in  (a', input'')
                                    

        
    -- let (a, s) = rsa input in (f a, s)
    -- m a -> (a -> m b) -> m b
    -- State s a -> ( a -> State s b) -> State s b

newtype Reader'' r a = Reader'' { runReader'' :: r -> a}

instance Functor (Reader'' r) where
    fmap f (Reader'' ra) = Reader'' $ fmap f ra

instance Applicative (Reader'' r) where
    pure x = Reader'' $ \_ -> x
    Reader'' fa <*> Reader'' xa = Reader'' $ \input -> let a  = xa input
                                                           ab = fa input
                                                       in ab a

instance Monad (Reader'' r) where
    return x = Reader'' $ \_ -> x
    rra >>= f = Reader'' $ \input -> let a = runReader'' rra input in runReader'' (f a) input