{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module Goats where

import Data.Int

class TooMany a where 
    tooMany :: a -> Bool

instance TooMany (Int, Int) where 
    tooMany (g1, g2) = (g1 + g2) > 42

newtype Goats = Goats (Int, Int) deriving (Eq, Show, TooMany)

-- What is the cardinality here?
data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

-- BigSmall is a sum type
-- Has two Unary constructors, Big & Small, each of them get one argument of type Bool
-- Which means their cardinality is based on their argument type
-- Bool has 2 possible types True or False, therefore cardinality 2
-- Big has 2 , Small has 2
-- Therefore BigSmall has 2 + 2 = 4 -> Cardinality


data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

-- let myNumba = Numba (-128)

data FlowerType = Gardenia | Daisy | Rose | Lilac deriving Show

type Gardener = String
data Garden = Garden Gardener FlowerType deriving Show

-- data Garden = Garden Gardener Gardenia | Garden Gardener Daisy | Garden Gardener Rose | Garden Gardener Lilac
