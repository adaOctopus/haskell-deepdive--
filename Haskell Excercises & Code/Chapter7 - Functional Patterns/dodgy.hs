module Dodgy where

-- Types not provided,
-- try filling them in yourself.
dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = flip dodgy 2

-- Think through
-- dodgy 2 2
-- 4. dodgy 1 2
-- 5. dodgy 2 1
-- 6. oneIsOne 1
-- 7. oneIsOne 2
-- 8. oneIsTwo 1
-- 9. oneIsTwo 2
-- 10. oneIsOne 3
-- 11. oneIsTwo 3
numbers x
  | x < 0 = -1
  | x == 0 = 0
  | x > 0 = 1
