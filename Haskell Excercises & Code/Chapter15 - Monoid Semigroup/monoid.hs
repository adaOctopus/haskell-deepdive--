module Monoiding where

import Data.Monoid
-- class Monoid m where
--     mempty :: m
--     mappend :: m -> m -> m
--     mconcat :: [m] -> m
--     mconcat = foldr mappend mempty

-- instance Monoid [a] where
--     mempty = []
--     mappend = (++)

data Crypto = Crypto String

--newtype Blockchain = Blockchain Crypto | Blockcha String

-- Write monoid instance for Optional type of Maybe 

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
   mempty = Nada

instance Semigroup a => Semigroup (Optional a) where
  Nada <> (Only a) = Only a
  (Only a) <> Nada = Only a
  (Only a) <> (Only a') = Only (a <> a')
  Nada <> Nada = Nada

main :: IO ()
main = do
  print $ Nada `mappend` Only (Sum 1)
