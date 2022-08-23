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
mayybee x _ Nothing  = x 
mayybee x f (Just n) = f n 

-- 3. In case you just want to provide a fallback value.
-- >>> fromMaybe 0 Nothing
-- 0
-- >>> fromMaybe 0 (Just 1)
-- 1
fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing  = x
fromMaybe x (Just n) = n

-- 4. Converting between List and Maybe.
listToMaybe :: [a] -> Maybe a
listToMaybe []     = Nothing
listToMaybe (x:xs) = Just x
-- >>> maybeToList (Just 1)
-- [1]
-- >>> maybeToList Nothing
-- []
maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just n) = [n]

-- MyIterate, implement iterate function on your own
myIterate :: (a -> a) -> a -> [a]
myIterate f x = (f x) : (myIterate f (f x))
