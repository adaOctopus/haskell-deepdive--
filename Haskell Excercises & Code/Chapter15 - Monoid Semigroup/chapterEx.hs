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
