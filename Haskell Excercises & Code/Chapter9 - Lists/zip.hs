module ZipTest where 

myZip :: [a] -> [b] -> [(a, b)]
myZip [] [_]        = []
myZip [_] []        = []
myZip [x] [y]       = [(x,y)]
myZip (x:xs) [y]    = [(x,y)]
myZip [x] (y:ys)    = [(x,y)]
myZip (x:xs) (y:ys) = [(x,y)] ++ (myZip xs ys)  