module MySemigroup where

import Data.Semigroup as S 
import Data.List.NonEmpty as N
import Data.Monoid
import Test.QuickCheck 

-- My own practice was perfectly correct!
-- instance Semigroup (Maybe a) where
--     (<>) Nothing _             = Nothing
--     (<>) _ Nothing             = Nothing
--     (<>) (Just one) (Just two) = Just (one <> two) 

-- == Exerc 1.
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where 
    (<>) Trivial Trivial = Trivial

instance Arbitrary Trivial where 
    arbitrary = return Trivial


semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrivAssoc = Trivial -> Trivial -> Trivial -> Bool
main :: IO ()
main = quickCheck (semigroupAssoc :: TrivAssoc)

-- Exer 2. Do the same for this: . newtype Identity a = Identity a

newtype Identity a = Identity a

instance Semigroup a => Semigroup (Identity a) where
    (<>) (Identity x) _            = Identity x
    (<>) _ (Identity y)            = Identity y
    (<>) (Identity x) (Identity y) = Identity (x <> y)

-- instance Arbitrary a => Arbitrary (Identity a) where
--     arbitrary = return (Identity a)

genInteg :: Arbitrary a => Gen (Maybe a)
genInteg = do
    x <- arbitrary
    frequency [(0, return Nothing), (1, return (Just x))]

checkPositive = autoGen
  where 
    autoGen     = sample' (genInteg :: Gen (Maybe Int))

-- checkList = print $ checkPositive
-- mainTwo :: IO ()
-- mainTwo = sample' (genInteg :: Gen (Maybe Int))


newtype BoolDisj = BoolDisj Bool

instance Semigroup BoolDisj where
    (<>) (BoolDisj True) _ = BoolDisj True
    (<>) _ (BoolDisj True) = BoolDisj True
    (<>) _ _               = BoolDisj False