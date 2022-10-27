module TestIng where

-- /*

-- I = 1
-- V = 5
-- X = 10
-- L = 50
-- C = 100
-- D = 500
-- M = 1000

-- */

desiredList = [(1,'I'),(5,'V'),(10,'X'),(50,'L'),(100,'C'), (500,'D'),(1000,'M')]
indexing = [1,5,10,50,100,500,1000]


devisionIndex x = [ x / i | i <- reverse indexing]


-- General case
-- Always larger to smaller - left to right
-- 66 == LXVI

-- Special cases:
-- 4 = IV | 9 = IX
-- 40 = XL | 90 = XC
-- 400 = CD | 900 = CM

-- Initial test examples
-- 3 = III
-- 4 = IV
-- 9 = IX
-- 58 = LVIII
-- 1994 = MCMXCIV 
-- 3000 = MMM

isBigGang :: Int -> IO () -- (Bool, String)  
isBigGang x = print $ (x > 9, "Compared gang size to 9.")  