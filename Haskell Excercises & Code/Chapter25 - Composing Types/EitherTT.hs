module EitherTT where

import Test.QuickCheck
-- newtype MaybeT m a =
-- MaybeT { runMaybeT :: m (Maybe a) }


newtype EitherT e m a = EitherT { runEitherT :: m (Either e a) }

newtype TestData a b = TestData b deriving (Eq, Show)

-- Github Arbitrary example
-- instance Arbitrary Cell where
--    arbitrary = do
--      Positive x <- arbitrary
--      Positive y <- arbitrary
--      return $ Cell x y

-- arbitrary :: Gen a
genArbit :: (Arbitrary a, Arbitrary b) => Gen (TestData a b)
genArbit = do
    x1 <- arbitrary
    return $ TestData x1

randomGen = sample' (genArbit :: Gen (TestData Int Int))

-- 1. Write the Functor instance for EitherT:
instance Functor m => Functor (EitherT e m) where
    fmap f (EitherT ema) = EitherT $ (fmap . fmap) f ema
