{-# LANGUAGE InstanceSigs #-}

module RApplicat where

newtype HumanName = HumanName String deriving (Eq, Show)

newtype DogName = DogName String deriving (Eq, Show)

newtype Address = Address String deriving (Eq, Show)


data Person = Person {
                    humanName :: HumanName
                    , dogName :: DogName
                    , address :: Address
                    } deriving (Eq, Show)

data Dog = Dog {
                dogsName :: DogName
                , dogsAddress :: Address
                } deriving (Eq, Show)


-- Sample Data
pers :: Person
pers = Person (HumanName "Big Bird")
              (DogName "Barkley")
              (Address "Sesame Street")

chris :: Person
chris = Person (HumanName "Chris Allen")
                (DogName "Papu")
                (Address "Austin")


-- 1. Write liftA2 yourself. Think about it in terms of abstracting out the difference between getDogR and getDogR'
myLiftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
myLiftA2 f a1 a2 = f <$> a1 <*> a2

newtype Reader r a = Reader { runReader :: r -> a } 

asks :: (r -> a) -> Reader r a
asks f = Reader f

instance Functor (Reader r) where
  fmap f (Reader g) = Reader (f . g)

instance Applicative (Reader r) where 
    pure :: a -> Reader r a
    pure a = Reader (const a)
    (<*>) :: Reader r (a -> b) -> Reader r a -> Reader r b
    (Reader rab) <*> (Reader ra) = Reader $ (\x -> rab x (ra x))

instance Monad (Reader r) where
    return = pure
    (>>=) :: Reader r a -> (a -> Reader r b) -> Reader r b
    (Reader ra) >>= aRb = Reader $ \r -> aRb (r ra)

-- ============= Reader Monad itself is boring
-- ============================================

instance Functor ((->) r) where
    fmap = (.)
instance Applicative ((->) r) where
    pure = const
    f <*> a = \r -> f r (a r)
instance Monad ((->) r) where
    return = pure
    m >>= k = flip k <*> m

