-- registeredUser2.hs
module RegisteredUser where
    
newtype Username = Username String
newtype AccountNumber = AccountNumber Integer
data User = UnregisteredUser | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username name) (AccountNumber acctNum)) = putStrLn $ name ++ " " ++ show acctNum

data LocationBase = Anartartic | Americas | Mars | Honolulu deriving Show 

data AnimalBase = Animal LocationBase deriving Show 


isItClose :: LocationBase -> Bool
isItClose Mars = False
isItClose _    = True