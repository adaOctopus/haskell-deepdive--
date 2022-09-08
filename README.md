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
-> 16. Pending - Functor <br/>

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
fmap f (Two a b) = Two a (f b) < br />
`Example instance`

data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a) where
  fmap f (Three a1 b1 c1) = Three a1 (f b1) (f c1)
  
*Notice that whatever is after Functor in the instance aka the `f` functorial structure, it does not get altered* <br />
Because functor is about changing the values of a structure, not the structure itself.
