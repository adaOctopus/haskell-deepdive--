module Operations where

import Control.Applicative

f x = lookup x [ (3, "hello"), (4, "julie"), (5, "kbai")]

g y = lookup y [ (7, "sup?")
                   , (8, "chris")
                   , (9, "aloha")]

h z = lookup z [(2, 3), (5, 6), (7, 8)]
m x = lookup x [(4, 10), (8, 13), (1, 9001)]

-- You have Just "julie"
-- how can u get length of julie?
-- Well done I did it!
-- pure length <*> liftA2 (++) (g 9) (f 4)