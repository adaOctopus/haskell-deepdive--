{-# LANGUAGE FlexibleContexts #-}
module MonadicCode where

import Control.Monad.State as CMS
import System.Random

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

-- Contravariant instance of a Predicate

newtype Returns r a = R (r -> a)

newtype Predicate a = Predicate { runPredicate :: a -> Bool}
through :: (a -> b) -> Predicate b -> Predicate a
through f (Predicate p) = Predicate (p . f)

-- instance Functor (Returns r) where
--     fmap f (R ra) = R (ra . f)

-- instance Contravariant (Returns r) where

-- Functor, Applcive, Monad for Either

data EitherX e r = LeftX e | RightX r deriving (Eq,Show)

instance Functor (EitherX e) where
    fmap f (LeftX er) = LeftX er
    fmap f (RightX re) = RightX (f re)

instance Applicative (EitherX e) where
    pure x = RightX x
    fa <*> xa = do f <- fa; x <- xa; return (f x)

instance Monad (EitherX e) where
        return = RightX
        RightX m >>= k = k m
        LeftX e  >>= _ = LeftX e


newtype MaybeTX m a = MaybeTX { runMaybeTX :: m (Maybe a)}

instance Functor m => Functor (MaybeTX m) where
    fmap f (MaybeTX ma) = MaybeTX $ (fmap . fmap) f ma

instance Applicative m => Applicative (MaybeTX m) where
    pure x = MaybeTX (pure (pure x))
    MaybeTX rfa <*> MaybeTX rxa = MaybeTX $ (<*>) <$> rfa <*> rxa

instance Monad m => Monad (MaybeTX m) where
    return x = MaybeTX $ return (Just x)
    MaybeTX ma >>= f = MaybeTX $ do
                         maybeValue <- ma
                         case maybeValue of
                            Nothing -> return Nothing
                            Just y -> runMaybeTX (f y)


