-- matchingTuples1.hs
module TupleFunctions where
-- These have to be the same type because
-- (+) is a -> a -> a
addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y
-- addEmUp2 could also be written like so
addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x

-- Practice Excercise
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)


-- data (,) a b = (a,b)
-- Remember: Tuples have the
-- same syntax for their
-- type constructors and
-- their data constructors.
thirdItem :: (a,b,c) -> c 
thirdItem (a,b,c) = c

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d),(c, f))

funcZ x = case x + 1 == 1 of
            True -> "AWESOME"
            False -> "wut"
