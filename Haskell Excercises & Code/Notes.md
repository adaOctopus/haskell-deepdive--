### Chapter 1
Intermissions Excercises (Answers)
1.6
1) b
2)  c
3)  b

## Chapter 1 main points to understand

• Functional programming is based on expressions that incclude variables or constant values, expressions combined with other expressions, and functions. 

• Functions have a head and a body and are those expressions that can be applied to arguments and reduced, or evaluated, to a result. 

• Variables may be bound in the function declaration, and every time a bound variable shows up in a function, it has the same value. 

• All functions take one argument and return one result. 

• Functions are a mapping of a set of inputs to a set of outputs. Given the same input, they always return the same result.

### Chapter 2

The last case is known as sectioning and allows you to pass around partially applied functions. With commutative functions, such as addition, it makes no difference if you use (+1) or (1+) because the order of the arguments won’t change the result. If you use sectioning with a function that is not commutative, the order matters: 

Prelude> (1/) 2
0.5 
Prelude> (/1) 2 
2.0

**Argument vs Parameter**
Parameter is the official parameter that a function takes
i.e
f `x` = `x` + 2
`x` is a parameter
**Argument** is the function input to which the function is
applied to. For example if function `f` gets applied to `2`
i.e f `2` = `2` + 2 = `4`
argument is basically the value `2` where `x` is the parameter

### Chapter 2 
### Summary Definitions
1. The terms argument and parameter are often used interchangeably. However, it is worthwhile to understand the distinction. A parameter, or formal parameter, represents a value that will be passed to the function when the function is called. Thus, parameters are usually variables. An argument is an input value the function is applied to. A function’s parameter is bound to the value of an argument when the function is applied to that argument. For example, in f x = x + 2 which takes an argument and returns that value added to 2, 𝑥 is the one parameter of our function. We run the code by applying 𝑓 to some argument. If the argument we passed to the parameter 𝑥 were 2, our result would be 4. However, arguments can themselves be variables or be expressions that include variables, thus the distinction is not always clear. When we use “parameter” in this book, it will always be referring to formal parameters, usually in a type signature, but we’ve taken the liberty of using “argument” somewhat more loosely. 
2. An expression is a combination of symbols that conforms to syntactic rules and can be evaluated to some result. In Haskell, an expression is a well-structured combination of constants, variables, and functions. While irreducible constants are technically expressions, we usually refer to those as “values”, so we usually mean “reducible expression” when we use the term expression. 
3. A value is an expression that cannot be reduced or evaluated any further. 2 * 2 is an expression, but not a value, whereas what it evaluates to, 4, is a value. 
4. A function is a mathematical object whose capabilities are limited to being applied to an argument and returning a result. Functions can be described as a list of ordered pairs of their inputs and the resulting outputs, like a mapping. Given the function f x = x + 2 applied to the argument 2, we would have the ordered pair (2, 4) of its input and output. 
5. Infix notation is the style used in arithmetic and logic. Infix means that the operator is placed between the operands or arguments. An example would be the plus sign in an expression like 2 + 2. 
6. Operators are functions that are infix by default. In Haskell, operators must use symbols and not alphanumeric characters. 7. Syntactic sugar is syntax within a programming language designed to make expressions easier to write or read.


### Chapter 3
Strings


:set prompt "GandalfSays>"
that changes Prelude> to whatever u want, super cool

'a' a is a Character
"a" is a [Char]

The (:) operator, called cons, builds a list:
"c" : "ris"
"cris"

#### Functions commonly used in Haskell on lists

`head` takes first of list
`tail` removes first and returns the remaining elements
`take n` returns the n number of elements
`drop n` removes the n number of elements

The infix operator, (!!), returns the element that is in the specified position in the list.
Starts with index position `0`

### Chapter 4:  Basic Datatypes

