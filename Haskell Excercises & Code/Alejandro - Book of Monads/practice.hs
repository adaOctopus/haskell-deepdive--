module WithCounting where

data WithCounter a = Int -> (a, Int) deriving (Eq, Show)