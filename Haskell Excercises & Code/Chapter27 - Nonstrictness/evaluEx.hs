module EvEx where

-- Evaluation reasoning examples
1. const 1 undefined
2. const undefined 1
3. flip const undefined 1
4. flip const 1 undefined
5. const undefined undefined

6. foldr const 'z' ['a'..'e']
-- That reasoning i did was closer to foldl not foldr (read again and understood)
-- (foldr const 'z' ['a','b','c','d']) const 'e'
-- (((fodlr const 'z' ['a','b','c'] ) const 'd') const 'e')
-- ((((foldr const 'z' ['a','b']) const 'c' ) const 'd') const 'e')
-- (((((foldr const 'z' ['a']) const 'b') const 'c') const 'd') const 'e'
-- ((((((foldr const 'z' [] ) const 'a' ) const 'b') const 'c') const 'd') const 'e')
-- Wrong reasoning 
7. foldr (flip const) 'z' ['a'..'e']