End definitions
2. A typeclass is a set of operations defined with respect to a polymorphic type. When a type has an instance of a typeclass, values of that type can be used in the standard operations defined for that typeclass. In Haskell, typeclasses are unique pairings of class and concrete instance. This means that if a given type 𝑎 has an instance of Eq, it has only one instance of Eq.
3.  Arity is the number of arguments a function accepts. This notion is a little slippery in Haskell as, due to currying, all functions are 1-arity and we handle accepting multiple arguments by nesting functions. 
8. Polymorphism in Haskell means being able to write code in terms of values which may be one of several, or any, type. Polymorphism in Haskell is either parametric or constrained. The identity function, id, is an example of a parametrically polymorphic function:


### Chapter 5 Types

Polymorphic type variables give us the ability to implement expressions that can accept arguments and return results of different types without having to write variations on the same expression for each type.

Parametric & constraint polymorphism

Parametric

Constraint (id function ) f a -> a

Parametric polymorphism is broader than ad-hoc polymorphism. Parametric polymorphism refers to type variables, or parameters, that are fully polymorphic. When unconstrained by a typeclass, their final, concrete type could be anything. Constrained polymorphism, on the other hand, puts typeclass constraints on the variable, decreasing the number of concrete types it could be, but increasing what you can do with it by defining and bringing into scope a set of operations.

`a Num a => a 
`Int `

-- The principal type here is the -- parametrically polymorphic 'a'.
-- Given these types 

`(Ord a, Num a) => a 
`Integer

-- The principal type is -- (Ord a, Num a) => a 

3. Type variable is a way to refer to an unspecified type or set of types in Haskell type signatures. Type variables ordinarily will be equal to themselves throughout a type signature. Let us consider some examples.
4. A typeclass is a means of expressing faculties or interfaces that multiple datatypes may have in common. This enables us to write code exclusively in terms of those commonalities without repeating yourself for each instance. Just as one may sum values of type Int, Integer, Float, Double, and Rational, we can avoid having different (+), (*), (-), negate, etc. functions for each by unifying them into a single typeclass. Importantly, these can then be used with all types that have a Num instance. Thus, a typeclass provides us a means to write code in terms of those operators and have our functions be compatible with all types that have instances of that typeclass, whether they already exist or are yet to be invented (by you, perhaps)


### Chapter 6 - Typeclasses

How to write your own instances?
Link to hackage
ed at http:// hackage.haskell.org/package/base/docs/Data-Eq.html.


The good news is there is something you can do to get more help from GHC on this. If we turn all warnings on with the -Wall flag in our REPL (or in our build configuration), then GHC will let us know when we’re not handling all cases: 
Prelude> :set -Wall 
Prelude> :l code/derivingInstances.hs 
[1 of 1] Compiling DerivingInstances

Instance Example with parameterized variables
instance Eq a => Eq (Identity a) where (==) (Identity v) (Identity v') = v == v'

Those details aren’t important for understanding this code. Just remember: 
• a typeclass defines a set of functions and/or values;
• types have instances of that typeclass; 
• the instances specify the ways that type uses the functions of the typeclass.


1. Typeclass inheritance is when a typeclass has a superclass. This is a way of expressing that a typeclass requires another typeclass to be available for a given type before you can write an instance. class Num a => Fractional a where (/) :: a -> a -> a recip :: a -> a fromRational :: Rational -> a Here the typeclass Fractional inherits from Num. We could also say that Num is a superclass of Fractional. The long and short of it is that if you want to write an instance of Fractional for some 𝑎, that type 𝑎, must already have an instance of Num before you may do so
4. An instance is the definition of how a typeclass should work for a given type. Instances are unique for a given combination of typeclass and type.

### Chapter 7 - Pattern Matching

isItTwo :: Integer -> Bool 
isItTwo _ = False 
isItTwo 2 = True

Pattern matching works from lft to right and outside to inside.
This is read from top to bottom, therefore `_` `
will always get executed and the rest of the patterns wqill not be matched

Try to order your patterns from most specific to least specific, particularly as it concerns the use of _ to unconditionally match any value. Unless you get fancy, you should be able to trust GHC’s pattern match overlap warning and should triple-check your code when it complains

