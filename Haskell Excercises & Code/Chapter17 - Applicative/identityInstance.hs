module IDInstance where

-- Ex . Applicative instance for identity

newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where 
    fmap f (Identity a) = Identity (f a)

instance Applicative Identity where 
    pure = Identity
    (Identity a1) <*> (Identity a2) = Identity (a1 a2)

--Write an Applicative instance for Constant.
newtype Constant a b = Constant { getConstant :: a } deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap _ (Constant x) = Constant x

instance Monoid a => Applicative (Constant a) where
  pure _                    = Constant mempty
  Constant f <*> Constant x = Constant (f <> x)

-- Maybe Applicative
-- Practice With Maybe Person

validateLength :: Int -> String -> Maybe String

validateLength maxLen s = if (length s) > maxLen then Nothing else Just s

newtype Name = Name String deriving (Eq, Show)

newtype Address = Address String deriving (Eq, Show)

mkName :: String -> Maybe Name
mkName s = fmap Name $ validateLength 25 s

mkAddress :: String -> Maybe Address
mkAddress a = fmap Address $ validateLength 100 a

data Cow = Cow { name :: String , age :: Int , weight :: Int } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty str = Just str

noNegative :: Int -> Maybe Int
noNegative n | n >= 0 = Just n
             | otherwise = Nothing

maybeApply :: Maybe (a -> b) -> Maybe a -> Maybe b
maybeApply = (<*>)