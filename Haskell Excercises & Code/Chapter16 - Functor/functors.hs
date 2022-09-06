module Functorino where


-- 1. Law of identity

-- fmap id == id

-- 2. Law of composition

-- fmap (f . g) == fmap f . fmap g
-- This concerns the composability of fmap. If we compose two functions, 
-- 𝑓 and 𝑔, and fmap that over some structure, we should get the same result as if we fmapped them and then composed them:

let replaceWithP = const 'p'