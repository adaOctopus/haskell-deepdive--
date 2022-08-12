-- learn.hs
module Learn where
x = 7
y = 10
f = x + y

-- with let
printAdo x = print addTwo
  where
    addTwo = x + 2

printAda x = let addTwo = x + 2
             in print addTwo
