module ChangeMood where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Moody = Woot
changeMood _ = Blah