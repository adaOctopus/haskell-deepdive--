module Folda where

-- class Foldable (t :: * -> *) where 
--     fold :: Monoid m => t m -> m
--     foldMap :: Monoid m => (a -> m) -> t a -> m

-- Pay attention that Foldable structure also takes higher-kinded
-- But it also requires a monoidal inside it, because it does not accept a function
--i.e
-- foldr (+) 0 [1,2,3]
-- returns 6
-- fold (+) [1,2,3]
-- des not work

-- ghci> let xs = map Sum [1..5]
-- ghci> fold xs
-- Sum {getSum = 15}
-- ghci> xs
-- [Sum {getSum = 1},Sum {getSum = 2},Sum {getSum = 3},Sum {getSum = 4},Sum {getSum = 5}]

-- If you reason about the above u see that when fold runs
-- the function that gets applied to the monoidal value is basically the default monoidal operation that can be applied
-- Sum is addition
-- Product is multiplication
-- String or [Char] it is concatenation etc etc

---- ====== IMPORTANT NOTE =======
-- ===============================
    -- Prelude> let xs = [Just 1, Nothing, Just 5]
    -- Prelude> foldMap First xs
    -- First {getFirst = Just 1}
    -- Prelude> foldMap Last xs
    -- Last {getLast = Just 5}
    -- In the above examples, the function being applied is a data
    -- constructor. The data constructor identifies the Monoid instance
    -- — the mappend — for those types. It already contains enough
    -- information to allow foldMap to reduce the collection of values
    -- to one summary value.

-- Foldable Instances
-- 1. Identity
data Identity a = Identity a

instance Foldable Identity where 
    foldr f z (Identity x) = f x z
    foldl f z (Identity x) = f z x
    foldMap f (Identity x) = f x

-- 2.Maybe
-- But renamed as data Optional a = Nada | Yep a
instance Foldable Optional where
    foldr _ z Nada = z
    foldr f z (Yep x) = f x z
    foldl _ z Nada = z
    foldl f z (Yep x) = f z x
    foldMap _ Nada = mempty
    foldMap f (Yep a) = f a

-- Remember that foldMap needs the monoid isnatnce specifically to work
-- foldMap (+1) Nada will give u an error
--- foldMap (+1) Nada :: Sum Int will work , because it will know what kind of Monoid operation to do

-- | List of elements of a structure,
-- from left to right.
-- toList :: t a -> [a]
-- Prelude> toList (Just 1)
-- [1]

-- | Test whether the structure is empty.
-- null :: t a -> Bool
-- Notice that null returns True on Left and Nothing values, just
-- as it does on empty lists and so forth:
-- Prelude> null (Left 3)
-- True
-- Prelude> null []
-- True
-- Prelude> null Nothing
-- True

-- ########### Checking length
-- Remember that `t` represents the Foldable
-- However in structures like tuple, Maybe or Either
-- the left/outermost argument is included in the `t` in the instance (because of higher-kinded argument expected)
-- | Returns the size/length of a finite
-- structure as an 'Int'.
-- length :: t a -> Int
-- Prelude> length (1, 2)
-- 1
-- Prelude> let xs = [(1, 2), (3, 4), (5, 6)]
-- Prelude> length xs
-- 3
-- Prelude> fmap length xs
-- [1,1,1]

-- ###### Same with `elem`
-- It does not see outermost or left of Either or Maybe
-- | Does the element occur
-- in the structure?
-- elem :: Eq a => a -> t a -> Bool

