module ZipListEx where

data List a = Nil | Cons a (List a) deriving (Eq, Show)

take' :: Int -> List a -> List a
take' _ Nil = Nil
take' n (Cons a Nil) = Cons a Nil
take' n (Cons a xs)  = Cons a (take' (n - 1) xs) 

instance Functor List where
    fmap f Nil = Nil
    -- fmap f (Cons a Nil) = Cons a Nil
    fmap f (Cons a xs)  = Cons (f a) (fmap f xs)


-- instance Applicative List where
--     pure x = Cons x Nil
--     Nil <*> _ = Nil
--     _ <*> Nil = Nil
--     Cons f x <*> xs = (f <$> xs) <> (x <*> xs)

-- newtype ZipList' a = ZipList' (List a) deriving (Eq, Show)


-- instance Eq a => EqProp (ZipList' a) where
--     xs =-= ys = xs' `eq` ys' 
--       where xs' = let (ZipList' l) = xs
--                 in take' 3000 l
--             ys' = let (ZipList' l) = ys
--                 in take' 3000 l

-- instance Functor ZipList' where 
--     fmap f (ZipList' xs) = ZipList' $ fmap f xs

-- instance Applicative ZipList' where 
--     pure = undefined
--     (<*>) = undefined

-- Validation as Either 

data Validation e a = Failure e | Success a deriving (Eq, Show)

-- same as Either
instance Functor (Validation e) where 
    fmap f (Failure e1) = Failure e1
    fmap f (Success e1) = Success (f e1)

-- This is different
instance Monoid e => Applicative (Validation e) where 
    pure x = Success x
    Failure e1 <*> _ = Failure e1
    _ <*> Failure e1 = Failure e1
    Failure e1 <*> Failure e2 = Failure (e1 <> e2)
    Success f1 <*> Success e1 = Success (f1 e1)

-- Remember u need to think of what Applicatives can do
-- when you write instances, think what goes before <*> what goes after, pattern matching etc

