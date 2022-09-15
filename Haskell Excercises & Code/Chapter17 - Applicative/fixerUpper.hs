module FixerUpper where

import Control.Applicative
-- 1.

-- funca1 :: (Show a, Show b) => f (a -> b) -> Maybe String -> Maybe String 
-- added pure and <*> and Just
funca1 = pure const <*> Just "Hello" <*> Just "World"
-- 2. 
-- (,,,) Just 90 <*> Just 10 Just "Tierness" [1, 2, 3]