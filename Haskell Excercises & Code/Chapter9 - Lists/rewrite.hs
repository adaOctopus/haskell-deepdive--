module MyRecurs where 


-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr  []      = False
myOrd [True]  = True
myOrd [False] = False
myOrd (x:xs)
  | x == True = True
  | x /= True = myOrd xs

-- 2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f []     = False
myAny f [x]    = if f x == True then True else False
myAny f (x:xs) 
  | f x == True = True 
  | f x /= True = myAny f xs

-- 3. recursive version of elem function
myElem :: Eq a => a -> [a] -> Bool
myElem x []      = False
myElem x [n]     = if x == n then True else False 
myElem k (x:xs) 
  | k == x = True 
  | k /= x = myElem k xs


-- 4. Implement myReverse.
myReverse :: [a] -> [a]
myReverse []     = []
myReverse [x]    = [x]
myReverse (x:xs) = myReverse xs ++ x : []


-- 5. squish flattens a list of lists into a list
-- Works only with up to two lists, need to make it infinite
squish :: [[a]] -> [a]
squish [[]]     = []
squish [[x]]    = [x]
squish [(x:xs)] = (x:xs)
squish [(x:xs),(y:ys)] = (x:xs) ++ (y:ys)

-- 6. squishMap maps a function over a list and concatenates the results.
squishMap :: (Num a,Num b) => (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs


-- 7,8,9,10 were super BORING LOL. Apologies to the authors <3