## 7.12 Chapter Definitions 
1. Binding or bound is a common word used to indicate connection, linkage, or association between two objects. In Haskell we’ll use it to talk about what value a variable has, e.g., a parameter variable is bound to an argument value, meaning the value is passed into the parameter as input and each occurrence of that named parameter will have the same value. Bindings as a plurality will usually refer to a collection of variables and functions which can be referenced by name. **:: -> blah :: Int ; blah = 10 -> Here the variable blah is bound to the value 10.**
2. An anonymous function is a function which is not bound to an identifier and is instead passed as an argument to another function and/or used to construct another function. See the following examples. \x -> x -- anonymous version of id id x = x -- not anonymous, it's bound to 'id'
3. . Currying is the process of transforming a function that takes multiple arguments into a series of functions which each take one argument and return one result. This is accomplished through the nesting. In Haskell, all functions are curried by default. You don’t need to do anything special yourself.
4. **Higher-order** functions are functions which themselves take functions as arguments or return functions as results. Due to currying, technically any function that appears to take more than one argument is higher order in Haskell.
5. **Function Composition** -> -- or (.) :: (b -> c) -> ((a -> b) -> (a -> c)) -- can be implemented as comp :: (b -> c) -> ((a -> b) -> (a -> c)) comp f g x = f (g x) The function 𝑔 is applied to 𝑥, 𝑓 is applied to the result of g x. 
8. **Pointfree** is programming tacitly, or without mentioning arguments by name. This tends to look like “plumby” code where you’re routing data around implicitly or leaving off unnecessary arguments thanks to currying. The “point” referred to in the term pointfree is an argument.

## Chapter 8 - Recursion

Type
Base case
Recursive case

## Chapter 9 - Lists
**LIST COMPREHENSIONS NOTES**
We can also write list comprehensions that have multiple generators. One thing to note is that the rightmost generator will be exhausted first, then the second rightmost, and so on. For example, let’s say you wanted to make a list of 𝑥 to the 𝑦 power, instead of squaring all of them as we did above. Separate the two inputs with a comma as below: Prelude> [x^y | x <- [1..5], y <- [2, 3]] [1,1,4,8,9,27,16,64,25,125]


zip proceeds until the shortest list ends.
Prelude> zip ['a'] [1..1000000000000000000] [('a',1)]
Prelude> zip [1..100] ['a'..'c'] [(1,'a'),(2,'b'),(3,'c')]

zip unzip zipwith
Remember zip combines lists, but basically returns a list of tuples
LIST: OF TUPLES AND EACH TUPLE (indexed1ItemList1, indexed1ItemList2)
i.e
zip [1,2]  [3,4]
returns -> [(1,3), (2,4)]

zipWith however does nor return list of tuples, returns lists combined based on the function provided
i.e
zipWith (+) [1,2,3]  [1,2,5]

### Products & Sum types definitions
1. In type theory, a **product type** is a type made of a set of types compounded over each other. In Haskell we represent products using tuples or data constructors with more than one argument. The “compounding” is from each type argument to the data constructor representing a value that coexists with all the other values simultaneously. Products of types represent a conjunction, “and,” of those types. If you have a product of Bool and Int, your terms will each contain a Bool and Int value. 
2. In type theory, a **sum type** of two types is a type whose terms are terms in either type, but not simultaneously. In Haskell sum types are represented using the pipe, |, in a datatype definition. Sums of types represent a disjunction, “or,” of those types. If you have a sum of Bool and Int, your terms will be either a Bool value or an Int value.
3. Cons is ordinarily used as a verb to signify that a list value has been created by cons’ing a value onto the head of another list value. In Haskell, (:) is the cons operator for the list type. It is a data constructor defined in the list datatype:
(:) :: a -> [a] -> [a]

Reasoning
1 : 2 : 3 : []
3 to empty list []
2 to [3]
1 to [2,3]


## Chapter 10 - Folding lists
Catamorphisms are a means of deconstructing data. If the spine of a list is the structure of a list, then a fold is what can reduce that structure.1

