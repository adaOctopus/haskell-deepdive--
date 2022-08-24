module Binario where 

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

-- 1. Write unfold for BinaryTree.
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f x = case f x of
  Nothing        -> Leaf
  Just (x, y, z) -> Node (unfold f x) y (unfold f z)


-- 2. Using the unfold, build tree

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold f 0
  where f x
          | x == n    = Nothing
          | otherwise = Just (x + 1, x, x + 1)

-- Prelude> treeBuild 0
-- Leaf
-- Prelude> treeBuild 1
-- Node Leaf 0 Leaf
-- Prelude> treeBuild 2
-- Node (Node Leaf 1 Leaf)
-- 0
-- (Node Leaf 1 Leaf)
-- Prelude> treeBuild 3
-- Node (Node (Node Leaf 2 Leaf)
-- 1
-- (Node Leaf 2 Leaf))
-- 0
-- (Node (Node Leaf 2 Leaf)
-- 1
-- (Node Leaf 2 Leaf))
