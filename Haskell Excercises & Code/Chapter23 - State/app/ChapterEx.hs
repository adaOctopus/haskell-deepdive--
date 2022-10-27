module ChapterEx where

newtype Moi s a = Moi { runMoi :: s -> (a, s) }

-- State s a = State { runState :: s -> (a, s)}

-- if we use State s s = (s, s)
-- Write instances for yourself.

instance Functor (Moi s) where
  --fmap :: (a -> b) -> Moi s a -> Moi s b
  fmap f (Moi g) = Moi $ \h -> (f $ fst $ g h, h)
    -- let a = fst $ g h
    -- in (f a, h)


instance Applicative (Moi s) where
  --pure :: a -> Moi s a
  pure a = Moi $ \s -> (a, s)
  --(<*>) :: Moi s (a -> b) -> Moi s a -> Moi s b
  (Moi f) <*> (Moi g) = Moi $ \h ->
    let ab = fst $ f h
        a  = fst $ g h
    in (ab a, h)

instance Monad (Moi s) where
  return = pure
  --(>>=) :: Moi s a -> (a -> Moi s b) -> Moi s b
  (Moi f) >>= g = Moi $ \h ->
    let a  = fst $ f h
        b  = fst $ runMoi (g a) h
    in (b, h)

-- 1. Return the state in the function
-- newtype Moi s a = Moi { runMoi :: s -> (a, s) }
get :: Moi s s
get = Moi $ \h -> (h, h)

-- 2. Return unit and the input as new state
put :: s -> Moi s ()
put s = Moi $ \h -> ((), s)

-- 3 Get the state that results
exec :: Moi s a -> s -> s
exec sa s = snd $ runMoi sa s

--4. Get the value that results
eval :: Moi s a -> s -> a
eval (Moi sa) s = fst $ runMoi (Moi sa) s

-- 5. Applies a function to return a new stte
modify :: (s -> s) -> Moi s ()
modify f = f . put 