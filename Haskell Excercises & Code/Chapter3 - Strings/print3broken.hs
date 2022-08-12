-- print3broken.hs
module Print3Broken where

printSecond :: IO ()
printSecond = do
    putStrLn greeting
    where greeting = "Yarrrrr"

main :: IO ()
main = do
    putStrLn greeting
    printSecond
    where greeting = "Yarrrrr"

parseIt x = drop 1 x

thirdLetter :: String -> Char
thirdLetter x = x !! 2

pickLetter :: Int -> Char
pickLetter x = "Fixed string" !! x

rvrs = do 
    let prwto = take 8 sentence
        prwto' = take 5 prwto
        telefteo = drop 9 sentence
        i = drop 6 prwto
        reverValue = telefteo ++ " " ++ i ++ " " ++ prwto'
    putStrLn reverValue
    where
      sentence = "Curry is awesome"