{-# LANGUAGE BangPatterns #-}

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


doesntEval :: Bool -> Int
doesntEval b = 1
manualSeq :: Bool -> Int
manualSeq b = b `seq` 1

banging :: Bool -> Int
banging !b = 1

-- If you try passing bottom to each function you’ll find that
-- manualSeq and banging are forcing their argument despite not
-- using it for anything. Remember that forcing something is
-- expressed in Core as a case expression and that case evaluates
-- up to weak head normal form in Core