-- Remember how map worked? 
map :: (a -> b) -> [a] -> [b] 
map (+1) 1 : 2 : 3 : [] (+1) 1 : (+1) 2 : (+1) 3 : [] 
Given the list foldr (+) 0 (1 : 2 : 3 : []) 1 + (2 + (3 + 0)) 
- Where map applies a function to each member of a list and returns a list, a fold replaces the cons constructors with the function and reduces the list.

### Right fold foldr evaluation

foldr :: (a -> b -> b) -> b -> [a] -> b 
foldr f z xs = 
          case xs of 
          []         -> z 
          (x:xs)   -> f x (foldr f z xs)


So one way to think about the way Haskell evaluates is that it’s like a text rewriting system. Our expression has thus far rewritten itself from: 
foldr (+) 0 [1, 2, 3] 
Into: (+) 1 ((+) 2 ((+) 3 0))

Use this in REPL to see how the evaluation works.
xs = map show [1..5] 
y = foldr (\x y -> concat ["(",x,"+",y,")"]) "0" xs

take is **nonstrict** like everything else you’ve seen so far, and in this case, it only returns as much list as you ask for.
Basically strict should mean that we evaluate ALL VALUES AS WELL.
for example
let xs = [1,2,3,4] ++ undefined
length (take 4 xs) -> this will work
length xs will not work.

### Difference in foldl reasoning evaluation

Prelude> let conc = concat 
Prelude> let f x y = conc ["(",x,"+",y,")"] 
Prelude> foldl f "0" (map show [1..5]) "(((((0+1)+2)+3)+4)+5)" 

We can see from this that foldl begins its reduction process by adding the acc (accumulator) value to the head of the list, whereas foldr had added it to the final element of the list first.

## How to think of evaluation
Associativity and folding Next we’ll take a closer look at some of the effects of the associativity of foldl. As we’ve said, both folds traverse the spine in the same direction. What’s different is the associativity of the evaluation. The fundamental way to think about evaluation in Haskell is as SUBSTITUTION. When we use a right fold on a list with the function 𝑓 and start value 𝑧, we’re, in a sense, replacing the cons constructors with our folding function and the empty list constructor with our start value �

[1..3] == 1 : 2 : 3 : [] 
foldr f z [1, 2, 3] 
1 `f` (foldr f z [2, 3]) 
1 `f` (2 `f` (foldr f z [3])) 
1 `f` (2 `f` (3 `f` (foldr f z []))) 
1 `f` (2 `f` (3 `f` z))

Furthermore, lazy evaluation lets our functions, rather than the ambient semantics of the language, dictate what order things get evaluated in. Because of this, the parentheses are real. In the above, the 3 `f` z pairing gets evaluated first because it’s in the innermost parentheses. Right folds have to traverse the list outside-in, but the folding itself starts from the end of the list

foldr :: (a -> b -> b) -> b -> [a] -> b -- [1] [2] [3] foldl :: (b -> a -> b) -> b -> [a] -> b -- [4] [5] [6] 1. The parameter of type 𝑎 represents one of the list element arguments the folding function of foldr is applied to. 2. The parameter of type 𝑏 will either be the start value or the result of the fold accumulated so far, depending on how far you are into the fold. 3. The final result of having combined the list element and the start value or fold so far to compute the fold. 4. The start value or fold accumulated so far is the first argument to foldl’s folding function. 5. The list element is the second argument to foldl’s folding function


## Discord user recommendation
## Data.Bool.bool gatekeeper _—_ Today at 13:12

`foldr` for lazily generating a list from an existing one, or for calculations that don’t require knowing the whole list (e.g. `and`) `foldl'` for calculating summary values that depend on knowing all elements (like `sum`) `foldl` basically never

1.  By the ‘evaluation process’ they mean the difference between ``1 `f` (2 `f` (3 `f` []))`` (for `foldr`) and ``(([] `f` 1) `f` 2) `f` 3`` (for `foldl`)
    
2.  _[_12:58_]_
    
    One evaluates from the right, the other from the left

