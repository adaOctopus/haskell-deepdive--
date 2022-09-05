module MonoidCompr where

import Data.Monoid
import Data.Semigroup
import Test.QuickCheck 

data Crypto a b = Ponzi a | RealDeal b deriving (Eq, Show)

-- Semigroup Instance
instance (Semigroup a, Semigroup b) => Semigroup (Crypto a b) where 
    (<>) (Ponzi one) (Ponzi two) = Ponzi (one <> two)
    (<>) (Ponzi one) (RealDeal two) = Ponzi one
    (<>) (RealDeal one) (Ponzi two) = Ponzi two
    (<>) (RealDeal one) (RealDeal two) = RealDeal (one <> two)

-- instance Monoid
-- Semigroup + identity
-- instance (Monoid a, Monoid b) => Monoid (Crypto a b) where 
--     mempty = Ponzi 

main :: IO ()
main = do
    let ponzi :: String -> Crypto String String
        ponzi = Ponzi

        real :: String -> Crypto String String
        real = RealDeal
    print $ ponzi "Solana" <> real "Cardano"
    print $ real "ADA" <> real "Cardano"
    print $ real "ETH" <> ponzi "2.0"
    print $ ponzi "ETH" <> ponzi "2.0"



