module ReaderTest where

-- Calls func2 if even length, func3 and func4 if odd
func1 :: String -> (Int, String)
func1 input = if length input `mod` 2 == 0
  then func2 (0, input)
  else (i1 + i2, str1 ++ str2)
    where
      (i1, str1) = func3 (0, tail input)
      (i2, str2) = func4 (0, take 1 input)

-- Calls func4 on truncated version
func2 :: (Int, String) -> (Int, String)
func2 (prev, input) = if (length input) > 10
  then func4 (prev + 1, take 9 input)
  else (10, input)

-- Calls func2 on expanded version if a multiple of 3
func3 :: (Int, String) -> (Int, String)
func3 (prev, input) = if (length input) `mod` 3 == 0
  then (prev + f2resI + 3, f2resStr)
  else (prev + 1, tail input)
  where
    (f2resI, f2resStr) = func2 (prev, input ++ "ab")

func4 :: (Int, String) -> (Int, String)
func4 (prev, input) = if (length input) < 10
  then (prev + length input, input ++ input)
  else (prev + 5, take 5 input)