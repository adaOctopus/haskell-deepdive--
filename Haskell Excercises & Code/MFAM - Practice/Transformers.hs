module Transformers where

import Control.Monad
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Class -- lift comes from Here
import Data.Char

checkInput :: String -> Bool
checkInput []  = False
checkInput (x:_) = isUpper x

getName :: MaybeT IO String
getName = do
    x <- lift getLine
    guard (checkInput x)
    return x

example = runMaybeT $ do
    lift $ putStr "Your name: "
    name <- getName
    lift $ putStrLn $ "Your name is " ++ name

practice' = let x = [1,2,3,5] in
            let y = [1,5,6,7] in
            zip x y