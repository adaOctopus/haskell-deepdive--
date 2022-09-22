module EitherMonadInstance where

data Sum a b = First a | Second b deriving (Eq, Show)


instance Functor (Sum a) where 
    fmap f (First a) = First a
    fmap f (Second b) = Second (f b)



instance Applicative (Sum a) where 
    pure x = Second x
    (First f1) <*> (First b1) = First (f1 b1)
    (Second f) <*> (Second b) = Second (f b)


instance Monad (Sum a) where 
    return = pure
    -- (>>=) :: Monad m => m a -> ( a -> m b) -> m b
    (Second x) >>= f = f x
    (First x)  >>= _ = First x
