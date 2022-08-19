{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}


module Goat where 


-- 11.9 Excercise Logic Goats
-- 1. Reusing the TooMany typeclass, write an instance of the
-- typeclass for th:re type (Int, String). This will require
-- adding a language pragma named FlexibleInstances5
-- if you do not use a newtype — GHC will tell you what to do.

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