foldl (-) 0 [1, 2, 3] 
= foldl (-) 0 [1, 2] - 3 
= (foldl (-) 0 [1] - 2) - 3 
= ((foldl (-) 0 [] - 1) - 2) - 3 
= ((0 - 1) - 2) - 3 
= (-6) 


foldr (-) 0 [1, 2, 3]
= 1 - foldr (-) 0 [2, 3] 
= 1 - (2 - foldr (-) 0 [3]) 
= 1 - (2 - (3 - foldr (-) 0 [])) 
= 1 - (2 - (3 - 0)) 
= 2

foldr 
1. The rest of the fold (recursive invocation of foldr) is an argument to the folding function you passed to foldr. It doesn’t directly self-call as a tail-call like foldl. You could think of it as alternating between applications of foldr and your folding function 𝑓. The next invocation of foldr is conditional on 𝑓 having asked for more of the results of having folded the list. That is: foldr :: (a -> b -> b) -> b -> [a] -> b -- ^
2. That 𝑏 we’re pointing at in (a -> b -> b) is the rest of the fold. Evaluating that evaluates the next application of foldr. 
2. Associates to the right. 
3. Works with infinite lists. We know this because: Prelude> foldr const 0 [1..] 1 
4. Is a good default choice whenever you want to transform data structures, be they finite or infinite.

## Chapter 11 - Algebraic Datatypes

4. Data constructor. In this case, a data constructor that takes no arguments and so is called a nullary constructor. This is one of the possible values of this type that can show up in term-level code.
5. 5. The pipe denotes a sum type which indicates a logical disjunction (colloquially, or) in what values can have that type. (|)

Although the term constructor is often used to describe all type constructors and data constructors, we can make a distinction between constants and constructors. Type and data constructors that take no arguments are constants. They can only store a fixed type and amount of data.

**Distinguish**
Type-level (i.e Bool)
Term-level (i.e True or False)

data Bool = True | False

## Kinds
Are basically types one level up
U can query them with :k
:k Bool
Prelude> Bool :: *
Means concrete and represented with *
Type constant is a type constructor with zero arguments
data PubType = PubData
PubType takes 0 arguments so it is called as type constant
PubData is also called as constant value, cause it takes 0 arguments

`data HuskyType a = HuskyData`
4. HuskyData is the data constructor for HuskyType. Note that the type variable argument 𝑎 does not occur as an argument to HuskyData or anywhere else after the =. That means our type argument 𝑎 is phantom, or, “has no witness.” We will elaborate on this later. Here HuskyData is a constant value, like PugData.

## Important note
As we’ve said, types are static and resolve at compile time. Types are known before runtime, whether through explicit declaration or type inference, and that’s what makes them static types. Information about types does not persist through to runtime. Data are what we’re working with at runtime.

Data constructors are basically generated by the DECLARATION itself

Nullary Data constructors, are data constructors that take 0 arguments
Unary Data constructors are data constructors that take 1 argument
Products are call data constructors that take more than one argument.

Cardinality is basically, in a finite set, the number of unique possible objects
i.e Bool type has two possible values, True or False
therefore its cardaniality is 2
Int8, which is from -128 to 127 (including 0) it is 256 possible values
therefore its cardinality is 256.

or cardinality, this means unary constructors are the identity function.
Unary constructors have cardinality equal to their argument

Datatypes that only contain a unary constructor always have the same cardinality 
as the type they contain.

11.9 newtype We will now look at a way to define a type that can only ever have a single unary data constructor. We use the newtype keyword to mark these types, as they are different from type declarations marked with the data keyword as well as from type synonym definitions marked by the type keyword. Like other datatypes that have a single unary constructor, the cardinality of a newtype is the same as that of the type it contains.

Useful note
class TooMany a where 
tooMany :: a -> Bool
instance TooMany Int where 
tooMany n = n > 42 

We can use that instance in the REPL but only if we assign the type Int to whatever numeric literal we’re passing as an argument, because numeric literals are polymorphic. That looks like this:

