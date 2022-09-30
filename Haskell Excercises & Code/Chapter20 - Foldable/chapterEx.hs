module Practice where

import Data.Foldable

-- Excercise, write functions in terms of foldmap or foldr
-- These exercises, i could not SOLVE.
-- Only 3 out of 6 i managed to solve

-- 1.
isum :: (Foldable t, Num a) => t a -> a
isum str = foldr (+) 0 str

--2.
iproduct :: (Foldable t, Num a) => t a -> a
iproduct str = foldr (*) 1 str

-- 3.
-- ielem :: (Foldable t, Eq a) => a -> t a -> Bool
-- ielem i str = foldr (\x -> (==) x i) False str

-- iminimum :: (Foldable t, Ord a) => t a -> Maybe a
-- iminimum str = 

-- -- 6. 
-- inull :: (Foldable t) => t a -> Bool

-- ifold :: (Foldable t, Monoid m) => t m -> m
-- ifold str = 

-- Chapter Exercises - INSTANCES
----------------------------------


-- class Foldable (t :: * -> *) where 
--     fold :: Monoid m => t m -> m
--     foldMap :: Monoid m => (a -> m) -> t a -> m
-- 1
data Constant a b = Constant b

instance Foldable (Constant a) where
    foldMap f (Constant b) = f b


-- 2
data Two a b = Two a b

instance Foldable (Two a) where
    foldMap f (Two a b) = f b


-- 3
data Three a b c = Three a b c

instance Foldable (Three a b) where
    foldMap f (Three a b c) = f c

-- 4
data Three' a b = Three' a b b

instance Foldable (Three' a) where
    foldMap f (Three' a b1 b2) = (f b1) <> (f b2)

-- 5
data Four' a b =
    Four' a b b b

instance Foldable (Four' a) where
    foldMap f (Four' a b b1 b2) = (f b) <> (f b1 ) <> (f b2)

-- Final Excercise
-- Thinking cap time

-- class Applicative f where
--     pure :: a -> f a
--     <*> :: f (a -> b) -> f a -> f b

-- data F a = F a 
-- monoid
-- mempty = f
-- mappend (f a) (f a') = f (a <> a')

-- Not sure it is correct
filterF :: ( Applicative f , Foldable t , Monoid (f a)) => (a -> Bool) -> t a -> f a
filterF f = foldMap (\x -> if f x then mempty else pure x)
