module Persona where 

type Name = String
type Age = Integer
data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnknown String deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 =
     Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise = Left $ PersonInvalidUnknown $ "Name was: " ++ show name ++ " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
    putStrLn "What is your age?"
    ageString <- getLine
    let ageNum = read ageString :: Integer
    putStrLn "What is your name?"
    nameString <- getLine
    case mkPerson nameString ageNum of
        Right (Person nameString ageNum) -> do
                                             putStrLn ("Yay, Successfully got a person: " ++ nameString ++ ", " ++ ageString)
                                             return ()

        Left NameEmpty                   -> do
                                             putStrLn "Ooops, empty name. Try again"
                                             gimmePerson
        Left AgeTooLow                   -> do
                                             putStrLn "Ooops, age low. Try again"
                                             gimmePerson
        _                                -> do
                                             putStrLn "Ooops unknown error."
                                             return ()