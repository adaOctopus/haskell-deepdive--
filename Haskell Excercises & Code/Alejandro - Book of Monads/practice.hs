module WithCounting where

-- Chapter 1. Exercises and Practice
type WithCounter a = Int -> (a, Int)

-- 1ST PATTERN IDENTIFIED
next :: WithCounter a -> (a -> WithCounter b) -> WithCounter b
f `next` g = \i -> let (r, i') = f i in g r i'

-- Reason the types
-- f => WithCounter a
-- g => (a -> WithCounter b)
-- i => a
-- f i => (a, Int)
-- (r, i') => (a, Int)
-- 

--2ND PATTERN IDENTIFIED

pure :: a -> WithCounter a
pure x = \i -> (x, i)

type State s a = s -> (a, s)

-- rewrite next & pure
next' :: State s a -> (a -> State s b) -> State s b
f `next'` g = \i -> let (r, i') = f i in g r i'

pure' :: a -> State s a
pure' x = \s -> (x, s) 

-- 1.2

-- ++

doublePlus :: [a] -> [a] -> [a]
doublePlus [] []         = []
doublePlus [] xs         = xs
doublePlus ys []         = ys
-- doublePlus xs (y:ys)     = y : doublePlus xs' ys'
--   where xs' = reverse xs
--         ys' = reverse ys
doublePlus (x:xs) ys     = x : doublePlus xs ys

-- [1,2,3]
-- [4,5,6]

then_ :: Maybe a -> (a -> Maybe b) -> Maybe b
then_ v g = case v of
              Nothing -> Nothing
              Just k -> g k
              
flatten :: Maybe (Maybe a) -> Maybe a
flatten (Just (Just x)) = Just x
flatten _               = Nothing

flatten' oo = then_ oo id
            -- case oo of 
                Nothing -> Nothing
                Just x -> id x ==> x