`{-# LANGUAGE GeneralizedNewtypeDeriving #-}
Using this, to not repeat ourselves when creating instances for newType type declarations

class TooMany a where 
tooMany :: a -> Bool 

instance TooMany Int where 
tooMany n = n > 42

i.e newtype Goat = Goat Int deriving (Eq, Show, TooMany)

Arity has to do with how many arguments a constructor takes
nullary
unary
binary

## Sum types
look at is the sum type such as Bool: data Bool = False | True We’ve mentioned previously that the | represents logical disjunction — that is, “or.” This is the sum in algebraic datatypes. To know the cardinality of sum types, we add the cardinalities of their data constructors.`

Now, since -128 is a perfectly valid Int8 value you could choose to ignore this. What happens is that (-128) desugars into (negate 128). The compiler sees that you expect the type Int8, but Int8’s max boundary is 127. So even though you’re negating 128, it hasn’t done that step yet and immediately whines about 128 being larger than 127. One way to avoid the warning is the following:

`use NegativeLiterals`

## Product Types
For those that have programmed in C-like languages before, a product is like a struct. For those that haven’t, a product is a way to carry multiple values around in a single data constructor. Any data constructor with two or more type arguments is a product.

The cardinality of this will be the same as it was previously. The reason it’s important to understand cardinality is that the cardinality of a datatype roughly equates to how difficult it is to reason about.

The cardinality of product types is the product (multiplication) of the cardinalities of the arguments its data constructor takes.

Record syntax of product types
data Person = Person { name :: String , age :: Int } deriving (Eq, Show)

You can see the similarity to the Person type defined above, but defining it as a record means there are now named record field accessors. They’re just functions that go from the product type to a member of product

## List comprehension note, that I realised in practice
-- try it out

-- iterate

listOne = [1,2,3,4]

listTwo = ['a','b','c','d']

listThree = ['k','y']

funca   = [(x1,x2,x3) | x1 <- listOne, x2 <- listTwo, x3 <- listThree]

*Programmer> funca
[(1,'a','k'),(1,'a','y'),(1,'b','k'),(1,'b','y'),(1,'c','k'),(1,'c','y'),(1,'d','k'),(1,'d','y'),(2,'a','k'),(2,'a','y'),(2,'b','k'),(2,'b','y'),(2,'c','k'),(2,'c','y'),(2,'d','k'),(2,'d','y'),(3,'a','k'),(3,'a','y'),(3,'b','k'),(3,'b','y'),(3,'c','k'),(3,'c','y'),(3,'d','k'),(3,'d','y'),(4,'a','k'),(4,'a','y'),(4,'b','k'),(4,'b','y'),(4,'c','k'),(4,'c','y'),(4,'d','k'),(4,'d','y')]

The inner list needs to be exhausted first to iterate to the new list.

### Chapter 12 - Signaling Adversity

The Haskell Report uses the term type constant to refer to types that take no arguments and are already types. In the Report, type constructor is used to refer to types which must have arguments applied to become a type.

## Chapter 13 Building Projects

`git clone ..hello.git

`stack build`

or `stack setup `

Then u can load Main. module in your repl and it sees your project and dependencies

stack.yaml file, is about tracking the versions of your packages and what GHC version they work best with

If you have a binary executable file u do:
`stack exec -- <name>`

inside a .cabal file
this is called a stanza

executable hello -- [1] 
hs-source-dirs: src -- [2] 
main-is: Main.hs -- [3] 
default-language: Haskell2010 -- [4] 
build-depends: base >= 4.7 && < 5 -- [5]

How to make our project a library so others can use it

First we’re going to add a library stanza to hello.cabal: 
library 
``hs-source-dirs: src 
exposed-modules: Hello 
build-depends: base >= 4.7 && < 5 
default-language: Haskell2010``
`

## Chapter 14 Testing

14.4 Enter QuickCheck

**hspec** does a nice job with spec testing, but we’re Haskell users — we’re never satisfied!! hspec can only prove something about particular values. Can we get assurances that are stronger, something closer to proofs? As it happens, we can. 
**QuickCheck** was the first library to offer what is today called property testing. hspec testing is more like what is known as unit testing — the testing of individual units of code — whereas property testing is done with the assertion of laws or properties.

