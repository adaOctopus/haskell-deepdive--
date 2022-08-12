-- Rewrite let statements with where clauses
--  let x = 3; y = 1000 in x * 3 + y
--  let y = 10; x = 10 * 5 + y in x * 5
module Practice where

multip = x * 3 + y
  where
    x = 3
    y = 1000

multip2 = x * 5
  where y = 10
        x = 10 * 5 + y

z = 7
y = z + 8
x = y ^ 2
wax0n = multip
  where multip = x * 5

triple k = k * 3

waxOff h = triple h
