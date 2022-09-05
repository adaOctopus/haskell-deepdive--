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
-> 15. Pending - Monoid Semigroup <br/>

## Key point for understanding Monoid, Functor, Applicative and Monad is to start thinking of them as abstractions.
Defined operations and the set of types those operations can be applied to.

-> Chapter 15. Basically Semigroup is Monoid one leg off. Which is the requirement to fulfill the `Identity` law
Semigroups and Monoids are basically ways to express operations on a specific set/type
Think of it as a blueprint. Describing a behavior you want your types to have.
