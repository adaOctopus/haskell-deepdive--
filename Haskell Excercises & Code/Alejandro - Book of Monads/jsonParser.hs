{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}


module JSONParser where

import Data.Char

newtype Parser a = Parser { runParser :: String -> Maybe (String, a)}

charP :: Char -> Parser Char
charP x = Parser $ \input ->
    case input of
        y:ys | y == x      -> Just (ys, x)
             | otherwise   -> Nothing
        []                 -> Nothing

-- Write a functor instance for the Parse

instance Functor Parser where
    fmap f (Parser rp) = Parser $ \s -> do
                          (s', x) <- rp s
                          Just (s', f x)

instance Applicative Parser where
    pure x = Parser $ \input -> Just (input, x)
    Parser fz <*> Parser rp = Parser $ \input -> do
                               (input' , x) <- rp input
                               (input'', aTob) <- fz input'
                               Just (input'', aTob x)