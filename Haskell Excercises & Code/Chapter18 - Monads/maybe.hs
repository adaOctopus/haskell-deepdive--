module MaybeMonad where



data Cow = Cow { 
    name :: String
    , age :: Int
    , weight :: Int
     } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty str = Just str

noNegative :: Int -> Maybe Int
noNegative n | n >= 0 = Just n
             | otherwise = Nothing

-- -- if Cow's name is Bess, must be under 500
-- weightCheck :: Cow -> Maybe Cow
-- weightCheck c = let w = weight c
-- n = name c
-- in if n == "Bess" && w > 499
-- then Nothing
-- else Just c
-- mkSphericalCow :: String
-- -> Int
-- -> Int
-- -> Maybe Cow
-- mkSphericalCow name' age' weight' =
-- case noEmpty name' of
-- Nothing -> Nothing
-- Just nammy ->
-- case noNegative age' of
-- Nothing -> Nothing
-- Just agey ->
-- case noNegative weight' of
-- Nothing -> Nothing
-- Just weighty ->
-- weightCheck
-- (Cow nammy agey weighty)

-- Monad instance types
-- >>= :: Monad m => m a -> (a -> m b) -> m b
-- return :: Monad m => a -> m a
-- >> :: m a -> m b -> m b (sequencing actions and completely ignoring the result of the first)