`QuickCheck`
What’s being hidden a bit by hspec is that QuickCheck tests many values to see if your assertions hold for all of them. It does this by randomly generating values of the type you said you expected. So, it’ll keep feeding our function random Int values to see if the property is ever false. The number of tests QuickCheck runs defaults to 100.

Arbitrary a => Gen a
sample / sample'
Gen a -> IO () or IO [a]
choose & elements from QuickCheck library

## Chapter 15  - Monoid Semigroup

In plain English, a monoid is a function that takes two arguments and follows two laws: `associativity and identity. `
Associativity means the arguments can be regrouped (or reparenthesized, or reassociated) in different orders and give the same result, as in addition. 
Identity means there exists some value such that when we pass it as input to our function, the operation is rendered moot and the other value is returned, such as when we add zero or multiply by one. 
Monoid is the typeclass that generalizes these laws across types.

### Monoid Laws
-- left identity 
mappend mempty x = x 
-- right identity 
mappend x mempty = x 
-- associativity 
mappend x (mappend y z) = mappend (mappend x y) z 

mconcat = foldr mappend mempty

mconcat
foldr mappend mempty {xs}
These 2 need to return same result

mappend mempty x = x
mappend x mempty = x
both need to be satisfied

and 
Sum 1 <> (Sum 2 <> Sum 3)
(Sum 1 <> Sum 2) <> Sum 3 
should be the same

Bool Monoid instances are All & Any
All True <> All True
All {getAll = True}

Any True <> Any False
Any {getAny = False}

class Monoid m where 
mempty :: m 
mappend :: m -> m -> m 
mconcat :: [m] -> m 
mconcat = foldr mappend mempty

## Instance of monoid for lists
instance Monoid [a] where 
mempty = [] 
mappend = (++)

Associativity is about grouping and associating your arguments differently and the result remains the same. Commutative means that you can reorder/rearrange the arguments and the result to be the same
(+) is commutative, (++) is only associative

## Laws
Associativity
This is the other law for Monoid: the binary operation must be associative and it must have a sensible identity value.

## Semigroup

Is basically monoid without the requirement to fulfill the identity law
only associativity and binary
from Monoid to Semigroup, we’re pulling a leg off. In this case, the leg is our identity. To get from a monoid to a semigroup, we simply no longer furnish nor require an identity. The core operation remains binary and associative.

class Semigroup a where 
(<>) :: a -> a -> a 

And we’re left with one law: (a <> b) <> c = a <> (b <> c)

## Chapter 16. Functor

This chapter is all about Functor, and Functor is all about a pattern of mapping over structure. We saw fmap way back in the chapter on lists and noted that it worked just the same as map, but we also said back then that the difference is that you can use fmap with structures that aren’t lists. Now we will begin to see what that means.

## Functor Laws

1. Identity

**`fmap id == id`**

2. Composition law

**`fmap (f . g) == fmap f . fmap g`** 
This concerns the composability of fmap. If we compose two functions, 𝑓 and 𝑔, and fmap that over some structure, we should get the same result as if we fmapped them and then composed them:

Remember instances of functors expect higher kinded params as in
* -> * instead of type constants of type kind *

Here, functorial structure is the `f`

instance Functor (Two a) where
fmap f (Two a b) = Two $ (f a) (f b)

(Two a) -> is the functorial structure f
where data type = Two a b = Two a b ( but the functorial structure needs to be higher-kinded * -> *

`But remember`
Functor is supposed to leave the functorial structure UNTOUCHED and only ammend the within values
This won’t fly, because the 𝑎 is part of the functorial structure (the 𝑓). We’re not supposed to touch anything in the 𝑓 referenced in the type of fmap, so we can’t apply the function (named 𝑓 in our fmap definition) to the 𝑎 because the 𝑎 is now untouchable.

Therefore we cannot touche the `a` as it is a part fo the functorial so we can only ammend the inner most value, thats why in tuples we only fmap the second value

instance Functor (Two a) where 
fmap f (Two a b) = Two a (f b)
