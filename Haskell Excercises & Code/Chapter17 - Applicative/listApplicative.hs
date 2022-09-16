module ListApplicative where

data List a = Nil | Cons a (List a) deriving (Eq, Show)


-- Remember what you wrote for the list Functor:
instance Functor List where 
    fmap f Nil = Nil
    fmap f (Cons a lista) = Cons (f a) (fmap f lista)
-- Writing the list Applicative is similar.

instance Applicative List where
    pure x = Cons x Nil
    Nil <*> _ = Nil
    _ <*> Nil = Nil
    Cons f x <*> y = (f <$> y) <> (x <*> y)


