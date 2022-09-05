module NewEx where

data Validation a b = Failure a | Success b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Validation a b) where 
    (<>) (Failure alpha) (Failure beta) = Failure (alpha <> beta)
    (<>) (Success a1) (Success b1)      = Success (a1 <> b1)
    (<>) (Success a1) (Failure b1)      = Success a1
    (<>) (Failure a1) (Success b1)      = Success b1


main = do
    let failure :: String -> Validation String Int
        failure = Failure

        success :: Int -> Validation String Int
        success = Success
    print $ success 1 <> failure "blah"
    print $ failure "woot" <> failure "blah"
    print $ success 1 <> success 2
    print $ failure "woot" <> success 2


data Trivial = Trivial deriving (Eq, Show)
instance Semigroup Trivial where 
    (<>) Trivial Trivial = Trivial

instance Monoid Trivial where 
    mempty = undefined 
    mappend = (<>)
type TrivAssoc =Trivial -> Trivial -> Trivial -> Bool

mainT :: IO ()
mainT = do
    let sa = semigroupAssoc
        mli = monoidLeftIdentity
        mlr = monoidRightIdentity
    quickCheck (sa :: TrivAssoc)
    quickCheck (mli :: Trivial -> Bool)
    quickCheck (mlr :: Trivial -> Bool)
