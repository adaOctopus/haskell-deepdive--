module OutsideIn where

hypo :: IO ()
hypo = do
    let x :: Int
        x = undefined
    s <- getLine
    case s of
        "hi" -> print x
        _ -> putStrLn "hello"

notGonnaHappenBru :: Int
notGonnaHappenBru = 
    let x = undefined
        y = 2
        z = (x `seq` y `seq` 10, 11)
    in snd z