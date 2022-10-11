# Haskell Deepdive from First Principles
This is a repository of my deepdive into haskell via using First Principles book. After doing 2 courses in Haskell in University of Nottingham, Im diving deeper with this 2,000 pages book -> Haskell from First Principles

## Chapters completed so far
-> 1. Lambda Calculus <br/>
-> 2. Hello Haskell <br/>
-> 3. Strings <br/>
-> 4. Basic Datatypes <br/>
-> 5. Types <br/>
-> 6. Typeclasses <br/>
-> 7. Functional Patterns <br/>
-> 8. Recursion <br/>
-> 9. Lists <br/>
-> 10. Folding Lists <br/> 
-> 11. Algebraic Datatypes <br/>
-> 12. Signaling Adversity <br/>
-> 13. Building Projects (cabal, stack) <br/>
-> 14. Testing <br/>
-> 15. Monoid Semigroup <br/>
-> 16. Functor <br/>

## Key point for understanding Monoid, Functor, Applicative and Monad is to start thinking of them as abstractions.
Defined operations and the set of types those operations can be applied to.

-> Chapter 15. Basically Semigroup is Monoid one leg off. Which is the requirement to fulfill the `Identity` law
Semigroups and Monoids are basically ways to express operations on a specific set/type
Think of it as a blueprint. Describing a behavior you want your types to have.

## Functor Laws

1. Identity

**`fmap id == id`**

2. Composition law

**`fmap (f . g) == fmap f . fmap g`** 
This concerns the composability of fmap. If we compose two functions, 𝑓 and 𝑔, and fmap that over some structure, we should get the same result as if we fmapped them and then composed them:

Remember instances of functors expect higher kinded params as in
* -> * instead of type constants of type kind *

Here, functorial structure is the `f`

instance Functor (Two a) where <br/>
fmap f (Two a b) = Two $ (f a) (f b)

(Two a) -> is the functorial structure f
where data type = Two a b = Two a b ( but the functorial structure needs to be higher-kinded * -> *

`But remember`
Functor is supposed to leave the functorial structure UNTOUCHED and only ammend the within values
This won’t fly, because the 𝑎 is part of the functorial structure (the 𝑓). We’re not supposed to touch anything in the 𝑓 referenced in the type of fmap, so we can’t apply the function (named 𝑓 in our fmap definition) to the 𝑎 because the 𝑎 is now untouchable.

Therefore we cannot touche the `a` as it is a part fo the functorial so we can only ammend the inner most value, thats why in tuples we only fmap the second value

instance Functor (Two a) where 
fmap f (Two a b) = Two a (f b) <br/>
`Example instance`

data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a) where
  fmap f (Three a1 b1 c1) = Three a1 (f b1) (f c1)
  
*Notice that whatever is after Functor in the instance aka the `f` functorial structure, it does not get altered* <br/>
Because functor is about changing the values of a structure, not the structure itself.
Completing excercises for Functor instances was super useful to understand how functors work. Change the values within a structure.

-> 17. Pending - Applicative <br/>
`Notes on Applicatives` <br/>

For applicative to work, we need functions inside some functorial structure
If the functions we want to apply are not in a structure, then we use pure f <*>
In that way the functions get wrapped by some structural context

## APPLICATIVE LAWS PRACTICE NOTES
-- APPLICATIVE LAWS<br/>

-- Define 1. IDENTITY laws and test their equality
law1 = id [1,2,3]

-- Functor
law2 = fmap id [1,2,3]

-- Applicative
law3 = pure id <*> [1,2,3]

checkIdent :: (Eq a, Show a, Num a) => [a] -> Bool
checkIdent xs = id xs == fmap id xs

runQuickCheck :: IO ()
runQuickCheck = quickCheck (checkIdent :: [Int] -> Bool)

-- 2. COMPOSITION LAW <br/>

pure (.) <*> u <*> v <*> w = u <*> (v <*> w)

-- This law is meant to ensure that there are no surprises
-- resulting from composing your function applications.
-- I.E
-- pure (.)
-- <*> [(+1)]
-- <*> [(*2)]
-- <*> [1, 2, 3]
-- [(+1)] <*> ([(*2)] <*> [1, 2, 3])

