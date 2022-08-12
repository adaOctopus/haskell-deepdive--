module ListOne where

-- Data type declaration of lists
-- data [] a = [] | a : [a]

myHead :: [a] -> Maybe a
myhead []     = Nothing
myHead [x]    = Just x
myHead (x:xs) = Just x

-- 9.5 excercises
eftBool :: Bool -> Bool -> [Bool]
eftBool True True   = True : [] ++ True : []
eftBool True False  = True : [] ++ False : []
eftBool False True  = False : [] ++ True : []
eftBool False False = False : [] ++ False : []
eftBool _ _         = error "Please pass Booleans"

-- Maybe here it means to do ranging as in, if we pass 1 10, to not do just [1,10] concatenation
    -- But instead do [1,2,3,4,5,6,7,8,9,10]
    -- I did not understand from the context
eftInt :: Int -> Int -> [Int]
eftInt x y = x : [] ++ y : []



