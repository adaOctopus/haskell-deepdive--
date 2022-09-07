module HeavyLifting where

-- = Exercises Heavy Lifting
-- 1. a = (+1) $ read "[1]" :: [Int]
-- Expected result
-- Prelude> a
-- [2]
-- Answr
a = fmap (+1) . read $ "[1]" :: [Int]

-- 2. b = (++ "lol") (Just ["Hi,", "Hello"])
-- (a -> a -> a)
-- Prelude> b
-- Just ["Hi,lol","Hellolol"]
-- Answr
b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])

-- 3. c = (*2) (\x -> x - 2)
-- Prelude> c 1
-- -2
c = ((*2) . (\x -> x - 2))

-- 4. d = ((return '1' ++) . show) (\x -> [x, 1..3])
-- Prelude> d 0
-- "1[0,1,2,3]"
d = ((return '1' ++) . show) (\x -> [x, 1..3])

-- Did not complete number 5

-- 5. e :: IO Integer
-- e = let ioi = readIO "1" :: IO Integer
--         changed = read ("123"++) show ioi in (*3) changed
-- Prelude> e
-- 3693
