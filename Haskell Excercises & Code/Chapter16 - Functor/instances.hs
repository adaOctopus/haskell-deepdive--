module FuncInstance where 


-- 1. 

newtype Identity a = Identity a

instance Functor Identity where 
    fmap f (Identity a)  = Identity (f a)


-- 2. 
data Pair a = Pair a a

instance Functor Pair where
    fmap f (Pair a a') = Pair (f a) (f a')

-- 3. 
data Two a b = Two a b

instance Functor (Two a) where 
    fmap f (Two alpha beta) = Two alpha (f beta)

-- 4. 
data Three a b c = Three a b c

instance Functor (Three a b) where
    fmap f (Three al be ci) = Three al be (f ci)

-- 5. 
data Three' a b = Three' a b b

instance Functor (Three' a) where
    fmap f (Three' a1 b1 b2) = Three' a1 (f b1) (f b2)


-- 6. 
data Four a b c d = Four a b c d

instance Functor (Four a b c) where
    fmap f (Four a1 b1 c1 d1) = Four a1 b1 c1 (f d1)


-- 7. 
data Four' a b = Four' a a a b

instance Functor (Four' a) where 
    fmap f (Four' a1 a2 a3 b1) = Four' a1 a2 a3 (f b1)

-- 8.
data Trivial = Trivial
-- We cannot define functor for this cause it is a concrete type and not a higher-kinded one.
-- There is no structure to fmap

-- Maybe Instance similar

data Possibly a = LolNope | Yeppers a deriving (Eq, Show)

instance Functor Possibly where 
    fmap f (Yeppers a) = Yeppers (f a)
    fmap f LolNope     = LolNope


-- If it helps, you’re basically writing the following function:
-- applyIfJust :: (a -> b) -> Maybe a -> Maybe b

liftedInc :: (Functor f, Num b) => f b -> f b
liftedInc = fmap (+1)

-- Write functor instance similar to Either but with our datatype
data Sum a b = First a | Second b deriving (Eq, Show)

instance Functor (Sum a) where 
    fmap f (First a1)  = First a1
    fmap f (Second b1) = Second (f b1)


-- IO Functor
meTooIsm :: IO String
meTooIsm = do
    input <- getLine
    return (input ++ "and me too!")

getInt :: IO Int
getInt = read <$> getLine

bumpIt :: IO Int
bumpIt = do
    intVal <- getInt
    return (intVal + 1)
