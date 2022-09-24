module TestingKnowl where

-- This code file is basically to write notes, and instances and laws
-- This is mainly for the revision purposes and testing of my understanding of the following:
-- Monoids, Functors, Applicatives, Monads -> Instances and their Laws
-- PS: Do not proceed without testing your knowledge for this

-- Starting by writing a few dummy data types

-- type -> are basically aliases for built-in data types
type Name   = String
type Amount = Integer

-- newtype requires only a unary Constructor
-- u cannot put Token Name Amount, it has to be Token Name or Token Amount
newtype Token = Token Name deriving (Eq, Show)

-- data can have as many constructors nested or not
data Coin = Coin Name Amount deriving (Eq, Show)

-- sum types are basically types with the | `or` operator
-- > such as data Lista a = Neil | Full a
-- product types are like data Product = Product Name Amount
-- :: function Product takes two params (Name) + (Amount) -> to produce the type Product

-- == Now that we get the basics of types lets move to Monoids
-- A complex explanation is, a function that takes two params and obeys the identity and associativity laws. WTF?
-- To me , Monoids are contexts or structures to say it better, that can be joined together.
-- mempty which is basically the identity value, for addition it is 0 for multiplication is 1
-- mappend which basically combines two same structures together
