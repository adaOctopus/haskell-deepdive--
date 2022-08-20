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
listOne = [1,2,3,4]
listTwo = ['a','b','c','d']
funca   = [(x1,x2) | x1 <- listOne, x2 <- listTwo]
