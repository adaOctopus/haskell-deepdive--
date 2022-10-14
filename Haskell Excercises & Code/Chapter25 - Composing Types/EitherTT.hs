module EitherTT where

import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
-- newtype MaybeT m a =
-- MaybeT { runMaybeT :: m (Maybe a) }


newtype EitherT e m a = EitherT { runEitherT :: m (Either e a) }

-- -- 1. Write the Functor instance for EitherT:
-- instance Functor m => Functor (EitherT e m) where
--     fmap f (EitherT ema) = EitherT $ (fmap . fmap) f ema


-- Github Arbitrary example
-- instance Arbitrary Cell where
--    arbitrary = do
--      Positive x <- arbitrary
--      Positive y <- arbitrary
--      return $ Cell x y

newtype TestData a b = TestData b deriving (Eq, Show)

instance Functor (TestData a) where
    fmap f (TestData b) = TestData (f b)

-- functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
-- functorIdentity f = fmap id f == f


instance (Eq a, Eq b) => EqProp (TestData a b) where (=-=) = eq
-- arbitrary :: Gen a
genArbit :: (Arbitrary a, Arbitrary b) => Gen (TestData a b)
genArbit = do
    x1 <- arbitrary
    return $ TestData x1

instance (Arbitrary a, Arbitrary b) => Arbitrary (TestData a b) where
    arbitrary = genArbit

randomGen = sample' (genArbit :: Gen (TestData Int Int))

-- Function for Identity Law
validateFunctorIdent :: IO Bool
validateFunctorIdent = do
    context <- randomGen
    print $ context
    let checkUp = fmap id context
    case checkUp == context of
        True -> return $ True
        False -> return $ False