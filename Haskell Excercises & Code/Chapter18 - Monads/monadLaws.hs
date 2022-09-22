module MonadLaws where

--- IDENTITY LAWS
-----------------

-- right identity
-- m >>= return = m

-- left identity
-- return x >>= f = fx

-- ASSOCIATIVITY
---------------

--- (m >>= f) >>= g = m >>= (\x -> f x >>= g)

-- mempty = 
