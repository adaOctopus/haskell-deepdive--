module RD1 where

import Control.Applicative


boop = (*2)
doop = (+10)

bip :: Integer -> Integer
bip = boop . doop

bbop :: Integer -> Integer
bbop = (+) <$> boop <*> doop

duwop :: Integer -> Integer
duwop = liftA2 (+) boop doop
