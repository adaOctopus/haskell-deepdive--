module JSONParser where

newtype Parser a = Parser { runParser :: String -> Maybe (String, a)}

charP :: Char -> Parser Char
charP x = Parser $ \input ->
    case input of
        y:ys | y == x      -> Just (ys, x)
             | otherwise   -> Nothing
        []                 -> Nothing