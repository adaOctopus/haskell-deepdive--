module TestingKnowl where

-- This code file is basically to write notes, and instances and laws
-- This is mainly for the revision purposes and testing of my understanding of the following:
-- Monoids, Functors, Applicatives, Monads -> Instances and their Laws
-- PS: Do not proceed without testing your knowledge for this
import Data.Monoid

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

-- Basically semigroup is mappend without the identity law, mempty missing
-- class Semigroup a where
--   (<>) :: a -> a -> a

-- Class definiton for Monoid
-- Monoid is a semigroup that fulfills the identity law
-- class Semigroup a => Monoid a where
--     mempty :: a
--     mappend :: a -> a -> a
--     mconcat :: [a] -> a

-- Remember Monoid expects of type * kind when writting instances
-- However, Functor, Applicative , Monad expect * -> * higher kinded
-- But we will explain that later in this file.

-- For practice lets right an instance for Monoid for Token and Coin
-- Remember we cannot write functor or applicative or monad instances
-- Because they are of concrete type * and not higher kinded, aka. they are no wrapping structures

-- ============================================================================
--                                  Monoids
-- ============================================================================
{--
-- A Monoid is a binary associative operation with an identity
-- Laws for Monoids
-- Left and Right Identity
mappend mempty x = x
mappend x mempty = x
-- Associativity
mappend x (mappend y z) = mappend (mappend x y) z
mconcat = foldr mappend mempty
-}

-- ============================================================================
--                                Semigroups
-- ============================================================================
-- A semigroup is an associative binary operation
-- (This is a monoid without an identity)
{-
class Semigroup a where
    (<>) :: a -> a -> a
-- Law:
(a <> b) <> c == a <> (b <> c)
-}

-- Semigroups will be coming to base in GHC 8.0, and we will see:
-- class Semigroup a => Monoid a where
-- ...
-- in the definition of Monoid.

-- ========
-- examples
-- ========

data MyFlag a = Burned | Moving a deriving (Eq, Show)
-- lets write monoid instance

instance Semigroup a => Semigroup (MyFlag a) where
    Burned <> Burned = Burned
    (Moving a) <> Burned = Moving a
    Burned <> (Moving a) = Moving a

instance Monoid a => Monoid (MyFlag a) where
    mempty = Burned
    mappend Burned Burned = Burned
    mappend (Moving a) Burned = Moving a
    mappend Burned (Moving a) = Moving a
    mappend (Moving a) (Moving b) = Moving (mappend a b)


