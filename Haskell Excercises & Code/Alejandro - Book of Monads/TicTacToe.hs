module TicTacToe where

data Player = O | X deriving (Eq,Show)

type Row = Int
type Column = Int

data Position = Position Row Column deriving (Eq, Show)

-- info :: Position -> TicTacToe (Maybe Player)

data Result = AlreadyTake { by :: Player } | NextTurn | GameEnded { winner :: Player}

-- take:: Position -> TicTacToe Result