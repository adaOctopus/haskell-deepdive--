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


-- Functors
{-- Typeclass definition:
class Functor f where
    fmap :: (a -> b) -> f a -> f b
-- Laws:
-- Identiy Law:
fmap id == id
-- Composition Law:
fmap (f . g) == fmap f . fmap g
-}

-- The identity law enforces the constraint that the functor does not change
-- the outer structure of f, just the internal values.  The second law also
-- deals with preservation of structure, this time by allowing us to compose
-- functions.

-- Note that in function definitions, all paremeter variables have to have
-- the concrete kind type *.

instance Functor MyFlag where
    fmap f Burned = Burned
    fmap f (Moving x) = Moving (f x)


-- Applicative is a monoidal functor, in a sense.
-- It allows for function application lifted over structure, but the function we're
-- applying is itself embedded in some structure.
--
{-- Definition
class Functor f => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b
--}

ex1 = [(*2), (*3)] <*> [4, 5]
ex2 = Just (*2) <*> Just 3
ex3 = ("Woo", (+1)) <*> ("hoo!", 0) :: (String, Int)

{-- The last example works beause we have:
instance Monoid a => Applicative ((,) a) where
    pure x = (mempty, x)
    (u, f) <*> (v, x) = (u <> v, f x)
-- Note that as with Functor, Applicative takes an argument of kind * -> *
--}

-- ============== APPLICATIVE LAWS ====================
-- ====================================================

-- -- {{{{ Identity }}}}
-- pure id <*> v = v

-- {{{ Homomorphism }}}

-- A homomorphism is a structure-preserving map between
-- two algebraic structures. The effect of applying a function that is embedded in some structure to a value that is
-- embedded in some structure should be the same as applying a function to a value without affecting any outside
-- structure
-- pure f <*> pure x = pure (f x)

-- -- {{{ {Interchange }}}}
-- u <*> pure y = pure ($ y) <*> u

-- -- Composition
-- Same as functors
-- The result of composing our functions first and then applying them should be the same as applying them first and then composing
-- pure (.) <*> u <*> v <*> w = u <*> (v <*> w)

instance Applicative MyFlag where
    pure x = Moving x
    _ <*> Burned = Burned
    Burned <*> _ = Burned
    (Moving f) <*> (Moving b) = Moving (f b)

instance Monad MyFlag where
    return x = Moving x
    Burned >>= _ = Burned
    (Moving a) >>= f = f a


-- =========== Monads ============================
-- ===============================================

-- Applicative Functors with bind and sequencing functions
-- The generalization here is that we can do mappings that generate additional
-- layers of structure, but we can also 'concat' that structure back down to
-- just the original layer.
--
-- The "secret sauce" of Monads is the join function, which lets us strip
-- away a layer of structure:
-- join :: Monad m => m (m a) -> m a
-- bind :: Monad m => (a -> m b) -> m a -> m b
-- bind f m = join $ fmap f m

--  ===========================================================================
--                             Monad Laws
--  ===========================================================================
{-- 1. Left Identity
m >>= return = m
-- 2. Right Identity
return x >>= f = f x
-- 3. Associativity
(m >>= f) >>= g = m >>= (\x -> f x >>= g)
--}

-- The laws can be checked with quickBatch:
-- q1 = quickBatch $ monad (undefined :: [(Int, Int, Int)])


-- Kleisli Composition
-- If I have two monads f and g and I'd like to compose them, I need something like this:
-- mcomp :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
-- mcomp f g a = g a >>= f
-- Kleisli to get is to get composition
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g ==> g takes an `a` and returns a `b` , f takes a `b` and returns a `c`
-- Kleisli is the flip of it
-- (thoughtKleisli) :: (a -> b) -> (b -> c) -> a -> c
--- BUUUUUUT FOR MONADIC STRUCTURES SO THE TYPE SIGNATURE IS:
-- (>=>) :: (a -> M b) -> (b -> M c) -> a -> M c

-- Functor laws (2)
-- key operator -> fmap : (<$>)
-- class Monoid f => Functor f where
--     fmap :: (a -> b) -> f a -> f b

-- 1 identity ==> fmap id = id ==> fmap id [1,2,3] == id [1,2,3] returns True
-- 2 composition ===> (fmap f) . (fmap g) == fmap (f . g)

-- Applicative Laws (4)
-- key operators -> pure & (<*>)
-- Left to the (<*>) operator, always goes the functions embedded in a structure (unless we interchange)
-- class Functor f => Applicative f where
--     pure :: a -> f a
--     (<*>) :: f (a -> b) -> f a -> f b

-- 1. Identity
-- pure id <*> v = v
-- 2. Homomorphism
-- pure f <*> pure x = pure (f x)
-- Applying the function embeded to the structure, to a value embedded to a structure, should be like leaving the structure untouched.
-- 3. Interchange
-- u <*> pure x = pure ($ x) <*> u
-- Where u is a function embeded in the structure
-- 4. Composition
-- This is similar to the law of composition for
-- Functor. It is the law stating that the result of composing
-- our functions first and then applying them and the result of applying the functions first then composing them
-- should be the same.
-- -- pure (.) <*> u <*> v <*> w = u <*> (v <*> w)