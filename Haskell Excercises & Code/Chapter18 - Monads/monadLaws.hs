module MonadLaws where

--import Test.QuickCheck
import Control.Monad ((>=>))

--- IDENTITY LAWS
-----------------

-- right identity
-- m >>= return = m

-- left identity
-- return x >>= f = fx

-- ASSOCIATIVITY
---------------

--- (m >>= f) >>= g = m >>= (\x -> f x >>= g)

-- mempty = 
-- Composition type sign
-- :: (b -> c) -> (a -> b) -> a -> c
-- Monad type sign
--(>>=) :: Monad m => m a -> (a -> m b) -> m b
-- flipped composition type sign
-- (>=>) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c

sayHi :: String -> IO String
sayHi greeting = do
    putStrLn greeting
    getLine

readM :: Read a => String -> IO a
readM = return . read

getAge :: String -> IO Int
getAge = sayHi >=> readM

askForAge :: IO Int
askForAge = getAge "Hello! How old are you? "
