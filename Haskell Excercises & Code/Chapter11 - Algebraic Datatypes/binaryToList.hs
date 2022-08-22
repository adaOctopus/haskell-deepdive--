{-# LANGUAGE DeriveFoldable #-}

module BinaryToList where


-- Write functions to convert BinaryTree values to lists. Make
-- certain your implementation passes the tests.
data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show, Foldable)


preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = a : (preorder left) ++ (preorder right)

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = (inorder left) ++ a : (inorder right)

-- postorder :: BinaryTree a -> [a]
-- postorder = undefined

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = if preorder testTree == [2, 1, 3] then putStrLn "Preorder fine!" else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder = if inorder testTree == [1, 2, 3] then putStrLn "Inorder fine!" else putStrLn "Bad news bears."

-- Exe. Write a foldr function for the  BinaryTree

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ b Leaf = b
foldTree f b (Node left a right) = f a $ (foldr (\x -> f x) b left)

-- Node (Node Leaf 1 Leaf) 2 (Node Leaf 2 Leaf)