-- 3. HOMOMORPHISM<br/>

-- A homomorphism is a structure-preserving map between two algebraic structures.
-- The effect of applying a function that is embedded in some structure to a value that is
-- embedded in some structure should be the same as applying a function to a value without affecting any outside
-- structure:

-- Law statement in code
-- pure f <*> pure x = pure (f x)

-- The general idea of the homomorphism law is that applying the function doesn’t 
-- change the structure around the values.


-- 4. INTERCHANGE LAW<br/>
-- We begin again by looking at the definition of the interchange law:
-- u <*> pure y = pure ($ y) <*> u

-- HINT: This is what I was thinking of , if it is possible :)
-- According to the interchange law, this should be true:
-- (Just (+2) <*> pure 2)
-- == (pure ($ 2) <*> Just (+2))



## Chapter 19 I choose to skip
It is completely out of scope for my purpose.
I am learning Haskell to build smart contracts on Cardano using Plutus & Plutarch which are built on top of Haskell
Not to build Haskell projects.
For my purposes after completing all 18 chapters which are essential to building on Plutus
The rest of the book will be just about reading and becoming familiar<br/>
`Here the final chapters I will focus on`
1. Foldable - Chapter 20
2. Traversable - Chapter 21
3. Reader - Chapter 22
4. State - Chapter 23
5. Monad Transformers - Chapter 26
6. Non strictness - Chapter 27
7. IO - Chapter 29

</br>
18. Monads -> Completed
Thing to remember the unique sauce of monads is the join function m (m a) -> m a
- The laws for monads are 3, left identity, right identity, associativity
- The laws for functors are 2, identity & composition
- The laws for applicatives are 4, identity, interchange, composition, homomorphism

### Functors Laws(2)</br>
#### 1. Identity Law
`fmap id == id`</br>

#### 2. Composition Law
`(fmap f) . (fmap g) == fmap (f . g)`</br>

### Applicative Laws(4)</br>
#### 1. Identity Law
`pure id <*> u == u`</br>

#### 2. Homomorphism Law
`pure f <*> pure x == pure (f x)`</br>

#### 3. Interchange Law
`y <*> pure u == pure ($ u) <*> y`</br>

#### 4. Composition
` pure (.) <*> u <*> v <*> w = u <*> (v <*> w)`</br>

### Monad Laws (3)</br>
#### 1. Left identity
`m >>= return = m `</br>

### 2. Right identity
`return m >>= f = f m`</br>

### 3. Assocatiavity
`(m >>= f) >>= g = m >>= (\x -> f x >>= g)`</br>

### Continuing the book</br>

-> 20.Foldable - Completed</br>
-> 21. Traversable - Completed</br>
`Remember`</br>

-- =========================</br>
-- ====== REMEMBER =========</br>
-- =========================</br>
-- Functors are about fmap and lifting a function over to some structure, affecting values, never the structure</br>
-- Foldable is about Monoids, without monoids, it does not understand what kind of function to apply foldMap over</br>
-- Traverse is about fmap, and `ap` operator, and works with recursion mostly</br>

-- =========================</br>
-- ====== NOTE =========</br>
-- =========================</br>
-- This might seem tedious at first, but remember our Foldable type class, </br>
-- as it also defines a function that is perfect for this particular use case: </br>
-- foldMap :: Monoid m => (a -> m) -> t a -> m. </br>
-- We can read this as:</br>
-- Given a foldable containing things that aren’t Monoids, </br>
-- and a function that can convert a single thing to a Monoid, </br>
-- I’ll give you back a Monoid by traversing the foldable, </br>
-- converting everything to Monoids and folding them together.</br>

### Continuing the book</br>

-> 22. Reader - Completed</br>
`Remember`</br>

-- =========================</br>
-- ====== REMEMBER =========</br>
-- =========================</br>
-- Reader is basically all about partial applied functions. ((->) a)
-- the functor of functions is basically composition
-- the applicative of functions is again the `ap` attribute

### Continuing the book</br>

-> 23. State - Completed</br>
