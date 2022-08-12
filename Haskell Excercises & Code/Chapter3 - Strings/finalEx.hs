-- Turn the following into a module
-- rvrs = do 
--     let prwto = take 8 sentence
--         prwto' = take 5 prwto
--         telefteo = drop 9 sentence
--         i = drop 6 prwto
--         reverValue = telefteo ++ " " ++ i ++ " " ++ prwto'
--     putStrLn reverValue
--     where
--       sentence = "Curry is awesome"


module Reverse where

rvrs :: String -> String
rvrs x = do 
    let prwto = take 8 x
        prwto' = take 5 prwto
        telefteo = drop 9 x
        i = drop 6 prwto
    telefteo ++ " " ++ i ++ " " ++ prwto'


main :: IO ()
main = print $ rvrs "Curry is awesome"