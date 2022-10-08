module RandomTwo where

import Control.Applicative (liftA3)
import Control.Monad (replicateM)
import Control.Monad.Trans.State
import System.Random
import StateTest


rollDie :: State StdGen Die
rollDie = state $ do
    (n, s) <- randomR (1, 6)
    return (intToDie n, s)

rollDie' :: State StdGen Die
rollDie' =intToDie <$> state (randomR (1, 6))

rollDieThreeTimes':: State StdGen (Die, Die, Die)
rollDieThreeTimes' = liftA3 (,,) rollDie rollDie rollDie