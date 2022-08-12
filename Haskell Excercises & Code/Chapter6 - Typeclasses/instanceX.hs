module InstanceExamples where

data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn v) (TisAn v') = v == v'

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two x y) (Two x' y') = x == x' && y == y'

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt v) (TisAnInt v')     = v == v'
    (==) (TisAString s) (TisAString s') = s == s'
    (==) _ _ = False

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
    (==) a a' = a == a'

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne a) (ThisOne a') = a == a'
    (==) (ThatOne a) (ThatOne a') = a == a'

-- askhsh :: Which a -> Bool
-- askhsh (ThisOne a) = a == a
-- askhsh (ThatOne a) = a == a
-- askhsh _ = False

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello a) (Hello a') = a == a'
    (==) (Goodbye b) (Goodbye b') = b == b'
