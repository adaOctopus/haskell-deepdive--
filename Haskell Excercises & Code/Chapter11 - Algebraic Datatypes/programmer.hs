module Programmer where 

data OperatingSystem = GnuPlusLinux
                       | OpenBSDPlusNevermindJustBSDStill
                       | Mac
                       | Windows deriving (Eq, Show)

data ProgLang = Haskell | Agda | Idris | PureScript deriving (Eq, Show)

data Programmer = Programmer { os :: OperatingSystem
                               , lang :: ProgLang } deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems = [ GnuPlusLinux
                        , OpenBSDPlusNevermindJustBSDStill
                        , Mac
                        , Windows
                        ]

allLanguages :: [ProgLang]
allLanguages = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer x2 x1 | x1 <- allLanguages, x2 <- allOperatingSystems]

myFunca = length allLanguages * length allOperatingSystems

-- try it out
-- iterate
-- Practicing to understand how list comprehension works, to generate the product of Programmers, without writting the type
-- I guess we are clever... ;)
listOne = [1,2,3,4]
listTwo = ['a','b','c','d']
listThree = ['k','y']
funca   = [(x1,x2,x3) | x1 <- listOne, x2 <- listTwo, x3 <- listThree]
