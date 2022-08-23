module MoreExer where 


-- As natural as any
-- competitive bodybuilder
data Nat = Zero | Succ Nat deriving (Eq, Show)

-- COMPLETED
natToInteger :: Nat -> Integer
natToInteger Zero        = 0
natToInteger (Succ Zero) = 1
natToInteger (Succ nat)  = 1 + (natToInteger nat)

-- NON COMPLETE, CANNOT FIND THE RECURSION PATTERN
integerToNat :: Integer -> Maybe Nat
integerToNat n 
  | n == 0    = Just Zero
  | n > 0     = case n == 1 of
                 True  -> Just (Succ Zero)
                 False -> integerToNat (n-1)   
  | otherwise = Nothing

-- More ex. 1. Simple boolean checks for Maybe values.

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust _        = False
-- >>> isNothing (Just 1)
-- False
-- >>> isNothing Nothing
-- True
isNothing :: Maybe a -> Bool
isNothing (Nothing) = True
isNothing _         = False


-- 2. The following is the Maybe catamorphism. You can turn a
-- Maybe value into anything else with this.
-- >>> mayybee 0 (+1) Nothing
-- 0
-- >>> mayybee 0 (+1) (Just 1)
-- 2
mayybee :: b -> (a -> b) -> Maybe a -> b
