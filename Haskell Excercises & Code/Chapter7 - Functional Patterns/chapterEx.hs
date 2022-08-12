module ChapterEx where

-- Char -> String f
-- String -> [String] g

-- g . f
-- x :: (String -> [String]) -> (Char -> String) -> Char -> [String]
-- x = g . f


f :: a -> a
f x = x

-- what is type of f True ?
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d = xLast `mod` 10

tensDigit' x = x `divMod` 100

-- Write once with guard and once with Case

-- Excersise 2
foldBool :: a -> a -> Bool -> a
foldBool a1 a2 boola = 
    case boola of
        False -> a1 
        True  -> a2 
        _     -> error "Error: Need to implement foldBool!"

foldBool' :: a -> a -> Bool -> a
foldBool' a1 a2 boola 
  | boola == False = a1
  | boola == True  = a2
  | otherwise      = error "Error: Need to implement foldBool!"

-- Pattern matching example
-- foldBool3 :: a -> a -> Bool -> a
-- foldBool3 x _ False = x
-- foldBool3 _ y True = y

-- Excersise 3 definition setter
g :: (a -> b) -> (a, c) -> (b, c)
-- g = undefined

g f (a1,a2) = (f a1, a2)

-- Exercise 4 and beyond, next file